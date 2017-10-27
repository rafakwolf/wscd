unit unFoto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unSimplePadrao, StdCtrls, Buttons,
  ExtCtrls, uniGUIBaseClasses, uniGUIClasses, uniButton, uniBitBtn, uniGroupBox;

type
  TfrmFoto = class(TfrmSimplePadrao)
    btnOK: TUniBitBtn;
    btnCancel: TUniBitBtn;
    grpFoto: TUniGroupBox;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  public
    class function Load(NomeFoto: string; var FotoResult: String): Boolean;
  end;

var
  frmFoto: TfrmFoto;

implementation

uses Funcoes;

{$R *.dfm}

class function TfrmFoto.Load(NomeFoto: string; var FotoResult: String): Boolean;
begin
  frmFoto := TfrmFoto.Create(Application);
  with frmFoto do
  try
    //cmrWeb.FichierImage := GetEnvironmentVariable('tmp')+'\'+NomeFoto+'.bmp';
    Result := (ShowModal = mrOK);

    if Result then
    begin
      //cmrWeb.CaptureImageDisque;
      //BmpToJpeg(cmrWeb.FichierImage);
      //FotoResult := ChangeFileExt(cmrWeb.FichierImage, '.jpg');
    end
    else
      FotoResult := '';
  finally
    FreeAndNil(frmFoto);
  end;
end;

procedure TfrmFoto.FormShow(Sender: TObject);
begin
  try
    try
      //cmrWeb.Actif := True;
    except
      MsgErro('Ocorreu um erro ao tentar ativar a Web-cam.'+#13+
        'Certifique-se de que a câmera esteja conectada e corretamente configurada.');
    end;
  finally
  end;
end;

procedure TfrmFoto.FormDestroy(Sender: TObject);
begin
  inherited;
  //cmrWeb.Actif := False;
end;

end.
