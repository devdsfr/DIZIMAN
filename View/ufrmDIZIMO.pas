unit ufrmDIZIMO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBASICO, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.FMTBcd, Data.SqlExpr, Datasnap.Provider,
  Datasnap.DBClient;

type
  TfrmDIZIMO = class(TfrmBASICO)
    DBGrid1: TDBGrid;
    dsDizimo: TDataSource;
    cdsDizimo: TClientDataSet;
    dspDizimo: TDataSetProvider;
    sdsDizimo: TSQLDataSet;
    sdsDizimoSEQDIZ: TIntegerField;
    sdsDizimoCODPES: TIntegerField;
    sdsDizimoTIPPES: TStringField;
    sdsDizimoDTADIZ: TDateField;
    sdsDizimoVLRDIZ: TFMTBCDField;
    sdsDizimoTIPOFT: TStringField;
    sdsDizimoTELDIZ: TStringField;
    cdsDizimoSEQDIZ: TIntegerField;
    cdsDizimoCODPES: TIntegerField;
    cdsDizimoTIPPES: TStringField;
    cdsDizimoDTADIZ: TDateField;
    cdsDizimoVLRDIZ: TFMTBCDField;
    cdsDizimoTIPOFT: TStringField;
    cdsDizimoTELDIZ: TStringField;
    procedure acSALVARExecute(Sender: TObject);
    procedure acEDITARExecute(Sender: TObject);
    procedure edTELEFONEKeyPress(Sender: TObject; var Key: Char);
    procedure edNASCIMENTOKeyPress(Sender: TObject; var Key: Char);
    procedure edVALORKeyPress(Sender: TObject; var Key: Char);
    procedure acINSERIRExecute(Sender: TObject);
  private

  public

  end;

var
  frmDIZIMO: TfrmDIZIMO;

implementation

{$R *.dfm}

uses udmDIZIMAN, udmRELATORIOS, uFUNCOES, ufrmDIZIMISTAS, ufrmCADASTRODIZIMO;

procedure TfrmDIZIMO.acEDITARExecute(Sender: TObject);
begin
  inherited;
//   edNOMEDIZIMISTA.Text := dmDIZIMAN.cdsDizimoNOME_DIZIMISTA.AsString ;
//   edNASCIMENTO.Text := dmDIZIMAN.cdsDizimoNASCIMENTO.AsSTRING;
//   edTELEFONE.Text := dmDIZIMAN.cdsDizimoTELEFONE.AsString;
//   edVALOR.Text := dmDIZIMAN.cdsDizimoVALOR.AsString;
end;

procedure TfrmDIZIMO.acINSERIRExecute(Sender: TObject);
begin
  inherited;
  frmCADASTRODIZIMO := TfrmCADASTRODIZIMO.Create(nil);
  try
   frmCADASTRODIZIMO.ShowModal;
  finally
   frmCADASTRODIZIMO.Free;

  end;
end;

procedure TfrmDIZIMO.acSALVARExecute(Sender: TObject);
begin
//
//  if Trim(edNOMEDIZIMISTA.Text) = '' then
//      begin
//       Application.MessageBox('Preencha o campo Nome do Dizimista! ', 'Atenção' , MB_OK+MB_ICONWARNING );
//       edNOMEDIZIMISTA.SetFocus;
//       Abort
//      end;
//
//
//      if Trim(edVALOR.Text) = '' then
//      begin
//       Application.MessageBox('Preencha o campo Valor do Dízimo! ', 'Atenção' , MB_OK+MB_ICONWARNING );
//       edVALOR.SetFocus;
//       Abort
//      end;
//
//
//      if dsTabela.State in [dsInsert] then
//
//      dmDIZIMAN.cdsDizimoID_DIZIMO.AsInteger := GetId('ID', 'DIZIMO');
//      dmDIZIMAN.cdsDizimoNOME_DIZIMISTA.AsString := trim(edNOMEDIZIMISTA.Text);
//      dmDIZIMAN.cdsDizimoNASCIMENTO.AsString := trim(edNASCIMENTO.Text);
//      dmDIZIMAN.cdsDizimoTELEFONE.AsString := trim(edTELEFONE.Text);
//      dmDIZIMAN.cdsDizimoVALOR.AsString := trim(edVALOR.Text);
  inherited;

end;
procedure TfrmDIZIMO.edNASCIMENTOKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
   key := #0;
end;

procedure TfrmDIZIMO.edTELEFONEKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
   key := #0;
end;

procedure TfrmDIZIMO.edVALORKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
   key := #0;
end;

end.
