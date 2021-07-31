; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Espanso"
#define MyAppVersion "{{{app_version}}}"
#define MyAppPublisher "Federico Terzi"
#define MyAppURL "{{{app_url}}}"
#define MyAppExeName "espansod.exe"
#define MyAppUserModelID "{{5E3B6C0F-1A4D-45C4-8872-D8174702101A}"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{0E3D83CE-A644-4E0E-8487-657C7ECF6BF9}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
LicenseFile="{{{app_license}}}"
; Remove the following line to run in administrative install mode (install for all users.)
PrivilegesRequired=lowest
OutputDir="{{{output_dir}}}"
OutputBaseFilename={{{output_name}}}
SetupIconFile="{{{app_icon}}}"
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ChangesEnvironment=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "{{{executable_path}}}"; DestDir: "{app}"; DestName: "espansod.exe"; Flags: ignoreversion
Source: "{{{app_icon}}}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{{{cli_helper}}}"; DestDir: "{app}"; Flags: ignoreversion
{{{dll_include}}}

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Parameters: "launcher"; AppUserModelID: "{#MyAppUserModelID}"; IconFilename: "{app}\icon.ico";
;Name: "{userstartup}\espanso"; Filename: "{app}\espansod.exe"; Parameters: "launcher"; Tasks:StartMenuEntry;

;[Tasks]
;Name: modifypath; Description: Add espanso to PATH ( recommended );
;Name: "StartMenuEntry" ; Description: "Start espanso at Windows startup" ;

; [Code]
; const
;     ModPathName = 'modifypath';
;     ModPathType = 'user';
; function ModPathDir(): TArrayOfString;
; begin
;     setArrayLength(Result, 1)
;     Result[0] := ExpandConstant('{app}');
; end;
; #include "modpath.iss"
[Run]
Filename: "{app}\{#MyAppExeName}"; Parameters: "launcher"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[UninstallRun]
Filename: "{cmd}"; Parameters: "/C ""taskkill /im espansod.exe /f /t"