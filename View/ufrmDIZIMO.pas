unit ufrmDIZIMO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBASICO, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.FMTBcd, Data.SqlExpr, Datasnap.Provider,
  Datasnap.DBClient, udmDIZIMAN;

type
  TfrmDIZIMO = class(TfrmBASICO)
    dbDizimo: TDBGrid;
    dsDizimo: TDataSource;
    procedure acINSERIRExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  frmDIZIMO: TfrmDIZIMO;

implementation

{$R *.dfm}

uses  udmRELATORIOS, uFUNCOES, ufrmDIZIMISTAS, ufrmCADASTRODIZIMO;

procedure TfrmDIZIMO.acINSERIRExecute(Sender: TObject);
begin
  inherited;
  dmDIZIMAN.cdsDizimo.Append;
  frmCADASTRODIZIMO := TfrmCADASTRODIZIMO.Create(nil);
  try
   frmCADASTRODIZIMO.ShowModal;
  finally
   frmCADASTRODIZIMO.Free;

  end;
end;

procedure TfrmDIZIMO.FormShow(Sender: TObject);
begin
  inherited;
  dmDIZIMAN.sdsDizimo.Close;
  dmDIZIMAN.sdsDizimo.ParamByName('TIPPES').AsString := 'D';
  dmDIZIMAN.sdsDizimo.Open;
end;

end.
