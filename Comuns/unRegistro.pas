unit unRegistro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBClient, Provider, SqlExpr, Mask,
  DBCtrls,  FMTBcd;

type
  TfrmRegistro = class(TForm)
    imgCadeado: TImage;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    sqldSetSerial: TSQLDataSet;
    bvlLinha: TBevel;
    sqldEmpresa: TSQLDataSet;
    dspEmpresa: TDataSetProvider;
    cdsEmpresa: TClientDataSet;
    dsEmpresa: TDataSource;
    sqldEmpresaRAZASOCIAL: TStringField;
    sqldEmpresaCNPJ: TStringField;
    sqldEmpresaCEP: TStringField;
    cdsEmpresaRAZASOCIAL: TStringField;
    cdsEmpresaCNPJ: TStringField;
    cdsEmpresaCEP: TStringField;
    dbeNomeEmpresa: TDBEdit;
    dbeCnpj: TDBEdit;
    dbeCep: TDBEdit;
    grpSerial: TGroupBox;
    medtSerial: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
  private
    procedure GravaDados;
  public
    SerialPassou: Boolean;
    function GetSerial: string;
  end;

var
  frmRegistro: TfrmRegistro;

implementation

uses Funcoes, unDadosEmpresa;

{$R *.dfm}

procedure TfrmRegistro.FormShow(Sender: TObject);
begin
  cdsEmpresa.Open;
  if cdsEmpresa.IsEmpty then
    cdsEmpresa.Insert
  else
    cdsEmpresa.Edit;
  medtSerial.Text := GetSerial;
  SetFocusIfCan(medtSerial);  
end;

procedure TfrmRegistro.btnOkClick(Sender: TObject);
begin
  cdsEmpresa.ApplyUpdates(0);
  GravaDados;
  Close;
end;

procedure TfrmRegistro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmRegistro.GravaDados;
begin
  with sqldSetSerial do
  begin
    Close;
    Params.ParamByName('SERIAL').AsString := Trim(medtSerial.Text);
    Params.ParamByName('DATAVALIDADE').AsString :=
      Copy(Trim(medtSerial.Text), 1, Pos('-', medtSerial.Text)-1);
    ExecSQL;
  end;
end;

procedure TfrmRegistro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  //RetornoValidacao: TTipoValidacao;
  SimNao: Boolean;
  TextoParaValidacao: string;
begin
  SimNao := False;
  TextoParaValidacao := cdsEmpresaRAZASOCIAL.AsString+cdsEmpresaCNPJ.AsString+cdsEmpresaCEP.AsString;
 // RetornoValidacao := ValidaSerial(Trim(medtSerial.Text),TextoParaValidacao);
//
//  case RetornoValidacao of
//    tvSerialErrado, tvChaveErrada:
//    begin
//      if Application.MessageBox('A chave de liberação informada está incorreta '+
//        'ou os dados informados estão incorretos. '+#13+
//        'Deseja efetuar a correção agora?', 'Dados incorretos',
//        MB_YESNO or MB_ICONWARNING) = ID_YES then
//        SimNao := True
//      else
//        SimNao := False;
//    end;
//    tvExpirouPrazo:
//    begin
//      if Application.MessageBox('A chave de liberação do sistema está expirada.'+#13+
//        'O sistema poderá ser bloqueado a qualquer momento. Por favor entre em contato '+
//        'com o suporte para obter uma nova chave de liberação.'+#13+
//        'Deseja informar uma nova chave de liberação?', 'Chave expirada',
//        MB_YESNO or MB_ICONWARNING) = ID_YES then
//        SimNao := True
//      else
//        SimNao := False;
//    end;
//    tvBloqueioSistema:
//    begin
//      if Application.MessageBox('CHAVE DE LIBERAÇÃO EXPIRADA.'+#13+
//        'Seu sistema foi bloqueado pois sua chave de liberação expirou a mais de 3 dias. '+
//        'Por favor entre em contato com o suporte para obter uma nova chave de liberação.'+#13+
//        'Deseja informar uma nova chave de liberação?',
//        'Sistema bloqueado', MB_YESNO or MB_ICONERROR) = ID_YES then
//        SimNao := True
//      else
//        SimNao := False;
//    end;
//    tvPrazoMtoLongo:
//    begin
//      if Application.MessageBox('A chave de liberação informada está fora de um período válido. '+
//        'Verifique a data do seu computador e se a chave foi digitada corretamente.'+#13+
//        'Deseja informar uma nova chave de liberação?',
//        'Chave inválida', MB_YESNO or MB_ICONWARNING) = ID_YES then
//        SimNao := True
//      else
//        SimNao := False;
//    end;
//  end;
//
//  SerialPassou := (RetornoValidacao = tvValidacaoOk);
//
//  if not SerialPassou then
//  begin
//    if (not SerialPassou) and (SimNao) then
//    begin
//      SetFocusIfCan(medtSerial);
//      Abort;
//    end
//    else if (RetornoValidacao <> tvExpirouPrazo) then
//    begin
//      if Application.MessageBox(PChar('Não é possível utilizar o sistema sem informar uma chave de liberação válida. '+
//        'Para obter uma nova chave, entre em contato com o suporte. '+#13+
//        'Clique em OK para finalizar o sistema.'), 'Finalizando o sistema', MB_OKCANCEL or MB_ICONERROR) = ID_OK then
//      begin
//        Application.Terminate;
//        Exit;
//      end
//      else
//      begin
//        SetFocusIfCan(medtSerial);
//        Abort;
//      end;
//    end;
//  end;
//  if SerialPassou then
//    ChamaForm('TfrmDadosEmpresa', 'Dados da empresa', Self);
end;

procedure TfrmRegistro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsEmpresa.Close;
  Action := caFree;
end;

procedure TfrmRegistro.FormCreate(Sender: TObject);
begin
  CentralizaForm(Self);
end;

procedure TfrmRegistro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
    Key := Chr(0);
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);
  end;
end;

procedure TfrmRegistro.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

function TfrmRegistro.GetSerial: string;
begin
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := sqldEmpresa.SQLConnection;
    CommandText := 'select SERIAL from SISTEMA where IDSISTEMA = 1';
    Open;
    Result := Fields[0].AsString;
  finally
    Free;
  end;
end;

initialization
  RegisterClass(TfrmRegistro);
finalization
  UnRegisterClass(TfrmRegistro);
end.
