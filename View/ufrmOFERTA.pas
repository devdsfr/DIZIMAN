unit ufrmOFERTA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBASICO, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.Mask;

type
  TfrmOFERTA = class(TfrmBASICO)
    edNASCIMENTO: TMaskEdit;
    edVALOR: TMaskEdit;
    edTELEFONE: TMaskEdit;
    edNOMEOFERTISTA: TEdit;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure acSALVARExecute(Sender: TObject);
    procedure edNASCIMENTOKeyPress(Sender: TObject; var Key: Char);
    procedure edTELEFONEKeyPress(Sender: TObject; var Key: Char);
    procedure edVALORKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOFERTA: TfrmOFERTA;

implementation

{$R *.dfm}

uses udmDIZIMAN, udmRELATORIOS, uFUNCOES;

procedure TfrmOFERTA.acSALVARExecute(Sender: TObject);
begin

  if Trim(edNOMEOFERTISTA.Text) = '' then
      begin
       Application.MessageBox('Preencha o campo Nome do Ofertista! ', 'Atenção' , MB_OK+MB_ICONWARNING );
       edNOMEOFERTISTA.SetFocus;
       Abort
      end;


      if Trim(edVALOR.Text) = '' then
      begin
       Application.MessageBox('Preencha o campo Valor do Dízimo! ', 'Atenção' , MB_OK+MB_ICONWARNING );
       edVALOR.SetFocus;
       Abort
      end;


      if dsTabela.State in [dsInsert] then

      dmDIZIMAN.cdsOfertaID_OFERTA.AsInteger := GetId('ID', 'OFERTA');
      dmDIZIMAN.cdsOfertaNOME_OFERTISTA.AsString := trim(edNOMEOFERTISTA.Text);
      dmDIZIMAN.cdsOfertaNASCIMENTO.AsString := trim(edNASCIMENTO.Text);
      dmDIZIMAN.cdsOfertaTELEFONE.AsString := trim(edTELEFONE.Text);
      dmDIZIMAN.cdsOfertaVALOR.AsString := trim(edVALOR.Text);
  inherited;

end;

procedure TfrmOFERTA.edNASCIMENTOKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
   key := #0;
end;

procedure TfrmOFERTA.edTELEFONEKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
   key := #0;
end;

procedure TfrmOFERTA.edVALORKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
   key := #0;
end;

end.
