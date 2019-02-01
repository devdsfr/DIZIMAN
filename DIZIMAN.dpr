program DIZIMAN;

uses
  Vcl.Forms,
  ufrmPRINCIPAL in 'ufrmPRINCIPAL.pas' {frmPrincipal},
  ufrmOFERTA in 'View\ufrmOFERTA.pas' {frmOFERTA},
  ufrmDIZIMO in 'View\ufrmDIZIMO.pas' {frmDIZIMO},
  ufrmDIZIMISTAS in 'View\ufrmDIZIMISTAS.pas' {frmDIZIMISTAS},
  udmDIZIMAN in 'Model\udmDIZIMAN.pas' {dmDIZIMAN: TDataModule},
  udmRELATORIOS in 'Model\udmRELATORIOS.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmDIZIMAN, dmDIZIMAN);
  Application.Run;
end.
