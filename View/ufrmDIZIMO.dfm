inherited frmDIZIMO: TfrmDIZIMO
  Caption = 'Cadastro de D'#237'zimo'
  ClientHeight = 476
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 419
  end
  inherited Panel1: TPanel
    Top = 419
  end
  object DBGrid1: TDBGrid [6]
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
    DataSet = cdsDizimo
    Left = 296
    Top = 224
  end
  object cdsDizimo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDizimo'
    Left = 296
    Top = 272
    object cdsDizimoSEQDIZ: TIntegerField
      FieldName = 'SEQDIZ'
      Required = True
    end
    object cdsDizimoCODPES: TIntegerField
      FieldName = 'CODPES'
      Required = True
    end
    object cdsDizimoTIPPES: TStringField
      FieldName = 'TIPPES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsDizimoDTADIZ: TDateField
      FieldName = 'DTADIZ'
    end
    object cdsDizimoVLRDIZ: TFMTBCDField
      FieldName = 'VLRDIZ'
      Precision = 18
      Size = 2
    end
    object cdsDizimoTIPOFT: TStringField
      FieldName = 'TIPOFT'
      Size = 10
    end
    object cdsDizimoTELDIZ: TStringField
      FieldName = 'TELDIZ'
      Size = 19
    end
  end
  object dspDizimo: TDataSetProvider
    DataSet = sdsDizimo
    Left = 352
    Top = 272
  end
  object sdsDizimo: TSQLDataSet
    CommandText = 'SELECT * FROM TBLDIZIMO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDIZIMAN.SQLConnecT
    Left = 248
    Top = 280
    object sdsDizimoSEQDIZ: TIntegerField
      FieldName = 'SEQDIZ'
      Required = True
    end
    object sdsDizimoCODPES: TIntegerField
      FieldName = 'CODPES'
      Required = True
    end
    object sdsDizimoTIPPES: TStringField
      FieldName = 'TIPPES'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sdsDizimoDTADIZ: TDateField
      FieldName = 'DTADIZ'
    end
    object sdsDizimoVLRDIZ: TFMTBCDField
      FieldName = 'VLRDIZ'
      Precision = 18
      Size = 2
    end
    object sdsDizimoTIPOFT: TStringField
      FieldName = 'TIPOFT'
      Size = 10
    end
    object sdsDizimoTELDIZ: TStringField
      FieldName = 'TELDIZ'
      Size = 19
    end
  end
end
