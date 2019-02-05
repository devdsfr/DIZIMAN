unit ufrmPESQUISARDIZIMO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.StdCtrls;

type
  TfrmPESQUISARDIZIMO = class(TForm)
    dstabela: TDataSource;
    actacoes: TActionList;
    acINSERIR: TAction;
    acEDITAR: TAction;
    acEXCLUIR: TAction;
    acSALVAR: TAction;
    acCANCELAR: TAction;
    acPESQUISAR: TAction;
    acIMPRIMIR: TAction;
    acFECHAR: TAction;
    imagedizimista: TImageList;
    DBGrid1: TDBGrid;
    cbxFILTRAR: TCheckBox;
    edFILTRAR: TEdit;
    btnFILTRAR: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPESQUISARDIZIMO: TfrmPESQUISARDIZIMO;

implementation

{$R *.dfm}

end.
