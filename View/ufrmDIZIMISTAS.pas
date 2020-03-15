unit ufrmDIZIMISTAS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBASICO, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.Mask, Data.FMTBcd, Datasnap.Provider, Datasnap.DBClient, Data.SqlExpr;

type
  TfrmDIZIMISTAS = class(TfrmBASICO)
    sdsDizimista: TSQLDataSet;
    cdsDizimista: TClientDataSet;
    dpDizimista: TDataSetProvider;
    procedure acEDITARExecute(Sender: TObject);
    procedure acPESQUISARExecute(Sender: TObject);
    procedure acSALVARExecute(Sender: TObject);
    procedure edTELEFONEKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDIZIMISTAS: TfrmDIZIMISTAS;

implementation

{$R *.dfm}

uses udmDIZIMAN, uFUNCOES;

procedure TfrmDIZIMISTAS.acEDITARExecute(Sender: TObject);
begin
  inherited;
//  edNOMEDIZIMISTAS.Text := dmDIZIMAN.cdsDIZIMISTASNOME.AsString ;
//  edENDERECO.Text := dmDIZIMAN.cdsDIZIMISTASENDERECO.AsString;
//  edTELEFONE.Text := dmDIZIMAN.cdsDIZIMISTASTELEFONE.AsString;
//  edNASCIMENTO.Text := dmDIZIMAN.cdsDIZIMISTASNASCIMENTO.AsSTRING;

end;

procedure TfrmDIZIMISTAS.acPESQUISARExecute(Sender: TObject);
begin
  inherited;
   dmDIZIMAN.cdsDIZIMISTAS.Close;
   dmDIZIMAN.cdsDIZIMISTAS.CommandText := ' SELECT * FROM DIZIMISTAS ';
   dmDIZIMAN.cdsDIZIMISTAS.Open;
end;

procedure TfrmDIZIMISTAS.acSALVARExecute(Sender: TObject);
begin
//if Trim(edNOMEDIZIMISTAS.Text) = '' then
//      begin
//       Application.MessageBox('Preencha o campo Nome do Membro da Igreja! ', 'Atenção' , MB_OK+MB_ICONWARNING );
//       edNOMEDIZIMISTAS.SetFocus;
//       Abort
//      end;
//
//      if Trim(edENDERECO.Text) = '' then
//      begin
//       Application.MessageBox('Preencha o campo Endereço! ', 'Atenção' , MB_OK+MB_ICONWARNING );
//       edENDERECO.SetFocus;
//       Abort
//      end;
//      if Trim(edTELEFONE.Text) = '' then
//      begin
//       Application.MessageBox('Preencha o campo Telefone! ', 'Atenção' , MB_OK+MB_ICONWARNING );
//       edTELEFONE.SetFocus;
//       Abort
//      end;
//      if Trim(edNASCIMENTO.Text) = '' then
//      begin
//       Application.MessageBox('Preencha o campo Data de Nascimento! ', 'Atenção' , MB_OK+MB_ICONWARNING );
//       edNASCIMENTO.SetFocus;
//       Abort
//      end;


//      if dsTabela.State in [dsInsert] then
//
//      dmDIZIMAN.cdsDIZIMISTASID.AsInteger := GetId('ID', 'DIZIMISTAS');
//      dmDIZIMAN.cdsDIZIMISTASNOME.AsString := trim(edNOMEDIZIMISTAS.Text);
//      dmDIZIMAN.cdsDIZIMISTASENDERECO.AsString := trim(edENDERECO.Text);
//      dmDIZIMAN.cdsDIZIMISTASTELEFONE.AsString := trim(edTELEFONE.Text);
//      dmDIZIMAN.cdsDIZIMISTASNASCIMENTO.AsString := trim(edNASCIMENTO.Text);
  inherited;

end;

procedure TfrmDIZIMISTAS.edTELEFONEKeyPress(Sender: TObject;
  var Key: Char);
begin

  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
   key := #0;
end;

end.
