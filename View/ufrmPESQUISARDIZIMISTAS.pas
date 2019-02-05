unit ufrmPESQUISARDIZIMISTAS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPESQUISARDIZIMISTAS = class(TForm)
    dstabela: TDataSource;
    imagedizimista: TImageList;
    actacoes: TActionList;
    acINSERIR: TAction;
    acEDITAR: TAction;
    acEXCLUIR: TAction;
    acSALVAR: TAction;
    acCANCELAR: TAction;
    acPESQUISAR: TAction;
    acIMPRIMIR: TAction;
    acFECHAR: TAction;
    DBGrid1: TDBGrid;
    cbxFILTRAR: TCheckBox;
    edFILTRAR: TEdit;
    btnFILTRAR: TButton;
    Panel1: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPESQUISARDIZIMISTAS: TfrmPESQUISARDIZIMISTAS;

implementation

{$R *.dfm}

end.
