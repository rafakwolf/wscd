unit unDialogoRelatorioPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, System.Rtti, UniGuiForm,
  uniGUIBaseClasses, uniGUIClasses, uniPanel, uniButton, uniBitBtn;

type
  TfrmDialogoRelatorioPadrao = class(TUniForm)
    dsPadrao: TDataSource;
    pnButtons: TUniContainerPanel;
    btnImprimir: TUniBitBtn;
    btnVisualizar: TUniBitBtn;
    btnSair: TUniBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
  private
  public
  end;

var
  frmDialogoRelatorioPadrao: TfrmDialogoRelatorioPadrao;

implementation

uses
  Funcoes, uNotifyEventDispatcher, Vcl.DBCtrls;

{$R *.dfm}

procedure TfrmDialogoRelatorioPadrao.FormCreate(Sender: TObject);
begin
  ReordenaBotoes([btnImprimir, btnVisualizar, btnSair]);
end;

procedure TfrmDialogoRelatorioPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmDialogoRelatorioPadrao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmDialogoRelatorioPadrao.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
