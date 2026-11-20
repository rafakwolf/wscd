unit unContasRecebidas;

interface

uses
  Messages, ExtCtrls, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, DB, SqlDb, VarGlobal, memds, ComCtrls,
  Menus, Grids, DBGrids, ZDataset, ZAbstractRODataset, unDmPrincipal,
  unContasReceber, FMTBcd, unSimplePadrao, LCLType;

const DefaultQuery = 'select * from CONTASRECEGER';

type

  { TfrmContasRecebidas }

  TfrmContasRecebidas = class(TfrmSimplePadrao)
    dsPadrao: TDataSource;
    dspConta: TComponent;
    mmContasRecebidas: TMainMenu;
    miOpcoes: TMenuItem;
    miEstornar: TMenuItem;
    miAtualizar: TMenuItem;
    N1: TMenuItem;
    miFechar: TMenuItem;
    sqldPadraoATRASO: TZIntegerField;
    sqldPadraoCAPITALRECDO: TZBCDField;
    sqldPadraoCLIENTE: TZIntegerField;
    sqldPadraoCODIGO: TZIntegerField;
    sqldPadraoDATA: TZDateField;
    sqldPadraoDATARECTO: TZDateField;
    sqldPadraoDESCRICAO: TZRawStringField;
    sqldPadraoDESCTO: TZBCDField;
    sqldPadraoDOCUMENTO: TZRawStringField;
    sqldPadraoIDCONTA: TZIntegerField;
    sqldPadraoJURO: TZBCDField;
    sqldPadraoJURORECDO: TZBCDField;
    sqldPadraoOBS: TZRawStringField;
    sqldPadraoORIGEM: TZIntegerField;
    sqldPadraoRECDA: TZRawStringField;
    sqldPadraoRECEBER: TZRawStringField;
    sqldPadraoTOTAL: TZBCDField;
    sqldPadraoTOTALRECDO: TZBCDField;
    sqldPadraoVALOR: TZBCDField;
    sqldPadraoVALORJURO: TZBCDField;
    sqldPadraoVENCIMENTO: TZDateField;
    sqldPadraoVENDA: TZIntegerField;
    Stb: TStatusBar;
    pnBotoes: TPanel;
    btnAtualizar: TSpeedButton;
    btnEstornar: TSpeedButton;
    btnFechar: TSpeedButton;
    grpCliente: TGroupBox;
    dbeCliente: TDBEdit;
    grpFiltro: TGroupBox;
    lbFiltroUsado: TLabel;
    Grade: TDBGrid;
    sqldPadrao: TZQuery;
    sqldConta: TZQuery;
    sqldDeletaConta: TZQuery;
    procedure btnFecharClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEstornarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GradeDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FCliente: Integer;
    procedure Estornar;
    procedure SomaContasRecebidas;
  public
    property Cliente: Integer read FCliente write FCliente;
  end;

var
  frmContasRecebidas: TfrmContasRecebidas;

implementation

uses Funcoes, ConstPadrao, uDatabaseUtils;

{$R *.dfm}

procedure TfrmContasRecebidas.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmContasRecebidas.btnAtualizarClick(Sender: TObject);
begin
  sqldPadrao.Close;
  sqldPadrao.Params.ParamByName('PCLIENTE').AsInteger := FCliente;
  sqldPadrao.Open;
end;

procedure TfrmContasRecebidas.FormShow(Sender: TObject);
var
  OpcaoFiltro: Integer;
  DataI, DataF: string;
begin

  OpcaoFiltro :=
    FormRadioButtons('Por data de recebimento, Todas as contas recebidas',
      'Contas recebidas', 1);

  case OpcaoFiltro of
   -1: begin
     self.close;
     Exit;
   end;
   0: begin
     if ObterDatas(DataI, DataF) and
        (ClearMask(DataI) <> '') and
        (ClearMask(DataF) <> '') then
     begin
       sqldPadrao.Close;
       sqldPadrao.SQL.Clear;
       sqldPadrao.SQL.Text := DefaultQuery +
         ' and CLIENTE = :PCLIENTE' +
         ' and DATARECTO between :DATAI and :DATAF';
       sqldPadrao.Params.ParamByName('PCLIENTE').AsInteger := FCliente;
       sqldPadrao.Params.ParamByName('DATAI').AsDate := StrToDateTime(DataI);
       sqldPadrao.Params.ParamByName('DATAF').AsDate := StrToDateTime(DataF);
       sqldPadrao.Open;
       lbFiltroUsado.Caption := 'Período de '+DataI+' até '+DataF;
     end;
   end;
   1: begin
     sqldPadrao.Close;
     sqldPadrao.Params.ParamByName('PCLIENTE').AsInteger := FCliente;
     sqldPadrao.Open;
     lbFiltrousado.Caption := 'Todas as contas recebidas';
   end;
  end;
  if sqldPadrao.IsEmpty then
  begin
    MsgErro(UM_PESQUISAVAZIO);
    self.Close;
    Exit;
  end;
  SomaContasRecebidas;
