unit unContasPagas;

interface

uses
  Messages, ExtCtrls, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DB, StdCtrls, DBCtrls, SqlDb, ConstPadrao, ComCtrls,
  unContasPagar, LCLType, Menus, Grids, DBGrids, FMTBcd, unSimplePadrao,
  ZAbstractRODataset, varglobal, zdataset;

type

  { TfrmContasPagas }

  TfrmContasPagas = class(TfrmSimplePadrao)
    sqldEstornoCODIGO: TZIntegerField;
    sqldEstornoORIGEM: TZIntegerField;
    sqldPadrao: TZQuery;
    dsPadrao: TDataSource;
    sqldEstorno: TZQuery;
    sqldContaEstorno: TZQuery;
    sqldPadraoATRASO: TZIntegerField;
    sqldPadraoCAPITALPAGO: TZBCDField;
    sqldPadraoCODIGO: TZIntegerField;
    sqldPadraoCOMPRA: TZIntegerField;
    sqldPadraoDATA: TZDateField;
    sqldPadraoDATAPAGTO: TZDateField;
    sqldPadraoDESCRICAO: TZRawStringField;
    sqldPadraoDESCTO: TZBCDField;
    sqldPadraoDOCUMENTO: TZRawStringField;
    sqldPadraoFORNECEDOR: TZIntegerField;
    sqldPadraoIDCONTA: TZIntegerField;
    sqldPadraoJURO: TZBCDField;
    sqldPadraoJUROPAGO: TZBCDField;
    sqldPadraoNOMEFORN: TStringField;
    mmContasPagas: TMainMenu;
    miOpcoes: TMenuItem;
    miEstornar: TMenuItem;
    miAtualizar: TMenuItem;
    N1: TMenuItem;
    miFechar: TMenuItem;
    sqldPadraoOBS: TZRawStringField;
    sqldPadraoORIGEM: TZIntegerField;
    sqldPadraoPAGA: TZRawStringField;
    sqldPadraoPAGAR: TZRawStringField;
    sqldPadraoTOTAL: TZBCDField;
    sqldPadraoTOTALPAGO: TZBCDField;
    sqldPadraoVALOR: TZBCDField;
    sqldPadraoVALORJURO: TZBCDField;
    sqldPadraoVENCIMENTO: TZDateField;
    Stb: TStatusBar;
    pnBotoes: TPanel;
    btnAtualizar: TSpeedButton;
    btnEstornar: TSpeedButton;
    btnFechar: TSpeedButton;
    GroupCredor: TGroupBox;
    dbeFornecedor: TDBEdit;
    grpFiltro: TGroupBox;
    lbFiltrousado: TLabel;
    Grade: TDBGrid;
    procedure miFecharClick(Sender: TObject);
    procedure miAtualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEstornarClick(Sender: TObject);
    procedure Estornar;
    procedure GradeDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FFornecedor: Integer;
    procedure SomaContasPagas;
  public
    property Fornecedor: Integer read FFornecedor write FFornecedor;
  end;

var
  frmContasPagas: TfrmContasPagas;

implementation

uses Funcoes, uDatabaseutils;

{$R *.dfm}

procedure TfrmContasPagas.miFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmContasPagas.miAtualizarClick(Sender: TObject);
begin
  sqldPadrao.Close;
  sqldPadrao.Params.ParamByName('PFORN').AsInteger := FFornecedor;
  sqldPadrao.Open;
end;

procedure TfrmContasPagas.FormCreate(Sender: TObject);
begin
  inherited;
  ClientHeight := 430;
  ClientWidth  := 930;
  ReordenaBotoes([btnEstornar, btnAtualizar, btnFechar]);
  CentralizaForm(Self);
end;

procedure TfrmContasPagas.FormShow(Sender: TObject);
var
  OpcaoFiltro: Integer;
  DataI, DataF: string;
begin

  OpcaoFiltro :=
    FormRadioButtons('Por data de pagamento, Todas as contas pagas',
      'Contas pagas', 1);

  case OpcaoFiltro of
  -1: begin
         self.Close;
         Exit;
       end;
   0: begin
        if ObterDatas(DataI, DataF) and
          (ClearMask(DataI) <> '') and
          (ClearMask(DataF) <> '') then
        begin
          sqldPadrao.Close;
          sqldPadrao.SQL.Clear;
          sqldPadrao.SQL.Text :=
            'select * from CONTASPAGAR and DATAPAGTO between :DATAI and :DATAF';
          sqldPadrao.Params.ParamByName('PFORN').AsInteger := FFornecedor;
          sqldPadrao.Params.ParamByName('DATAI').AsDate := StrToDateTime(DataI);
          sqldPadrao.Params.ParamByName('DATAF').AsDate := StrToDateTime(DataF);
          sqldPadrao.Open;
          lbFiltrousado.Caption := 'Período de '+DataI+' até '+DataF;
        end;
      end;
   1: begin
        sqldPadrao.Close;
        sqldPadrao.Params.ParamByName('PFORN').AsInteger := FFornecedor;
        sqldPadrao.Open;
        lbFiltrousado.Caption := 'Todas as contas pagas';
      end;
  end;
  if sqldPadrao.IsEmpty then
  begin
    MsgErro(UM_PESQUISAVAZIO);
    self.Close;
    Exit;
  end;
  SomaContasPagas;
