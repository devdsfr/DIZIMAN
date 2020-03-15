inherited frmDIZIMO: TfrmDIZIMO
  Caption = 'Cadastro de D'#237'zimo'
  ClientHeight = 476
  Position = poMainFormCenter
  OnShow = FormShow
  ExplicitTop = -102
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 419
  end
  inherited Panel1: TPanel
    Top = 419
    inherited SpeedButton4: TSpeedButton
      Top = 8
      ExplicitTop = 8
    end
  end
  object dbDizimo: TDBGrid [6]
    Left = 0
    Top = 0
    Width = 869
    Height = 419
    Align = alClient
    DataSource = dsDizimo
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOMEDIZ'
        Title.Caption = 'Nome do Dizimista'
        Width = 445
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPPES'
        Title.Caption = 'Status do Membro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTADIZ'
        Title.Caption = 'Data do D'#237'zimo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELDIZ'
        Title.Caption = 'Telefone do Dizimista'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSDIZ'
        Title.Caption = 'Observa'#231#245'es'
        Visible = True
      end>
  end
  inherited actacoes: TActionList
    Left = 584
    Top = 176
  end
  inherited dstabela: TDataSource
    DataSet = dmDIZIMAN.cdsDizimo
    Left = 536
    Top = 64
  end
  object dsDizimo: TDataSource
    AutoEdit = False
    DataSet = dmDIZIMAN.cdsDizimo
    Left = 352
    Top = 200
  end
end