end;

procedure TfrmContasRecebidas.btnEstornarClick(Sender: TObject);

  function ContasMarcadas: Integer;
  begin
    with TZQuery.Create(nil) do
    try
      Connection := GetZConnection;
      SQL.Clear; SQL.Text :='select count(1) as CONT from CONTASRECEBER'+
        ' where RECEBER = '+QuotedStr('S')+
        ' and RECDA = '+QuotedStr('S')+
        ' and CLIENTE = '+QuotedStr(IntToStr(FCliente));
      Open;
      Result := FieldByName('CONT').AsInteger;  
    finally
      Free;
    end;
  end;

begin
  if ContasMarcadas > 1 then
  begin
    MsgAviso('Marque apenas uma conta por vez para efetuar o estorno.');
    Exit;
  end;

  if Locate(sqldPadrao, sqldPadraoRECEBER, 'S') then
  begin
    if MsgSN('Deseja estornar esta conta?') then
      Estornar;
  end
  else
    MsgAviso('Não há conta marcada para estorno.'+#13#10+
      'Para marcar/desmarcar, duplo clique sobre a conta desejada.');
end;

procedure TfrmContasRecebidas.Estornar;
begin
  try
    if sqldPadraoORIGEM.IsNull then
    begin
      sqldPadrao.Edit;
      sqldPadraoRECDA.AsString := 'N';
      sqldPadraoRECEBER.AsString := 'N';
      sqldPadraoDATARECTO.Clear;
      sqldPadraoCAPITALRECDO.AsFloat := 0;
      sqldPadraoJURORECDO.AsFloat := 0;
      sqldPadraoDESCTO.AsFloat := 0;
      sqldPadrao.ApplyUpdates;
      { delete conta restante }
      sqldDeletaConta.Close;
      sqldDeletaConta.Params.ParamByName('CODIGO').AsInteger := sqldPadraoCODIGO.AsInteger;
      sqldDeletaConta.ExecSQL;
    end
    else
    begin
      sqldConta.Open;
      if sqldConta.Locate('ORIGEM', sqldPadraoCODIGO.AsInteger, []) then
      begin
        MsgAviso('O recebimento desta conta gerou a conta restante de código = ' +
          IntToStr(sqldConta.fieldByName('CODIGO').AsInteger) + '.' + #13#10 +
          'Exclua a conta restante para prosseguir.');
        Abort;
      end
      else
      begin
        sqldPadrao.Edit;
        sqldPadraoRECDA.AsString := 'N';
        sqldPadraoRECEBER.AsString := 'N';
        sqldPadraoDATARECTO.Clear;
        sqldPadraoCAPITALRECDO.AsFloat := 0;
        sqldPadraoJURORECDO.AsFloat := 0;
        sqldPadraoDESCTO.AsFloat := 0;
        sqldPadrao.ApplyUpdates;
      end;
    end;
  finally
    btnAtualizar.Click;
    PostMessageAllForms(WM_CONTA_RECEBER_RECEBIDA);
    sqldConta.Close;
  end;
  SomaContasRecebidas;
end;

procedure TfrmContasRecebidas.FormCreate(Sender: TObject);
begin
  inherited;
  ClientHeight := 430;
  ClientWidth  := 930;
  CentralizaForm(Self);
end;

procedure TfrmContasRecebidas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqldPadrao.Close;
  Action := caFree;
end;

procedure TfrmContasRecebidas.SomaContasRecebidas;
begin
  with TZQuery.Create(nil) do
  try
    Connection := GetZConnection;
    SQL.Clear; SQL.Text :='select sum(TOTAL) as SOMA from CONTASRECEBER '+
      'where RECDA = '+QuotedStr('S')+' and CLIENTE = :PCLIENTE';
    Params.ParamByName('PCLIENTE').AsInteger := FCliente; 
    Open;
    Stb.Panels[0].Text := 'Total de contas recebidas: '+
      CurrToStrF(FieldByName('SOMA').AsCurrency, ffCurrency, 2);
  finally
    Free;
  end;
end;

procedure TfrmContasRecebidas.GradeDblClick(Sender: TObject);
begin
  if sqldPadrao.IsEmpty then Exit;
  sqldPadrao.Edit;
  if (sqldPadraoRECEBER.AsString = 'N') then
    sqldPadraoRECEBER.AsString := 'S'
  else
    sqldPadraoRECEBER.AsString := 'N';
  sqldPadrao.ApplyUpdates;
  sqldPadrao.Next;
end;

procedure TfrmContasRecebidas.FormResize(Sender: TObject);
var
  Size: Integer;
begin
  Size := Trunc(Self.Width div 2);
  Stb.Panels[0].Width := Size;
  Stb.Panels[1].Width := Size;
end;

procedure TfrmContasRecebidas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    ChamaHelp(Self, 74,'');
  if Key = VK_ESCAPE then
    Close;
end;

initialization
  RegisterClass(TfrmContasRecebidas);
finalization
  UnRegisterClass(TfrmContasRecebidas);
end.
