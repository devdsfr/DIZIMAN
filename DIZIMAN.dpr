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
  ufrmDIZIMO in 'View\ufrmDIZIMO.pas' {frmDIZIMO},
  ufrmPESQUISARDIZIMISTAS in 'View\ufrmPESQUISARDIZIMISTAS.pas' {frmPESQUISARDIZIMISTAS},
  ufrmPESQUISARDIZIMO in 'View\ufrmPESQUISARDIZIMO.pas' {frmPESQUISARDIZIMO},
  ufrmCADASTRODIZIMO in 'View\ufrmCADASTRODIZIMO.pas' {frmCADASTRODIZIMO},
  ufrmCADASTROOFERTA in 'View\ufrmCADASTROOFERTA.pas' {frmCADASTROOFERTA},
  ufrmCADASTROMEMBRO in 'View\ufrmCADASTROMEMBRO.pas' {frmCADASTROMEMBRO};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCADASTROMEMBRO, frmCADASTROMEMBRO);
  Application.Run;
end.
