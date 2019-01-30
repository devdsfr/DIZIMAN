program DIZIMAN;

uses
  Vcl.Forms,
  ufrmPRINCIPAL in 'ufrmPRINCIPAL.pas' {Form1},
  ufrmOFERTA in 'View\ufrmOFERTA.pas' {Form4},
  ufrmDIZIMO in 'View\ufrmDIZIMO.pas' {Form2},
  ufrmDIZIMISTAS in 'View\ufrmDIZIMISTAS.pas' {Form3},
  udmDIZIMAN in 'Model\udmDIZIMAN.pas' {DataModuleDIZIMAN: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TDataModuleDIZIMAN, DataModuleDIZIMAN);
  Application.Run;
end.
