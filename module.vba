Sub WorkbooksSaveAsCsvToFolder()
'UpdatebyExtendoffice20181031
Dim xObjWB As Workbook
Dim xObjWS As Worksheet
Dim xStrEFPath As String
Dim xStrEFFile As String
Dim xObjFD As FileDialog
Dim xObjSFD As FileDialog
Dim xStrSPath As String
Dim xStrCSVFName As String
 
    Application.ScreenUpdating = False
    Application.EnableEvents = False
    Application.Calculation = xlCalculationManual
    On Error Resume Next
Set xObjFD = Application.FileDialog(msoFileDialogFolderPicker)
    xObjFD.AllowMultiSelect = False
    xObjFD.Title = "Kutools for Excel - Select a folder which contains Excel files"
    If xObjFD.Show <> -1 Then Exit Sub
    xStrEFPath = xObjFD.SelectedItems(1) & "\"
 
    Set xObjSFD = Application.FileDialog(msoFileDialogFolderPicker)
 
    xObjSFD.AllowMultiSelect = False
    xObjSFD.Title = "Kutools for Excel - Select a folder to locate CSV files"
    If xObjSFD.Show <> -1 Then Exit Sub
    xStrSPath = xObjSFD.SelectedItems(1) & "\"
 
    xStrEFFile = Dir(xStrEFPath & "*.xls*")
 
    Do While xStrEFFile <> ""
        Set xObjWB = Workbooks.Open(Filename:=xStrEFPath & xStrEFFile)
        xStrCSVFName = xStrSPath & Left(xStrEFFile, InStr(1, xStrEFFile, ".") - 1) & ".csv"
        xObjWB.SaveAs Filename:=xStrCSVFName, FileFormat:=xlCSV
        xObjWB.Close savechanges:=False
        xStrEFFile = Dir
  Loop
    Application.Calculation = xlCalculationAutomatic
    Application.EnableEvents = True
    Application.ScreenUpdating = True
End Sub