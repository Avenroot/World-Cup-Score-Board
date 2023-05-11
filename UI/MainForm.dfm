object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'World Cup Scoreboard'
  ClientHeight = 223
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  StyleName = 'Aqua Graphite'
  TextHeight = 15
  object btnScoreboard: TButton
    Left = 128
    Top = 64
    Width = 145
    Height = 25
    Caption = 'Scoreboard'
    TabOrder = 0
    OnClick = btnScoreboardClick
  end
  object btnClose: TButton
    Left = 128
    Top = 120
    Width = 145
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = btnCloseClick
  end
end
