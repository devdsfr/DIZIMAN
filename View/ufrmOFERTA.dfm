inherited frmOFERTA: TfrmOFERTA
  Caption = 'frmOFERTA'
  ClientHeight = 444
  ExplicitTop = -41
  ExplicitHeight = 483
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 387
  end
  inherited Panel1: TPanel
    Top = 387
  end
  object DBGrid1: TDBGrid [6]
    Left = 0
    Top = 0
    Width = 869
    Height = 387
    Align = alClient
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  inherited dstabela: TDataSource
    DataSet = dmDIZIMAN.cdsOferta
  end
end
