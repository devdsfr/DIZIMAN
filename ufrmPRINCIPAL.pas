unit ufrmPRINCIPAL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.ComCtrls, System.Actions, Vcl.ActnList, dxGDIPlusClasses;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    BalloonHint1: TBalloonHint;
    StatusBar1: TStatusBar;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   StatusBar1.Panels.Items[0].Text := DateTimeToStr(now);
end;

end.
