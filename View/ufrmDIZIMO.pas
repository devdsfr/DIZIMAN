unit ufrmDIZIMO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBASICO, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TfrmDIZIMO = class(TfrmBASICO)
    edVALOR: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure acSALVARExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDIZIMO: TfrmDIZIMO;

implementation

{$R *.dfm}

uses udmDIZIMAN, udmRELATORIOS, uFUNCOES;

procedure TfrmDIZIMO.acSALVARExecute(Sender: TObject);
begin

  if Trim(edVALOR.Text) = '' then

      if Trim(edVALOR.Text) = '' then
      begin
       Application.MessageBox('Preencha o campo Valor! ', 'Atenção' , MB_OK+MB_ICONWARNING );
       edVALOR.SetFocus;
       Abort
      end;


      if dsTabela.State in [dsInsert] then

      dmDIZIMAN.cdsDizimoID_DIZIMO.AsInteger := GetId('ID', 'DIZIMISTAS');
      dmDIZIMAN.cdsDizimoVALOR.AsCurrency := StringParaFloat(edVALOR.Text);
      dmDIZIMAN.cdsDizimoDT_PAGAMENTO.AsDateTime := now;
  inherited;

end;

end.
