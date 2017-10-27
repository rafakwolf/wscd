unit unMsgChaveLiberacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, uniGUIBaseClasses, uniGUIClasses,
  uniLabel, uniButton, uniBitBtn, uniCheckBox, uniImage, uniGuiForm;

type
  TfrmMsgChaveLiberacao = class(TUniForm)
    lblInfo: TUniLabel;
    btnOk: TUniBitBtn;
    chkExibir: TUniCheckBox;
    imgWarning: TUniImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
  public
  end;

var
  frmMsgChaveLiberacao: TfrmMsgChaveLiberacao;

implementation

uses Funcoes;

{$R *.dfm}

procedure TfrmMsgChaveLiberacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMsgChaveLiberacao.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMsgChaveLiberacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  WriteIniFile('MSG CHAVE', 'Mostrar', BoolToStr(chkExibir.Checked));
end;

initialization
  RegisterClass(TfrmMsgChaveLiberacao);
finalization
  UnRegisterClass(TfrmMsgChaveLiberacao);
end.
