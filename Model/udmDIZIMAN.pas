unit udmDIZIMAN;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Datasnap.DBClient, Datasnap.Provider;

type
  TdmDIZIMAN = class(TDataModule)
    dspDizimo: TDataSetProvider;
    cdsDizimo: TClientDataSet;
    sdsDizimo: TSQLDataSet;
    sdsDizministas: TSQLDataSet;
    cdsDizimistas: TClientDataSet;
    dspDizimistas: TDataSetProvider;
    sdsOferta: TSQLDataSet;
    cdsOferta: TClientDataSet;
    dspOferta: TDataSetProvider;
    sdsDizministasID: TIntegerField;
    sdsDizministasNOME: TStringField;
    sdsDizministasENDERECO: TStringField;
    sdsDizministasNASCIMENTO: TStringField;
    sdsDizministasTELEFONE: TStringField;
    cdsDizimistasID: TIntegerField;
    cdsDizimistasNOME: TStringField;
    cdsDizimistasENDERECO: TStringField;
    cdsDizimistasNASCIMENTO: TStringField;
    cdsDizimistasTELEFONE: TStringField;
    sdsDizimoID_DIZIMO: TIntegerField;
    sdsDizimoDT_PAGAMENTO: TDateField;
    sdsDizimoVALOR: TStringField;
    sdsDizimoNOME_DIZIMISTA: TStringField;
    sdsDizimoNASCIMENTO: TStringField;
    sdsDizimoTELEFONE: TStringField;
    cdsDizimoID_DIZIMO: TIntegerField;
    cdsDizimoDT_PAGAMENTO: TDateField;
    cdsDizimoVALOR: TStringField;
    cdsDizimoNOME_DIZIMISTA: TStringField;
    cdsDizimoNASCIMENTO: TStringField;
    cdsDizimoTELEFONE: TStringField;
    sdsOfertaID_OFERTA: TIntegerField;
    sdsOfertaVALOR: TStringField;
    sdsOfertaDATA_OFERTA: TDateField;
    sdsOfertaNOME_OFERTISTA: TStringField;
    sdsOfertaNASCIMENTO: TStringField;
    sdsOfertaTELEFONE: TStringField;
    cdsOfertaID_OFERTA: TIntegerField;
    cdsOfertaVALOR: TStringField;
    cdsOfertaDATA_OFERTA: TDateField;
    cdsOfertaNOME_OFERTISTA: TStringField;
    cdsOfertaNASCIMENTO: TStringField;
    cdsOfertaTELEFONE: TStringField;
    SQLConnecT: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDIZIMAN: TdmDIZIMAN;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
