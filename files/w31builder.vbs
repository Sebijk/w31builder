'Sebijk Mini-Windows 3.1 Builder Alpha 0.05
'(c) 2005-2019 Home of the Sebijk.com. Lizenz liegt unter der GPL
'http://www.sebijk.com
'Dieses Skript darf verändert und weiterverbreitet werden.

'Variabeln einbinden
Set MyShell = CreateObject("Wscript.Shell")
Set MyFiles = CreateObject("Scripting.FileSystemObject")
Set AppShell = CreateObject("Shell.Application")
Set umgebung = MyShell.Environment("PROCESS")
temp = umgebung("temp")
plugin = ".\plugin"
title = "Sebijk's Mini-Windows 3.1 Builder Alpha 0.05"

if not MyFiles.FileExists(plugin & "\msdos\msdos.exe") then 
set load_plugins=wscript.arguments
if load_plugins.count=0 then
	i=MyShell.popup(title & " hat entdeckt, dass die erforderlichen Plugins noch nicht heruntergeladen worden sind. Möchten Sie ""getplugins.vbs"" starten?",,title,4 + vbQuestion)
	if i = 6 then MyShell.Run "getplugins.vbs",,true
	WScript.Quit
End If
End if


Set BrowsePfad = Appshell.BrowseForFolder(0, "Bitte wählen Sie ein Ordner aus, wo sich die Windows 95/98/Me-Installationsdateien befinden.",  &H0001, 17)
On Error Resume Next
If BrowsePfad = "" Then wscript.quit
Ordner = BrowsePfad.ParentFolder.ParseName(BrowsePfad.Title).Path
	If err.number > 0 Then
	i=instr(BrowsePfad, ":")
	Ordner = mid(BrowsePfad, i - 1, 1) & ":\"
	End If
	
If not (MyFiles.FolderExists(Ordner)) Then
	g = msgbox("Wählen Sie bitte einen gültigen Ordner aus.",vbCritical,title)
	wscript.quit
