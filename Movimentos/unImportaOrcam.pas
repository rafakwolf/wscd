unit unImportaOrcam;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ComCtrls, 
  memds,  SqlDb, FMTBcd, LCLType;

type
  TDatasetField = TDataset;
  TfrmImportaOrcam = class(TForm)
    Progresso: TProgressBar;
    sqldVenda: TSQLQuery;
    sqldItemVenda: TSQLQuery;
    dtOrcam: TComponent;
    cdsOrcam: TMemDataSet;
    cdsOrcamCODIGO: TIntegerField;
    cdsOrcamCODCLIENTE: TIntegerField;
    cdsOrcamNOMECLIENTE: TStringField;
    cdsOrcamDATA: TDateField;
    cdsOrcamOBS: TStringField;
    cdsOrcamSTATUS: TStringField;
    cdsOrcamCONCLUIDO: TStringField;
    cdsOrcamsqlDetOrcam: TDataset;
    cdsDetOrcam: TMemDataSet;
    cdsDetOrcamCODIGO: TIntegerField;
    cdsDetOrcamCODPRODUTO: TIntegerField;
    cdsDetOrcamNOMEPRODUTO: TStringField;
    dsLink: TDataSource;
    sqlOrcam: TSQLQuery;
    sqlDetOrcam: TSQLQuery;
    dsOrcam: TDataSource;
    dsDetOrcam: TDataSource;
    sqlOrcamCODIGO: TIntegerField;
    sqlOrcamCODCLIENTE: TIntegerField;
    sqlOrcamNOMECLIENTE: TStringField;
    sqlOrcamDATA: TDateField;
    sqlOrcamOBS: TStringField;
    sqlOrcamTOTAL: TFMTBCDField;
    sqlOrcamITENS: TIntegerField;
    sqlOrcamSTATUS: TStringField;
    sqlOrcamCONCLUIDO: TStringField;
    sqlDetOrcamCODIGO: TIntegerField;
    sqlDetOrcamCODPRODUTO: TIntegerField;
    sqlDetOrcamNOMEPRODUTO: TStringField;
    sqlDetOrcamQTDE: TIntegerField;
    sqlDetOrcamCUSTO: TFMTBCDField;
    sqlDetOrcamVENDA: TFMTBCDField;
    sqlDetOrcamDESCTO: TFMTBCDField;
    sqlDetOrcamVALORDESCTO: TFMTBCDField;
    sqlDetOrcamTOTAL: TFMTBCDField;
    cdsOrcamTOTAL: TFMTBCDField;
    cdsOrcamITENS: TIntegerField;
    cdsDetOrcamQTDE: TIntegerField;
    cdsDetOrcamCUSTO: TFMTBCDField;
    cdsDetOrcamVENDA: TFMTBCDField;
    cdsDetOrcamDESCTO: TFMTBCDField;
    cdsDetOrcamVALORDESCTO: TFMTBCDField;
    cdsDetOrcamTOTAL: TFMTBCDField;
    sqlOrcamIDVENDEDOR: TIntegerField;
    cdsOrcamIDVENDEDOR: TIntegerField;
    lbCampo: TLabel;
    lbDados: TLabel;
    btnBuscar: TBitBtn;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    grpStatus: TGroupBox;
    lbStatus: TLabel;
    cmbCampo: TComboBox;
    edtPesquisa: TEdit;
    Grade: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsOrcamAfterScroll(DataSet: TDataSet);
  private
    procedure ImportaOrcamento;
    procedure EscreveExportado;  
  public
  end;

var
  frmImportaOrcam: TfrmImportaOrcam;

implementation

uses Funcoes, VarGlobal, uDatabaseutils;

{$R *.dfm}

procedure TfrmImportaOrcam.EscreveExportado;
begin
  cdsOrcam.Edit;
  cdsOrcamSTATUS.AsString := 'E';
  //cdsOrcam.ApplyUpdates(0);
end;

procedure TfrmImportaOrcam.ImportaOrcamento;
var
  RecNo, CalcProg, NRec, ID: Integer;
