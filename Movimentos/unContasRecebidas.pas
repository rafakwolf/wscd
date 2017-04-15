unit unContasRecebidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, DB, SqlExpr, varglobal,
  DBClient, ComCtrls, Menus, Grids, DBGrids,
  Datasnap.Provider, unContasReceber, FMTBcd, unSimplePadrao;

type
  TfrmContasRecebidas = class(TfrmSimplePadrao)
    cdsPadrao: TClientDataSet;
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    pnBotoes: TPanel;
    btnAtualizar: TSpeedButton;
    btnEstornar: TSpeedButton;
    btnFechar: TSpeedButton;
    grpCliente: TGroupBox;
    dbeCliente: TDBEdit;
    Grade: TDBGrid;
    mmContasRecebidas: TMainMenu;
    miOpcoes: TMenuItem;
    miEstornar: TMenuItem;
    miAtualizar: TMenuItem;
    N1: TMenuItem;
    miFechar: TMenuItem;
    Stb: TStatusBar;
    dsPadrao: TDataSource;
    sqldConta: TSQLDataSet;
    dspConta: TDataSetProvider;
    cdsConta: TClientDataSet;
    cdsContaORIGEM: TIntegerField;
    sqldContaCODIGO: TIntegerField;
    sqldContaORIGEM: TIntegerField;
    cdsContaCODIGO: TIntegerField;
    sqldDeletaConta: TSQLDataSet;
    grpFiltro: TGroupBox;
    lbFiltroUsado: TLabel;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoDATA: TDateField;
    sqldPadraoVENCIMENTO: TDateField;
    sqldPadraoCLIENTE: TIntegerField;
    sqldPadraoNOMECLIENTE: TStringField;
    sqldPadraoDESCRICAO: TStringField;
    sqldPadraoDOCUMENTO: TStringField;
    sqldPadraoVALOR: TFMTBCDField;
    sqldPadraoJURO: TFMTBCDField;
    sqldPadraoRECEBER: TStringField;
    sqldPadraoRECDA: TStringField;
    sqldPadraoDATARECTO: TDateField;
    sqldPadraoORIGEM: TIntegerField;
    sqldPadraoVENDA: TIntegerField;
    sqldPadraoCAPITALRECDO: TFMTBCDField;
    sqldPadraoJURORECDO: TFMTBCDField;
    sqldPadraoDESCTO: TFMTBCDField;
    sqldPadraoOBS: TMemoField;
    sqldPadraoATRASO: TIntegerField;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoDATA: TDateField;
    cdsPadraoVENCIMENTO: TDateField;
    cdsPadraoCLIENTE: TIntegerField;
    cdsPadraoNOMECLIENTE: TStringField;
    cdsPadraoDESCRICAO: TStringField;
    cdsPadraoDOCUMENTO: TStringField;
    cdsPadraoVALOR: TFMTBCDField;
    cdsPadraoJURO: TFMTBCDField;
    cdsPadraoRECEBER: TStringField;
    cdsPadraoRECDA: TStringField;
    cdsPadraoDATARECTO: TDateField;
    cdsPadraoORIGEM: TIntegerField;
    cdsPadraoVENDA: TIntegerField;
    cdsPadraoCAPITALRECDO: TFMTBCDField;
    cdsPadraoJURORECDO: TFMTBCDField;
    cdsPadraoDESCTO: TFMTBCDField;
    cdsPadraoOBS: TMemoField;
    cdsPadraoATRASO: TIntegerField;
    sqldPadraoVALORJURO: TSingleField;
    sqldPadraoTOTAL: TSingleField;
    sqldPadraoTOTALRECDO: TSingleField;
    cdsPadraoVALORJURO: TSingleField;
    cdsPadraoTOTAL: TSingleField;
    cdsPadraoTOTALRECDO: TSingleField;
    procedure btnFecharClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEstornarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GradeDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure GradeTitleClick(Column: TColumn);
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

uses Funcoes, ConstPadrao, uDatabaseutils;

{$R *.dfm}

procedure TfrmContasRecebidas.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmContasRecebidas.btnAtualizarClick(Sender: TObject);
begin
  cdsPadrao.Close;
  cdsPadrao.Params.ParamByName('PCLIENTE').AsInteger := FCliente;
  cdsPadrao.Open;
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
     PostMessage(Handle, WM_CLOSE, 0, 0);
     Exit;
   end;
   0: begin
     if ObterDatas(DataI, DataF) and
        (ClearMask(DataI) <> '') and
        (ClearMask(DataF) <> '') then
     begin
       cdsPadrao.Close;
       cdsPadrao.CommandText := GetSQLFromQuery(cdsPadrao) +
         ' and CLIENTE = :PCLIENTE' +
         ' and DATARECTO between :DATAI and :DATAF';
       cdsPadrao.Params.ParamByName('PCLIENTE').AsInteger := FCliente;
       cdsPadrao.Params.ParamByName('DATAI').AsDate := StrToDateTime(DataI);
       cdsPadrao.Params.ParamByName('DATAF').AsDate := StrToDateTime(DataF);
       cdsPadrao.Open;
       lbFiltroUsado.Caption := 'Período de '+DataI+' até '+DataF;
     end;
   end;
   1: begin
     cdsPadrao.Close;
     cdsPadrao.Params.ParamByName('PCLIENTE').AsInteger := FCliente;
     cdsPadrao.Open;
     lbFiltrousado.Caption := 'Todas as contas recebidas';
   end;
  end;
  if cdsPadrao.IsEmpty then
  begin
    MsgErro(UM_PESQUISAVAZIO);
    PostMessage(Handle, WM_CLOSE, 0, 0);
    Exit;
  end;
  SomaContasRecebidas;
