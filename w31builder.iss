; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppName=Sebijk's Mini-Windows 3.1 Builder
AppVerName=Sebijk's Mini-Windows 3.1 Builder Alpha 0.05
AppCopyright=Copyright � 2005 - 2012, Home of the Sebijk.com. This software is released under the terms of the GNU General Public License.
AppPublisher=Home of the Sebijk.com
AppPublisherURL=http://www.sebijk.com
AppSupportURL=http://www.sebijk.com/
AppUpdatesURL=http://www.sebijk.com
VersionInfoCompany=Home of the Sebijk.com
SetupIconFile=X:\WorkingDir\w31builder\files\w31builder.ico
VersionInfoDescription=Sebijk's Mini-Windows 3.1 Builder
VersionInfoProductVersion=0.0.5
DefaultDirName={pf}\Home of the Sebijk.com\Mini-Windows 3.1 Builder
DefaultGroupName=Home of the Sebijk.com\Mini-Windows 3.1 Builder
AllowNoIcons=yes
LicenseFile=X:\WorkingDir\w31builder\LICENSE
InfoBeforeFile=X:\WorkingDir\w31builder\README.md
OutputBaseFilename=w31builder
Compression=lzma2
SolidCompression=yes
WindowVisible=yes
DisableStartupPrompt=no
SignedUninstaller=yes

[Languages]
Name: "german"; MessagesFile: "compiler:Languages\German.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Dirs]
Name: "{app}\plugin"
Name: "{app}\4unzip"

[Files]
Source: "X:\WorkingDir\w31builder\files\*"; DestDir: "{app}"; Flags: ignoreversion; Permissions: users-modify;
Source: "X:\WorkingDir\w31builder\files\wget\*"; DestDir: "{app}\wget"; Flags: ignoreversion
Source: "X:\WorkingDir\w31builder\files\plugin\*"; DestDir: "{app}\plugin"; Flags: ignoreversion; Permissions: users-modify;
;Source: "X:\WorkingDir\w31builder\files\plugin\4unzip\*"; DestDir: "{app}\plugin\calc"; Flags: ignoreversion; Permissions: users-modify;
Source: "X:\WorkingDir\w31builder\files\plugin\calc\*"; DestDir: "{app}\plugin\calc"; Flags: ignoreversion; Permissions: users-modify;
Source: "X:\WorkingDir\w31builder\files\plugin\mcicda\*"; DestDir: "{app}\plugin\mcicda"; Flags: ignoreversion; Permissions: users-modify;
Source: "X:\WorkingDir\w31builder\files\plugin\msdos\*"; DestDir: "{app}\plugin\msdos"; Flags: ignoreversion; Permissions: users-modify;
;Source: "X:\WorkingDir\w31builder\files\plugin\pkzipw\*"; DestDir: "{app}\plugin\pkzipw"; Flags: ignoreversion; Permissions: users-modify;
Source: "X:\WorkingDir\w31builder\files\plugin\taskman\*"; DestDir: "{app}\plugin\taskman"; Flags: ignoreversion; Permissions: users-modify;
Source: "X:\WorkingDir\w31builder\files\plugin\totalcmd\*"; DestDir: "{app}\plugin\totalcmd"; Flags: ignoreversion; Permissions: users-modify;
Source: "X:\WorkingDir\w31builder\files\plugin\w31key\*"; DestDir: "{app}\plugin\w31key"; Flags: ignoreversion; Permissions: users-modify;
Source: "X:\WorkingDir\w31builder\files\plugin\win311\*"; DestDir: "{app}\plugin\win311"; Flags: ignoreversion; Permissions: users-modify;
Source: "X:\WorkingDir\w31builder\files\plugin\windir\*"; DestDir: "{app}\plugin\windir"; Flags: ignoreversion; Permissions: users-modify;
Source: "X:\WorkingDir\w31builder\files\plugin\winfile\*"; DestDir: "{app}\plugin\winfile"; Flags: ignoreversion; Permissions: users-modify;
Source: "X:\WorkingDir\w31builder\files\plugin\wingif\*"; DestDir: "{app}\plugin\wingif"; Flags: ignoreversion; Permissions: users-modify;
Source: "X:\WorkingDir\w31builder\files\plugin\winhelp\*"; DestDir: "{app}\plugin\winhelp"; Flags: ignoreversion; Permissions: users-modify;
Source: "X:\WorkingDir\w31builder\files\plugin\winvi16\*"; DestDir: "{app}\plugin\winvi16"; Flags: ignoreversion; Permissions: users-modify;

[Icons]
Name: "{group}\Mini-Windows 3.1 Builder"; Filename: "{app}\w31builder.vbs"; WorkingDir: "{app}"; IconFilename: "{app}\w31builder.ico";
Name: "{group}\Plugins herunterladen"; Filename: "{app}\getplugins.vbs"; WorkingDir: "{app}"
Name: "{group}\Skript bearbeiten"; Filename: "{app}\scriptedit.bat"; WorkingDir: "{app}"
Name: "{group}\{cm:ProgramOnTheWeb,Home of the Sebijk.com}"; Filename: "http://www.sebijk.com"
Name: "{group}\{cm:UninstallProgram,Mini-Windows 3.1 Builder}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\Mini-Windows 3.1 Builder"; Filename: "{app}\w31builder.vbs"; Tasks: desktopicon; WorkingDir: "{app}"; IconFilename: "{app}\w31builder.ico"
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Mini-Windows 3.1 Builder"; Filename: "{app}\w31builder.vbs"; Tasks: quicklaunchicon; WorkingDir: "{app}"; IconFilename: "{app}\w31builder.ico"

;[Run]
;Filename: "{app}\w31builder.vbs"; Description: "{cm:LaunchProgram,Mini-Windows 3.1 Builder}"; Flags: nowait postinstall skipifsilent; WorkingDir: "{app}"