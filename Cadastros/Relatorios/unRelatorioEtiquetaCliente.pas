unit unRelatorioEtiquetaCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, DB, StdCtrls, Buttons, ExtCtrls, Mask,
  DBCtrls, PLDBEdit;

type
  TfrmRelatorioEtiquetaCliente = class(TfrmDialogoRelatorioPadrao)
    dbeCliente: TPLDBEdit;
    dbeCidade: TPLDBEdit;
    rgpFiltro: TRadioGroup;
    dsCidade: TDataSource;
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
        QuotedStr(IntToStr(GetDmPesquisar.cdsPesqCliente.FieldByName('CODCLIENTE').AsInteger))+
        'order by TITULO'
    else
    if rgpFiltro.ItemIndex = 1 then
      SQL := 'select '+
             ' TITULO, '+
             ' TEXTO '+
             'from VIEWETIQUETACLIENTE '+
             'where IDCIDADE = '+
        QuotedStr(IntToStr(GetDmPesquisar.cdsPesqCidadeCODCIDADE.AsInteger))+
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
begin
  inherited;
  GetDmPesquisar.cdsPesqCliente.Close;
  GetDmPesquisar.cdsPesqCliente.CommandText := SQLCliente;
  if not TfrmModeloConsulta.Execute('Cliente', GetDmPesquisar.cdsPesqCliente, FN_CLIENTES, DL_CLIENTES) then
    GetDmPesquisar.cdsPesqCliente.Close;
end;

procedure TfrmRelatorioEtiquetaCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GetDmPesquisar.cdsPesqCidade.Close;
  GetDmPesquisar.cdsPesqCliente.Close;
  inherited;
end;

procedure TfrmRelatorioEtiquetaCliente.FormCreate(Sender: TObject);
begin
  inherited;
  ReordenaBotoes([btnVisualizar, btnSair]);
  dsPadrao.DataSet := GetDmPesquisar.cdsPesqCliente;
  dsCidade.DataSet := GetDmPesquisar.cdsPesqCidade;
  dbeCidade.Top := dbeCliente.Top;
  rgpFiltroClick(Self);

  SQLCidade := GetDmpesquisar.sqldPesqCidade.CommandText;
  SQLCliente := GetDmpesquisar.sqldPesqCliente.CommandText;
end;

procedure TfrmRelatorioEtiquetaCliente.dbeCidadeClickButton(
  Sender: TObject);
begin
  inherited;
  GetDmPesquisar.cdsPesqCidade.Close;
  GetDmPesquisar.cdsPesqCidade.CommandText := SQLCidade;
  if not TfrmModeloConsulta.Execute('Cidade', GetDmPesquisar.cdsPesqCidade, FN_CIDADES, DL_CIDADES) then
    GetDmPesquisar.cdsPesqCidade.Close;
end;

procedure TfrmRelatorioEtiquetaCliente.rgpFiltroClick(Sender: TObject);
begin
  inherited;
  case rgpFiltro.ItemIndex of
  0: begin
       dbeCliente.Visible := True;
       dbeCidade.Visible  := False;
       dbeCliente.Button.Enabled := True;
     end;
  1: begin
       dbeCliente.Visible := False;
       dbeCidade.Visible  := True;
       dbeCidade.Button.Enabled := True;         
     end;
  2: begin
       dbeCliente.Visible := False;
       dbeCidade.Visible := False;
     end;
  end;
end;

initialization
  RegisterClass(TfrmRelatorioEtiquetaCliente);
finalization
  UnRegisterClass(TfrmRelatorioEtiquetaCliente);
end.
