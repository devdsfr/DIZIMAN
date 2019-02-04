unit ufrmBASICO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udmDIZIMAN, Data.DB, Vcl.Buttons,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls,
  Datasnap.DBClient, cxGraphics, cxControls, cxLookAndFeels;


type
  TfrmBASICO = class(TForm)
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
    edFILTRAR: TEdit;
    btnFILTRAR: TButton;
    Label3: TLabel;
    edNOMEDIZIMISTAS: TEdit;
    Label4: TLabel;
    edENDERECO: TEdit;
    Label5: TLabel;
    edTELEFONE: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbxFILTRAR: TCheckBox;
    procedure btnFILTRARClick(Sender: TObject);
    procedure cbxFILTRARClick(Sender: TObject);
    procedure acSALVARExecute(Sender: TObject);
    procedure acPESQUISARExecute(Sender: TObject);
    procedure acFECHARExecute(Sender: TObject);
    procedure acCANCELARExecute(Sender: TObject);
    procedure acCANCELARUpdate(Sender: TObject);
    procedure acEDITARExecute(Sender: TObject);
    procedure acEXCLUIRExecute(Sender: TObject);
    procedure acINSERIRUpdate(Sender: TObject);
    procedure acINSERIRExecute(Sender: TObject);

  private
    iModo : Integer;
    procedure LimparTudo;
  public
    { Public declarations }
  end;

var
  frmBASICO: TfrmBASICO;

implementation

{$R *.dfm}

uses uFUNCOES;

procedure TfrmBASICO.acCANCELARExecute(Sender: TObject);
begin
    LimparTudo;
    TClientDataSet(dsTabela.DataSet).Cancel;
end;

procedure TfrmBASICO.acCANCELARUpdate(Sender: TObject);
begin
  acCANCELAR.Enabled := acSALVAR.Enabled = true
end;

procedure TfrmBASICO.acEDITARExecute(Sender: TObject);
begin
     iModo := 1;

     if PageControl1.ActivePage = pcPESQUISAR then
        pcCADASTRO.TabVisible := true;
        pcPESQUISAR.TabVisible := false;
        PageControl1.ActivePage := pcCADASTRO;
        TClientDataSet(dsTabela.DataSet).Edit;
end;

procedure TfrmBASICO.acEXCLUIRExecute(Sender: TObject);
begin
if Application.MessageBox('Deseja realmente excluir o registro?','Pergunta', MB_YESNO+MB_ICONQUESTION) = mrYes then
     begin
      try
        TClientDataSet(dsTabela.DataSet).Delete;
        TClientDataSet(dsTabela.DataSet).ApplyUpdates(0);

        Application.MessageBox('Registro excluido com sucesso', 'Informação',0+65 );
        TClientDataSet(dsTabela.DataSet).Open;

        except on E : Exception do
        raise Exception.Create('Erro ao Excluir Registro: '+E.Message);

      end;
     end;
end;

procedure TfrmBASICO.acFECHARExecute(Sender: TObject);
begin
 Close;
end;

procedure TfrmBASICO.acINSERIRExecute(Sender: TObject);
begin
iModo :=0;

  if PageControl1.ActivePage = pcPESQUISAR then
     pcCADASTRO.TabVisible := true;
     pcPESQUISAR.TabVisible := false;
     PageControl1.ActivePage := pcCADASTRO;
  if not TClientDataSet(dsTabela.DataSet).Active then

   TClientDataSet(dsTabela.DataSet).Open;
   TClientDataSet(dsTabela.DataSet).Insert;
end;

procedure TfrmBASICO.acINSERIRUpdate(Sender: TObject);
begin
  acinserir.Enabled := dsTabela.State in [dsBrowse,dsInactive];
end;

procedure TfrmBASICO.acPESQUISARExecute(Sender: TObject);
begin
      PageControl1.ActivePage := pcPESQUISAR;
      edFILTRAR.Clear;
      
end;

procedure TfrmBASICO.acSALVARExecute(Sender: TObject);
begin

      try
        TClientDataSet(dsTabela.DataSet).Post;
        TClientDataSet(dsTabela.DataSet).ApplyUpdates(0);

      case iModo of
        0 : Application.MessageBox('Registro inserido com sucesso','Informaçãao', MB_OK+MB_ICONINFORMATION);
        1 : Application.MessageBox('Registro atualizado com sucesso','Informação', MB_OK+MB_ICONINFORMATION);

      end;


      //limpar os campos
       LimparTudo;

      TClientDataSet(dsTabela.DataSet).Open;




        except on E : Exception do
        raise Exception.Create('Erro ao salvar registo: '+E.Message);
      end;

end;

procedure TfrmBASICO.btnFILTRARClick(Sender: TObject);
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
                 'RG : ' + dmDIZIMAN.cdsDIZIMISTASID.AsString + #13 +
                 'Nome do Dizimista  : ' + dmDIZIMAN.cdsDIZIMISTASNome.AsString);
   end
   else
   begin
     ShowMessage('Registro não encontrado!!!!');
     edFILTRAR.Clear;
     edFILTRAR.SetFocus;
   end;
end;


procedure TfrmBASICO.cbxFILTRARClick(Sender: TObject);
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

procedure TfrmBASICO.LimparTudo;
var

 i: Integer;
begin
   for i := 0 to ComponentCount -1 do
   begin
    if Components[i] is TCustomEdit then
     TCustomEdit(Components[i]).Clear;

   end;
   if PageControl1.ActivePage = pcCADASTRO then
   begin
    pcCADASTRO.TabVisible := false;
    PageControl1.ActivePage := pcPESQUISAR;
   end;
   pcPESQUISAR.setFocus;
end;
end.
