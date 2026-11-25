# YouGlitch SMP 1024 — Windows build

Projet JUCE/CMake pour générer une application Windows Standalone et un plugin VST3.

## GitHub Actions

Le workflow `.github/workflows/windows-build.yml` :

1. détecte automatiquement le dossier contenant `CMakeLists.txt` et les sources attendues ;
2. configure CMake et récupère JUCE 8.0.6 ;
3. compile explicitement `YouGlitchSMP1024_Standalone` puis `YouGlitchSMP1024_VST3` ;
4. collecte l'EXE, le VST3 et les fichiers PDB ;
5. publie l'artefact `YouGlitch-SMP-1024-Windows-x64-Diagnostic`.

Le détecteur prend en charge un dépôt où le dossier du projet a été téléversé à la racine ou dans un sous-dossier.

## Compilation locale

Prérequis : Windows 10/11 x64, Visual Studio 2022 avec « Développement Desktop en C++ », CMake 3.22+ et Internet pour récupérer JUCE.

```powershell
cmake -S . -B build -A x64
cmake --build build --config Release --target YouGlitchSMP1024_Standalone
cmake --build build --config Release --target YouGlitchSMP1024_VST3
```

## État et précautions

Cette archive est un paquet source destiné à être compilé par GitHub Actions. Elle n'inclut pas de binaire déjà validé. Une compilation réussie ne remplace pas les essais d'exécution, de lecture audio, de MIDI, de sauvegarde et de stabilité. En cas de plantage `0xc0000005`, conserver l'EXE et le PDB de la même compilation et produire un dump pour identifier l'instruction fautive.
