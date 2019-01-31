unit ufrmDIZIMISTAS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udmDIZIMAN, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.DBGrids;

type
  TfrmDIZIMISTAS = class(TForm)
    DBGrid1: TDBGrid;
    imagedizimista: TImageList;
    actacoes: TActionList;
    dstabela: TDataSource;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDIZIMISTAS: TfrmDIZIMISTAS;

implementation

{$R *.dfm}

end.
