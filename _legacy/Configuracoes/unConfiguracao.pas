unit unConfiguracao;

interface

uses
  Messages, ExtCtrls, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons, ComCtrls, SqlDb,
  DBCtrls, ExtDlgs, FileCtrl, ZSqlUpdate, ZDataset, ZAbstractRODataset, FMTBcd, Types;

type

  { TfrmConfiguracao }

  TfrmConfiguracao = class(TfrmPadrao)
    dsContas: TDataSource;
    dbcmbContas: TDBLookupComboBox;
    Label1: TLabel;
    PgConfig: TPageControl;
    sqldContasCODIGO: TZIntegerField;
    sqldContasINATIVO: TZRawStringField;
    sqldContasNOME: TZRawStringField;
    sqldPadraoCAIXA90DIAS: TZRawStringField;
    sqldPadraoCAIXAPADRAO: TZIntegerField;
    sqldPadraoIDCONFIGURACAO: TZIntegerField;
    sqldPadraoMOSTRARSALDOCAIXA: TZRawStringField;
    sqldPadraoNOMECOMPUTADOR: TZRawStringField;
    sqldPadraoRELZEBRADO: TZRawStringField;
    sqldPadraoSENHACAIXA: TZRawStringField;
    TabImg: TTabSheet;
    TabCaixa: TTabSheet;
    dbeSenhaCaixa: TDBEdit;
    opImagem: TOpenPictureDialog;
    tsRelatorio: TTabSheet;
    dbcbMostrarSaldo: TDBCheckBox;
    dbcbLanc90Dias: TDBCheckBox;
    dbckbRelZebrado: TDBCheckBox;
    imgPapelParede: TImage;
    grpCaixaPadrao: TGroupBox;
    btnBuscar: TBitBtn;
    btnExImg: TBitBtn;
    btnAlterarSenhaCaixa: TBitBtn;
    rgOrientationImg: TRadioGroup;
    sqldPadrao: TZQuery;
    sqldContas: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnExImgClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure actPostExecute(Sender: TObject);
    procedure btnAlterarSenhaCaixaClick(Sender: TObject);
    procedure rgOrientationImgClick(Sender: TObject);
  private
    procedure GravaPapelParede;
    procedure CarregaPapelParede;
  protected
    procedure AntesSalvar; override;
  public
  end;

var
  frmConfiguracao: TfrmConfiguracao;

implementation

uses Funcoes, ConstPadrao, VarGlobal, unTrocaSenhaCaixa,
     uUtilFncs, crypto;

{$R *.dfm}

procedure TfrmConfiguracao.FormCreate(Sender: TObject);
begin

  sqldContas.Close;
  sqldContas.Open;

  sqldPadrao.Close;
  sqldPadrao.Parambyname('COMP').AsString := trim(VarGlobal.Usuario);
  sqldPadrao.Open;

  inherited;

  CarregaPapelParede;
  PgConfig.TabIndex := 0;
  CentralizaForm(Self);
  actInsert.Visible := False;
  actPrint.Visible := False;
  actDelete.Visible := False;
  actSearch.Visible := False;

  ReordenaBotoes([btnAlterar, btnSalvar, btnCancelar, btnSair]);
end;

procedure TfrmConfiguracao.btnBuscarClick(Sender: TObject);
begin
  inherited;
  if (opImagem.Execute) then
  begin
    WriteIniFile('PapelParede', 'Local', Trim(opImagem.FileName));
    with imgPapelParede do
    begin
      Picture.LoadFromFile(opImagem.FileName);
      if rgOrientationImg.ItemIndex = 0 then
      begin
        imgPapelParede.Center := True;
        imgPapelParede.Stretch := False;
      end
      else if rgOrientationImg.ItemIndex = 1 then
      begin
        imgPapelParede.Center := True;
        imgPapelParede.Stretch := True;
      end;
    end
  end;
end;

