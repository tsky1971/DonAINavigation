@echo off

set EngineVesion=5.4

for /f "skip=2 tokens=2*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\EpicGames\Unreal Engine\%EngineVesion%" /v "InstalledDirectory"') do set "EngineDirectory=%%b"

set AutomationToolPath="%EngineDirectory%\Engine\Build\BatchFiles\RunUAT.bat"
set PluginPath="%cd%\DonAINavigation.uplugin"
set OutputPath="%cd%\Build"

set "LINUX_MULTIARCH_ROOT=C:\UnrealToolchains\v23_clang-18.1.0-rockylinux8"
set "LINUX_ROOT=C:\UnrealToolchains\v23_clang-18.1.0-rockylinux8\x86_64-unknown-linux-gnu"
set "UE_LINUX_CORE_PATH=%LINUX_MULTIARCH_ROOT%"

title Build Plugin UE 5.4 (Win64 & Linux)
echo Engine: %EngineDirectory%
echo Toolchain: %LINUX_MULTIARCH_ROOT%
echo:

title Build Plugin
echo Automation Tool Path: %AutomationToolPath%
echo:

rem call %AutomationToolPath% BuildPlugin -Plugin=%PluginPath% -Package=%OutputPath% -Rocket -TargetPlatforms="Win64+Linux"
call %AutomationToolPath% BuildPlugin -Plugin=%PluginPath% -Package=%OutputPath% -Rocket -TargetPlatforms=Linux
echo:
pause
exit 0
