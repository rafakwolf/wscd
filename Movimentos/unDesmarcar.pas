unit unDesmarcar;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, unSimplePadrao,  
     uniCheckBox;

type
  TfrmDesmarcar = class(TfrmSimplePadrao)
    Desmarcar: TSpeedButton;
    Cancel: TSpeedButton;
    Alterados: TCheckBox;
    Novos: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure DesmarcarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure DesmarcaNovos;
    procedure DesmarcaAlterados;
  public
 
  end;

var
  frmDesmarcar: TfrmDesmarcar;

implementation

uses Funcoes, VarGlobal, uDatabaseutils;

{$R *.dfm}

procedure TfrmDesmarcar.DesmarcaNovos;
begin
  UpdateSingleField('update PRODUTOS set NOVO = 0');
end;

procedure TfrmDesmarcar.DesmarcaAlterados;
begin
  UpdateSingleField('update PRODUTOS set ALTERADO = 0');
end;

procedure TfrmDesmarcar.CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDesmarcar.DesmarcarClick(Sender: TObject);
begin
  if Novos.Checked then
  begin
    DesmarcaNovos;
    MsgAviso('Produtos Novos Desmarcados');
  end;

  if Alterados.Checked then
  begin
    DesmarcaAlterados;
    MsgAviso('Produtos Alterados Desmarcados');
  end;
end;
 
procedure TfrmDesmarcar.FormCreate(Sender: TObject);
begin
  SetDialogForm(Self);
end;

procedure TfrmDesmarcar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmDesmarcar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

initialization
  RegisterClass(TfrmDesmarcar);
finalization
  UnRegisterClass(TfrmDesmarcar);
end.
