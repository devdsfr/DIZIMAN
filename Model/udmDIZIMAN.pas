unit udmDIZIMAN;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Datasnap.DBClient, Datasnap.Provider;

type
  TDataModuleDIZIMAN = class(TDataModule)
    dspDizimo: TDataSetProvider;
    SQLConnection: TSQLConnection;
    cdsDizimo: TClientDataSet;
    sdsDizimo: TSQLDataSet;
    sdsDizministas: TSQLDataSet;
    cdsDizimistas: TClientDataSet;
    dspDizimistas: TDataSetProvider;
    sdsOferta: TSQLDataSet;
    cdsOferta: TClientDataSet;
    dspOferta: TDataSetProvider;
    sdsDizimoID_DIZIMO: TIntegerField;
    sdsDizimoDT_PAGAMENTO: TDateField;
    sdsDizimoVALOR: TFMTBCDField;
    sdsDizimoDIZIMISTA: TIntegerField;
    sdsOfertaID_OFERTA: TIntegerField;
    sdsOfertaVALOR: TFMTBCDField;
    sdsOfertaDATA_OFERTA: TDateField;
    sdsOfertaNOME_OFERTADO: TStringField;
    sdsOfertaDIZIMISTA: TIntegerField;
    cdsDizimoID_DIZIMO: TIntegerField;
    cdsDizimoDT_PAGAMENTO: TDateField;
    cdsDizimoVALOR: TFMTBCDField;
    cdsDizimoDIZIMISTA: TIntegerField;
    cdsDizimistasID: TIntegerField;
    cdsDizimistasNOME: TStringField;
    cdsDizimistasENDERECO: TStringField;
    cdsDizimistasTELEFONE: TIntegerField;
    cdsDizimistasNASCIMENTO: TDateField;
    cdsOfertaID_OFERTA: TIntegerField;
    cdsOfertaVALOR: TFMTBCDField;
    cdsOfertaDATA_OFERTA: TDateField;
    cdsOfertaNOME_OFERTADO: TStringField;
    cdsOfertaDIZIMISTA: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleDIZIMAN: TDataModuleDIZIMAN;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
