VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form Form2 
   Caption         =   "FurbControl"
   ClientHeight    =   2520
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   4215
   Icon            =   "Furby.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   2520
   ScaleWidth      =   4215
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command16 
      Caption         =   "Cache 2"
      Height          =   495
      Left            =   1200
      TabIndex        =   15
      Top             =   1920
      Width           =   975
   End
   Begin VB.CommandButton Command15 
      Caption         =   "Cache 1"
      Height          =   495
      Left            =   120
      TabIndex        =   14
      Top             =   1920
      Width           =   975
   End
   Begin VB.CommandButton Command14 
      Caption         =   "Chante"
      Height          =   495
      Left            =   3240
      TabIndex        =   13
      Top             =   1320
      Width           =   855
   End
   Begin VB.CommandButton Command13 
      Caption         =   "Rigole"
      Height          =   495
      Left            =   2280
      TabIndex        =   12
      Top             =   1320
      Width           =   855
   End
   Begin VB.CommandButton Command12 
      Caption         =   "Chante + rotte"
      Height          =   495
      Left            =   1200
      TabIndex        =   11
      Top             =   1320
      Width           =   975
   End
   Begin VB.CommandButton Command11 
      Caption         =   "Atchoum"
      Height          =   495
      Left            =   120
      TabIndex        =   10
      Top             =   1320
      Width           =   975
   End
   Begin VB.CommandButton Command10 
      Caption         =   "Dance 2"
      Height          =   495
      Left            =   3240
      TabIndex        =   9
      Top             =   720
      Width           =   855
   End
   Begin VB.CommandButton Command9 
      Caption         =   "Dance 1"
      Height          =   495
      Left            =   2280
      TabIndex        =   8
      Top             =   720
      Width           =   855
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Parle 1"
      Height          =   495
      Left            =   120
      TabIndex        =   7
      Top             =   120
      Width           =   975
   End
   Begin VB.CommandButton Command18 
      Caption         =   "Dormir"
      Height          =   495
      Left            =   3240
      TabIndex        =   6
      Top             =   1920
      Width           =   855
   End
   Begin VB.CommandButton Command17 
      Caption         =   "Fatigué"
      Height          =   495
      Left            =   2280
      TabIndex        =   5
      Top             =   1920
      Width           =   855
   End
   Begin VB.Timer Timer2 
      Interval        =   80
      Left            =   4080
      Top             =   720
   End
   Begin VB.CommandButton Command8 
      Caption         =   "C'est la fête"
      Height          =   495
      Left            =   1200
      TabIndex        =   4
      Top             =   720
      Width           =   975
   End
   Begin VB.CommandButton Command7 
      Caption         =   "Parle 5"
      Height          =   495
      Left            =   120
      TabIndex        =   3
      Top             =   720
      Width           =   975
   End
   Begin VB.CommandButton Command6 
      Caption         =   "Parle 4"
      Height          =   495
      Left            =   3240
      TabIndex        =   2
      Top             =   120
      Width           =   855
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Parle 3"
      Height          =   495
      Left            =   2280
      TabIndex        =   1
      Top             =   120
      Width           =   855
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Parle 2"
      Height          =   495
      Left            =   1200
      TabIndex        =   0
      Top             =   120
      Width           =   975
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   4080
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.Menu mnu_instructions 
      Caption         =   "&Instructions"
   End
   Begin VB.Menu mnu_mail 
      Caption         =   "&Evoyer un mail à l'auteur"
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'********************************
' FurbControl par Goebish
' d'aprés une idée de Blank Frank
'********************************

Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Dim t1, t2, t3 As Integer ' utilisés pour le timing
Dim chaine As String    ' chaine à envoyer

' Changer cette constante suivant le port COM a utiliser
Private Const COMPORT = 2

' explication: chr(239) envoie un 'bit furby' à 0 , 255 envoie 1
' schéma (il faut prendre en compte le bit d'arret du port série qui est toujours à 1):
' 239: (on pourrait remplacer cette valeur par n'importe quel octet ayant 1 ou plusieurs bits à 0 à la suite)
' ___  _____
'    ||
'    --
'
' 255:
' __________
'
'
' le furby connait 16 commandes (2^4), les commandes sont envoyés sur 8 'bits furby'
' on commence par envoyer la commande (4 bits)
' puis on envoie 'l'inverse' de ces 4 bits
' par exemple: 1001 0110 (commande 9)
' il faut envoyer cet 'octet furby' 6 fois de suite en respectant un interval de temps entre chaque octets (environ 80ms)
' exemple pour endormir le furby (commande 15): 11110000t11110000t11110000t11110000t11110000t11110000  -->> et la bête nous fout la paix

Private Sub transmit(furbycom As String)
    t3 = 0
    ' on envoie la chaine 6 fois de suite en respectant un interval entre chaque envoi
    Do While t3 < 6
      t2 = t1
      Do While t1 = t2
            DoEvents
      Loop
    MSComm1.Output = furbycom
    t3 = t3 + 1
    Loop
End Sub

' Furby command code 7
Private Sub Command10_Click()
    chaine = Chr(239) + Chr(239) + Chr(239) + Chr(239) + Chr(255) + Chr(255) + Chr(255) + Chr(255) + Chr(239)
    Call transmit(chaine)
End Sub

'Furby command code 8
Private Sub Command11_Click()
    chaine = Chr(239) + Chr(255) + Chr(255) + Chr(255) + Chr(239) + Chr(239) + Chr(239) + Chr(239) + Chr(255)
    Call transmit(chaine)
End Sub

'Furby command code 9
Private Sub Command12_Click()
    chaine = Chr(239) + Chr(239) + Chr(255) + Chr(255) + Chr(239) + Chr(255) + Chr(239) + Chr(239) + Chr(255)
    Call transmit(chaine)
