@echo off
setlocal
cd /d "%~dp0"
cmake -S . -B build -A x64
if errorlevel 1 goto :error
cmake --build build --config Release --target YouGlitchSMP1024_Standalone --parallel 2
if errorlevel 1 goto :error
cmake --build build --config Release --target YouGlitchSMP1024_VST3 --parallel 2
if errorlevel 1 goto :error
echo.
echo Build termine. Cherche les sorties dans build\YouGlitchSMP1024_artefacts\Release.
pause
exit /b 0
:error
echo.
echo ECHEC : consulte le message CMake/MSBuild ci-dessus.
pause
exit /b 1
