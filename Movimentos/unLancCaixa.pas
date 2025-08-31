unit unLancCaixa;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,   Buttons, StdCtrls,  DBCtrls, DB, ComCtrls,
  memds,  SqlDb, FMTBcd, VarGlobal, ZDataset;

type

  { TfrmLancCaixa }

  TfrmLancCaixa = class(TForm)
    DataSource1: TDataSource;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    dspCaixas: TComponent;
    dsPadrao: TDataSource;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    btnNovo: TBitBtn;
    zPadrao: TZQuery;
    zCaixas: TZQuery;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zPadraoAfterInsert(DataSet: TDataSet);
  private
    FIdCaixa: Integer;
    function CamposNulos: Boolean;
    procedure SetIdCaixa(AValue: Integer);
  public
    property IdCaixa: Integer read FIdCaixa write SetIdCaixa default 0;
  end;

var
  frmLancCaixa: TfrmLancCaixa;

implementation

uses unCaixa, Funcoes, unModeloConsulta, ConstPadrao;

{$R *.dfm}

procedure TfrmLancCaixa.btnOkClick(Sender: TObject);
begin
  if CamposNulos then
  begin
    MsgCuidado('','Preencha todos os campos');
    Exit;
  end
  else
  begin
    zPadrao.ApplyUpdates;
  end;
end;

procedure TfrmLancCaixa.btnCancelClick(Sender: TObject);
begin
  zPadrao.CancelUpdates;
  Close;
end;
 
procedure TfrmLancCaixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if zPadrao.State in [dsInsert, dsEdit] then
    zPadrao.CancelUpdates;

  zPadrao.Close;
end;

function TfrmLancCaixa.CamposNulos: Boolean;
begin
  Result := False;
  if (DBComboBox1.ItemIndex = -1) or
     (DBEdit1.Text = '') or
     (DBEdit2.Text = '') then
  begin
    Result := True;
  end;
end;

procedure TfrmLancCaixa.SetIdCaixa(AValue: Integer);
begin
  if FIdCaixa=AValue then Exit;
  FIdCaixa:=AValue;
end;

procedure TfrmLancCaixa.btnNovoClick(Sender: TObject);
begin
 zPadrao.Insert;
end;

procedure TfrmLancCaixa.FormCreate(Sender: TObject);
begin
   zCaixas.Open;
  zPadrao.Open;
  CentralizaForm(Self);
end;

procedure TfrmLancCaixa.dsPadraoStateChange(Sender: TObject);
begin
  btnOk.Enabled := dsPadrao.DataSet.State in [dsEdit, dsInsert];
  btnNovo.Enabled := dsPadrao.DataSet.State in [dsBrowse];
end;

procedure TfrmLancCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmLancCaixa.zPadraoAfterInsert(DataSet: TDataSet);
begin
  zPadrao.fieldByName('DATA_LANC').AsDateTime := Date;
  zPadrao.fieldByName('EXCLUIR').AsString := 'N';
end;


initialization
  RegisterClass(TfrmLancCaixa);
finalization
  UnRegisterClass(TfrmLancCaixa);
end.
