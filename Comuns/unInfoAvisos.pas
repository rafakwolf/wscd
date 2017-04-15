unit unInfoAvisos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons,
  DB, DBClient, Datasnap.Provider,
  Data.SqlExpr, ComCtrls, DateUtils, ImgList, FMTBcd, System.ImageList;

type
  TfrmInfoAvisos = class(TfrmSimplePadrao)
    imgInfo: TImage;
    lbInfo: TLabel;
    sqldCR: TSQLDataSet;
    dspCR: TDataSetProvider;
    cdsCR: TClientDataSet;
    dsCR: TDataSource;
    sqldCRVENCIMENTO: TDateField;
    sqldCRCLIENTE: TStringField;
    sqldCRVALOR: TFMTBCDField;
    sqldCRATRASO: TIntegerField;
    cdsCRVENCIMENTO: TDateField;
    cdsCRCLIENTE: TStringField;
    cdsCRVALOR: TFMTBCDField;
    cdsCRATRASO: TIntegerField;
    sqldCRCODIGO: TIntegerField;
    cdsCRCODIGO: TIntegerField;
    pgcInfoAviso: TPageControl;
    tsContasReceber: TTabSheet;
    dbgrdContas: TDBGrid;
    btnReceber: TBitBtn;
    rgpExibicao: TRadioGroup;
    tsContasPagar: TTabSheet;
    tsClientesAniver: TTabSheet;
    dtpData: TDateTimePicker;
    lblData: TLabel;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    sqldCP: TSQLDataSet;
    sqldCPCODIGO: TIntegerField;
    sqldCPVENCIMENTO: TDateField;
    sqldCPFORNECEDOR: TStringField;
    sqldCPVALOR: TFMTBCDField;
    sqldCPATRASO: TIntegerField;
    dspCP: TDataSetProvider;
    cdsCP: TClientDataSet;
    cdsCPCODIGO: TIntegerField;
    cdsCPVENCIMENTO: TDateField;
    cdsCPFORNECEDOR: TStringField;
    cdsCPVALOR: TFMTBCDField;
    cdsCPATRASO: TIntegerField;
    dsCP: TDataSource;
    dbgrdContasPagar: TDBGrid;
    rgExibicaoCP: TRadioGroup;
    btnPagar: TBitBtn;
    lblTotalCR: TLabel;
    lblTotalCP: TLabel;
    sqldCRRECEBER: TStringField;
    sqldCPPAGAR: TStringField;
    cdsCPPAGAR: TStringField;
    cdsCRRECEBER: TStringField;
    ilImages: TImageList;
    dbgrdClientes: TDBGrid;
    sqldClientes: TSQLDataSet;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    dsClientes: TDataSource;
    btnEtiqCliente: TBitBtn;
    sqldClientesNOME: TStringField;
    sqldClientesDATANASC: TDateField;
    sqldClientesCIDADE: TStringField;
    sqldClientesFONE: TStringField;
    sqldClientesIDADE: TIntegerField;
    sqldClientesMARCADO: TStringField;
    cdsClientesNOME: TStringField;
    cdsClientesDATANASC: TDateField;
    cdsClientesCIDADE: TStringField;
    cdsClientesFONE: TStringField;
    cdsClientesIDADE: TIntegerField;
    cdsClientesMARCADO: TStringField;
    btnImpRelatorio: TBitBtn;
    btnEnvelopes: TBitBtn;
    lblClientes: TLabel;
    bvlLinha: TBevel;
    sqldCRTOTAL: TSingleField;
    cdsCRTOTAL: TSingleField;
    sqldCPTOTAL: TSingleField;
    cdsCPTOTAL: TSingleField;
    procedure FormCreate(Sender: TObject);
    procedure rgpExibicaoClick(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
    procedure dbgrdContasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure rgExibicaoCPClick(Sender: TObject);
    procedure dtpDataChange(Sender: TObject);
    procedure dbgrdContasDblClick(Sender: TObject);
    procedure dbgrdContasPagarDblClick(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure btnEtiqClienteClick(Sender: TObject);
    procedure dbgrdClientesDblClick(Sender: TObject);
    procedure dbgrdClientesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnImpRelatorioClick(Sender: TObject);
    procedure btnEnvelopesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure TotalizaCR(Data: TDateTime);
    procedure TotalizaCP(Data: TDateTime);
    procedure AbreClientesAniver;
    procedure IdadeClientes;
  public
  end;

var
  frmInfoAvisos: TfrmInfoAvisos;

implementation

uses unReceberMan, unPagarMan, Funcoes, ufmImprimeEtiq, unDmPrincipal,
  unPrevClienteAniver, uConfiguraRelatorio, unPrevEnvelopeClientes,
  uDatabaseutils;

{$R *.dfm}

procedure TfrmInfoAvisos.FormCreate(Sender: TObject);
begin
  inherited;
  UpdateSingleField('update CONTASRECEBER set RECEBER = '+
    QuotedStr('N'));

  UpdateSingleField('update CONTASPAGAR set PAGAR = '+
    QuotedStr('N'));

  dtpData.Date := Date;

  cdsCR.Close;
  cdsCR.Params.ParamByName('DATA').AsDate := dtpData.Date;
  cdsCR.Open;

  cdsCP.Close;
  cdsCP.Params.ParamByName('DATA').AsDate := dtpData.Date;
  cdsCP.Open;

  AbreClientesAniver;
  IdadeClientes;

  TotalizaCR(dtpData.Date);
  TotalizaCP(dtpData.Date);

  dtpData.Color := $0080FFFF;
  pgcInfoAviso.ActivePageIndex := 0;
end;

procedure TfrmInfoAvisos.FormShow(Sender: TObject);
begin
  inherited;
 rgpExibicao.OnClick(Self);
 rgExibicaoCP.OnClick(Self);
end;

procedure TfrmInfoAvisos.rgpExibicaoClick(Sender: TObject);
begin
  inherited;
  case rgpExibicao.ItemIndex of
    0:
    begin
      cdsCR.Filtered := False;
      cdsCR.Filter := 'VENCIMENTO < '+QuotedStr(DateToStr(Date));
      cdsCR.Filtered := True;
    end;
    1:
    begin
      cdsCR.Filtered := False;
      cdsCR.Filter := 'VENCIMENTO = '+QuotedStr(DateToStr(Date));
      cdsCR.Filtered := True;
    end;
    2:
    begin
      cdsCR.Filtered := False;
      cdsCR.Filter := 'VENCIMENTO <= '+QuotedStr(DateToStr(Date));
      cdsCR.Filtered := True;
    end;
  end;
end;

procedure TfrmInfoAvisos.btnReceberClick(Sender: TObject);
begin
  inherited;
  frmReceberMan := TfrmReceberMan.Create(Self);
  frmReceberMan.Caption := 'Recebimento';
  frmReceberMan.ShowModal;

  if Assigned(frmReceberMan) then
    FreeAndNil(frmReceberMan);

  cdsCR.Close;
  cdsCR.Open;
end;

procedure TfrmInfoAvisos.dbgrdContasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  FieldCheck: string;
begin
  inherited;
  if pgcInfoAviso.ActivePageIndex = 0 then
    FieldCheck := 'RECEBER'
  else if pgcInfoAviso.ActivePageIndex = 1 then
    FieldCheck := 'PAGAR';

  if (TDBGrid(Sender).DataSource.DataSet.FieldByName('VENCIMENTO').AsDateTime < Date) then
    TDBGrid(Sender).Canvas.Font.Color := clRed
  else if (TDBGrid(Sender).DataSource.DataSet.FieldByName('VENCIMENTO').AsDateTime = Date) then
    TDBGrid(Sender).Canvas.Font.Color := clBlue;

  if TDBGrid(Sender).DataSource.DataSet.FieldByName(FieldCheck).AsString = 'S' then
    TDBGrid(Sender).Canvas.Brush.Color := $0080FFFF;

  if (gdSelected in State) and (not (TDBGrid(Sender).DataSource.DataSet.FieldByName(FieldCheck).AsString = 'S')) then
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;

  TDBGrid(Sender).Canvas.FillRect(Rect);
  TDBGrid(Sender).DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TfrmInfoAvisos.btnAnteriorClick(Sender: TObject);
begin
  inherited;
  dtpData.Date := IncDay(dtpData.Date, -1);
  dtpData.OnChange(Self);
end;

procedure TfrmInfoAvisos.btnProximoClick(Sender: TObject);
begin
  inherited;
  dtpData.Date := IncDay(dtpData.Date, 1);
  dtpData.OnChange(Self);
end;

procedure TfrmInfoAvisos.rgExibicaoCPClick(Sender: TObject);
begin
  inherited;
  case rgExibicaoCP.ItemIndex of
    0:
    begin
      cdsCP.Filtered := False;
      cdsCP.Filter := 'VENCIMENTO < '+QuotedStr(DateToStr(Date));
      cdsCP.Filtered := True;
    end;
    1:
    begin

      cdsCp.Filtered := False;
      cdsCp.Filter := 'VENCIMENTO = '+QuotedStr(DateToStr(Date));
      cdsCp.Filtered := True;
    end;
    2:
    begin

      cdsCp.Filtered := False;
      cdsCp.Filter := 'VENCIMENTO <= '+QuotedStr(DateToStr(Date));
      cdsCp.Filtered := True;
    end;
  end;
end;

procedure TfrmInfoAvisos.TotalizaCP(Data: TDateTime);
begin
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := sqldCP.SQLConnection;
    CommandText := 'SELECT '+
      'SUM(CP.TOTAL) '+
      'FROM CONTASPAGAR CP '+
      'LEFT JOIN FORNECEDORES FO ON (FO.CODFORNECEDOR = CP.FORNECEDOR) '+
      'WHERE (CP.PAGA = '''+'N'+''') AND (CP.VENCIMENTO <= :DATA)';
    Params.ParamByName('DATA').AsDate := Data;
    Open;
    lblTotalCP.Caption := 'Total de pagamentos: R$ '+FormatFloat('#,##0.00', Fields[0].AsFloat);
  finally
    Free;
  end;
end;

procedure TfrmInfoAvisos.TotalizaCR(Data: TDateTime);
begin
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := sqldCP.SQLConnection;
    CommandText := 'SELECT '+
      'SUM(CR.TOTAL) '+
      'FROM CONTASRECEBER CR '+
      'LEFT JOIN CLIENTES CLI ON (CLI.CODCLIENTE = CR.CLIENTE) '+
      'WHERE (CR.RECDA = '''+'N'+''') AND (CR.VENCIMENTO <= :DATA)';
    Params.ParamByName('DATA').AsDate := Data;
    Open;
    lblTotalCR.Caption := 'Total de recebimentos: R$ '+FormatFloat('#,##0.00', Fields[0].AsFloat);
  finally
    Free;
  end;
end;

procedure TfrmInfoAvisos.dtpDataChange(Sender: TObject);
begin
  inherited;
  cdsCR.Close;
  cdsCR.Params.ParamByName('DATA').AsDate := dtpData.Date;
  cdsCR.Open;

  cdsCP.Close;
  cdsCP.Params.ParamByName('DATA').AsDate := dtpData.Date;
  cdsCP.Open;

  AbreClientesAniver;
  IdadeClientes;

  TotalizaCR(dtpData.Date);
  TotalizaCP(dtpData.Date);
end;

procedure TfrmInfoAvisos.dbgrdContasDblClick(Sender: TObject);
begin
  inherited;
  if cdsCR.IsEmpty then Exit;
  if not (cdsCR.State in dsEditModes) then
    cdsCR.Edit;
  if cdsCRRECEBER.AsString = 'N' then
    cdsCRRECEBER.AsString := 'S'
  else
    cdsCRRECEBER.AsString := 'N';
  cdsCR.ApplyUpdates(0);
  cdsCR.Next;
end;

procedure TfrmInfoAvisos.dbgrdContasPagarDblClick(Sender: TObject);
begin
  inherited;
  if cdsCP.IsEmpty then
    Exit;
  if not (cdsCP.State in dsEditModes) then
    cdsCP.Edit;
  if cdsCPPAGAR.AsString = 'N' then
    cdsCPPAGAR.AsString := 'S'
  else
    cdsCPPAGAR.AsString := 'N';

  cdsCP.ApplyUpdates(0);
  cdsCP.Next;
end;

procedure TfrmInfoAvisos.btnPagarClick(Sender: TObject);
begin
  inherited;
  frmPagarMan := TfrmPagarMan.Create(Self);
  frmPagarMan.Caption := 'Pagamento';
  frmPagarMan.ShowModal;

  if Assigned(frmPagarMan) then
    FreeAndNil(frmPagarMan);

  cdsCP.Close;
  cdsCP.Open;
end;

procedure TfrmInfoAvisos.AbreClientesAniver;
begin
  with cdsClientes do
  begin
    Close;
    Params.ParamByName('PTIPO').AsInteger   := 0;
    Params.ParamByName('PDIAINI').AsInteger := DayOf(dtpData.Date);
    Params.ParamByName('PDIAFIM').AsInteger := DayOf(dtpData.Date);
    Params.ParamByName('PMES').AsInteger    := MonthOf(dtpData.Date);
    Params.ParamByName('PANO').AsInteger    := -1;
    Params.ParamByName('PDATA1').AsDate     := dtpData.Date;
    Params.ParamByName('PDATA2').AsDate     := dtpData.Date;
    Open;
    lblClientes.Caption := IntToStr(RecordCount)+' cliente(s) aniversariante(s)';
  end;
end;

procedure TfrmInfoAvisos.btnEtiqClienteClick(Sender: TObject);
var
  WhereClause, Operador: string;
begin
  inherited;

  if not Locate(cdsClientes, cdsClientesMARCADO, 'S') then
  begin
    MsgAviso('Nenhum cliente marcado para impressão de etiquetas');
    Exit;
  end;

  cdsClientes.First;
  while not cdsClientes.Eof do
  begin
    if Pos(' where ', AnsiLowerCase(WhereClause)) > 0 then
      Operador := ' or '
    else
      Operador := ' where ';

    if cdsClientesMARCADO.AsString = 'S' then
      WhereClause := WhereClause + Operador+'(TITULO = '+QuotedStr(cdsClientesNOME.AsString)+')';

    cdsClientes.Next;
  end;

  with TfrmImprimeEtiq.Create(Self) do
  try
    SQL := 'select '+
           'TITULO, '+  // TITULO --> nome do cliente
           'TEXTO '+
           'from VIEWETIQUETACLIENTE '+ WhereClause +
           ' order by TITULO';
    TipoEtq := teCliente;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmInfoAvisos.dbgrdClientesDblClick(Sender: TObject);
begin
  inherited;
  if cdsClientes.IsEmpty then
    Exit;
  if not (cdsClientes.State in dsEditModes) then
    cdsClientes.Edit;
  if cdsClientesMARCADO.AsString = 'N' then
    cdsClientesMARCADO.AsString := 'S'
  else
    cdsClientesMARCADO.AsString := 'N';

  cdsClientes.Post;
  cdsClientes.Next;
end;

procedure TfrmInfoAvisos.dbgrdClientesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('MARCADO').AsString = 'S' then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := $0080FFFF;
    TDBGrid(Sender).Canvas.Font.Color  := clBlack;
  end;

  if (gdSelected in State) and (not (TDBGrid(Sender).DataSource.DataSet.FieldByName('MARCADO').AsString = 'S')) then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color  := clBlack;
  end;

  TDBGrid(Sender).Canvas.FillRect(Rect);
  TDBGrid(Sender).DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TfrmInfoAvisos.IdadeClientes;
begin
  cdsClientes.First;
  with cdsClientes do
  begin
    while not Eof do
    begin
      Edit;
      FieldByName('IDADE').AsInteger :=
        Idade(FieldByName('DATANASC').AsDateTime);
      Post;
      Next;
    end;
  end;
end;

procedure TfrmInfoAvisos.btnImpRelatorioClick(Sender: TObject);
begin
  inherited;
  with TfrmPrevClientesAniver.Create(Self) do
  try
    with cdsPadrao do
    begin
      Close;
      Params.ParamByName('PTIPO').AsInteger   := 0;
      Params.ParamByName('PDIAINI').AsInteger := DayOf(dtpData.Date);
      Params.ParamByName('PDIAFIM').AsInteger := DayOf(dtpData.Date);
      Params.ParamByName('PMES').AsInteger    := MonthOf(dtpData.Date);
      Params.ParamByName('PANO').AsInteger    := -1;
      Params.ParamByName('PDATA1').AsDate     := dtpData.Date;
      Params.ParamByName('PDATA2').AsDate     := dtpData.Date;
      Open;
    end;
    PrintIfNotEmptyRL(rrPadrao);
  finally
    cdsPadrao.Close;
    Free;
  end;
end;

procedure TfrmInfoAvisos.btnEnvelopesClick(Sender: TObject);
var
  arrayClientes: string;
begin
  if not Locate(cdsClientes, cdsClientesMARCADO, 'S') then
  begin
    MsgAviso('Nenhum cliente selecionado.');
    Exit;
  end;

  cdsClientes.First;
  while not cdsClientes.Eof do
  begin
    if cdsClientesMARCADO.AsString = 'S' then
    begin
      if arrayClientes = '' then
        arrayClientes := QuotedStr(cdsClientesNOME.AsString)
      else
        arrayClientes := arrayClientes+','+QuotedStr(cdsClientesNOME.AsString);
    end;
    cdsClientes.Next;
  end;

  inherited;
  with TfrmPrevEnvelopeCliente.Create(Self) do
  try
    with cdsPadrao do
    begin
      Close;
      //ShowMessage(arrayClientes);
      CommandText := 'select '+
                     'NOME, '+
                     'DATA, '+
                     'ENDERECO, '+
                     'CIDADE, '+
                     'BAIRRO, '+
                     'CEP '+
                     'from VIEWENDERECOCLIENTES '+
                     'where NOME in ('+arrayClientes+') '+
                     'order by DATA, NOME';
      //Params.ParamByName('MES').AsInteger     := MonthOf(dtpData.Date);
      //Params.ParamByName('PDIAINI').AsInteger := DayOf(dtpData.Date);
      //Params.ParamByName('PDIAFIM').AsInteger := DayOf(dtpData.Date);

      //ShowMessage(CommandText);
      Open;
    end;
    PrintIfNotEmptyRL(rrEnvelope);
  finally
    Free;
  end;
end;

initialization
  RegisterClass(TfrmInfoAvisos);
finalization
  UnRegisterClass(TfrmInfoAvisos);
end.

