unit unRelatorioEtiquetaCliente;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, DB, StdCtrls, Buttons,   
  DBCtrls, ZDataset, ZAbstractRODataset;

type

  { TfrmRelatorioEtiquetaCliente }

  TfrmRelatorioEtiquetaCliente = class(TfrmDialogoRelatorioPadrao)
    btnCliente: TButton;
    btnCidade: TButton;
    cdsPesqClienteCODCLIENTE: TZIntegerField;
    cdsPesqClienteNOME: TZRawStringField;
    cdsPesqCidadeCODCIDADE: TZIntegerField;
    cdsPesqCidadeDESCRICAO: TZRawStringField;
    dsCidade: TDataSource;
    dbeCidade: TDBEdit;
    dbeCliente: TDBEdit;
    rgpFiltro: TRadioGroup;
    cdsPesqCliente: TZQuery;
    cdsPesqCidade: TZQuery;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure dbeClienteClickButton(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbeCidadeClickButton(Sender: TObject);
    procedure rgpFiltroClick(Sender: TObject);
  private
    SQLCidade, SQLCliente: string;
  public
  end;

var
  frmRelatorioEtiquetaCliente: TfrmRelatorioEtiquetaCliente;

implementation

uses
  Funcoes, unModeloConsulta, ConstPadrao, ufmImprimeEtiq, VarGlobal;

{$R *.dfm}

procedure TfrmRelatorioEtiquetaCliente.btnImprimirClick(Sender: TObject);
begin

end;

procedure TfrmRelatorioEtiquetaCliente.btnVisualizarClick(Sender: TObject);
begin
  inherited;

  with TfrmImprimeEtiq.Create(Self) do
  try
    if rgpFiltro.ItemIndex = 0 then
      SQL := 'select '+
             ' TITULO, '+
             ' TEXTO '+
             'from VIEWETIQUETACLIENTE '+
             'where IDCLIENTE = '+
        QuotedStr(IntToStr(cdsPesqCliente.FieldByName('CODCLIENTE').AsInteger))+
        'order by TITULO'
    else
    if rgpFiltro.ItemIndex = 1 then
      SQL := 'select '+
             ' TITULO, '+
             ' TEXTO '+
             'from VIEWETIQUETACLIENTE '+
             'where IDCIDADE = '+
        QuotedStr(IntToStr(cdsPesqCidadeCODCIDADE.AsInteger))+
        'order by IDCIDADE'
    else if rgpFiltro.ItemIndex = 2 then
      SQL := 'select '+
             ' TITULO, '+
             ' TEXTO '+
             'from VIEWETIQUETACLIENTE '+
             'order by TITULO';

    if rgpFiltro.ItemIndex = 0 then
    begin
      if dbeCliente.Text = '' then
      begin
        MsgCuidado(UM_FILTROINVALIDO);
        Exit;
      end;
    end
    else if rgpFiltro.ItemIndex = 1 then
    begin
      if dbeCidade.Text = '' then
      begin
        MsgCuidado(UM_FILTROINVALIDO);
        Exit;
      end;
    end;

    TipoEtq := teCliente;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmRelatorioEtiquetaCliente.dbeClienteClickButton(
  Sender: TObject);
var IdCliente: Integer;
begin
  inherited;
  cdsPesqCliente.Close;
  cdsPesqCliente.SQL.Clear;
  cdsPesqCliente.SQL.Text := SQLCliente;

  IdCliente := TfrmModeloConsulta.Execute('Cliente', 'CLIENTES', FN_CLIENTES, DL_CLIENTES, self);

  if (IdCliente > 0) then
  begin
    cdsPesqCliente.Open;
    cdsPesqCliente.Locate('CODCLIENTE', IdCliente, []);
  end;
end;

procedure TfrmRelatorioEtiquetaCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsPesqCidade.Close;
  cdsPesqCliente.Close;
  inherited;
end;

procedure TfrmRelatorioEtiquetaCliente.FormCreate(Sender: TObject);
begin
  inherited;
  dsPadrao.DataSet := cdsPesqCliente;
  dsCidade.DataSet := cdsPesqCidade;

  SQLCidade := 'select * from CIDADES';
  SQLCliente := 'select * from CLIENTES';
end;

procedure TfrmRelatorioEtiquetaCliente.dbeCidadeClickButton(
  Sender: TObject);
var IdCidade : Integer;
begin
  inherited;
  cdsPesqCidade.Close;
  cdsPesqCidade.SQL.Clear;
  cdsPesqCidade.SQL.Text := SQLCidade;

  IdCidade := TfrmModeloConsulta.Execute('Cidade', 'CIDADES', FN_CIDADES, DL_CIDADES, self);

  if (idCidade > 0) then
  begin
    cdsPesqCidade.Open;
    CdsPesqCidade.Locate('CODCIDADE', IdCidade, []);
  end;
end;

procedure TfrmRelatorioEtiquetaCliente.rgpFiltroClick(Sender: TObject);
begin

end;


initialization
  RegisterClass(TfrmRelatorioEtiquetaCliente);
finalization
  UnRegisterClass(TfrmRelatorioEtiquetaCliente);
end.
