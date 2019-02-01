unit ufrmOFERTA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBASICO, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TfrmOFERTA = class(TfrmBASICO)
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

end.
