Attribute VB_Name = "Module1"
Sub Count()
Attribute Count.VB_ProcData.VB_Invoke_Func = " \n14"
'
' Count 巨集
'
' Set variable
    Dim x As Integer
    x = ActiveSheet.UsedRange.Rows.Count
    y = x - 1
    y = y / 2
    y = y + 1
    Z = y + 1
    Range("B" & y & ":B" & x & "").Select
' Count nulear circle no
    Sheets("UhMaxIsGroup_LhMeanIsRedMean").Select
    Range("A1").Select
    ActiveCell.FormulaR1C1 = "=COUNTA(R[1]C:R[4999]C)"
    Sheets.Add After:=ActiveSheet
    Range("A1").Select
    ActiveCell.FormulaR1C1 = "Column no"
    Range("A2").Select
    ActiveCell.FormulaR1C1 = "Nucleus circle no"
    Range("B1").Select
    ActiveCell.FormulaR1C1 = "=UhMaxIsGroup_LhMeanIsRedMean!RC[-1]"
    Range("B2").Select
    ActiveCell.FormulaR1C1 = "=R[-1]C/2"
' Copy group code from raw results
    Sheets("UhMaxIsGroup_LhMeanIsRedMean").Select
    Range("A1:G" & y & "").Select
    Selection.Copy
    Sheets("工作表1").Select
    Range("D1").Select
    ActiveSheet.Paste
    Columns("E:G").Select
    Selection.Delete Shift:=xlToLeft
    Range("E1").Select
    ActiveCell.FormulaR1C1 = "Group code"
    Range("A3").Select
    ActiveCell.FormulaR1C1 = "Group max"
    Range("B3").Select
     ActiveCell.FormulaR1C1 = "=MAX(R[-1]C[3]:R[5001]C[3])"
' Set red intensity form
    Sheets("UhMaxIsGroup_LhMeanIsRedMean").Select
    Range("C1:G1").Select
    Selection.Copy
    Sheets("工作表1").Select
    Range("H1").Select
    ActiveSheet.Paste
' Copyt red intensity from raw results
    Sheets("UhMaxIsGroup_LhMeanIsRedMean").Select
    Range("C" & Z & ":G" & x & "").Select
    Selection.Copy
    Sheets("工作表1").Select
    Range("H2").Select
    ActiveSheet.Paste
' Set table for group count
    Range("O1").Select
    ActiveCell.FormulaR1C1 = "Group"
    Range("O2").Select
    ActiveCell.FormulaR1C1 = "0"
    Range("O3").Select
    ActiveCell.FormulaR1C1 = "1"
    Range("O4").Select
    ActiveCell.FormulaR1C1 = "2"
    Range("O5").Select
    ActiveCell.FormulaR1C1 = "3"
    Range("O2:O4").Select
    Selection.AutoFill Destination:=Range("O2:O257"), Type:=xlFillDefault
    Range("P1").Select
    ActiveCell.FormulaR1C1 = "nucleus no in each group"
    Range("P2:P257").Select
    Selection.FormulaArray = "=FREQUENCY(RC[-11]:R[4998]C[-11],RC[-1]:R[255]C[-1])"
    
End Sub


