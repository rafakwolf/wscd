unit unContasPagas;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, DB, StdCtrls,  DBCtrls, SqlDb,
  memds,  ConstPadrao, ComCtrls, unContasPagar,
  Menus, Grids, DBGrids, FMTBcd, unSimplePadrao, varglobal;

type
  TfrmContasPagas = class(TfrmSimplePadrao)
    sqldPadrao: TSQLQuery;
    dspPadrao: TComponent;
    cdsPadrao: TMemDataSet;
    dsPadrao: TDataSource;
    sqldEstorno: TSQLQuery;
    dspEstorno: TComponent;
    cdsEstorno: TMemDataSet;
    sqldEstornoCODIGO: TIntegerField;
    sqldEstornoORIGEM: TIntegerField;
    cdsEstornoCODIGO: TIntegerField;
    cdsEstornoORIGEM: TIntegerField;
    sqldContaEstorno: TSQLQuery;
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
    sqldPadraoVALORJURO: TFMTBCDField;
    sqldPadraoTOTAL: TFMTBCDField;
    sqldPadraoTOTALPAGO: TFMTBCDField;
    cdsPadraoVALORJURO: TFMTBCDField;
    cdsPadraoTOTAL: TFMTBCDField;
    cdsPadraoTOTALPAGO: TFMTBCDField;
    mmContasPagas: TMainMenu;
    miOpcoes: TMenuItem;
    miEstornar: TMenuItem;
    miAtualizar: TMenuItem;
    N1: TMenuItem;
    miFechar: TMenuItem;
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
    procedure GradeTitleClick(Column: TColumn);
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
  cdsPadrao.Close;
  //cdsPadrao.Params.ParamByName('PFORN').AsInteger := FFornecedor;
  cdsPadrao.Open;
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
         //PostMessage(Handle, WM_CLOSE, 0, 0);
         Exit;
       end;
   0: begin
        if ObterDatas(DataI, DataF) and
          (ClearMask(DataI) <> '') and
          (ClearMask(DataF) <> '') then
        begin
          cdsPadrao.Close;
          sqldPadrao.SQL.Clear; sqldPadrao.SQL.Text :=GetSQLFromQuery(cdsPadrao) +
            ' and DATAPAGTO between :DATAI and :DATAF';
          sqldPadrao.Params.ParamByName('PFORN').AsInteger := FFornecedor;
          sqldPadrao.Params.ParamByName('DATAI').AsDate := StrToDateTime(DataI);
          sqldPadrao.Params.ParamByName('DATAF').AsDate := StrToDateTime(DataF);
          cdsPadrao.Open;
          lbFiltrousado.Caption := 'Per�odo de '+DataI+' at� '+DataF;
        end;
      end;
   1: begin
        cdsPadrao.Close;
        sqldPadrao.Params.ParamByName('PFORN').AsInteger := FFornecedor;
        cdsPadrao.Open;
        lbFiltrousado.Caption := 'Todas as contas pagas';
      end;
  end;
  if cdsPadrao.IsEmpty then
  begin
    MsgErro(UM_PESQUISAVAZIO);
    //PostMessage(Handle, WM_CLOSE, 0, 0);
    Exit;
  end;
  SomaContasPagas;
end;

procedure TfrmContasPagas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsPadrao.Close;
  Action := caFree;
end;

procedure TfrmContasPagas.btnEstornarClick(Sender: TObject);

  function ContasMarcadas: Integer;
  begin
    with TSQLQuery.Create(nil) do
    try
      SQLConnection := GetConnection;
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

  if Locate(cdsPadrao, cdsPadraoPAGAR, 'S') then
  begin
    if MsgSN('Deseja estornar esta conta?') then
      Estornar;
  end
  else
    MsgAviso('N�o h� conta marcada para estorno.'+#13#10+
      'Para marcar/desmarcar d� um duplo clique sobre a conta desejada.');
end;

procedure TfrmContasPagas.Estornar;
begin
  try
    if cdsPadraoORIGEM.IsNull then
    begin
      cdsPadrao.Edit;
      cdsPadraoPAGA.AsString := 'N';
      cdsPadraoPAGAR.AsString := 'N';
      cdsPadraoDATAPAGTO.Clear;
      cdsPadraoCAPITALPAGO.AsFloat := 0;
      cdsPadraoJUROPAGO.AsFloat := 0;
      cdsPadraoDESCTO.AsFloat := 0;
      ////cdsPadrao.ApplyUpdates(0);
      { delete conta restante }
      sqldContaEstorno.Close;
      sqldContaEstorno.Params.ParamByName('CODIGO').AsInteger := cdsPadraoCODIGO.AsInteger;
      sqldContaEstorno.ExecSQL;
    end
    else
    begin
      cdsEstorno.Open;
      if cdsEstorno.Locate('ORIGEM', cdsPadraoCODIGO.AsInteger, []) then
      begin
        MsgAviso('O pagamento desta conta gerou a conta restante de c�digo = ' +
          IntToStr(cdsEstornoCODIGO.AsInteger) + '.' + #13#10 +
          'Exclua a conta restante para prosseguir.');
        Exit;
      end
      else
      begin
        cdsPadrao.Edit;
        cdsPadraoPAGA.AsString := 'N';
        cdsPadraoPAGAR.AsString := 'N';
        cdsPadraoDATAPAGTO.Clear;
        cdsPadraoCAPITALPAGO.AsFloat := 0;
        cdsPadraoJUROPAGO.AsFloat := 0;
        cdsPadraoDESCTO.AsFloat := 0;
        ////cdsPadrao.ApplyUpdates(0);
      end;
    end;
  finally
    btnAtualizar.Click;
    PostMessageAllForms(WM_CONTA_PAGAR_PAGA);
    cdsEstorno.Close;
  end;
  SomaContasPagas;
end;

procedure TfrmContasPagas.SomaContasPagas;
begin
  with TSQLQuery.Create(nil) do
  try
    SQLConnection := GetConnection;
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
  if cdsPadrao.IsEmpty then Exit;
  cdsPadrao.Edit;
  if (cdsPadraoPAGAR.AsString = 'N') then
    cdsPadraoPAGAR.AsString := 'S'
  else
    cdsPadraoPAGAR.AsString := 'N';
  ////cdsPadrao.ApplyUpdates(0);
  cdsPadrao.Next;
end;

procedure TfrmContasPagas.FormResize(Sender: TObject);
var
  Size: Integer;
begin
  Size := Trunc(Self.Width div 2);
  Stb.Panels[0].Width := Size;
  Stb.Panels[1].Width := Size;
end;

procedure TfrmContasPagas.GradeTitleClick(Column: TColumn);
begin
  ////OrdenaColunasGrid(Grade, Column, cdsPadrao);
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