end;

procedure TfrmContasPagas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqldPadrao.Close;
  Action := caFree;
end;

procedure TfrmContasPagas.btnEstornarClick(Sender: TObject);

  function ContasMarcadas: Integer;
  begin
    with TZQuery.Create(nil) do
    try
      Connection := GetZConnection;
      SQL.Clear; SQL.Text :='select count(1) as CONT from CONTASPAGAR'+
        ' where PAGAR = '+QuotedStr('S')+
        ' and PAGA = '+QuotedStr('S')+
        ' and FORNECEDOR = '+QuotedStr(IntToStr(FFornecedor));
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

  if Locate(sqldPadrao, sqldPadraoPAGAR, 'S') then
  begin
    if MsgSN('Deseja estornar esta conta?') then
      Estornar;
  end
  else
    MsgAviso('Não há conta marcada para estorno.'+#13#10+
      'Para marcar/desmarcar, duplo clique sobre a conta desejada.');
end;

procedure TfrmContasPagas.Estornar;
begin
  try
    if sqldPadraoORIGEM.IsNull then
    begin
      sqldPadrao.Edit;
      sqldPadraoPAGA.AsString := 'N';
      sqldPadraoPAGAR.AsString := 'N';
      sqldPadraoDATAPAGTO.Clear;
      sqldPadraoCAPITALPAGO.AsFloat := 0;
      sqldPadraoJUROPAGO.AsFloat := 0;
      sqldPadraoDESCTO.AsFloat := 0;
      sqldPadrao.ApplyUpdates;
      { delete conta restante }
      sqldContaEstorno.Close;
      sqldContaEstorno.Params.ParamByName('CODIGO').AsInteger := sqldPadraoCODIGO.AsInteger;
      sqldContaEstorno.ExecSQL;
    end
    else
    begin
      sqldEstorno.Open;
      if sqldEstorno.Locate('ORIGEM', sqldPadraoCODIGO.AsInteger, []) then
      begin
        MsgAviso('O pagamento desta conta gerou a conta restante de código = ' +
          IntToStr(sqldEstornoCODIGO.AsInteger) + '.' + #13#10 +
          'Exclua a conta restante para prosseguir.');
        Exit;
      end
      else
      begin
        sqldPadrao.Edit;
        sqldPadraoPAGA.AsString := 'N';
        sqldPadraoPAGAR.AsString := 'N';
        sqldPadraoDATAPAGTO.Clear;
        sqldPadraoCAPITALPAGO.AsFloat := 0;
        sqldPadraoJUROPAGO.AsFloat := 0;
        sqldPadraoDESCTO.AsFloat := 0;
        sqldPadrao.ApplyUpdates;
      end;
    end;
  finally
    btnAtualizar.Click;
    PostMessageAllForms(WM_CONTA_PAGAR_PAGA);
    sqldEstorno.Close;
  end;
  SomaContasPagas;
end;

procedure TfrmContasPagas.SomaContasPagas;
begin
  with TZQuery.Create(nil) do
  try
    Connection := GetZConnection;
    SQL.Clear; SQL.Text :='select sum(TOTAL) as SOMA from CONTASPAGAR '+
      'where PAGA = '+QuotedStr('S')+' and FORNECEDOR = :PFORN';
    Params.ParamByName('PFORN').AsInteger := FFornecedor; 
    Open;
    Stb.Panels[0].Text := 'Total de contas pagas: '+
      CurrToStrF(FieldByName('SOMA').AsCurrency, ffCurrency, 2);
  finally
    Free;
  end;
end;

procedure TfrmContasPagas.GradeDblClick(Sender: TObject);
begin
  if sqldPadrao.IsEmpty then Exit;
  sqldPadrao.Edit;
  if (sqldPadraoPAGAR.AsString = 'N') then
    sqldPadraoPAGAR.AsString := 'S'
  else
    sqldPadraoPAGAR.AsString := 'N';
  sqldPadrao.ApplyUpdates;
  sqldPadrao.Next;
end;

procedure TfrmContasPagas.FormResize(Sender: TObject);
var
  Size: Integer;
begin
  Size := Trunc(Self.Width div 2);
  Stb.Panels[0].Width := Size;
  Stb.Panels[1].Width := Size;
end;

procedure TfrmContasPagas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    ChamaHelp(Self, 73,'');
   if Key = VK_ESCAPE then
    Close;
end;

initialization
  RegisterClass(TfrmContasPagas);
finalization
  UnRegisterClass(TfrmContasPagas);
end.
