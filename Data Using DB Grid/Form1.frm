VERSION 5.00
Object = "{00028C01-0000-0000-0000-000000000046}#1.0#0"; "DBGRID32.OCX"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Add Data Using DBGRID........"
   ClientHeight    =   2655
   ClientLeft      =   30
   ClientTop       =   330
   ClientWidth     =   4350
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2655
   ScaleWidth      =   4350
   StartUpPosition =   3  'Windows Default
   Begin MSDBGrid.DBGrid DBGrid1 
      Bindings        =   "Form1.frx":0000
      Height          =   732
      Left            =   120
      OleObjectBlob   =   "Form1.frx":0014
      TabIndex        =   4
      Top             =   960
      Width           =   4212
   End
   Begin VB.TextBox Text2 
      DataField       =   "Email"
      DataSource      =   "Data1"
      Height          =   288
      Left            =   600
      TabIndex        =   1
      Top             =   480
      Width           =   2652
   End
   Begin VB.TextBox Text1 
      DataField       =   "Name"
      DataSource      =   "Data1"
      Height          =   288
      Left            =   600
      TabIndex        =   0
      Top             =   120
      Width           =   2652
   End
   Begin VB.Data Data1 
      Caption         =   "Email List # 1"
      Connect         =   "Access"
      DatabaseName    =   "C:\WINDOWS\Desktop\Data Using DB Grid\Data.mdb"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      EOFAction       =   2  'Add New
      Exclusive       =   0   'False
      Height          =   324
      Left            =   480
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "DATA"
      Top             =   1800
      Width           =   3492
   End
   Begin VB.Label Label2 
      Caption         =   "E-Mail"
      Height          =   252
      Left            =   120
      TabIndex        =   3
      Top             =   480
      Width           =   492
   End
   Begin VB.Label Label1 
      Caption         =   "Name"
      Height          =   252
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   492
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Este Codigo fue Creado por JOSE MANUEL MENDEZ
' This code was made by JOSE MANUEL MENDEZ


Private Sub Command1_Click()
MSFlexGrid1.AddItem Text1.Text + vbTab + Text2.Text
End Sub

Private Sub Command2_Click()
Data1.RecordSource = "Data"
Data1.Recordset("Name") = CStr(Text1.Text)
Data1.Recordset("Tel.") = CStr(Text2.Text)

If Data1.Recordset.BOF Or Data1.Recordset.EOF Then
Data1.Recordset.Update
End If
SPATH = App.Path + "\data.mdb"
Set daoDB36 = DBEngine.OpenDatabase(SPATH)
'Set rs2 = daoDB36.OpenRecordset(SPATH)
'Set Data1.Recordset = rs2
Data1.Refresh
End Sub

