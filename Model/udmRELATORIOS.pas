unit udmRELATORIOS;

interface

uses
  System.SysUtils, System.Classes, frxExportPDF, frxClass, frxExportText,
  frxDBSet;

type
  TDataModule1 = class(TDataModule)
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxPDFExport1: TfrxPDFExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