end;

procedure TfrmContasRecebidas.btnEstornarClick(Sender: TObject);

  function ContasMarcadas: Integer;
  begin
    with TSQLDataSet.Create(nil) do
    try
      SQLConnection := GetConnection;
      CommandText := 'select count(1) as CONT from CONTASRECEBER'+
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

  if Locate(cdsPadrao, cdsPadraoRECEBER, 'S') then
  begin
    if MsgSN('Deseja estornar esta conta?') then
      Estornar;
  end
  else
    MsgAviso('Não há conta marcada para estorno.'+#13#10+
      'Para marcar/desmarcar dê um duplo clique sobre a conta desejada.');
end;

procedure TfrmContasRecebidas.Estornar;
begin
  try
    if cdsPadraoORIGEM.IsNull then
    begin
      cdsPadrao.Edit;
      cdsPadraoRECDA.AsString := 'N';
      cdsPadraoRECEBER.AsString := 'N';
      cdsPadraoDATARECTO.Clear;
      cdsPadraoCAPITALRECDO.AsFloat := 0;
      cdsPadraoJURORECDO.AsFloat := 0;
      cdsPadraoDESCTO.AsFloat := 0;
      cdsPadrao.ApplyUpdates(0);
      { delete conta restante }
      sqldDeletaConta.Close;
      sqldDeletaConta.Params.ParamByName('CODIGO').AsInteger := cdsPadraoCODIGO.AsInteger;
      sqldDeletaConta.ExecSQL;
    end
    else
    begin
      cdsConta.Open;
      if cdsConta.Locate('ORIGEM', cdsPadraoCODIGO.AsInteger, []) then
      begin
        MsgAviso('O recebimento desta conta gerou a conta restante de código = ' +
          IntToStr(cdsContaCODIGO.AsInteger) + '.' + #13#10 +
          'Exclua a conta restante para prosseguir.');
        Abort;
      end
      else
      begin
        cdsPadrao.Edit;
        cdsPadraoRECDA.AsString := 'N';
        cdsPadraoRECEBER.AsString := 'N';
        cdsPadraoDATARECTO.Clear;
        cdsPadraoCAPITALRECDO.AsFloat := 0;
        cdsPadraoJURORECDO.AsFloat := 0;
        cdsPadraoDESCTO.AsFloat := 0;
        cdsPadrao.ApplyUpdates(0);
      end;
    end;
  finally
    btnAtualizar.Click;
    PostMessageAllForms(WM_CONTA_RECEBER_RECEBIDA);
    cdsConta.Close;
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
  cdsPadrao.Close;
  Action := caFree;
end;

procedure TfrmContasRecebidas.SomaContasRecebidas;
begin
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := GetConnection;
    CommandText := 'select sum(TOTAL) as SOMA from CONTASRECEBER '+
      'where RECDA = '+QuotedStr('S')+' and CLIENTE = :PCLIENTE';
    Params.ParamByName('PCLIENTE').AsInteger := FCliente; 
    Open;
    Stb.Panels[0].Text := 'Total de contas recebidas: '+
      CurrToStrF(FieldByName('SOMA').AsCurrency, ffCurrency, 2);
  finally
    Free;
  end;
end;

procedure TfrmContasRecebidas.GradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if cdsPadraoRECEBER.AsString = 'S' then
    Grade.Canvas.Brush.Color := $0080FFFF;

  if (Column.FieldName = 'ATRASO') or
     (Column.FieldName = 'TOTAL') then
    Grade.Canvas.Brush.Color := $0080FFFF;

  if (gdSelected in State) then
  begin
    Grade.Canvas.Font.Color := clWhite;
    if ((cdsPadraoRECEBER.AsString = 'S') or
        (Column.FieldName = 'ATRASO') or
        (Column.FieldName = 'TOTAL')) then
      Grade.Canvas.Brush.Color := clMenuHighlight;
  end;

  Grade.Canvas.FillRect(Rect);
  Grade.DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TfrmContasRecebidas.GradeDblClick(Sender: TObject);
begin
  if cdsPadrao.IsEmpty then Exit;
  cdsPadrao.Edit;
  if (cdsPadraoRECEBER.AsString = 'N') then
    cdsPadraoRECEBER.AsString := 'S'
  else
    cdsPadraoRECEBER.AsString := 'N';
  cdsPadrao.ApplyUpdates(0);
  cdsPadrao.Next;
end;

procedure TfrmContasRecebidas.FormResize(Sender: TObject);
var
  Size: Integer;
begin
  Size := Trunc(Self.Width div 2);
  Stb.Panels[0].Width := Size;
  Stb.Panels[1].Width := Size;
end;

procedure TfrmContasRecebidas.GradeTitleClick(Column: TColumn);
begin
  //OrdenaColunasGrid(Grade, Column, cdsPadrao);
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
