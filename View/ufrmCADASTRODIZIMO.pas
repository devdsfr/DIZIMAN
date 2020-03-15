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
    edtCPF: TMaskEdit;
    gpCPF: TGroupBox;
    gpNome: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox1: TGroupBox;
    mskValor: TMaskEdit;
    GroupBox4: TGroupBox;
    Memo1: TMemo;
    RadioGroup1: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADASTRODIZIMO: TfrmCADASTRODIZIMO;

implementation

{$R *.dfm}

end.
