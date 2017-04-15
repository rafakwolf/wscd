unit unDialogoRelatorioPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, System.Rtti;

type
  TfrmDialogoRelatorioPadrao = class(TForm)
    pnButtons: TPanel;
    btnImprimir: TBitBtn;
    btnVisualizar: TBitBtn;
    btnSair: TBitBtn;
    dsPadrao: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure CarregaFitros;
  public
  end;

var
  frmDialogoRelatorioPadrao: TfrmDialogoRelatorioPadrao;

implementation

uses
  Funcoes,   uNotifyEventDispatcher, Vcl.DBCtrls;

{$R *.dfm}

procedure TfrmDialogoRelatorioPadrao.FormCreate(Sender: TObject);
begin
  ReordenaBotoes([btnImprimir, btnVisualizar, btnSair]);
  SetDialogForm(Self);
  CentralizaForm(Self);
end;

procedure TfrmDialogoRelatorioPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmDialogoRelatorioPadrao.btnImprimirClick(Sender: TObject);
begin
 // if not VerificaImpressora then
  //  Abort;
end;

procedure TfrmDialogoRelatorioPadrao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmDialogoRelatorioPadrao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (ActiveControl is TCustomMemo) or ((ActiveControl is TCustomCombo) and (TCustomCombo(ActiveControl).DroppedDown)) then
    Exit;

  if Key = #13 then
  begin
    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);
  end;
end;

procedure TfrmDialogoRelatorioPadrao.FormShow(Sender: TObject);
begin
  CarregaFitros;
end;

procedure TfrmDialogoRelatorioPadrao.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDialogoRelatorioPadrao.CarregaFitros;
var ctx: TRttiContext;
    info: TRttiType;
    method: TRttiMethod;
    I: Integer;
    m : TMethod;
begin
  ctx := TRttiContext.Create;
  try
    info := ctx.GetType(self.ClassType);

    for I := 0 to ComponentCount-1 do
    begin
      if Components[i] is TDBEdit then
      begin
        method := info.GetMethod( TDBEdit( Components[i] ).Name + 'ClickButton' );

        if Assigned(method) then
        begin
          //TDBEdit( Components[i] ).VisibleButton := True;

          m.Data := TDBEdit( Components[i] );
          m.Code := method.CodeAddress;

          //TDBEdit( Components[i] ).OnClickButton := TnotifyEvent(m);
        end;
      end;
    end;
  finally
    ctx.Free;
  end;
end;

end.
