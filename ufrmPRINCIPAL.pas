unit ufrmPRINCIPAL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.ComCtrls, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, ufrmBASICO, ufrmDIZIMO, ufrmOFERTA, ufrmDIZIMISTAS;

type
  TfrmPrincipal = class(TForm)
    Timer1: TTimer;
    BalloonHint1: TBalloonHint;
    StatusBar1: TStatusBar;
    btajudas: TImage;
    btdizimo: TImage;
    btoferta: TImage;
    btrelarotios: TImage;
    Button1: TButton;
    btDIZIMISTAS: TImage;
    Image1: TImage;
    Image2: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure btdizimoClick(Sender: TObject);
    procedure btofertaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure btDIZIMISTASClick(Sender: TObject);
    procedure btajudasClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declaratiosadasdadsns }
  public
    { Public declaratidasdadadons }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses ufrmPESQUISARDIZIMISTAS, ufrmPESQUISARDIZIMO;

procedure TfrmPrincipal.btajudasClick(Sender: TObject);
begin
   frmPESQUISARDIZIMISTAS := TfrmPESQUISARDIZIMISTAS.Create(nil);
   try
    frmPESQUISARDIZIMISTAS.ShowModal;
   finally
    frmPESQUISARDIZIMISTAS.Free;

   end;
end;

procedure TfrmPrincipal.btDIZIMISTASClick(Sender: TObject);
begin
 frmDIZIMISTAS := TfrmDIZIMISTAS.Create(nil);
  try
   frmDIZIMISTAS.ShowModal;
  finally
   frmDIZIMISTAS.Free;

  end;
end;

procedure TfrmPrincipal.btdizimoClick(Sender: TObject);
begin
  frmDIZIMO := TfrmDIZIMO.Create(nil);
  try
   frmDIZIMO.ShowModal;
  finally
   frmDIZIMO.Free;

  end;
end;

procedure TfrmPrincipal.btofertaClick(Sender: TObject);
begin
   frmOFERTA := TfrmOFERTA.Create(nil);
   try
    frmOFERTA.ShowModal;
   finally
    frmOFERTA.Free;

   end;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
   frmBASICO := TfrmBASICO.Create(nil);
    try
     frmBASICO.ShowModal;
    finally
     frmBASICO.Free;

    end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Application.MessageBox('Você deseja realmente sair do DIZIMAN ?','Informação',  MB_YESNO +MB_ICONQUESTION)= mrYes then

  Application.Terminate
  else
  Abort;
end;

procedure TfrmPrincipal.Image2Click(Sender: TObject);
begin
   frmPESQUISARDIZIMO := TfrmPESQUISARDIZIMO.Create(nil);
   try
    frmPESQUISARDIZIMO.ShowModal;
   finally
    frmPESQUISARDIZIMO.Free;

   end;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
   StatusBar1.Panels.Items[0].Text := DateTimeToStr(now);
end;

end.
