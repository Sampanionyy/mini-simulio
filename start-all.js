const { spawn } = require("child_process");
const path = require("path");
const fs = require("fs");
const os = require("os");

const isWindows = os.platform() === "win32";

function runCommand(command, args, cwd, label) {
    return new Promise((resolve, reject) => {
        const proc = spawn(command, args, {
            cwd,
            shell: true,
        });

        proc.stdout.on("data", (data) => {
            process.stdout.write(`[${label}] ${data}`);
        });

        proc.stderr.on("data", (data) => {
            process.stderr.write(`[${label} ERROR] ${data}`);
        });

        proc.on("close", (code) => {
            if (code !== 0) {
                reject(new Error(`${label} failed with code ${code}`));
            } else {
                resolve();
            }
        });

        proc.on("error", (err) => {
            console.error(`[${label} ERROR] Failed to start: ${err.message}`);
            reject(err);
        });
    });
}

function runCommandAsync(command, args, cwd, label) {
    const proc = spawn(command, args, {
        cwd,
        shell: true,
    });

    proc.stdout.on("data", (data) => {
        process.stdout.write(`[${label}] ${data}`);
    });

    proc.stderr.on("data", (data) => {
        process.stderr.write(`[${label} ERROR] ${data}`);
    });

    proc.on("close", (code) => {
        if (code !== 0) {
            console.log(`[${label}] exited with code ${code}`);
        }
    });

    proc.on("error", (err) => {
        console.error(`[${label} ERROR] Failed to start: ${err.message}`);
    });

    return proc;
}

async function setupPythonEnvironment() {
    const venvPath = path.join(__dirname, "venv");
    const requirementsFile = path.join(__dirname, "requirements.txt");

    const pipPath = isWindows
        ? path.join(venvPath, "Scripts", "pip.exe")
        : path.join(venvPath, "bin", "pip");

    const pythonPath = isWindows
        ? path.join(venvPath, "Scripts", "python.exe")
        : path.join(venvPath, "bin", "python");

    const activatePath = isWindows
        ? path.join(venvPath, "Scripts", "activate.bat")
        : path.join(venvPath, "bin", "activate");

    if (!fs.existsSync(activatePath)) {
        console.log("Création de l'environnement virtuel Python...");
        try {
            await runCommand("python", ["-m", "venv", "venv"], __dirname, "VENV_SETUP");
            console.log("Environnement virtuel créé avec succès");
        } catch (error) {
            console.error("Erreur lors de la création de l'environnement virtuel:", error.message);
            return null;
        }
    } else {
        console.log("✅ Environnement virtuel Python déjà présent.");
    }

    if (!fs.existsSync(pipPath)) {
        console.error("pip non trouvé dans l'environnement virtuel");
        return null;
    }

    if (fs.existsSync(requirementsFile)) {
        console.log("Installation des dépendances Python...");
        try {
            await runCommand(pipPath, ["install", "-r", "requirements.txt"], __dirname, "PIP");
            console.log("Dépendances Python installées");
        } catch (error) {
            console.error("Erreur lors de l'installation des dépendances:", error.message);
            return null;
        }
    } else {
        console.log("Fichier requirements.txt non trouvé, dépendances Python non installées");
    }

    return pythonPath;
}

async function main() {
    console.log("Lancement des services...");

    const apiPath = path.join(__dirname, "mini-simulio-api");
    const webPath = path.join(__dirname, "mini-simulio-web");

    if (!fs.existsSync(apiPath)) {
        console.error("Dossier mini-simulio-api non trouvé");
        return;
    }

    if (!fs.existsSync(webPath)) {
        console.error("Dossier mini-simulio-web non trouvé");
        return;
    }

    console.log("Démarrage de l'API Laravel...");
    runCommandAsync("php", ["artisan", "serve"], apiPath, "API");

    await new Promise(resolve => setTimeout(resolve, 2000));

    console.log("Démarrage du frontend React...");
    runCommandAsync("npm", ["run", "dev"], webPath, "WEB");

    await new Promise(resolve => setTimeout(resolve, 2000));

    const pythonPath = await setupPythonEnvironment();

    if (pythonPath && fs.existsSync(pythonPath)) {
        const appPyPath = path.join(__dirname, "app.py");
        if (fs.existsSync(appPyPath)) {
            console.log("Lancement du simulateur Flask...");
            runCommandAsync(pythonPath, ["app.py"], __dirname, "FLASK");
        } else {
            console.error("Fichier app.py non trouvé");
        }
    } else {
        console.error("Impossible de lancer Flask - Python non disponible dans le venv");
    }

    console.log("Tous les services ont été lancés !");
    console.log("URLs disponibles :");
    console.log("   • API Laravel: http://127.0.0.1:8000");
    console.log("   • Frontend React: http://localhost:5173");
    console.log("   • Flask (si configuré): http://127.0.0.1:5000");
}

process.on('SIGINT', () => {
    console.log('Arrêt des services...');
    process.exit(0);
});

process.on('SIGTERM', () => {
    console.log('Arrêt des services...');
    process.exit(0);
});

main().catch(error => {
    console.error("Erreur lors du lancement:", error.message);
    process.exit(1);
});
