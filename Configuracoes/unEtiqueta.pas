unit unEtiqueta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, DBClient, Provider, SqlExpr, Spin, Mask,
  DBCtrls, FMTBcd, System.Actions, uniLabel, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniPanel, uniGUIBaseClasses, uniStatusBar,
  uniImage, uniEdit, uniDBEdit, uniGroupBox;

type
  TfrmEtiqueta = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    sqldPadraoIDETIQUETA: TIntegerField;
    sqldPadraoETIQUETA: TStringField;
    sqldPadraoALTURAFOLHA: TFloatField;
    sqldPadraoLARGURAFOLHA: TFloatField;
    sqldPadraoMARGEMSUPERIOR: TFloatField;
    sqldPadraoMARGEMESQUERDA: TFloatField;
    sqldPadraoNUMEROLINHAS: TIntegerField;
    sqldPadraoNUMEROCOLUNAS: TIntegerField;
    sqldPadraoALTURAETIQUETA: TFloatField;
    sqldPadraoLARGURAETIQUETA: TFloatField;
    sqldPadraoDISTANCIAVERTICAL: TFloatField;
    sqldPadraoDISTANCIAHORIZONTAL: TFloatField;
    sqldPadraoDISTACOLVERTICAL: TFloatField;
    sqldPadraoDISTCOLHORIZ: TFloatField;
    cdsPadraoIDETIQUETA: TIntegerField;
    cdsPadraoETIQUETA: TStringField;
    cdsPadraoALTURAFOLHA: TFloatField;
    cdsPadraoLARGURAFOLHA: TFloatField;
    cdsPadraoMARGEMSUPERIOR: TFloatField;
    cdsPadraoMARGEMESQUERDA: TFloatField;
    cdsPadraoNUMEROLINHAS: TIntegerField;
    cdsPadraoNUMEROCOLUNAS: TIntegerField;
    cdsPadraoALTURAETIQUETA: TFloatField;
    cdsPadraoLARGURAETIQUETA: TFloatField;
    cdsPadraoDISTANCIAVERTICAL: TFloatField;
    cdsPadraoDISTANCIAHORIZONTAL: TFloatField;
    cdsPadraoDISTACOLVERTICAL: TFloatField;
    cdsPadraoDISTCOLHORIZ: TFloatField;
    LabelEtiqueta: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label9: TUniLabel;
    Label10: TUniLabel;
    Label11: TUniLabel;
    LabelMedida: TUniLabel;
    Label1: TUniLabel;
    dbEtiqueta: TUniDBEdit;
    dbAlturaFolha: TUniDBEdit;
    dbLarguraFolha: TUniDBEdit;
    dbMargemSuperior: TUniDBEdit;
    dbMargemEsquerda: TUniDBEdit;
    dbEtqColuna: TUniDBEdit;
    dbAlturaEtq: TUniDBEdit;
    dbLarguraEtq: TUniDBEdit;
    dbDistVert: TUniDBEdit;
    dbDistHoriz: TUniDBEdit;
    dbNumeroLinhas: TUniDBEdit;
    gbImgMedidas: TUniGroupBox;
    iEtiqueta: TUniImage;
    procedure SpinButton1DownClick(Sender: TObject);
    procedure SpinButton1UpClick(Sender: TObject);
    procedure cdsPadraoALTURAETIQUETAChange(Sender: TField);
    procedure cdsPadraoDISTACOLVERTICALChange(Sender: TField);
    procedure cdsPadraoLARGURAETIQUETAChange(Sender: TField);
    procedure cdsPadraoDISTANCIAHORIZONTALChange(Sender: TField);
    procedure cdsPadraoBeforeApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    procedure CheckLarguraEtiqueta;
    procedure CheckAlturaEtiqueta;
  public

  end;

var
  frmEtiqueta: TfrmEtiqueta;

implementation

uses Funcoes, ConstPadrao, VarGlobal;

{$R *.dfm}

