unit unContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Mask, Buttons, DBCtrls, DB, DbClient,
  Menus, SqlExpr, ComCtrls, Provider, ConstPadrao, ActnList, PLSQLDataSet,
  FMTBcd, unSimplePadrao, System.Actions, varglobal;

const
  SQLPadraoTela: string = 'select'+
                          ' cp.CODIGO,'+
                          ' cp.DATA,'+
                          ' cp.VENCIMENTO,'+
                          ' cp.FORNECEDOR,'+
                          ' forn.FANTAZIA NOMEFORN,'+
                          ' cp.DESCRICAO,'+
                          ' cp.DOCUMENTO,'+
                          ' cp.VALOR,'+
                          ' cp.JURO,'+
                          ' cp.PAGAR,'+
                          ' cp.PAGA,'+
                          ' cp.DATAPAGTO,'+
                          ' cp.ORIGEM,'+
                          ' cp.COMPRA,'+
                          ' cp.CAPITALPAGO,'+
                          ' cp.JUROPAGO,'+
                          ' cp.DESCTO,'+
                          ' cp.OBS,'+
                          ' cp.ATRASO,'+
                          ' cp.VALORJURO,'+
                          ' cp.TOTAL,'+
                          ' cp.TOTALPAGO '+
                          'from CONTASPAGAR cp '+
                          'left join FORNECEDORES forn on (cp.FORNECEDOR = forn.CODFORNECEDOR) '+
                          'where PAGA = '''+'N'+''' and FORNECEDOR = :PFORN '+
                          'order by cp.VENCIMENTO desc';

  SQLVencidas: string =   'select'+
                          ' cp.CODIGO,'+
                          ' cp.DATA,'+
                          ' cp.VENCIMENTO,'+
                          ' cp.FORNECEDOR,'+
                          ' forn.FANTAZIA NOMEFORN,'+
                          ' cp.DESCRICAO,'+
                          ' cp.DOCUMENTO,'+
                          ' cp.VALOR,'+
                          ' cp.JURO,'+
                          ' cp.PAGAR,'+
                          ' cp.PAGA,'+
                          ' cp.DATAPAGTO,'+
                          ' cp.ORIGEM,'+
                          ' cp.COMPRA,'+
                          ' cp.CAPITALPAGO,'+
                          ' cp.JUROPAGO,'+
                          ' cp.DESCTO,'+
                          ' cp.OBS,'+
                          ' cp.ATRASO,'+
                          ' cp.VALORJURO,'+
                          ' cp.TOTAL,'+
                          ' cp.TOTALPAGO '+
                          'from CONTASPAGAR cp '+
                          'left join FORNECEDORES forn on (cp.FORNECEDOR = forn.CODFORNECEDOR) '+
                          'where PAGA = '''+'N'+''' and FORNECEDOR = :PFORN '+
                          'and VENCIMENTO < CURRENT_DATE '+
                          'order by cp.VENCIMENTO desc';

  SQLHoje: string =       'select'+
                          ' cp.CODIGO,'+
                          ' cp.DATA,'+
                          ' cp.VENCIMENTO,'+
                          ' cp.FORNECEDOR,'+
                          ' forn.FANTAZIA NOMEFORN,'+
                          ' cp.DESCRICAO,'+
                          ' cp.DOCUMENTO,'+
                          ' cp.VALOR,'+
                          ' cp.JURO,'+
                          ' cp.PAGAR,'+
                          ' cp.PAGA,'+
                          ' cp.DATAPAGTO,'+
                          ' cp.ORIGEM,'+
                          ' cp.COMPRA,'+
                          ' cp.CAPITALPAGO,'+
                          ' cp.JUROPAGO,'+
                          ' cp.DESCTO,'+
                          ' cp.OBS,'+
                          ' cp.ATRASO,'+
                          ' cp.VALORJURO,'+
                          ' cp.TOTAL,'+
                          ' cp.TOTALPAGO '+
                          'from CONTASPAGAR cp '+
                          'left join FORNECEDORES forn on (cp.FORNECEDOR = forn.CODFORNECEDOR) '+
                          'where PAGA = '''+'N'+''' and FORNECEDOR = :PFORN '+
                          'and VENCIMENTO = CURRENT_DATE '+
                          'order by cp.VENCIMENTO desc';

type
  TfrmContasPagar = class(TfrmSimplePadrao)
    Stb: TStatusBar;
    mnuCP: TMainMenu;
    grpForn: TGroupBox;
    Grade: TDBGrid;
    miOpcoes: TMenuItem;
    miRelatorios: TMenuItem;
    miRecibo: TMenuItem;
    pnBotoes: TPanel;
    btnExcluir: TSpeedButton;
    btnPagar: TSpeedButton;
    btnFechar: TSpeedButton;
    alContasPagar: TActionList;
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    actPagar: TAction;
    actExcluir: TAction;
    actFechar: TAction;
    dsPadrao: TDataSource;
    dbeFornecedor: TDBEdit;
    miPagar: TMenuItem;
    miExcluir: TMenuItem;
    miFechar: TMenuItem;
    N3: TMenuItem;
    sqldForn: TSQLDataSet;
    dspForn: TDataSetProvider;
    cdsForn: TClientDataSet;
    cdsFornCODFORNECEDOR: TIntegerField;
    cdsFornFANTAZIA: TStringField;
    cdsFornCNPJ: TStringField;
    cdsFornTELEFONE: TStringField;
    actBuscarForn: TAction;
    N1: TMenuItem;
    miBuscarForn: TMenuItem;
    btnPagas: TSpeedButton;
    actPagas: TAction;
    miPagas: TMenuItem;
    sqldDeleta: TPLSQLDataSet;
    sqldFornCODFORNECEDOR: TIntegerField;
    sqldFornFANTAZIA: TStringField;
    sqldFornCNPJ: TStringField;
    sqldFornTELEFONE: TStringField;
    N2: TMenuItem;
    miContasvencidas: TMenuItem;
    miTodasContas: TMenuItem;
    miVencendohoje: TMenuItem;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoDATA: TDateField;
    sqldPadraoVENCIMENTO: TDateField;
    sqldPadraoFORNECEDOR: TIntegerField;
    sqldPadraoNOMEFORN: TStringField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoDOCUMENTO: TStringField;
    sqldPadraoVALOR: TFMTBCDField;
    sqldPadraoJURO: TFMTBCDField;
    sqldPadraoPAGAR: TStringField;
    sqldPadraoPAGA: TStringField;
    sqldPadraoDATAPAGTO: TDateField;
    sqldPadraoORIGEM: TIntegerField;
    sqldPadraoCOMPRA: TIntegerField;
    sqldPadraoCAPITALPAGO: TFMTBCDField;
    sqldPadraoJUROPAGO: TFMTBCDField;
    sqldPadraoDESCTO: TFMTBCDField;
    sqldPadraoOBS: TMemoField;
    sqldPadraoATRASO: TIntegerField;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoDATA: TDateField;
    cdsPadraoVENCIMENTO: TDateField;
    cdsPadraoFORNECEDOR: TIntegerField;
    cdsPadraoNOMEFORN: TStringField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoDOCUMENTO: TStringField;
    cdsPadraoVALOR: TFMTBCDField;
    cdsPadraoJURO: TFMTBCDField;
    cdsPadraoPAGAR: TStringField;
    cdsPadraoPAGA: TStringField;
    cdsPadraoDATAPAGTO: TDateField;
    cdsPadraoORIGEM: TIntegerField;
    cdsPadraoCOMPRA: TIntegerField;
    cdsPadraoCAPITALPAGO: TFMTBCDField;
    cdsPadraoJUROPAGO: TFMTBCDField;
    cdsPadraoDESCTO: TFMTBCDField;
    cdsPadraoOBS: TMemoField;
    cdsPadraoATRASO: TIntegerField;
    sqldPadraoVALORJURO: TSingleField;
    sqldPadraoTOTAL: TSingleField;
    sqldPadraoTOTALPAGO: TSingleField;
    cdsPadraoVALORJURO: TSingleField;
    cdsPadraoTOTAL: TSingleField;
    cdsPadraoTOTALPAGO: TSingleField;
    procedure GradeDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miReciboClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actPagarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actBuscarFornExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actPagasExecute(Sender: TObject);
    procedure miContasvencidasClick(Sender: TObject);
    procedure miTodasContasClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure GradeDblClick(Sender: TObject);
    procedure GradeTitleClick(Column: TColumn);
    procedure miVencendohojeClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    SQLPadraoForn: string;
    function ContasVencidas: Currency;
    function ContasAVencer: Currency;
    function ContasVencendoHoje: Currency;
  protected
    procedure ContaPaga(var Msg: TMessage); message WM_CONTA_PAGAR_PAGA; 
  public
    TipoChamada: Integer;
    IdForn: Integer;
    procedure ContaModificada;
  end;                                                                                           

var
  frmContasPagar: TfrmContasPagar;

implementation

uses
  Funcoes, unContasPagas, unModeloConsulta, unRecibo, 
  FuncoesWin;

{$R *.dfm}

procedure TfrmContasPagar.GradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (cdsPadraoVENCIMENTO.AsDateTime < Date) then
    Grade.Canvas.Font.Color := clRed
  else if (cdsPadraoVENCIMENTO.AsDateTime = Date) then
    Grade.Canvas.Font.Color := clBlue
  else
    Grade.Canvas.Font.Color := clBlack;

  if cdsPadraoPAGAR.AsString = 'S' then
    Grade.Canvas.Brush.Color := $0080FFFF;

  if (Column.FieldName = 'ATRASO') or
     (Column.FieldName = 'TOTAL') then
    Grade.Canvas.Brush.Color := $0080FFFF;

  if (gdSelected in State) then
  begin
    Grade.Canvas.Font.Color := clWhite;
    if ((cdsPadraoPAGAR.AsString = 'S') or
        (Column.FieldName = 'ATRASO') or
        (Column.FieldName = 'TOTAL')) then
      Grade.Canvas.Brush.Color := clMenuHighlight;
  end;

  Grade.Canvas.FillRect(Rect);
  Grade.DefaultDrawDataCell(Rect, Column.Field, State);  
end;

procedure TfrmContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmContasPagar.miReciboClick(Sender: TObject);
begin
  if MsgSN('Exportar esta conta para recibo?')then
  begin
    with TfrmRecibo.Create(Self)do
    try
      Caption := 'Recibos';
      cdsPadrao.Open;
      cdsPadrao.Insert;
      cdsPadraoDATA.AsDateTime    := Self.cdsPadraoVENCIMENTO.AsDateTime;
      cdsPadraoVALOR.AsFloat      := Self.cdsPadraoTOTAL.AsFloat;
      cdsPadraoRECEBEDOR.AsString := Self.cdsPadraoNOMEFORN.AsString;
      cdsPadraoREFERENTE.AsString := Self.cdsPadraoDESCRICAO.AsString;
      cdsPadrao.ApplyUpdates(0);
      Imprime := True;
      ShowModal;
    finally
      Free;
    end;
  end;  
end;

procedure TfrmContasPagar.FormCreate(Sender: TObject);
begin
  inherited;
  ClientHeight := 425;
  ClientWidth  := 760;
  CentralizaForm(Self);
  ReordenaBotoes([btnPagar, btnExcluir, btnPagas, btnFechar], 0);
  SQLPadraoForn := sqldForn.CommandText;
end;

procedure TfrmContasPagar.actExcluirExecute(Sender: TObject);
begin
  if cdsPadrao.IsEmpty then Exit;
  if MsgSN('Deseja realmente excluir ?')then
  begin
    with sqldDeleta do
    begin
      Close;
      Params.ParamByName('CODIGO').AsInteger := cdsPadraoCODIGO.AsInteger;
      ExecSQL;
    end;
    cdsPadrao.Close;
    cdsPadrao.Open;
  end;
end;

procedure TfrmContasPagar.actPagarExecute(Sender: TObject);
begin
  if cdsPadrao.IsEmpty then
    Exit;
  ChamaForm('TfrmPagarMan', 'Pagamento', Self);
end;

procedure TfrmContasPagar.actFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmContasPagar.actBuscarFornExecute(Sender: TObject);
begin
  if TipoChamada = 0 then
  begin
    actBuscarForn.Enabled := True;

    cdsForn.Close;
    cdsForn.CommandText := SQLPadraoForn;
    cdsForn.Open;

    if TfrmModeloConsulta.Execute('Fornecedor', cdsForn, FN_FORN, DL_FORN) then
    begin
      IdForn := cdsFornCODFORNECEDOR.AsInteger;
      if (IdForn > 0) then
      begin
        cdsPadrao.Close;
        cdsPadrao.Params.ParamByName('PFORN').AsInteger := IdForn;
        cdsPadrao.Open;
      end;
      if cdsPadrao.IsEmpty then
      begin
        MsgErro(UM_PESQUISAVAZIO, 'Contas a Pagar');
        PostMessage(Handle, WM_CLOSE, 0, 0);
      end;
    end;
  end
  else if TipoChamada = 1 then
  begin
    actBuscarForn.Enabled := False;
    if (IdForn > 0) then
    begin
      cdsPadrao.Close;
      cdsPadrao.Params.ParamByName('PFORN').AsInteger := IdForn;
      cdsPadrao.Open;
    end;
    if cdsPadrao.IsEmpty then
    begin
      MsgErro(UM_PESQUISAVAZIO, 'Contas a Pagar');
      PostMessage(Handle, WM_CLOSE, 0, 0);
    end;
  end;
end;

procedure TfrmContasPagar.FormShow(Sender: TObject);
begin
  actBuscarForn.Execute;
end;

procedure TfrmContasPagar.actPagasExecute(Sender: TObject);
begin
  frmContasPagas := TfrmContasPagas.Create(Self);
  frmContasPagas.Caption := 'Contas pagas';
  frmContasPagas.Fornecedor := IdForn;
  frmContasPagas.ShowModal;
end;

procedure TfrmContasPagar.ContaModificada;
begin
  cdsPadrao.Close;
  cdsPadrao.Params.ParamByName('PFORN').AsInteger := IdForn;
  cdsPadrao.Open;
  dsPadrao.OnStateChange(dsPadrao);
end;

procedure TfrmContasPagar.miContasvencidasClick(Sender: TObject);
begin
  cdsPadrao.Close;
  cdsPadrao.CommandText := SQLVencidas;
  cdsPadrao.Params.ParamByName('PFORN').AsInteger := IdForn;
  cdsPadrao.Open;
end;

procedure TfrmContasPagar.miTodasContasClick(Sender: TObject);
begin
  cdsPadrao.Close;
  cdsPadrao.CommandText := SQLPadraoTela;
  cdsPadrao.Params.ParamByName('PFORN').AsInteger := IdForn;
  cdsPadrao.Open;
end;

function TfrmContasPagar.ContasAVencer: Currency;
begin
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := GetConnection;
    CommandText :=
      'select sum(TOTAL) as SOMA from CONTASPAGAR where (VENCIMENTO > CURRENT_DATE) '+
      'and (PAGA = '''+'N'+''') and FORNECEDOR = :FORN';
    Params.ParamByName('FORN').AsInteger := IdForn;  
    Open;
    Result := FieldByName('SOMA').AsCurrency;
  finally
    Free;
  end;
end;

function TfrmContasPagar.ContasVencendoHoje: Currency;
begin
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := GetConnection;
    CommandText :=
      'select sum(TOTAL) as SOMA from CONTASPAGAR where (VENCIMENTO = CURRENT_DATE) '+
      'and (PAGA = '''+'N'+''') and FORNECEDOR = :FORN';
    Params.ParamByName('FORN').AsInteger := IdForn;
    Open;
    Result := FieldByName('SOMA').AsCurrency;
  finally
    Free;
  end;
end;

function TfrmContasPagar.ContasVencidas: Currency;
begin
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := GetConnection;
    CommandText :=
      'select sum(TOTAL) as SOMA from CONTASPAGAR where (VENCIMENTO < CURRENT_DATE) '+
      'and (PAGA = '''+'N'+''') and FORNECEDOR = :FORN';
    Params.ParamByName('FORN').AsInteger := IdForn;  
    Open;
    Result := FieldByName('SOMA').AsCurrency;
  finally
    Free;
  end;
end;

procedure TfrmContasPagar.dsPadraoStateChange(Sender: TObject);
begin
  Stb.Panels[0].Text := 'Vencidas: '+CurrToStrF(ContasVencidas, ffCurrency, 2);
  Stb.Panels[1].Text := 'A vencer: '+CurrToStrF(ContasAVencer, ffCurrency, 2);
  Stb.Panels[2].Text := 'Vencendo hoje: '+CurrToStrF(ContasVencendoHoje, ffCurrency, 2);
end;

procedure TfrmContasPagar.ContaPaga(var Msg: TMessage);
begin
  ContaModificada;
end;

procedure TfrmContasPagar.GradeDblClick(Sender: TObject);
begin
  if cdsPadrao.IsEmpty then Exit;
  if not (cdsPadrao.State in dsEditModes) then
    cdsPadrao.Edit;
  if cdsPadraoPAGAR.AsString = 'N' then
    cdsPadraoPAGAR.AsString := 'S'
  else
    cdsPadraoPAGAR.AsString := 'N';
  cdsPadrao.ApplyUpdates(0);
  cdsPadrao.Next;
end;

procedure TfrmContasPagar.GradeTitleClick(Column: TColumn);
begin
  OrdenaColunasGrid(Grade, Column, cdsPadrao);
end;

procedure TfrmContasPagar.miVencendohojeClick(Sender: TObject);
begin
  cdsPadrao.Close;
  cdsPadrao.CommandText := SQLHoje;
  cdsPadrao.Params.ParamByName('PFORN').AsInteger := IdForn;
  cdsPadrao.Open;
end;

procedure TfrmContasPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    ChamaHelp(Self, 48,'');
   if Key = VK_ESCAPE then
    Close;
end;

initialization
  RegisterClass(TfrmContasPagar);
finalization
  UnRegisterClass(TfrmContasPagar);
end.