End Sub

'Furby command code 10
Private Sub Command13_Click()
    chaine = Chr(239) + Chr(255) + Chr(239) + Chr(255) + Chr(239) + Chr(239) + Chr(255) + Chr(239) + Chr(255)
    Call transmit(chaine)
End Sub

'Furby command code 11
Private Sub Command14_Click()
    chaine = Chr(239) + Chr(239) + Chr(239) + Chr(255) + Chr(239) + Chr(255) + Chr(255) + Chr(239) + Chr(255)
    Call transmit(chaine)
End Sub

'Furby command code 12
Private Sub Command15_Click()
    chaine = Chr(239) + Chr(255) + Chr(255) + Chr(239) + Chr(239) + Chr(239) + Chr(239) + Chr(255) + Chr(255)
    Call transmit(chaine)
End Sub

'Furby command code 13
Private Sub Command16_Click()
    chaine = Chr(239) + Chr(239) + Chr(255) + Chr(239) + Chr(239) + Chr(255) + Chr(239) + Chr(255) + Chr(255)
    Call transmit(chaine)
End Sub

'Furby command code 14
Private Sub Command17_Click()
    chaine = Chr(239) + Chr(255) + Chr(239) + Chr(239) + Chr(239) + Chr(239) + Chr(255) + Chr(255) + Chr(255)
    Call transmit(chaine)
End Sub

'Furby command code 15
Private Sub Command18_Click()
    chaine = Chr(239) + Chr(239) + Chr(239) + Chr(239) + Chr(239) + Chr(255) + Chr(255) + Chr(255) + Chr(255)
    Call transmit(chaine)
End Sub

'Furby command code 0
Private Sub Command3_Click()
    chaine = Chr(239) + Chr(255) + Chr(255) + Chr(255) + Chr(255) + Chr(239) + Chr(239) + Chr(239) + Chr(239)
    Call transmit(chaine)
End Sub

'Furby command code 1
Private Sub Command4_Click()
    chaine = Chr(239) + Chr(239) + Chr(255) + Chr(255) + Chr(255) + Chr(255) + Chr(239) + Chr(239) + Chr(239)
    Call transmit(chaine)
End Sub

'Furby command code 2
Private Sub Command5_Click()
    chaine = Chr(239) + Chr(255) + Chr(239) + Chr(255) + Chr(255) + Chr(239) + Chr(255) + Chr(239) + Chr(239)
    Call transmit(chaine)
End Sub

'Furby command code 3
Private Sub Command6_Click()
    chaine = Chr(239) + Chr(239) + Chr(239) + Chr(255) + Chr(255) + Chr(255) + Chr(255) + Chr(239) + Chr(239)
    Call transmit(chaine)
End Sub

'Furby command code 4
Private Sub Command7_Click()
    chaine = Chr(239) + Chr(255) + Chr(255) + Chr(239) + Chr(255) + Chr(239) + Chr(239) + Chr(255) + Chr(239)
    Call transmit(chaine)
End Sub

'Furby command code 5
Private Sub Command8_Click()
    chaine = Chr(239) + Chr(239) + Chr(255) + Chr(239) + Chr(255) + Chr(255) + Chr(239) + Chr(255) + Chr(239)
    Call transmit(chaine)
End Sub

'Furby command code 6
Private Sub Command9_Click()
    chaine = Chr(239) + Chr(255) + Chr(239) + Chr(239) + Chr(255) + Chr(239) + Chr(255) + Chr(255) + Chr(239)
    Call transmit(chaine)
End Sub

Private Sub Form_Load()
    ' envoie vers la routine d'erreur si le port COM est déja ouvert ou n'existe pas
    On Error GoTo err
    ' init du port COM
    MSComm1.CommPort = COMPORT
    ' note: le 'port' infrarouge du furby n'étant pas vraiment un port série,
    ' les vitesses de 2400 à 9600bps inclus fonctionnent sans problème
    MSComm1.Settings = "4800,N,8,1"
    MSComm1.PortOpen = True
    Timer2.Enabled = True
    Exit Sub
err:
    ret = MsgBox("Impossible d'ouvrir le port COM" & COMPORT & vbCrLf & "Changez la constante COMPORT !", vbOKOnly, "Furbemul")
    End
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub

' affiche le schéma électronique
Private Sub mnu_instructions_Click()
    Form1.Visible = True
End Sub

Private Sub mnu_mail_Click()
    ret = OpenEmail("goebish@hotmail.com", "A propos de FurbControl", "")
End Sub

' timer pour respecter le "pseudo timing" du furby qui n'est pas du tout prévu pour être controlé de cette façon :)
Private Sub Timer2_Timer()
    If t1 < 1000 Then
        t1 = t1 + 1
    Else
        t1 = 0
    End If
End Sub

' ouvre le client email
Private Function OpenEmail(ByVal EmailAddress As String, Optional Subject As String, Optional Body As String)
    On err GoTo err
    Dim lWindow As Long
    Dim lRet As Long
    Dim sParams As String
    sParams = EmailAddress
    If LCase(Left(sParams, 7)) <> "mailto:" Then sParams = "mailto:" & sParams
    If Subject <> "" Then sParams = sParams & "?subject=" & Subject
    If Body <> "" Then
        sParams = sParams & IIf(Subject = "", "?", "&")
        sParams = sParams & "body=" & Body
    End If
   OpenEmail = ShellExecute(lWindow, "open", sParams, vbNullString, vbNullString, SW_SHOW)
   Exit Function
err:
   ret = MsgBox("Impossible d'envoyer un email !!!", vbOKOnly, "FurbControl")
End Function
