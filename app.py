from flask import Flask, request, jsonify
import pandas as pd
import numpy as np
import numpy_financial
import datetime
import json

app = Flask(__name__)

def CalculerMensualité39_bis2_ANCIEN(N, C2, T, ASSU, apport, mois, annee, fraisAgence, fraisNotaire, TRAVAUX, revalorisationBien):
    CDEPART = C2
    fraisAgence2 = (fraisAgence/100)*C2
    fraisNotaire_calc = (fraisNotaire/100)*C2
    C2 = C2 - apport
    garantieBancaire = (1.5/100)*C2
    
    if garantieBancaire < 0:
        garantieBancaire = 0
    
    if fraisAgence2 < 0:
        fraisAgence2 = 0
    
    C2 = C2 + fraisNotaire_calc + garantieBancaire + fraisAgence2 + TRAVAUX
    N2 = N
    N = N * 12
    
    # Correction du calcul de la mensualité - utilisation directe de numpy_financial
    T2 = T/100  # Conversion en décimal
    monthly_rate = T2/12
    
    # Calcul de la mensualité principale (sans assurance)
    M_principal = -1 * numpy_financial.pmt(monthly_rate, N, C2)
    # Ajout de l'assurance
    M = M_principal + C2*((ASSU/100)/12)
    
    A = C2*((ASSU/100))*(N/12)
    I = N * M_principal - C2  # calcul des intérêts versés (sans assurance)
    
    # Correction du format de date
    date = "{:02d}/01/{}".format(mois, annee)  # Assure un format à 2 chiffres
    
    try:
        rng = pd.date_range(start=date, periods=N, freq='MS')
        rng.name = "Date"
        df = pd.DataFrame(index=rng, columns=['Mensualité', 'Capital_Amorti', 'Intérêts', 'Capital_restant_dû'], dtype='float')
        df.reset_index(inplace=True)
        df.index += 1
        df.index.name = "Mois"

        df["Mensualité"] = M_principal + C2*((ASSU/100)/12)
        df["Capital_Amorti"] = -1 * numpy_financial.ppmt(monthly_rate, df.index, N, C2)
        df["Intérêts"] = -1 * numpy_financial.ipmt(monthly_rate, df.index, N, C2)
        df = df.round(2)

        df["Capital_restant_dû"] = 0
        df.loc[1, "Capital_restant_dû"] = C2 - df.loc[1, "Capital_Amorti"]

        for period in range(2, len(df)+1):
            previous_balance = df.loc[period-1, "Capital_restant_dû"]
            principal_paid = df.loc[period, "Capital_Amorti"]

            if previous_balance <= 0:
                df.loc[period, ["Mensualité", 'Capital_Amorti', "Intérêts", "Capital_restant_dû"]] = 0
                continue
            elif principal_paid <= previous_balance:
                df.loc[period, "Capital_restant_dû"] = previous_balance - principal_paid
            else:
                df.loc[period, "Capital_restant_dû"] = 0

        df["Date"] = pd.to_datetime(df["Date"])

    except Exception as e:
        print(f"Erreur dans la création du DataFrame: {e}")
        # Créer un DataFrame vide en cas d'erreur
        df = pd.DataFrame()

    salaireMinimum = (M*100)/35
    salaireMinimum = int(salaireMinimum)
    
    # Vérifications de sécurité
    M = max(0, M)
    salaireMinimum = max(0, salaireMinimum)
    C2 = max(0, C2)

    data = {
        "Prix du bien": CDEPART, 
        'Frais de notaire': fraisNotaire_calc,
        'Garantie Bancaire': garantieBancaire,
        "Frais d'agence": fraisAgence2,
        "Apport": apport,
        "Total à financer": C2
    }
    output2 = pd.DataFrame([data])

    data2 = {
        "Montant du prêt total": C2, 
        "Taux d'intérêt": T,
        "Taux d'assurance": ASSU,
        "Mensualité de crédit": M,
    }
    output3 = pd.DataFrame([data2])

    try:
        date_initiale = datetime.datetime.strptime(date, "%d/%m/%Y")
        date_finale = date_initiale.replace(year=date_initiale.year + N2)
        date_finale_str = date_finale.strftime("%d/%m/%Y")
    except Exception as e:
        print(f"Erreur dans le traitement des dates: {e}")
        date_finale_str = "Erreur de date"

    data3 = {
        "Date d'acquisition": date, 
        "Fin du financement": date_finale_str,
    }
    output4 = pd.DataFrame([data3])

    # Calcul de l'évolution du bien
    try:
        liste_prixdubien = []
        prixDuBien2 = CDEPART
        listeprixdubieninitial = [prixDuBien2]
        for year in range(1, (int((N)/12)+1)):
            prixDuBien2 = prixDuBien2*(1+(revalorisationBien/100))
            liste_prixdubien.append(prixDuBien2)
        listeprixdubieninitial.extend(liste_prixdubien)

        nbreMois = int(N/12)
        liste_annne = []
        date_initiale_safe = datetime.datetime.strptime(date, "%d/%m/%Y")
        for i in range(0, (nbreMois+1)):
            a = date_initiale_safe.year + i
            liste_annne.append(a)

        df_somme = pd.DataFrame({
            'Prix du bien': listeprixdubieninitial,
            "Date": liste_annne,
        })
        
        if not df.empty:
            df['Year'] = df['Date'].dt.year
            products_dict = dict(zip(df.Year, df["Capital_restant_dû"]))
            df_somme["Capital restant dû"] = df_somme["Date"].map(products_dict)
            df_somme["Capital restant dû"] = df_somme["Capital restant dû"].fillna(0)
            df_somme["Capital restant dû"] = df_somme["Capital restant dû"].replace([float('inf'), -float('inf')], 0)
            df_somme["Somme disponible en cas de revente"] = df_somme["Prix du bien"] - df_somme["Capital restant dû"]
        else:
            df_somme["Capital restant dû"] = 0
            df_somme["Somme disponible en cas de revente"] = df_somme["Prix du bien"]
        
        df_somme.index += 1
        df_somme.index.name = "Periode (Année)"
        
        df_somme = df_somme.drop(columns="Date", axis=1)
        df_somme["Periode (en années)"] = liste_annne
        df_somme = df_somme.set_index("Periode (en années)")
        output13 = df_somme
    except Exception as e:
        print(f"Erreur dans le calcul de l'évolution du bien: {e}")
        output13 = pd.DataFrame()
    
    return M, I, A, fraisNotaire_calc, garantieBancaire, salaireMinimum, df, fraisAgence2, C2, output2, output3, output4, output13, TRAVAUX, date


