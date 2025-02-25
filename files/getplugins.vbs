'Sebijks Mini-Windows 3.1 Builder Alpha 0.05
'(c) 2005-2019 Home of the Sebijk.com. Lizenz liegt unter der GPL
'http://www.sebijk.com
'Dieses Skript darf verändert und weiterverbreitet werden.

'Variabeln einbinden
Set MyShell = CreateObject("Wscript.Shell")
Set MyFiles = CreateObject("Scripting.FileSystemObject")
Set umgebung = MyShell.Environment("PROCESS")
temp = umgebung("temp")
plugin = ".\plugin"
wget = ".\wget"
title = "Sebijk's Mini-Windows 3.1 Builder Alpha 0.05"

set MyShell = CreateObject("wscript.shell")
set drop=wscript.arguments
if drop.count=0 then
	i=MyShell.popup("Möchten Sie jetzt die Plugins herunterladen?",,title,4 + vbQuestion)
	if i = 6 then
		
		'Rechner
		if not MyFiles.FileExists(plugin & "\calc\calc.exe") then
			if not MyFiles.FileExists(plugin & "\calc\WW1138.EXE") then MyShell.Run wget & "\wget https://web.archive.org/web/20070119165703/https://download.microsoft.com/download/win95upg/update/6/w95/en-us/ww1138.exe --directory-prefix=" & plugin & "\calc",,true
			if not MyFiles.FileExists(plugin & "\calc\WW1138.EXE") then MyShell.Run wget & "\wget http://downloads.sebijk.com/win31/ww1138.exe --directory-prefix=" & plugin & "\calc",,true
		End if
		
		'CD-Audiotreiber
		if not MyFiles.FileExists(plugin & "\mcicda\mcicda.drv") then
			MyShell.Run wget & "\wget http://cwcyrix.nsupdate.info/ftp-archives/ftp.microsoft.com/Softlib/MSLFILES/MCICDA.EXE --directory-prefix=" & plugin & "\mcicda",,true
			if not MyFiles.FileExists(plugin & "\mcicda\MCICDA.EXE") then MyShell.Run wget & "\wget http://downloads.sebijk.com/win31/mcicda.exe --directory-prefix=" & plugin & "\mcicda",,true
		End if
		
		'MS-DOS Executive
		if not MyFiles.FileExists(plugin & "\msdos\msdos.exe") then
			Set w31sjBatch = Myfiles.OpenTextFile( temp & "\w31builder.bat", 2, True)
			w31sjbatch.Writeline "@echo off"
			w31sjbatch.Writeline wget & "\wget https://web.archive.org/web/20051215122706/http://oldfiles.org.uk/powerload/download/msexe.exe --directory-prefix=" & plugin & "\msdos"
			w31sjbatch.Writeline "cd " & plugin & "\msdos"
			w31sjbatch.Writeline "echo Bitte best„tigen Sie es mit ""y""."
			w31sjbatch.Writeline "echo Das Programm wird in das Pluginverzeichnis entpackt."
			w31sjbatch.Writeline "msexe.exe"
			w31sjbatch.Close
			MyShell.Run temp & "\w31builder.bat",,true
			MyFiles.DeleteFile temp & "\w31builder.bat"
		End If
		if MyFiles.FileExists(plugin & "\msdos\msdos.exe") then
			Set w31sjBatch = Myfiles.OpenTextFile( temp & "\w31builder.bat", 2, True)
			w31sjbatch.Writeline "@echo off"
			w31sjbatch.Writeline "if exist msdos.exe cd ..\.."
			w31sjbatch.Writeline "if exist " & plugin & "\msdos\msexe.exe del " & plugin & "\msdos\msexe.exe"
			w31sjbatch.Close
			MyShell.Run temp & "\w31builder.bat",,true
			MyFiles.DeleteFile temp & "\w31builder.bat"
		End If
		
		Set w31sjBatch = Myfiles.OpenTextFile( temp & "\w31builder.bat", 2, True)
		'w31builder.bat schreiben
		w31sjbatch.Writeline "@echo off"
		
		'Taskmanager
		w31sjbatch.Writeline "if not exist " & plugin & "\taskman\taskman.exe " & wget & "\wget http://downloads.sebijk.com/win31/xtaskman.zip --directory-prefix=" & plugin & "\taskman"
		w31sjbatch.Writeline "if not exist " & plugin & "\taskman\taskman.exe unzip32 -o " & plugin & "\taskman\xtaskman.zip -d " & plugin & "\taskman"
		w31sjbatch.Writeline "if exist " & plugin & "\taskman\taskman.exe del " & plugin & "\taskman\xtaskman.zip"
		'Rechner
		'Download siehe oben
		w31sjbatch.Writeline "if not exist " & plugin & "\calc\calc.exe cd " & plugin & "\calc"
		w31sjbatch.Writeline "if not exist calc.exe WW1138.EXE"
		w31sjbatch.Writeline "if exist calc.exe cd ..\.."
		w31sjbatch.Writeline "if exist " & plugin & "\calc\WW1138.EXE del " & plugin & "\calc\WW1138.EXE"
		'W31Key
		w31sjbatch.Writeline "if not exist " & plugin & "\w31key\w31key.exe " & wget & "\wget https://web.archive.org/web/20060624114425/http://www.bihler-online.de/freeware/download/w31key.zip --directory-prefix=" & plugin & "\w31key"
		w31sjbatch.Writeline "if not exist " & plugin & "\w31key\w31key.exe unzip32 -o " & plugin & "\w31key\w31key.zip -d " & plugin & "\w31key"
		w31sjbatch.Writeline "if exist " & plugin & "\w31key\w31key.exe del " & plugin & "\w31key\w31key.zip"
		'CD-Audiotreiber
		'Download siehe oben
		w31sjbatch.Writeline "if not exist " & plugin & "\mcicda\mcicda.drv cd " & plugin & "\mcicda"
		w31sjbatch.Writeline "if not exist mcicda.drv MCICDA.EXE"
		w31sjbatch.Writeline "if exist mcicda.drv cd ..\.."
		w31sjbatch.Writeline "if exist " & plugin & "\mcicda\MCICDA.EXE del " & plugin & "\mcicda\MCICDA.EXE"
		'Datei-Manager
		w31sjbatch.Writeline "if not exist " & plugin & "\winfile\winfile.exe " & wget & "\wget http://download.microsoft.com/download/wfw311/Update/3.11.0.304/WIN/DE/WFWY2KDE.EXE --directory-prefix=" & plugin & "\winfile"
		w31sjbatch.Writeline "if not exist " & plugin & "\winfile\winfile.exe " & wget & "\wget http://www.conradshome.com/win31/files/wgfmdll.exe --directory-prefix=" & plugin & "\winfile"
		w31sjbatch.Writeline "if not exist " & plugin & "\winfile\winfile.exe cd " & plugin & "\winfile"
		w31sjbatch.Writeline "if not exist winfile.exe WFWY2KDE.EXE"
		w31sjbatch.Writeline "if not exist winfile.exe ..\..\unzip32 -o wgfmdll.exe"
		w31sjbatch.Writeline "if exist winfile.y2k del winfile.exe"
		w31sjbatch.Writeline "if exist winfile.y2k ren winfile.y2k winfile.exe"
		w31sjbatch.Writeline "if exist INSTALL.BAT del INSTALL.BAT"
		w31sjbatch.Writeline "if exist winfile.exe cd ..\.."
		w31sjbatch.Writeline "if exist " & plugin & "\winfile\WFWY2KDE.EXE del " & plugin & "\winfile\WFWY2KDE.EXE"
		w31sjbatch.Writeline "if exist " & plugin & "\winfile\wgfmdll.exe del " & plugin & "\winfile\wgfmdll.exe"
		'Windows-Hilfe (wenn das laufende Betriebsystem NT/2000/XP oder Vista ist)
		w31sjbatch.Writeline "if ""%OS%""==""Windows_NT"" copy %windir%\winhelp.exe " & plugin & "\winhelp"
		'4 UnZip
		w31sjbatch.Writeline "if not exist " & plugin & "\4unzip\UNZ_TEST.EXE " & wget & "\wget http://downloads.sebijk.com/win31/4unzip.zip --directory-prefix=" & plugin & "\4unzip"
		w31sjbatch.Writeline "if not exist " & plugin & "\4unzip\UNZ_TEST.EXE unzip32 -o " & plugin & "\4unzip\4unzip.zip -d " & plugin & "\4unzip"
		w31sjbatch.Writeline "if exist " & plugin & "\4unzip\UNZ_TEST.EXE del " & plugin & "\4unzip\4unzip.zip"
		w31sjbatch.Writeline "pause"
		w31sjbatch.Close
		MyShell.Run temp & "\w31builder.bat",,true
		myfiles.DeleteFile temp & "\w31builder.bat"
		'Fertig
		MsgBox "Fertig!", 64, title
		End If
		End If
