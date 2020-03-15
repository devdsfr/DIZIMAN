object dmDIZIMAN: TdmDIZIMAN
  OldCreateOrder = False
  Height = 325
  Width = 448
  object dspDizimo: TDataSetProvider
    DataSet = sdsDizimo
    Left = 198
    Top = 113
  end
  object cdsDizimo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDizimo'
    Left = 264
    Top = 113
    object cdsDizimoID_DIZIMO: TIntegerField
      FieldName = 'ID_DIZIMO'
      Required = True
    end
    object cdsDizimoDT_PAGAMENTO: TDateField
      FieldName = 'DT_PAGAMENTO'
      Required = True
    end
    object cdsDizimoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 18
    end
    object cdsDizimoNOME_DIZIMISTA: TStringField
      FieldName = 'NOME_DIZIMISTA'
      Required = True
      Size = 50
    end
    object cdsDizimoNASCIMENTO: TStringField
      FieldName = 'NASCIMENTO'
      Size = 8
    end
    object cdsDizimoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 11
    end
  end
  object sdsDizimo: TSQLDataSet
    CommandText = 'SELECT * FROM DIZIMO'
    MaxBlobSize = -1
    Params = <>
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
    object sdsDizimoVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 18
    end
    object sdsDizimoNOME_DIZIMISTA: TStringField
      FieldName = 'NOME_DIZIMISTA'
      Required = True
      Size = 50
    end
    object sdsDizimoNASCIMENTO: TStringField
      FieldName = 'NASCIMENTO'
      Size = 8
    end
    object sdsDizimoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 11
    end
  end
  object sdsDizministas: TSQLDataSet
    CommandText = 'SELECT * FROM DIZIMISTAS'
    MaxBlobSize = -1
    Params = <>
    Left = 128
    Top = 176
    object sdsDizministasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsDizministasNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 50
    end
    object sdsDizministasENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 200
    end
    object sdsDizministasNASCIMENTO: TStringField
      FieldName = 'NASCIMENTO'
      Required = True
      Size = 10
    end
    object sdsDizministasTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 11
    end
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
      Required = True
      Size = 10
    end
    object cdsDizimistasTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 11
    end
  end
  object dspDizimistas: TDataSetProvider
    DataSet = sdsDizministas
    Left = 198
    Top = 177
  end
  object sdsOferta: TSQLDataSet
    CommandText = 'SELECT * FROM OFERTA'
    MaxBlobSize = -1
    Params = <>
    Left = 128
    Top = 248
    object sdsOfertaID_OFERTA: TIntegerField
      FieldName = 'ID_OFERTA'
      Required = True
    end
    object sdsOfertaVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 22
    end
    object sdsOfertaDATA_OFERTA: TDateField
      FieldName = 'DATA_OFERTA'
      Required = True
    end
    object sdsOfertaNOME_OFERTISTA: TStringField
      FieldName = 'NOME_OFERTISTA'
      Required = True
      Size = 50
    end
    object sdsOfertaNASCIMENTO: TStringField
      FieldName = 'NASCIMENTO'
      Size = 13
    end
    object sdsOfertaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 11
    end
  end
  object cdsOferta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOferta'
    Left = 264
    Top = 249
    object cdsOfertaID_OFERTA: TIntegerField
      FieldName = 'ID_OFERTA'
      Required = True
    end
    object cdsOfertaVALOR: TStringField
      FieldName = 'VALOR'
      Required = True
      Size = 22
    end
    object cdsOfertaDATA_OFERTA: TDateField
      FieldName = 'DATA_OFERTA'
      Required = True
    end
    object cdsOfertaNOME_OFERTISTA: TStringField
      FieldName = 'NOME_OFERTISTA'
      Required = True
      Size = 50
    end
    object cdsOfertaNASCIMENTO: TStringField
      FieldName = 'NASCIMENTO'
      Size = 13
    end
    object cdsOfertaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 11
    end
  end
  object dspOferta: TDataSetProvider
    DataSet = sdsOferta
    Left = 198
    Top = 249
  end
  object SQLConnecT: TSQLConnection
    ConnectionName = 'FBConnection'
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
      'LibraryName=fbclient.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'DriverName=Firebird'
      
        'Database=127.0.0.1:C:\Users\Daniel\Desktop\Project\DIZIMAN\DIZIM' +
        'AN.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Connected = True
    Left = 192
    Top = 24
  end
end
