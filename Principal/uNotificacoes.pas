unit uNotificacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, unSimplePadrao, uniGUIBaseClasses, uniGUIClasses,
  uniButton, uniBitBtn, uniSpeedButton, uniCheckBox, uniMultiItem, uniListBox;

type
  TfrmNotificacoes = class(TfrmSimplePadrao)
    Desmarcar: TUniSpeedButton;
    lbxNotificacoes: TUniListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure DesmarcaNovos;
    procedure DesmarcaAlterados;
  public
 
  end;

var
  frmNotificacoes: TfrmNotificacoes;

implementation

uses Funcoes, VarGlobal, uDatabaseutils;

{$R *.dfm}

procedure TfrmNotificacoes.DesmarcaNovos;
begin
  UpdateSingleField('update PRODUTOS set NOVO = 0');
end;

procedure TfrmNotificacoes.DesmarcaAlterados;
begin
  UpdateSingleField('update PRODUTOS set ALTERADO = 0');
end;

procedure TfrmNotificacoes.FormCreate(Sender: TObject);
begin
  SetDialogForm(Self);
end;

procedure TfrmNotificacoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmNotificacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

initialization
  RegisterClass(TfrmNotificacoes);
finalization
  UnRegisterClass(TfrmNotificacoes);
end.
