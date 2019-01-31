object frmDIZIMISTAS: TfrmDIZIMISTAS
  Left = 0
  Top = 0
  Caption = 'frmDIZIMISTAS'
  ClientHeight = 469
  ClientWidth = 868
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 144
    Width = 873
    Height = 273
    DataSource = dstabela
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NASCIMENTO'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 868
    Height = 57
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 416
    ExplicitWidth = 865
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = 11
      Width = 57
      Height = 38
    end
  end
  object imagedizimista: TImageList
    Left = 584
    Top = 96
  end
  object actacoes: TActionList
    Left = 584
    Top = 48
  end
  object dstabela: TDataSource
    DataSet = DataModuleDIZIMAN.cdsDizimistas
    Left = 584
  end
end
