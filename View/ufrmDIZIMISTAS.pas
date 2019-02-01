unit ufrmDIZIMISTAS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udmDIZIMAN, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TfrmDIZIMISTAS = class(TForm)
    DBGrid1: TDBGrid;
    imagedizimista: TImageList;
    actacoes: TActionList;
    dstabela: TDataSource;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    PageControl1: TPageControl;
    pcCADASTRO: TTabSheet;
    pcPESQUISAR: TTabSheet;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    acINSERIR: TAction;
    acEDITAR: TAction;
    acFECHAR: TAction;
    acCANCELAR: TAction;
    acEXCLUIR: TAction;
    acPESQUISAR: TAction;
    acIMPRIMIR: TAction;
    acSALVAR: TAction;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
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