@app.route('/api/calculer-mensualite', methods=['POST'])
def calculer_mensualite():
    try:
        data = request.get_json()
        
        # Validation des paramètres requis
        required_params = [
            'duree_annees', 'prix_bien', 'taux_interet', 'taux_assurance',
            'apport', 'mois_debut', 'annee_debut', 'frais_agence',
            'frais_notaire', 'travaux', 'revalorisation_bien'
        ]
        
        for param in required_params:
            if param not in data:
                return jsonify({'error': f'Paramètre manquant: {param}'}), 400
        
        # Conversion explicite des types de données
        try:
            duree_annees = int(float(data['duree_annees']))
            prix_bien = float(data['prix_bien'])
            taux_interet = float(data['taux_interet'])
            taux_assurance = float(data['taux_assurance'])
            apport = float(data['apport'])
            mois_debut = int(float(data['mois_debut']))
            annee_debut = int(float(data['annee_debut']))
            frais_agence = float(data['frais_agence'])
            frais_notaire = float(data['frais_notaire'])
            travaux = float(data['travaux'])
            revalorisation_bien = float(data['revalorisation_bien'])
        except ValueError as ve:
            return jsonify({'error': f'Erreur de conversion de type: {str(ve)}'}), 400
        
        # Validation des valeurs
        if duree_annees <= 0 or prix_bien <= 0:
            return jsonify({'error': 'La durée et le prix du bien doivent être positifs'}), 400
        
        if mois_debut < 1 or mois_debut > 12:
            return jsonify({'error': 'Le mois doit être entre 1 et 12'}), 400
        
        # Appel de la fonction de calcul
        result = CalculerMensualité39_bis2_ANCIEN(
            N=duree_annees,
            C2=prix_bien,
            T=taux_interet,
            ASSU=taux_assurance,
            apport=apport,
            mois=mois_debut,
            annee=annee_debut,
            fraisAgence=frais_agence,
            fraisNotaire=frais_notaire,
            TRAVAUX=travaux,
            revalorisationBien=revalorisation_bien
        )
        
        # Décomposition du résultat
        M, I, A, fraisNotaire, garantieBancaire, salaireMinimum, df, fraisAgence2, C2, output2, output3, output4, output13, TRAVAUX, date_acquisition = result
        
        # Conversion des DataFrames en dictionnaires pour JSON
        def convert_dataframe_to_dict(df):
            if isinstance(df, pd.DataFrame) and not df.empty:
                # Remplacer les NaN par None pour le JSON
                df_clean = df.where(pd.notnull(df), None)
                return df_clean.to_dict('records')
            return []
        
        # Conversion des dates en strings pour le DataFrame principal
        tableau_amortissement = []
        if not df.empty:
            df_copy = df.copy()
            if 'Date' in df_copy.columns:
                df_copy['Date'] = df_copy['Date'].dt.strftime('%Y-%m-%d')
            tableau_amortissement = convert_dataframe_to_dict(df_copy)
        
        response_data = {
            'mensualite': float(M) if not pd.isna(M) else 0,
            'interets_total': float(I) if not pd.isna(I) else 0,
            'assurance_total': float(A) if not pd.isna(A) else 0,
            'frais_notaire': float(fraisNotaire) if not pd.isna(fraisNotaire) else 0,
            'garantie_bancaire': float(garantieBancaire) if not pd.isna(garantieBancaire) else 0,
            'salaire_minimum': int(salaireMinimum) if not pd.isna(salaireMinimum) else 0,
            'frais_agence': float(fraisAgence2) if not pd.isna(fraisAgence2) else 0,
            'total_financer': float(C2) if not pd.isna(C2) else 0,
            'travaux': float(TRAVAUX) if not pd.isna(TRAVAUX) else 0,
            'date_acquisition': date_acquisition,
            'tableau_amortissement': tableau_amortissement,
            'resume_financement': convert_dataframe_to_dict(output2),
            'details_pret': convert_dataframe_to_dict(output3),
            'dates_financement': convert_dataframe_to_dict(output4),
            'evolution_bien': convert_dataframe_to_dict(output13.reset_index() if not output13.empty else pd.DataFrame())
        }
        
        return jsonify(response_data), 200
        
    except Exception as e:
        print(f"Erreur dans calculer_mensualite: {str(e)}")
        return jsonify({'error': f'Erreur interne: {str(e)}'}), 500


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)