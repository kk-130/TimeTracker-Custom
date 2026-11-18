Option Explicit
Dim WshShell, FSO, appPath, command
Set WshShell = CreateObject("WScript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")
appPath = WshShell.SpecialFolders("Desktop") & "\windows\TimeTracker_Custom.exe"
If Not FSO.FileExists(appPath) Then
    MsgBox "TimeTracker was not found: " & appPath, vbExclamation, "TimeTracker Startup"
    WScript.Quit 1
End If
WshShell.CurrentDirectory = FSO.GetParentFolderName(appPath)
' No --tray argument: show the window and use its saved window-layer setting.
command = Chr(34) & appPath & Chr(34)
If WScript.Arguments.Count > 0 Then
    If WScript.Arguments(0) = "--check" Then
        WScript.Echo command
        WScript.Quit 0
    End If
End If
WshShell.Run command, 1, False
