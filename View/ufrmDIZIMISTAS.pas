unit ufrmDIZIMISTAS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udmDIZIMAN, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls,
  Datasnap.DBClient, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxFilterControl;

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
    Label1: TLabel;
    edFILTRAR: TEdit;
    btnFILTRAR: TButton;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbxFILTRAR: TCheckBox;
    procedure actacoesExecute(Action: TBasicAction; var Handled: Boolean);
    procedure btnFILTRARClick(Sender: TObject);
    procedure cbxFILTRARClick(Sender: TObject);
  private
    iModo : Integer;
  public
    { Public declarations }
  end;

var
  frmDIZIMISTAS: TfrmDIZIMISTAS;

implementation

{$R *.dfm}

procedure TfrmDIZIMISTAS.actacoesExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
iModo := 0;



if PageControl1.ActivePage = pcPESQUISAR then
pcCADASTRO.TabVisible := true;
pcPESQUISAR.TabVisible := false;
PageControl1.ActivePage := pcCADASTRO;
if not TClientDataSet(dsTabela.DataSet).Active then

 TClientDataSet(dsTabela.DataSet).Open;
 TClientDataSet(dsTabela.DataSet).Insert;
end;


procedure TfrmDIZIMISTAS.btnFILTRARClick(Sender: TObject);
begin

 if edFILTRAR.Text = '' then

 begin
   Application.MessageBox('Informe um valor a ser pesquisado', 'Atenção', MB_OK+MB_ICONWARNING);
   edFILTRAR.SetFocus;
   Abort;
 end;

 if dmDIZIMAN.cdsDIZIMISTAS.Locate('Nome',edFILTRAR.Text,[loCaseInsensitive,loPartialKey]) then
   begin
     ShowMessage('Registro encontrado ' + #13 +
                 'Codigo : ' + dmDIZIMAN.cdsDIZIMISTASID.AsString + #13 +
                 'Nome   : ' + dmDIZIMAN.cdsDIZIMISTASNome.AsString);
   end
   else
   begin
     ShowMessage('Registro não encontrado!!!!');
     edFILTRAR.Clear;
     edFILTRAR.SetFocus;
   end;
end;


procedure TfrmDIZIMISTAS.cbxFILTRARClick(Sender: TObject);
begin
   if TCheckBox(Sender).Checked then
//Usando Cast onde sei que o Objeto Sender é um TCheckBox,
//para verificar se o mesmo esta marcado
   begin
     with dmDIZIMAN.cdsDIZIMISTAS do
     begin
       Close;
       Filtered := False;
       Filter := 'UPPER(Nome) Like ' +UpperCase(QuotedStr('%' + edFILTRAR.Text + '%'));
 //Funciona como uma Clausula Where do SQL
       Filtered := True;
      Open;
     end;
   end
   else
   begin
     dmDIZIMAN.cdsDIZIMISTAS.Filtered := False;
     edFILTRAR.Clear;
     edFILTRAR.SetFocus;
   end;
end;

end.
