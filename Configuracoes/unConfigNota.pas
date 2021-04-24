unit unConfigNota;

interface

uses
   Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  SqlDb, memds, 
  Grids, DBGrids, ConstPadrao, FMTBcd;

type
  TfrmConfigNota = class(TfrmPadrao)
    sqldPadrao: TSQLQuery;
    dspPadrao: TComponent;
    cdsPadrao: TMemDataSet;
    sqldPadraoCODIGO: TIntegerField;
    sqldPadraoCAMPO: TStringField;
    sqldPadraoLAYOUT: TStringField;
    sqldPadraoREFERENCIA: TStringField;
    sqldPadraoTIPO: TStringField;
    sqldPadraoLINHA: TIntegerField;
    sqldPadraoCOLUNA: TIntegerField;
    sqldPadraoIMPRIMIR: TStringField;
    cdsPadraoCODIGO: TIntegerField;
    cdsPadraoCAMPO: TStringField;
    cdsPadraoLAYOUT: TStringField;
    cdsPadraoREFERENCIA: TStringField;
    cdsPadraoTIPO: TStringField;
    cdsPadraoLINHA: TIntegerField;
    cdsPadraoCOLUNA: TIntegerField;
    cdsPadraoIMPRIMIR: TStringField;
    btnGrade: TSpeedButton;
    dbgrdCampos: TDBGrid;
    pmMenuGrid: TPopupMenu;
    miAlterarP: TMenuItem;
    miExcluirP: TMenuItem;
    N5: TMenuItem;
    miSearchP: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
  protected
  public
  end;

var
  frmConfigNota: TfrmConfigNota;

implementation

uses Funcoes, unConfigNotaMan;

{$R *.dfm}

procedure TfrmConfigNota.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_CONFIGNOTA;
  DisplayLabels := DL_CONFIGNOTA;
  aCaption := 'ConfigNota';

  actPrint.Visible := False;
  actPost.Visible  := False;
  actCancelUpdates.Visible := False;
end;

procedure TfrmConfigNota.actInsertExecute(Sender: TObject);
begin
  frmConfigNotaMan := TfrmConfigNotaMan.Create(Self);
  frmConfigNotaMan.IdCampo := -1;
  frmConfigNotaMan.ShowModal;
end;

procedure TfrmConfigNota.actEditExecute(Sender: TObject);
begin
  inherited;
  frmConfigNotaMan := TfrmConfigNotaMan.Create(Self);
  frmConfigNotaMan.IdCampo := cdsPadraoCODIGO.AsInteger;
  frmConfigNotaMan.ShowModal;
end;


initialization
  RegisterClass(TfrmConfigNota);
finalization
  UnRegisterClass(TfrmConfigNota);
end.
