object dmDIZIMAN: TdmDIZIMAN
  OldCreateOrder = False
  Height = 325
  Width = 448
  object dspDizimo: TDataSetProvider
    DataSet = sdsDizimo
    Left = 198
    Top = 113
  end
  object SQLConnection: TSQLConnection
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver220.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=22.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver220.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=22.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=C:\vendas\DIZIMAN\DBDIZIMAN.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    Connected = True
    Left = 200
    Top = 32
  end
  object cdsDizimo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDizimo'
    Left = 264
    Top = 113
    object cdsDizimoID_DIZIMO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_DIZIMO'
      Required = True
    end
    object cdsDizimoDT_PAGAMENTO: TDateField
      DisplayLabel = 'Data do Pagamento'
      FieldName = 'DT_PAGAMENTO'
      Required = True
    end
    object cdsDizimoVALOR: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsDizimoDIZIMISTA: TIntegerField
      DisplayLabel = 'Dizimista'
      FieldName = 'DIZIMISTA'
      Required = True
    end
  end
  object sdsDizimo: TSQLDataSet
    CommandText = 'SELECT * FROM DIZIMO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 128
    Top = 112
    object sdsDizimoID_DIZIMO: TIntegerField
      FieldName = 'ID_DIZIMO'
      Required = True
    end
    object sdsDizimoDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
      Required = True
    end
    object sdsDizimoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object sdsDizimoDIZIMISTA: TIntegerField
      FieldName = 'DIZIMISTA'
      Required = True
    end
  end
  object sdsDizministas: TSQLDataSet
    CommandText = 'SELECT * FROM DIZIMISTAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 128
    Top = 176
  end
  object cdsDizimistas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDizimistas'
    Left = 264
    Top = 177
    object cdsDizimistasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsDizimistasNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object cdsDizimistasENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 200
    end
    object cdsDizimistasNASCIMENTO: TStringField
      FieldName = 'NASCIMENTO'
      Size = 10
    end
    object cdsDizimistasTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 11
    end
  end
  object dspDizimistas: TDataSetProvider
    DataSet = sdsDizministas
    Constraints = False
    Left = 198
    Top = 177
  end
  object sdsOferta: TSQLDataSet
    Active = True
    CommandText = 'SELECT * FROM OFERTA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 128
    Top = 248
    object sdsOfertaID_OFERTA: TIntegerField
      FieldName = 'ID_OFERTA'
      Required = True
    end
    object sdsOfertaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object sdsOfertaDATA_OFERTA: TDateField
      FieldName = 'DATA_OFERTA'
      Required = True
    end
    object sdsOfertaNOME_OFERTADO: TStringField
      FieldName = 'NOME_OFERTADO'
      Size = 50
    end
    object sdsOfertaDIZIMISTA: TIntegerField
      FieldName = 'DIZIMISTA'
    end
  end
  object cdsOferta: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOferta'
    Left = 264
    Top = 249
    object cdsOfertaID_OFERTA: TIntegerField
      FieldName = 'ID_OFERTA'
      Required = True
    end
    object cdsOfertaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsOfertaDATA_OFERTA: TDateField
      FieldName = 'DATA_OFERTA'
      Required = True
    end
    object cdsOfertaNOME_OFERTADO: TStringField
      FieldName = 'NOME_OFERTADO'
      Size = 50
    end
    object cdsOfertaDIZIMISTA: TIntegerField
      FieldName = 'DIZIMISTA'
    end
  end
  object dspOferta: TDataSetProvider
    DataSet = sdsOferta
    Left = 198
    Top = 249
  end
end
