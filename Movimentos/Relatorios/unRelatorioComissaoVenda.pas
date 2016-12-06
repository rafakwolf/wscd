unit unRelatorioComissaoVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, DB, StdCtrls, Buttons, ExtCtrls,
  
  Mask, DBCtrls, PLDBEdit, ComCtrls, PLDBEditDateTimePicker;

type
  TfrmRelatorioComissaoVenda = class(TfrmDialogoRelatorioPadrao)
    dbeVendedor: TPLDBEdit;
    dsData: TDataSource;
    dbdtpDataIni: TPLDBEditDateTimePicker;
    dbdtpDataFim: TPLDBEditDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure dbeVendedorClickButton(Sender: TObject);
  private
    SQLpadrao: string;
    procedure Imprirmir(p: Boolean);
  public
  end;

var
  frmRelatorioComissaoVenda: TfrmRelatorioComissaoVenda;

implementation

uses
  Funcoes, unPrevComissaoVenda, uConfiguraRelatorio,
  ConstPadrao, unModeloConsulta, VarGlobal;

{$R *.dfm}

procedure TfrmRelatorioComissaoVenda.FormCreate(Sender: TObject);
begin
  inherited;
  dsPadrao.DataSet := GetDmPesquisar.cdsPesqVendedor;
  dsData.DataSet   := GetDmPesquisar.cdsPesqData;
  {...}
  GetDmPesquisar.cdsPesqData.Open;
  GetDmPesquisar.cdsPesqVendedor.Close;
  SQLpadrao := GetDmPesquisar.sqldPesqVendedor.CommandText;
end;

procedure TfrmRelatorioComissaoVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  GetDmPesquisar.cdsPesqData.Close;
  GetDmPesquisar.cdsPesqVendedor.Close;
end;

procedure TfrmRelatorioComissaoVenda.Imprirmir(p: Boolean);
begin
  if GetDmPesquisar.cdsPesqVendedor.FieldByName('IDVENDEDOR').IsNull then
  begin
    MsgErro(UM_FILTROINVALIDO);
    Exit;
  end;
  
  if ValidaDataIniFim(GetDmPesquisar.cdsPesqData.FieldByName('DATAINI').AsDateTime,
    GetDmPesquisar.cdsPesqData.FieldByName('DATAFIM').AsDateTime, dbdtpDataIni) then
  begin
    with TfrmPrevComissaoVenda.Create(Self) do
    try
      cdsPadrao.Close;
      cdsPadrao.Params.ParamByName('IDVEND').AsInteger :=
        GetDmPesquisar.cdsPesqVendedor.FieldByName('IDVENDEDOR').AsInteger;
      cdsPadrao.Params.ParamByName('DATAINI').AsDate :=
        GetDmPesquisar.cdsPesqData.FieldByName('DATAINI').AsDateTime;
      cdsPadrao.Params.ParamByName('DATAFIM').AsDate :=
        GetDmPesquisar.cdsPesqData.FieldByName('DATAFIM').AsDateTime;

      rlblDataVendedor.Caption := IntToStr(GetDmPesquisar.cdsPesqVendedor.FieldByName('IDVENDEDOR').AsInteger)+' - '+
        GetDmPesquisar.cdsPesqVendedor.FieldByName('VENDEDOR').AsString;
      rlblDataPeriodo.Caption  := FormatDateTime('dd/mm/yyyy', GetDmPesquisar.cdsPesqData.FieldByName('DATAINI').AsDateTime)+' à '+
        FormatDateTime('dd/mm/yyyy', GetDmPesquisar.cdsPesqData.FieldByName('DATAFIM').AsDateTime);

      lbTitulo.Caption := 'Comissão de vendedor';
      PrintIfNotEmptyRL(rrPadrao, p);
    finally
      Free;
    end;
  end;
end;

procedure TfrmRelatorioComissaoVenda.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  Imprirmir(False);
end;

procedure TfrmRelatorioComissaoVenda.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Imprirmir(True);
end;

procedure TfrmRelatorioComissaoVenda.dbeVendedorClickButton(
  Sender: TObject);
begin
  inherited;
  GetDmPesquisar.cdsPesqVendedor.Close;
  GetDmPesquisar.cdsPesqVendedor.CommandText := SQLpadrao;
  if not TfrmModeloConsulta.Execute('Vendedor', GetDmPesquisar.cdsPesqVendedor, FN_VENDEDOR, DL_VENDEDOR) then
    GetDmPesquisar.cdsPesqVendedor.Close;
end;

initialization
  RegisterClass(TfrmRelatorioComissaoVenda);
finalization
  UnRegisterClass(TfrmRelatorioComissaoVenda);
end.