procedure TfrmConfiguracao.btnExImgClick(Sender: TObject);
begin
  inherited;
  if (imgPapelParede.Picture.Graphic = nil) then
  begin
    MsgAviso('Nao existe imagem para limpar');
    Exit;
  end
  else
    if MsgSN('Deseja limpar a imagem do papel de parede?') then
    begin
      imgPapelParede.Picture.Graphic := nil;
      WriteIniFile('PapelParede', 'Local', '');
    end;
end;

procedure TfrmConfiguracao.GravaPapelParede;
begin
  WriteIniFile('PapelParede', 'Orientacao', IntToStr(rgOrientationImg.ItemIndex));
end;

procedure TfrmConfiguracao.dsPadraoStateChange(Sender: TObject);
var
  EditModes: Boolean;
begin
  inherited;
  EditModes := (sqldPadrao.State in [dsInsert, dsEdit]);

  dbeSenhaCaixa.ReadOnly := (Configuracao.SenhaCaixa <> '');

  rgOrientationImg.Enabled       := EditModes;
  btnBuscar.Enabled              := EditModes;
  btnExImg.Enabled               := EditModes;
  btnAlterarSenhaCaixa.Enabled   := EditModes;
end;

procedure TfrmConfiguracao.actPostExecute(Sender: TObject);
var
  s: string;
begin
  s := '';
  if (PgConfig.TabIndex = 5) then
  begin
    if PassWord(s, '*') then
    begin
      if s = crypto.EnDeCrypt(Configuracao.SenhaCaixa) then
      begin
        inherited;
        PostMessageAllForms(WM_CONFIG_ALTERADO);
        Application.ProcessMessages;
      end
      else
      begin
        MsgErro('Senha incorreta ou nao informada.');
        actCancelUpdates.Execute;
      end;
    end
    else
      actCancelUpdates.Execute;

    GravaPapelParede;

  end
  else
  begin
    inherited;
    GravaPapelParede;

    PostMessageAllForms(WM_CONFIG_ALTERADO);
    Application.ProcessMessages;
  end;
end;

procedure TfrmConfiguracao.btnAlterarSenhaCaixaClick(Sender: TObject);
begin
  inherited;
  frmSenhaCaixa := TfrmSenhaCaixa.Create(Self);
  if frmSenhaCaixa.ShowModal = mrOk then
  begin
    sqldPadrao.ApplyUpdates;
    ReabreDataSet(sqldPadrao);
  end;
end;

procedure TfrmConfiguracao.CarregaPapelParede;
begin
  if (ReadIniFile('PapelParede', 'Local') <> EmptyStr) then
  begin
    with imgPapelParede do
    begin
      if FileExists(ReadIniFile('PapelParede', 'Local'))then
      begin
        Picture.LoadFromFile(ReadIniFile('PapelParede', 'Local'));
        rgOrientationImg.ItemIndex := StrToIntDef(ReadIniFile('PapelParede', 'Orientacao'), 1);
        if rgOrientationImg.ItemIndex = 0 then
        begin
          imgPapelParede.Center := True;
          imgPapelParede.Stretch := False;
        end
        else if rgOrientationImg.ItemIndex = 1 then
        begin
          imgPapelParede.Center := True;
          imgPapelParede.Stretch := True;
        end;
      end
      else
      begin
        imgPapelParede.Picture.Graphic := nil;
        imgPapelParede.Refresh;
        WriteIniFile('PapelParede', 'Local', '');
      end;
    end;
  end;
end;

procedure TfrmConfiguracao.AntesSalvar;
begin
  inherited AntesSalvar;
  sqldPadrao.FieldByName('senhacaixa').asstring := crypto.EnDeCrypt(dbeSenhaCaixa.text);
end;

procedure TfrmConfiguracao.rgOrientationImgClick(Sender: TObject);
begin
  inherited;
  if rgOrientationImg.ItemIndex = 0 then
  begin
    imgPapelParede.Center := True;
    imgPapelParede.Stretch := False;
  end
  else if rgOrientationImg.ItemIndex = 1 then
  begin
    imgPapelParede.Center := True;
    imgPapelParede.Stretch := True;
  end;
end;

initialization
  RegisterClass(TfrmConfiguracao);
finalization
  UnRegisterClass(TfrmConfiguracao);
end.


