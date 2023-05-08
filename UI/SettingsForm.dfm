object frmSettings: TfrmSettings
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Settings'
  ClientHeight = 215
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblSpeedOfSim: TLabel
    Left = 84
    Top = 78
    Width = 105
    Height = 15
    Caption = 'Speed of simulation'
  end
  object btnClose: TButton
    Left = 273
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
  end
  object btnOK: TButton
    Left = 192
    Top = 176
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
  end
  object edtSimSpeed: TEdit
    Left = 195
    Top = 75
    Width = 41
    Height = 23
    MaxLength = 2
    NumbersOnly = True
    TabOrder = 2
    Text = '30'
  end
end