procedure TfrmEtiqueta.CheckAlturaEtiqueta;
begin
  if cdsPadraoDISTANCIAHORIZONTAL.AsCurrency < cdsPadraoLARGURAETIQUETA.AsCurrency then
    cdsPadraoDISTANCIAHORIZONTAL.AsCurrency := cdsPadraoLARGURAETIQUETA.AsCurrency;
end;

procedure TfrmEtiqueta.CheckLarguraEtiqueta;
begin
  if cdsPadraoDISTANCIAVERTICAL.AsCurrency < cdsPadraoALTURAETIQUETA.AsCurrency then
    cdsPadraoDISTANCIAVERTICAL.AsCurrency := cdsPadraoALTURAETIQUETA.AsCurrency;
end;

procedure TfrmEtiqueta.SpinButton1DownClick(Sender: TObject);
begin
  inherited;
  if cdsPadrao.State in dsEditModes then
  begin
    TDBEdit(TSpinButton(Sender).FocusControl).Field.AsCurrency :=
      TDBEdit(TSpinButton(Sender).FocusControl).Field.AsCurrency - 1;
  end;
end;

procedure TfrmEtiqueta.SpinButton1UpClick(Sender: TObject);
begin
  inherited;
  if cdsPadrao.State in dsEditModes then
  begin
    TDBEdit(TSpinButton(Sender).FocusControl).Field.AsCurrency :=
      TDBEdit(TSpinButton(Sender).FocusControl).Field.AsCurrency + 1;
  end;
end;

procedure TfrmEtiqueta.cdsPadraoALTURAETIQUETAChange(Sender: TField);
begin
  inherited;
  CheckAlturaEtiqueta;
end;

procedure TfrmEtiqueta.cdsPadraoDISTACOLVERTICALChange(Sender: TField);
begin
  inherited;
  CheckAlturaEtiqueta;
end;

procedure TfrmEtiqueta.cdsPadraoLARGURAETIQUETAChange(Sender: TField);
begin
  inherited;
  CheckLarguraEtiqueta;
end;

procedure TfrmEtiqueta.cdsPadraoDISTANCIAHORIZONTALChange(Sender: TField);
begin
  inherited;
  CheckLarguraEtiqueta;
end;

procedure TfrmEtiqueta.cdsPadraoBeforeApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  if ((cdsPadraoMARGEMESQUERDA.AsCurrency +
      (cdsPadraoLARGURAETIQUETA.AsCurrency * cdsPadraoNUMEROCOLUNAS.AsInteger) +
      ((cdsPadraoDISTANCIAHORIZONTAL.AsCurrency - cdsPadraoLARGURAETIQUETA.AsCurrency) *
         (cdsPadraoNUMEROCOLUNAS.AsInteger - 1))) > cdsPadraoLARGURAFOLHA.AsCurrency) then
  begin
    MsgCuidado('As medidas cadastradas não cabem na largura da folha. Verifque.');
    Abort;
  end;

  if ((cdsPadraoMARGEMSUPERIOR.AsCurrency +
      (cdsPadraoALTURAETIQUETA.AsCurrency * cdsPadraoNUMEROLINHAS.AsInteger) +
      ((cdsPadraoDISTANCIAVERTICAL.AsCurrency - cdsPadraoALTURAETIQUETA.AsCurrency) *
        (cdsPadraoNUMEROLINHAS.AsInteger - 1))) > cdsPadraoALTURAFOLHA.AsCurrency) then
  begin
    MsgCuidado('As medidas cadastradas não cabem na altura da folha. Verifque.');
    Abort;
  end;
end;

procedure TfrmEtiqueta.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Incrementa('ETIQUETA', cdsPadraoIDETIQUETA, GetConnection);
  SetFocusIfCan(dbEtiqueta);
end;

procedure TfrmEtiqueta.FormCreate(Sender: TObject);
begin
  inherited;
  FieldNames := FN_ETQ;
  DisplayLabels := DL_ETQ;
  aCaption := 'Etiquetas';
  //miRelatorios.Visible := False;
end;

initialization
  RegisterClass(TfrmEtiqueta);
finalization
  UnRegisterClass(TfrmEtiqueta);

end.
