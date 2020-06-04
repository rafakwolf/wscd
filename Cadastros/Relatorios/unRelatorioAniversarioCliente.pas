unit unRelatorioAniversarioCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, StdCtrls, Buttons, ExtCtrls,
  DB, DBClient, Provider, SqlExpr, ComCtrls,  Spin,
  FMTBcd, DBCtrls, Vcl.Mask, uniGUIBaseClasses, uniGUIClasses, uniPanel,
  uniLabel, uniEdit, uniButton, uniBitBtn, uniDBEdit, uniMultiItem, uniComboBox,
  uniSpinEdit, uniRadioGroup;

type
  TfrmRelatorioAniversarioCliente = class(TfrmDialogoRelatorioPadrao)
    sqldSelecao: TSQLDataSet;
    sqldSelecaoDATAINI: TSQLTimeStampField;
    sqldSelecaoDATAFIM: TSQLTimeStampField;
    dspSelecao: TDataSetProvider;
    cdsSelecao: TClientDataSet;
    cdsSelecaoDATAINI: TSQLTimeStampField;
    cdsSelecaoDATAFIM: TSQLTimeStampField;
    pnDiaMesAno: TContainerPanel;
    pnDatas: TContainerPanel;
    LabelMes: TLabel;
    LabelDo: TLabel;
    LabelAte: TLabel;
    edAno: TEdit;
    dbeDataIni: TDBEdit;
    dbeDataFim: TDBEdit;
    cmbMes: TComboBox;
    edDo: TSpinEdit;
    edAte: TSpinEdit;
    rgTipo: TRadioGroup;
    rgDatas: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edAnoKeyPress(Sender: TObject; var Key: Char);
    procedure rgDatasClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    procedure Imprimir(p: Boolean);
  public
  end;

var
  frmRelatorioAniversarioCliente: TfrmRelatorioAniversarioCliente;

implementation

uses
  Funcoes, uConfiguraRelatorio, unPrevEnvelopeClientes, unPrevClienteAniver;

{$R *.dfm}

procedure TfrmRelatorioAniversarioCliente.FormCreate(Sender: TObject);
begin
  inherited;
  cdsSelecao.Open;
  //pnDiaMesAno.BevelOuter := bvNone;
  //pnDatas.BevelOuter := bvNone;
  rgDatasClick(Self);  
end;

procedure TfrmRelatorioAniversarioCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsSelecao.Close;
  inherited;
end;

procedure TfrmRelatorioAniversarioCliente.edAnoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TfrmRelatorioAniversarioCliente.rgDatasClick(Sender: TObject);
begin
  inherited;
  case rgDatas.ItemIndex of
    0:
    begin
      //EnableControlSubControls(pnDatas, False, -1);
      //EnableControlSubControls(pnDiaMesAno, True, -1);
    end;
    1:
    begin
      //EnableControlSubControls(pnDatas, True, -1);
      //EnableControlSubControls(pnDiaMesAno, False, -1);
    end;
  end;
end;

procedure TfrmRelatorioAniversarioCliente.Imprimir(p: Boolean);
begin
  case rgTipo.ItemIndex of
  0:
    begin
      with TfrmPrevEnvelopeCliente.Create(Self) do
      try
        with cdsPadrao do
        begin
          Close;
          if rgDatas.ItemIndex = 0 then  // dis mes ano
          begin
            CommandText := 'select '+
                             'NOME, '+
                             'DATA, '+
                             'ENDERECO, '+
                             'CIDADE, '+
                             'BAIRRO, '+
                             'CEP '+
                           'from VIEWENDERECOCLIENTES '+
                           'where extract(month from DATA) = :MES '+
                           'and extract(day from DATA) between :PDIAINI and :PDIAFIM '+
                           'order by DATA, NOME';
            Params.ParamByName('MES').AsInteger     := cmbMes.ItemIndex+1;
            Params.ParamByName('PDIAINI').AsInteger := StrToIntDef(edDo.Text, 1);
            Params.ParamByName('PDIAFIM').AsInteger := StrToIntDef(edAte.Text, 30);
            //Params.ParamByName('PANO').AsInteger := StrToIntDef(edAno.Text, YearOf(Date));
          end
          else if rgDatas.ItemIndex = 1 then   // data inicial e final
          begin
            CommandText := 'select '+
                             'NOME, '+
                             'DATA, '+
                             'ENDERECO, '+
                             'CIDADE, '+
                             'BAIRRO, '+
                             'CEP '+
                           'from VIEWENDERECOCLIENTES '+
                           'where DATA between :PDINI and :PDFIM '+
                           'order by DATA, NOME';
            Params.ParamByName('PDINI').AsDate := cdsSelecaoDATAINI.AsDateTime;
            Params.ParamByName('PDFIM').AsDate := cdsSelecaoDATAFIM.AsDateTime;
          end;
          Open;
          //ShowMessage(IntToStr(RecordCount));
        end;
        PrintIfNotEmptyRL(rrEnvelope);
      finally
        Free;
      end;
    end;
  1:
    begin
      with TfrmPrevClientesAniver.Create(Self) do
      try
        with cdsPadrao do
        begin
          Close;
          Params.ParamByName('PTIPO').AsInteger   := rgDatas.ItemIndex;
          Params.ParamByName('PDIAINI').AsInteger := StrToIntDef(edDo.Text, 1);
          Params.ParamByName('PDIAFIM').AsInteger := StrToIntDef(edAte.Text, 30);
          Params.ParamByName('PMES').AsInteger    := cmbMes.ItemIndex+1;
          Params.ParamByName('PANO').AsInteger    := -1;//StrToIntDef(edAno.Text, YearOf(Date));
          Params.ParamByName('PDATA1').AsDate     := cdsSelecaoDATAINI.AsDateTime;
          Params.ParamByName('PDATA2').AsDate     := cdsSelecaoDATAFIM.AsDateTime;
          Open;
        end;
        PrintIfNotEmptyRL(rrPadrao);
      finally
        cdsPadrao.Close;
        Free;
      end;
    end;
  end;
end;

procedure TfrmRelatorioAniversarioCliente.btnVisualizarClick(
  Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

procedure TfrmRelatorioAniversarioCliente.btnImprimirClick(
  Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

initialization
  RegisterClass(TfrmRelatorioAniversarioCliente);
finalization
  UnRegisterClass(TfrmRelatorioAniversarioCliente);
end.
