program DIZIMAN;

uses
  Vcl.Forms,
  ufrmPRINCIPAL in 'ufrmPRINCIPAL.pas' {frmPrincipal},
  ufrmBASICO in 'View\ufrmBASICO.pas' {frmBASICO},
  udmDIZIMAN in 'Model\udmDIZIMAN.pas' {dmDIZIMAN: TDataModule},
  udmRELATORIOS in 'Model\udmRELATORIOS.pas' {DataModule1: TDataModule},
  uFUNCOES in 'Class\uFUNCOES.pas',
  ufrmDIZIMISTAS in 'View\ufrmDIZIMISTAS.pas' {frmDIZIMISTAS},
  ufrmOFERTA in 'View\ufrmOFERTA.pas' {frmOFERTA},
  ufrmDIZIMO in 'View\ufrmDIZIMO.pas' {frmDIZIMO};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmDIZIMAN, dmDIZIMAN);
  Application.CreateForm(TfrmDIZIMISTAS, frmDIZIMISTAS);
  Application.CreateForm(TfrmOFERTA, frmOFERTA);
  Application.CreateForm(TfrmDIZIMO, frmDIZIMO);
  Application.Run;
end.
