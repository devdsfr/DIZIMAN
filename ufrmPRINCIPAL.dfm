object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Align = alCustom
  AutoSize = True
  Caption = 'DIZIMAN - Controle de D'#237'zimo'
  ClientHeight = 529
  ClientWidth = 584
  Color = clScrollBar
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object btajudas: TImage
    Left = 8
    Top = 113
    Width = 65
    Height = 73
  end
  object btdizimo: TImage
    Left = 96
    Top = 17
    Width = 65
    Height = 73
    OnClick = btdizimoClick
  end
  object btoferta: TImage
    Left = 184
    Top = 17
    Width = 65
    Height = 73
    OnClick = btofertaClick
  end
  object btrelarotios: TImage
    Left = 272
    Top = 17
    Width = 57
    Height = 73
  end
  object btDIZIMISTAS: TImage
    Left = 8
    Top = 17
    Width = 65
    Height = 73
    Hint = 's'
    OnClick = btdizimistasClick
  end
  object Image1: TImage
    Left = 352
    Top = 17
    Width = 73
    Height = 73
  end
  object Image2: TImage
    Left = 8
    Top = 209
    Width = 65
    Height = 73
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 510
    Width = 584
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object Button1: TButton
    Left = 184
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 376
    Top = 312
  end
  object BalloonHint1: TBalloonHint
    Left = 352
    Top = 216
  end
end
