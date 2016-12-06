unit unRenovaChave;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, StdCtrls, ExtCtrls, Buttons, 
  Mask, SqlExpr;

type
  TfrmRenovaChave = class(TfrmSimplePadrao)
    lbTitulo: TLabel;
    meDataAtual: TMaskEdit;
    grpRenovacao: TGroupBox;
    mmoInfo: TMemo;
    edChave: TLabeledEdit;
    btnRenovar: TBitBtn;
    tmrInfo: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tmrInfoTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRenovarClick(Sender: TObject);
  private
    function GetDataValidade: TDateTime;
    procedure GravaNovaChave(Chave: String);
    function GetSerial: String;
  public
  end;

var
  frmRenovaChave: TfrmRenovaChave;

implementation

uses Funcoes,  Validacao, VarGlobal;

{$R *.dfm}


function TfrmRenovaChave.GetDataValidade: TDateTime;
begin
  with TSQLDataSet.Create(Self) do
  try
    SQLConnection := GetConnection;
    Close;
    CommandText := 'select DATAVALIDADE from SISTEMA';
    Open;
    Result := DecriptData(FieldByName('DATAVALIDADE').AsString);
  finally
    Close;
    Free;
  end;
end;

procedure TfrmRenovaChave.GravaNovaChave(Chave: String);
begin
  with TSQLDataSet.Create(Self) do
  try
    SQLConnection := GetConnection;
    Close;
    CommandText := 'update SISTEMA set DATAVALIDADE = :DATAVALIDADE, ' +
                   'SERIAL = :SERIAL';
    Params.ParamByName('DATAVALIDADE').AsString :=
      Copy(Chave, 1, Pos('-', Chave) - 1);
    Params.ParamByName('SERIAL').AsString := Trim(Chave);
    ExecSQL;
  finally
    Free;
    meDataAtual.Text := FormatDateTime('dd/mm/yyyy', GetDataValidade);
    MsgAviso('Ok!!! Nova chave válida até '+meDataAtual.Text+'.');
  end;
  Close;
end;

procedure TfrmRenovaChave.FormCreate(Sender: TObject);
begin
  inherited;
  if ValidaSerial(GetSerial, Empresa.Nome+Empresa.Cnpj+Empresa.Cep) = tvExpirouPrazo then
    meDataAtual.Font.Color := clRed
  else
    meDataAtual.Font.Color := clBlue;
      
  meDataAtual.Text := FormatDateTime('dd/mm/yyyy', GetDataValidade);
  SetDialogForm(Self);
end;

procedure TfrmRenovaChave.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  RetornoValidacao: TTipoValidacao;
  SimNao: Boolean;
  TextoParaValidacao: string;
begin
  inherited;
  SimNao := False;
  TextoParaValidacao := Trim(Empresa.Nome+Empresa.Cnpj+Empresa.Cep);

  RetornoValidacao := ValidaSerial(Sistema.Serial, TextoParaValidacao);

  case RetornoValidacao of
    tvSerialErrado, tvChaveErrada:
    begin
      if Application.MessageBox('A chave de liberação informada é incorreta.'+#13+
        'Deseja corrijí-la ou informí-la?', 'Chave incorreta',
        MB_YESNO or MB_ICONWARNING) = ID_YES then
        SimNao := True
      else
        SimNao := False;
    end;
    tvExpirouPrazo:
    begin
      if Application.MessageBox('A chave de liberação do sistema está expirada.'+#13+
        'O sistema poderá ser bloqueado a qualquer momento. Por favor entre em contato '+
        'com o suporte para obter uma nova chave de liberação.'+#13+
        'Deseja informar uma nova chave de liberação?', 'Chave Expirada',
        MB_YESNO or MB_ICONWARNING) = ID_YES then
        SimNao := True
      else
        SimNao := False;
    end;
    tvBloqueioSistema:
    begin
      if Application.MessageBox('CHAVE DE LIBERAÇÃO EXPIRADA.'+#13+
        'Seu sistema foi bloqueado pois sua chave de liberação expirou a mais de 3 dias.'+
        'Por favor entre em contato com o suporte para obter uma nova chave de liberação.'+#13+
        'Deseja informar uma nova chave de liberação?',
        'Sistema bloqueado', MB_YESNO or MB_ICONERROR) = ID_YES then
        SimNao := True
      else
        SimNao := False;
    end;
    tvPrazoMtoLongo:
    begin
      if Application.MessageBox('A Chave de Liberação informada está fora de um período válido. '+
        'Verifique a data do seu computador e se a chave foi digitada corretamente.' + #13 +
        'Deseja informar uma nova chave de liberação?',
        'Chave inválida', MB_YESNO or MB_ICONWARNING) = ID_YES then
        SimNao := True
      else
        SimNao := False;
    end;
  end;
  if (RetornoValidacao <> tvValidacaoOk) then
  begin
    if (RetornoValidacao <> tvValidacaoOk) and (SimNao) then
    begin
      edChave.SetFocus;
      CanClose := False;
    end
    else if(RetornoValidacao <> tvExpirouPrazo)then
    begin
      if Application.MessageBox(PChar('Não é possível utilizar o sistema sem informar uma chave de liberação válida. '+
        'Para obter uma nova chave de liberação entre em contato com o suporte.' + #13 +
        'Clique em OK para finalizar o sistema.'), 'Finalizando o sistema', MB_OKCANCEL or MB_ICONERROR) = ID_OK then
      begin
        Application.Terminate;
        Exit;
      end
      else
      begin
        edChave.SetFocus;
        CanClose := False;
      end;
    end;
  end;
end;

function TfrmRenovaChave.GetSerial: String;
begin
  with TSQLDataSet.Create(Self) do
  try
    SQLConnection := GetConnection;
    Close;
    CommandText := 'select SERIAL from SISTEMA';
    Open;
    Result := Trim(FieldByName('SERIAL').AsString);
  finally
    Close;
    Free;
  end;
end;

procedure TfrmRenovaChave.tmrInfoTimer(Sender: TObject);
begin
  inherited;
  tmrInfo.Enabled := False;
  if not StrToBoolDef(ReadIniFile('MSG CHAVE', 'Mostrar'), False) then
    ChamaForm('TfrmMsgChaveLiberacao', 'Informação', Self);
end;

procedure TfrmRenovaChave.FormShow(Sender: TObject);
begin
  inherited;
  tmrInfo.Enabled := True;
end;

procedure TfrmRenovaChave.btnRenovarClick(Sender: TObject);
begin
  inherited;
  if edChave.Text <> '' then
    GravaNovaChave(edChave.Text)
  else
  begin
    if MsgSN('Nenhuma chave informada, deseja informa agora?') then
      edChave.SetFocus
    else
      Close;
  end;
end;

initialization
  RegisterClass(TfrmRenovaChave);
finalization
  UnRegisterClass(TfrmRenovaChave);

end.
