VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Instructions"
   ClientHeight    =   5580
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6630
   Icon            =   "Instructions.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   5580
   ScaleWidth      =   6630
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.Frame Frame1 
      Caption         =   "Shéma électronique"
      Height          =   4815
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   6375
      Begin VB.Label Label20 
         Caption         =   "GD,TX = broches sur connecteur DB9 ou DB25 femelle (suivant votre PC)"
         Height          =   255
         Left            =   240
         TabIndex        =   20
         Top             =   4440
         Width           =   5415
      End
      Begin VB.Label Label17 
         Caption         =   "G1 = pile ou transformateur 9 volts (la consommation est quasi nulle)"
         Height          =   255
         Left            =   240
         TabIndex        =   17
         Top             =   4200
         Width           =   5295
      End
      Begin VB.Label Label16 
         Caption         =   "D1 = diode d'émition infrarouge (récupérée dans une vieille télécommande)"
         Height          =   255
         Left            =   240
         TabIndex        =   16
         Top             =   3960
         Width           =   5535
      End
      Begin VB.Label Label15 
         Caption         =   "T1 = n'importe quel transistor PNP de faible puissance (VN10LM,VN46AF,2N7000...)"
         Height          =   255
         Left            =   240
         TabIndex        =   15
         Top             =   3720
         Width           =   6015
      End
      Begin VB.Label Label14 
         Caption         =   "R2 = 100k ohms (marron,noir,jaune)"
         Height          =   255
         Left            =   240
         TabIndex        =   14
         Top             =   3480
         Width           =   3015
      End
      Begin VB.Label Label13 
         Caption         =   "R1 = 100 ohms (marron,noir,marron)"
         Height          =   255
         Left            =   240
         TabIndex        =   13
         Top             =   3240
         Width           =   3975
      End
      Begin VB.Label Label12 
         BackStyle       =   0  'Transparent
         Caption         =   "G1"
         Height          =   255
         Left            =   4530
         TabIndex        =   12
         Top             =   1740
         Width           =   375
      End
      Begin VB.Label Label11 
         BackStyle       =   0  'Transparent
         Caption         =   "R1"
         Height          =   255
         Left            =   3420
         TabIndex        =   11
         Top             =   645
         Width           =   375
      End
      Begin VB.Label Label10 
         Caption         =   "D1"
         Height          =   255
         Left            =   4200
         TabIndex        =   10
         Top             =   480
         Width           =   375
      End
      Begin VB.Label Label9 
         BackStyle       =   0  'Transparent
         Caption         =   "+"
         Height          =   255
         Left            =   5340
         TabIndex        =   9
         Top             =   1845
         Width           =   255
      End
      Begin VB.Label Label8 
         BackStyle       =   0  'Transparent
         Caption         =   "_"
         Height          =   375
         Left            =   5355
         TabIndex        =   8
         Top             =   1620
         Width           =   255
      End
      Begin VB.Line Line18 
         X1              =   4800
         X2              =   5280
         Y1              =   1800
         Y2              =   1800
      End
      Begin VB.Line Line17 
         X1              =   4920
         X2              =   5160
         Y1              =   1920
         Y2              =   1920
      End
      Begin VB.Line Line16 
         X1              =   5040
         X2              =   5040
         Y1              =   2880
         Y2              =   1920
      End
      Begin VB.Line Line15 
         X1              =   5040
         X2              =   5040
         Y1              =   930
         Y2              =   1800
      End
      Begin VB.Line Line14 
         X1              =   4440
         X2              =   5040
         Y1              =   915
         Y2              =   915
      End
      Begin VB.Line Line13 
         X1              =   4440
         X2              =   4440
         Y1              =   1080
         Y2              =   720
      End
      Begin VB.Line Line12 
         X1              =   4080
         X2              =   4440
         Y1              =   915
         Y2              =   1080
      End
      Begin VB.Line Line11 
         X1              =   4080
         X2              =   4440
         Y1              =   915
         Y2              =   720
      End
      Begin VB.Line Line10 
         X1              =   4080
         X2              =   4080
         Y1              =   1095
         Y2              =   735
      End
      Begin VB.Line Line9 
         X1              =   3720
         X2              =   4080
         Y1              =   915
         Y2              =   915
      End
      Begin VB.Shape Shape4 
         Height          =   135
         Left            =   3345
         Top             =   855
         Width           =   375
      End
      Begin VB.Label Label7 
         Caption         =   "T1"
         Height          =   255
         Left            =   2565
         TabIndex        =   7
         Top             =   975
         Width           =   375
      End
      Begin VB.Label Label6 
         BackStyle       =   0  'Transparent
         Caption         =   "e"
         Height          =   255
         Left            =   2520
         TabIndex        =   6
         Top             =   1230
         Width           =   255
      End
      Begin VB.Label Label5 
         BackStyle       =   0  'Transparent
         Caption         =   "c"
         Height          =   255
         Left            =   2520
         TabIndex        =   5
         Top             =   735
         Width           =   255
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "b"
         Height          =   255
         Left            =   2325
         TabIndex        =   4
         Top             =   885
         Width           =   255
      End
      Begin VB.Line Line8 
         X1              =   3000
         X2              =   3000
         Y1              =   1260
         Y2              =   2880
      End
      Begin VB.Line Line7 
         X1              =   2520
         X2              =   3360
         Y1              =   915
         Y2              =   915
      End
      Begin VB.Line Line6 
         X1              =   2505
         X2              =   2985
         Y1              =   1260
         Y2              =   1260
      End
      Begin VB.Line Line5 
         X1              =   2490
         X2              =   2490
         Y1              =   1440
         Y2              =   720
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "R2"
         Height          =   255
         Left            =   1560
         TabIndex        =   3
         Top             =   1860
         Width           =   375
      End
      Begin VB.Line Line4 
         X1              =   1860
         X2              =   1860
         Y1              =   2175
         Y2              =   2895
      End
      Begin VB.Line Line3 
         X1              =   1875
         X2              =   1875
         Y1              =   1800
         Y2              =   1080
      End
      Begin VB.Shape Shape3 
         Height          =   375
         Left            =   1800
         Top             =   1800
         Width           =   135
      End
      Begin VB.Line Line2 
         X1              =   795
         X2              =   5040
         Y1              =   2880
         Y2              =   2880
      End
      Begin VB.Line Line1 
         X1              =   810
         X2              =   2490
         Y1              =   1080
         Y2              =   1080
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "GD (broche 5 sur DB9 ou 7 sur DB25)"
         Height          =   615
         Left            =   210
         TabIndex        =   2
         Top             =   2055
         Width           =   975
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "TX (broche 3 sur DB9 ou 2 sur DB25)"
         Height          =   615
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   1215
      End
      Begin VB.Shape Shape2 
         Height          =   255
         Left            =   480
         Shape           =   3  'Circle
         Top             =   2760
         Width           =   375
      End
      Begin VB.Shape Shape1 
         Height          =   255
         Left            =   480
         Shape           =   3  'Circle
         Top             =   960
         Width           =   375
      End
   End
   Begin VB.Label Label19 
      Alignment       =   2  'Center
      Caption         =   $"Instructions.frx":1272
      Height          =   495
      Left            =   240
      TabIndex        =   19
      Top             =   5160
      Width           =   6375
   End
   Begin VB.Label Label18 
      Caption         =   "Commandez un Furby par infrarouge à partir d'un port série de votre PC !!!"
      Height          =   255
      Left            =   720
      TabIndex        =   18
      Top             =   0
      Width           =   5295
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' le schéma n'est pas bien compliqué à comprendre:
'
' quand il y a du courant dans la broche d'émition du port
' série, le transistor commande à la pile d'alimenter la
' diode infrarouge....