begin
  try
    try
      Progresso.Visible := True;
      with sqldVenda do
      begin
        Close;
        ID := GetProximoID('VENDA', 'CODIGO', GetConnection);
        Params.ParamByName('ID').AsInteger         := ID;
        Params.ParamByName('IDCLIENTE').AsInteger  := cdsOrcamCODCLIENTE.AsInteger;
        Params.ParamByName('IDVEND').AsInteger     := cdsOrcamIDVENDEDOR.AsInteger;
        Params.ParamByName('DATA').AsDate          := cdsOrcamDATA.AsDateTime;
        Params.ParamByName('OBS').AsString         := cdsOrcamOBS.AsString;
        Params.ParamByName('TOTALDECONTO').AsFloat := 0;
        Params.ParamByName('TOTAL').AsFloat        := cdsOrcamTOTAL.AsFloat;
        Params.ParamByName('CONC').AsString        := 'N';
        Params.ParamByName('BAIXADO').AsString     := 'N';
        Params.ParamByName('CANCEL').AsString      := 'N';
        ExecSQL;
      end;

      Recno := cdsDetOrcam.RecordCount;
      NRec := 0;

      // items
      cdsDetOrcam.First;
      while not cdsDetOrcam.Eof do
      begin
         Inc(NRec);
         with sqldItemVenda do
         begin
           Close;
           Params.ParamByName('ID').AsInteger        := ID;
           Params.ParamByName('IDPRODUTO').AsInteger := cdsDetOrcamCODPRODUTO.AsInteger;
           Params.ParamByName('QTD').AsFloat         := cdsDetOrcamQTDE.AsFloat;
           Params.ParamByName('CUSTO').AsFloat       := cdsDetOrcamCUSTO.AsFloat;
           Params.ParamByName('PRECOVENDA').AsFloat  := cdsDetOrcamVENDA.AsFloat;
           Params.ParamByName('DESCTO').AsFloat      := cdsDetOrcamDESCTO.AsFloat;
           Params.ParamByName('VLRDESC').AsFloat     := cdsDetOrcamVALORDESCTO.AsFloat;
           Params.ParamByName('TOTALITEM').AsFloat   := cdsDetOrcamTOTAL.AsFloat;
           Params.ParamByName('COMISSAO').AsFloat    := 0;
           Params.ParamByName('VLRCOM').AsFloat      := 0;
           ExecSQL;
         end;
         cdsDetOrcam.Next;
         CalcProg := Trunc(NRec * 100 / Recno);
         Progresso.Position := CalcProg;
      end;
    except
      raise Exception.Create('Erro impotando or�amento');
    end;
  finally
    Progresso.Visible := False;
  end;
  EscreveExportado;
  MsgAviso('Or�amento importado com sucesso!');
  Close;
end;

procedure TfrmImportaOrcam.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportaOrcam.btnBuscarClick(Sender: TObject);
var
  AuxInt: Integer;
  AuxDate: TDateTime;
begin
  if edtPesquisa.Text = '' then
  begin
    cdsOrcam.Close;
    cdsOrcam.Filtered := False;
    cdsOrcam.Open;
    Exit;
  end;

  case cmbCampo.ItemIndex of
    0, 1:
    begin
      if not TryStrToInt(edtPesquisa.Text, AuxInt) then
      begin
        MsgErro('Valor para pesquisa inv�lido');
        Exit;
      end;
    end;
    2:
    begin
      if not TryStrToDate(edtPesquisa.Text, AuxDate) then
      begin
        MsgErro('�sta n�o � uma data v�lida');
        Exit;
      end;
    end;
  end;

  cdsOrcam.Filtered := False;
  case cmbCampo.ItemIndex of
    0: cdsOrcam.Filter := 'CODIGO = ' + QuotedStr(edtPesquisa.Text);
    1: cdsOrcam.Filter := 'CODCLIENTE = ' + QuotedStr(edtPesquisa.Text);
    2: cdsOrcam.Filter := 'DATA = ' + QuotedStr(edtPesquisa.Text);
  end;
  cdsOrcam.Filtered := True;  
end;

procedure TfrmImportaOrcam.btnOkClick(Sender: TObject);
begin
  if cdsOrcamSTATUS.AsString = 'P' then
  begin
    if cdsOrcamCONCLUIDO.AsString = 'S' then
      ImportaOrcamento                                    
    else
    begin
      MsgAviso('Or�amento n�o conclu�do, n�o poder� ser importado.');
      Exit;
    end;
  end
  else
    MsgAviso('Este or�amento j� foi importado');
end;

procedure TfrmImportaOrcam.FormCreate(Sender: TObject);
begin
  CentralizaForm(Self);
  cdsOrcam.Open;
  Progresso.Position := 0;
  cmbCampo.ItemIndex := 0;
end;

procedure TfrmImportaOrcam.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmImportaOrcam.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmImportaOrcam.cdsOrcamAfterScroll(DataSet: TDataSet);
begin
  if cdsOrcamSTATUS.AsString = 'P' then
    lbStatus.Caption := 'Pendente'
  else if cdsOrcamSTATUS.AsString = 'E' then
    lbStatus.Caption := 'Exportado';  
end;

initialization
  RegisterClass(TfrmImportaOrcam);
finalization
  UnRegisterClass(TfrmImportaOrcam);
end.
