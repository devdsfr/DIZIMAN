unit ufrmCADASTRODIZIMO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmCADASTRODIZIMO = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSalvar: TButton;
    btnFechar: TButton;
    edtNome: TEdit;
    mksDataOferta: TMaskEdit;
    gpNome: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox1: TGroupBox;
    mskValor: TMaskEdit;
    GroupBox4: TGroupBox;
    Memo: TMemo;
    RadioGroup1: TRadioGroup;
    GroupBox2: TGroupBox;
    MaskEdit1: TMaskEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADASTRODIZIMO: TfrmCADASTRODIZIMO;

implementation

{$R *.dfm}

uses ufrmDIZIMO, udmDIZIMAN;

procedure TfrmCADASTRODIZIMO.btnSalvarClick(Sender: TObject);
begin
  dmDIZIMAN.cdsDizimo.Open;
  dmDIZIMAN.cdsDizimo.Edit;
  dmDIZIMAN.cdsDizimoNOMEDIZ.Value := edtNome.Text;
  dmDIZIMAN.cdsDizimoCODPES.Value := 10;
  dmDIZIMAN.cdsDizimoTIPPES.Value := 'D';
  dmDIZIMAN.cdsDizimoTIPOFT.Value := 'D';
  dmDIZIMAN.cdsDizimoDTADIZ.Value := now;
  dmDIZIMAN.cdsDizimoVLRDIZ.Value := mskValor.Text;
//  frmDIZIMO.cdsd
  dmDIZIMAN.cdsDizimo.Post;

end;

procedure TfrmCADASTRODIZIMO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDIZIMAN.cdsDizimo.Close;
  frmCADASTRODIZIMO.Free;
end;

end.