End If
quellpfad = Ordner
If quellpfad = "" then MsgBox "Sie haben kein Quellpfad eingegeben. Das Programm wird beendet!", vbCritical, title
If quellpfad = "" then WScript.Quit
'Zielpfad eingeben
zielpfad = InputBox("Bitte geben Sie den Zielpfad wo Mini-Windows 3.1 entpackt werden soll ein.",title,"C:\mini31")
If zielpfad = "" then MsgBox "Sie haben abgebrochen!", vbCritical, title
If zielpfad = "" then WScript.Quit
set MyShell = CreateObject("wscript.shell")
set drop=wscript.arguments
if drop.count=0 then
	i=MyShell.popup("Sie haben als Quellpfad " & quellpfad & " angeben und den Zielpfad " & zielpfad & " eingegeben!" _
	& VbCr & title & " startet jetzt den Vorgang. Wollen Sie fortfahren?",,title,4 + vbQuestion)
	if i = 6 then
		Set w31sjBatch = Myfiles.OpenTextFile( temp & "\w31builder.bat", 2, True)
		if MyFiles.FolderExists(zielpfad) then MyFiles.DeleteFolder(zielpfad)
		'w31builder.bat schreiben
		w31sjbatch.Writeline "@echo off"
		w31sjbatch.Writeline "echo " & title
		w31sjbatch.Writeline "echo (c) 2005-2019 Home of the Sebijk.com. Lizenz liegt unter der GPL"
		w31sjbatch.Writeline "echo http://www.sebijk.com"
		w31sjbatch.Writeline "REM Copyright-Hinweis darf nicht entfernt werden."
		w31sjbatch.Writeline "if ""%OS%""==""Windows_NT"" title " & title
		w31sjbatch.Writeline "echo."
		w31sjbatch.Writeline "if exist " & zielpfad & "del " & zielpfad
		w31sjbatch.Writeline "if exist " & zielpfad & "rd " & zielpfad
		w31sjbatch.Writeline "md " & zielpfad
		w31sjbatch.Writeline "md " & zielpfad & "\syswin"
		w31sjbatch.Writeline "if exist " & quellpfad & "\win95\extract.exe set winsource=" & quellpfad & "\win95"
		w31sjbatch.Writeline "if exist " & quellpfad & "\win98\extract.exe set winsource=" & quellpfad & "\win98"
		w31sjbatch.Writeline "if exist " & quellpfad & "\win9x\extract.exe set winsource=" & quellpfad & "\win9x"
		'Bei CD-ROM Laufwerken
		w31sjbatch.Writeline "if exist " & quellpfad & "win95\extract.exe set winsource=" & quellpfad & "win95"
		w31sjbatch.Writeline "if exist " & quellpfad & "win98\extract.exe set winsource=" & quellpfad & "win98"
		w31sjbatch.Writeline "if exist " & quellpfad & "win9x\extract.exe set winsource=" & quellpfad & "win9x"
		w31sjbatch.Writeline "%winsource%\extract.exe /E %winsource%\mini.cab /L " & zielpfad & "\syswin"
		w31sjbatch.Writeline "%winsource%\extract.exe /A %winsource%\precopy1.cab shell.dll /L " & zielpfad & "\syswin"
		w31sjbatch.Writeline "%winsource%\extract.exe %winsource%\precopy1.cab commdlg.dll /L " & zielpfad & "\syswin"
		w31sjbatch.Writeline "%winsource%\extract.exe %winsource%\precopy1.cab commctrl.dll /L " & zielpfad & "\syswin"
		w31sjbatch.Writeline "%winsource%\extract.exe %winsource%\precopy1.cab /A ver.dll /L " & zielpfad & "\syswin"
		w31sjbatch.Writeline "copy " & zielpfad & "\syswin\dosx.exe " & zielpfad & "\syswin\win386.exe"
		w31sjbatch.Writeline "if ""%winsource%""==""" & quellpfad & "\win95"" %winsource%\extract.exe /A %winsource%\win95_02.cab CTL3D.DLL /L " & zielpfad & "\syswin"
		w31sjbatch.Writeline "if ""%winsource%""==""" & quellpfad & "\win98"" %winsource%\extract.exe %winsource%\win98_26.cab CTL3D.DLL /L " & zielpfad & "\syswin"
		w31sjbatch.Writeline "if ""%winsource%""==""" & quellpfad & "\win9x"" %winsource%\extract.exe /A %winsource%\win_8.cab CTL3D.DLL /L " & zielpfad & "\syswin"
		w31sjbatch.Writeline "if ""%winsource%""==""" & quellpfad & "\win95"" %winsource%\extract.exe %winsource%\win95_13.cab CTL3DV2.DLL /L " & zielpfad & "\syswin"
		w31sjbatch.Writeline "if ""%winsource%""==""" & quellpfad & "\win98"" %winsource%\extract.exe %winsource%\win98_26.cab CTL3DV2.DLL /L " & zielpfad & "\syswin"
		w31sjbatch.Writeline "if ""%winsource%""==""" & quellpfad & "\win9x"" %winsource%\extract.exe /A %winsource%\win_8.cab CTL3DV2.DLL /L " & zielpfad & "\syswin"
		w31sjbatch.Writeline "if ""%winsource%""==""" & quellpfad & "\win98"" %winsource%\extract.exe %winsource%\win98_45.cab wininit.exe /L " & zielpfad
		w31sjbatch.Writeline "xcopy /E " & plugin & "\windir " & zielpfad
		w31sjbatch.Writeline "if exist " & plugin & "\msdos\msdos.exe copy " & plugin & "\msdos " & zielpfad
		'Zusätzliche Plugins
		w31sjbatch.Writeline "if exist " & plugin & "\taskman\taskman.exe copy " & plugin & "\taskman " & zielpfad
		w31sjbatch.Writeline "if exist " & plugin & "\calmira\calmira.exe md " & zielpfad & "\calmira"
		w31sjbatch.Writeline "if exist " & plugin & "\calmira\calmira.exe xcopy /E " & plugin & "\calmira " & zielpfad & "\calmira"
		w31sjbatch.Writeline "if exist " & plugin & "\calc\calc.exe xcopy /E " & plugin & "\calc\calc.exe " & zielpfad
		w31sjbatch.Writeline "if exist " & plugin & "\winhelp\winhelp.exe copy " & plugin & "\winhelp\winhelp.exe " & zielpfad
		w31sjbatch.Writeline "if exist " & plugin & "\winhelp\*.hlp copy " & plugin & "\winhelp\*.hlp " & zielpfad
		w31sjbatch.Writeline "if exist " & plugin & "\w31key\w31key.exe copy " & plugin & "\w31key\w31key.exe " & zielpfad
		w31sjbatch.Writeline "if exist " & plugin & "\winvi16\WinVi16.exe copy " & plugin & "\winvi16\WinVi16.exe " & zielpfad
		w31sjbatch.Writeline "if exist " & plugin & "\totalcmd\tcmd16.exe md " & zielpfad & "\totalcmd"
		w31sjbatch.Writeline "if exist " & plugin & "\totalcmd\tcmd16.exe xcopy /E " & plugin & "\totalcmd " & zielpfad & "\totalcmd"
		w31sjbatch.Writeline "if exist " & plugin & "\pkzipw\pkzipw.exe md " & zielpfad & "\pkzipw"
		w31sjbatch.Writeline "if exist " & plugin & "\pkzipw\pkzipw.exe xcopy /E " & plugin & "\pkzipw " & zielpfad & "\pkzipw"
		w31sjbatch.Writeline "if exist " & plugin & "\wingif\wingif.exe xcopy /E " & plugin & "\pkzipw " & zielpfad & "\wingif"
		w31sjbatch.Writeline "if exist " & plugin & "\mcicda\mcicda.drv copy " & plugin & "\mcicda\mcicda.drv " & zielpfad & "\syswin"
		w31sjbatch.Writeline "if exist " & plugin & "\winfile\winfile.exe copy " & plugin & "\winfile\winfile.exe " & zielpfad
		w31sjbatch.Writeline "if exist " & plugin & "\winfile\winfile.exe copy " & plugin & "\winfile\*.dll " & zielpfad & "\syswin"
		w31sjbatch.Writeline "if exist " & plugin & "\win311\user.exe xcopy /E " & plugin & "\win311 " & zielpfad & "\syswin"
		w31sjbatch.Writeline "if exist " & plugin & "\4unzip\UNZ_TEST.EXE copy " & plugin & "\4unzip\UNZ_TEST.EXE " & zielpfad & "\4unzip.exe"
		w31sjbatch.Writeline "if exist " & plugin & "\4unzip\UNZ_TEST.EXE copy " & plugin & "\4unzip\wizunz16.dll " & zielpfad
		'Dateien, die man nicht benötigt, werden entfernt
		w31sjbatch.Writeline "if exist " & zielpfad & "\*.wri del " & zielpfad & "\*.wri"
		w31sjbatch.Writeline "if exist " & zielpfad & "\*.diz del " & zielpfad & "\*.diz"
		w31sjbatch.Writeline "if exist " & zielpfad & "\*.txt del " & zielpfad & "\*.txt"
		w31sjbatch.Writeline "if exist " & zielpfad & "\*.htm del " & zielpfad & "\*.htm"
		w31sjbatch.Writeline "pause"
		w31sjbatch.Close
		MyShell.Run temp & "\w31builder.bat",,true
		myfiles.DeleteFile temp & "\w31builder.bat"
		'System.ini und Win.ini löschen
		myfiles.DeleteFile zielpfad & "\syswin\system.ini"
		myfiles.DeleteFile zielpfad & "\syswin\win.ini"
		'System.ini neu schreiben
		Set sysini = Myfiles.OpenTextFile( zielpfad & "\system.ini", 2, True)
		sysini.Writeline "[boot]"           
		sysini.Writeline "language=langger.dll"
		sysini.Writeline "; msdos.exe ist die Standard-Shell"
		sysini.Writeline "shell=msdos.exe"
		sysini.Writeline "mouse.drv=msmous31.drv"
		sysini.Writeline "comm.drv=comm.drv"
		sysini.Writeline "system.drv=system.drv"
		sysini.Writeline "keyboard.drv=keyboard.drv"
		sysini.Writeline "display.drv=vga.drv"
		sysini.Writeline "sound.drv=sound.drv"
		sysini.Writeline "network.drv="
		sysini.Writeline "oemfonts.fon=vgaoem.fon"
		sysini.Writeline "fixedfon.fon=vgafix.fon"
		sysini.Writeline "fonts.fon=vgasys.fon"
		sysini.Writeline "fixedfon.fon=vgafix.fon"
		sysini.Writeline "fonts.fon=vgasys.fon"
		sysini.Writeline "taskman.exe=taskman.exe"
		sysini.Writeline ""
		sysini.Writeline "[keyboard]"
		sysini.Writeline "oemansi.bin=xlat850.bin"
		sysini.Writeline "keyboard.dll=minikbd.dll"
		sysini.Writeline ""
		sysini.Writeline "[boot.description]"
		sysini.Writeline "keyboard.typ=Erweiterte 101-/102-Tasten oder andere"
		sysini.Writeline "mouse.drv=Microsoft, oder IBM PS/2"
		sysini.Writeline "language.dll=Neutral"
		sysini.Writeline "system.drv=MS-DOS-System mit APM"
		sysini.Writeline "codepage=850"
		sysini.Writeline "woafont.fon=Mehrsprachig (850)"
		sysini.Writeline "aspect=100,96,96"
		sysini.Writeline "display.drv=VGA"
		sysini.Close
		'Datei serialno.ini schreiben
		Set infoini = Myfiles.OpenTextFile( zielpfad & "\serialno.ini", 2, True)
		infoini.Writeline "[Microsoft Products]"           
		infoini.Writeline "mswindows=Microsoft Windows 3.1"
		infoini.Writeline ""
		infoini.Writeline "[mswindows]"
		infoini.Writeline "username=Sebijk's Mini-Windows 3.1"
		infoini.Writeline "company=erstellt mit Sebijk's Mini-Windows 3.1 Builder"
		infoini.Writeline "serialno=NICHT EINGEGEBEN"
		infoini.Close
		'win.ini neu schreiben
		Set winini = Myfiles.OpenTextFile( zielpfad & "\win.ini", 2, True)
		winini.Writeline "; Load the fonts for setup when running Mini-Windows"
		winini.Writeline "[fonts]"
		winini.Writeline "MS Serif 8,10,12,14,18,24 (VGA-Auflösung)=SERIFE.FON"
		winini.Writeline "MS Sans Serif 8,10,12,14,18,24 (VGA-Auflösung)=SSERIFE.FON"
		winini.Writeline "Times New Roman=times.fot"
		winini.Writeline "Times New Roman Bold=timesbd.fot"
		winini.Writeline "Arial=arial.fot"
		winini.Writeline "Arial Bold=arialbd.fot"
		winini.Writeline ""
		winini.Writeline "; Dateitypen registrieren"
		winini.Writeline "[Extensions]"
		if MyFiles.FileExists(zielpfad & "\WinVi16.exe") then
			winini.Writeline "txt=winvi16.exe ^.txt"
			winini.Writeline "ini=winvi16.exe ^.ini"
			winini.Writeline "inf=winvi16.exe ^.inf"
		End If
		if MyFiles.FileExists(zielpfad & "\winhelp.exe") then winini.Writeline "hlp=winhelp.exe ^.hlp"
		winini.Writeline ""
		winini.Writeline "[mci]"
		if MyFiles.FileExists(zielpfad & "\syswin\mcicda.drv") then winini.Writeline "CDAudio=mcicda.drv"
		winini.Writeline ""
		winini.Writeline "[TrueType]"
		winini.Writeline "TTEnable=1"
		winini.Writeline ""
		winini.Writeline "[windows]"
		winini.Writeline "Beep=yes"
		winini.Writeline ""
		winini.Writeline "[Desktop]"
		winini.Writeline "Wallpaper=win31sj.bmp"
		winini.Writeline ""
		'Nur wenn das Plugin WinVi eingebunden wurde, wird diese Aktion ausgeführt
		if MyFiles.FileExists(zielpfad & "\winvi16.exe") then winini.Writeline "[Ramo's WinVi]"
		if MyFiles.FileExists(zielpfad & "\winvi16.exe") then winini.Writeline "Language=de"
		winini.Close
		'Fertig
		MsgBox "Sebijks Mini-Windows 3.1 Dateien wurden in " & zielpfad & " abgelegt. Das Programm wird beendet.", 64, title
		End If
	wscript.quit
end if