unit unCommandoSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmCommandoSQL = class(TForm)
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    btnLimpar: TBitBtn;
    mmoSQL: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  public
    class function Execute(var SQLTextRetorno: string): Boolean;
  end;

var
  frmCommandoSQL: TfrmCommandoSQL;

implementation

uses Funcoes;

{$R *.dfm}

procedure TfrmCommandoSQL.FormCreate(Sender: TObject);
begin
  CentralizaForm(Self);
  mmoSQL.Lines.Clear;
  if FileExists(DiretorioSistema+'SQL.txt') then
    mmoSQL.Lines.Text := LeTxt(DiretorioSistema+'SQL.txt');
end;

class function TfrmCommandoSQL.Execute(
  var SQLTextRetorno: string): Boolean;
begin
  frmCommandoSQL := TfrmCommandoSQL.Create(Application);
  with frmCommandoSQL do
  try
    Result := ShowModal = mrOk;
    if Result then
      SQLTextRetorno := mmoSQL.Lines.Text
    else
      SQLTextRetorno := '';  
  finally
    FreeAndNil(frmCommandoSQL);
  end;
end;

procedure TfrmCommandoSQL.btnLimparClick(Sender: TObject);
begin
  mmoSQL.Lines.Clear;
  CriaTxt(DiretorioSistema+'SQL.txt', mmoSQL.Lines.Text);
end;

procedure TfrmCommandoSQL.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (Key = VK_RETURN) then
    btnOK.Click;
end;

end.
