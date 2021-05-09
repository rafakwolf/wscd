unit unEtiqueta;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ComCtrls, DBCtrls, ZDataset, ZSqlUpdate, FMTBcd;

type

  { TfrmEtiqueta }

  TfrmEtiqueta = class(TfrmPadrao)
    LabelEtiqueta: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    LabelMedida: TLabel;
    Label1: TLabel;
    dbEtiqueta: TDBEdit;
    dbAlturaFolha: TDBEdit;
    dbLarguraFolha: TDBEdit;
    dbMargemSuperior: TDBEdit;
    dbMargemEsquerda: TDBEdit;
    dbEtqColuna: TDBEdit;
    dbAlturaEtq: TDBEdit;
    dbLarguraEtq: TDBEdit;
    dbDistVert: TDBEdit;
    dbDistHoriz: TDBEdit;
    dbNumeroLinhas: TDBEdit;
    gbImgMedidas: TGroupBox;
    iEtiqueta: TImage;
    ZQuery1: TZQuery;
    ZUpdateSQL1: TZUpdateSQL;
    procedure FormCreate(Sender: TObject);
  private
  public

  end;

var
  frmEtiqueta: TfrmEtiqueta;

implementation

uses Funcoes, ConstPadrao, VarGlobal;

{$R *.dfm}

procedure TfrmEtiqueta.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_ETQ;
  DisplayLabels := DL_ETQ;
  aCaption := 'Etiquetas';
end;

initialization
  RegisterClass(TfrmEtiqueta);
finalization
  UnRegisterClass(TfrmEtiqueta);

end.
