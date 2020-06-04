unit ufmImprimeEtiq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unDialogoRelatorioPadrao, DBClient, Provider, DB, RLTypes,
  SqlExpr, StdCtrls, Buttons, ExtCtrls, Spin, RLReport, Funcoes,
  VarGlobal, FMTBcd, IniFiles, uniLabel, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniMultiItem, uniComboBox, uniButton, uniBitBtn, uniSpinEdit,
  uniRadioGroup;

type
  TTipoEtiqueta = (teProduto, teCliente);
  TfrmImprimeEtiq = class(TfrmDialogoRelatorioPadrao)
    sqldEtiqueta: TSQLDataSet;
    dspEtiqueta: TDataSetProvider;
    cdsEtiqueta: TClientDataSet;
    sqldEtiquetaIDETIQUETA: TIntegerField;
    sqldEtiquetaETIQUETA: TStringField;
    sqldEtiquetaALTURAFOLHA: TFloatField;
    sqldEtiquetaLARGURAFOLHA: TFloatField;
    sqldEtiquetaMARGEMSUPERIOR: TFloatField;
    sqldEtiquetaMARGEMESQUERDA: TFloatField;
    sqldEtiquetaNUMEROLINHAS: TIntegerField;
    sqldEtiquetaNUMEROCOLUNAS: TIntegerField;
    sqldEtiquetaALTURAETIQUETA: TFloatField;
    sqldEtiquetaLARGURAETIQUETA: TFloatField;
    sqldEtiquetaDISTANCIAVERTICAL: TFloatField;
    sqldEtiquetaDISTANCIAHORIZONTAL: TFloatField;
    sqldEtiquetaDISTACOLVERTICAL: TFloatField;
    sqldEtiquetaDISTCOLHORIZ: TFloatField;
    cdsEtiquetaIDETIQUETA: TIntegerField;
    cdsEtiquetaETIQUETA: TStringField;
    cdsEtiquetaALTURAFOLHA: TFloatField;
    cdsEtiquetaLARGURAFOLHA: TFloatField;
    cdsEtiquetaMARGEMSUPERIOR: TFloatField;
    cdsEtiquetaMARGEMESQUERDA: TFloatField;
    cdsEtiquetaNUMEROLINHAS: TIntegerField;
    cdsEtiquetaNUMEROCOLUNAS: TIntegerField;
    cdsEtiquetaALTURAETIQUETA: TFloatField;
    cdsEtiquetaLARGURAETIQUETA: TFloatField;
    cdsEtiquetaDISTANCIAVERTICAL: TFloatField;
    cdsEtiquetaDISTANCIAHORIZONTAL: TFloatField;
    cdsEtiquetaDISTACOLVERTICAL: TFloatField;
    cdsEtiquetaDISTCOLHORIZ: TFloatField;
    lbModeloEtq: TUniLabel;
    lbLinhaIni: TUniLabel;
    lbColIni: TUniLabel;
    cbListaEtiq: TUniComboBox;
    seColunaIni: TUniSpinEdit;
    seLinhaIni: TUniSpinEdit;
    rgTraversal: TUniRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure seLinhaIniExit(Sender: TObject);
    procedure seColunaIniExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FReferencia: Integer;
    FSQL: String;
    FTipoEtq: TTipoEtiqueta;
    procedure PreencheComboModelos;
    procedure ConfiguraPagina(aSaida: Integer);
    procedure SetIdReferencia(const Value: Integer);
    procedure SetSQL(const Value: String);
    procedure SetTipoEtq(const Value: TTipoEtiqueta);
  public
    property IdReferencia: Integer read FReferencia write SetIdReferencia;
    property SQL: String read FSQL write SetSQL;
    property TipoEtq: TTipoEtiqueta read FTipoEtq write SetTipoEtq;
  end;

var
  frmImprimeEtiq: TfrmImprimeEtiq;

implementation

uses unPrevEtiquetaProduto, unPrevEtiquetaCliente;

{$R *.dfm}

procedure TfrmImprimeEtiq.PreencheComboModelos;
begin
  with cdsEtiqueta do
  begin
    Close;
    Open;
    First;
    if IsEmpty then
    begin
      MsgAviso('','Não existem etiquetas cadastradas.' + #13#10 +
        'Cadastre pelo menos um modelo de etiqueta e tente novamente.');
      Close;
    end;
    cbListaEtiq.Items.Clear;
    while not Eof do
    begin
      cbListaEtiq.Items.Add(cdsEtiquetaETIQUETA.AsString);
      Next;
    end;
  end;
end;

procedure TfrmImprimeEtiq.FormCreate(Sender: TObject);
var
  Indice: Integer;
  Ordem: string[1];
begin
  inherited;
  with TIniFile.Create(ExtractFilePath(ParamStr(0))+'cfb.ini') do try

    PreencheComboModelos;
    Indice := cbListaEtiq.Items.IndexOf(ReadString('Etiqueta', 'Nome',''));

    if (Indice >= 0) then
      cbListaEtiq.ItemIndex := Indice
    else
      cbListaEtiq.ItemIndex := 0;

    Ordem := ReadString('Etiqueta', 'Ordem','');
  finally
     free;
  end;

  if UpperCase(Ordem) = 'V' then
    rgTraversal.ItemIndex := 1
  else
    rgTraversal.ItemIndex := 0;


  SetDialogForm(Self);
  CentralizaForm(Self);  
end;

procedure TfrmImprimeEtiq.ConfiguraPagina(aSaida: Integer);
var
  MargemInferior: Real;
  Linhas, Skip: Integer;
begin
  try
    if (cbListaEtiq.ItemIndex = -1) then
    begin
      MsgAviso('','Escolha um modelo de Etiqueta');
      cbListaEtiq.SetFocus;
      Abort;
    end;

    with TIniFile.Create(ExtractFilePath(Paramstr(0))+'cfg.ini') do try

      WriteString('Etiqueta', 'Nome', cbListaEtiq.Text);
      Writestring('Etiqueta', 'Ordem',
        Copy(rgTraversal.Items[rgTraversal.ItemIndex], 1, 1));
    finally
      free;
    end;

    cdsEtiqueta.Open;
    cdsEtiqueta.Locate('ETIQUETA', cbListaEtiq.Text, []);

    { etiquetas de produtos }
    if TipoEtq = teProduto then

      with TfrmPrevEtiquetaProduto.Create(Self) do
      try
        rpEtiqueta.PageSetup.PaperSize := fpCustom;
        rpEtiqueta.PageSetup.PaperHeight := cdsEtiquetaALTURAFOLHA.AsCurrency;
        rpEtiqueta.PageSetup.PaperWidth := cdsEtiquetaLARGURAFOLHA.AsCurrency;
        rpEtiqueta.Margins.TopMargin := cdsEtiquetaMARGEMSUPERIOR.AsCurrency;
        rpEtiqueta.Margins.LeftMargin := cdsEtiquetaMARGEMESQUERDA.AsCurrency;

        Detail.RealBounds.UsedUnit := buMilimeters;
        Detail.ColCount := cdsEtiquetaNUMEROCOLUNAS.AsInteger;
        Detail.ColSpacing := cdsEtiquetaDISTCOLHORIZ.AsCurrency;
        Detail.Margins.BottomMargin := cdsEtiquetaDISTACOLVERTICAL.AsCurrency;
        Detail.ColWidth := cdsEtiquetaLARGURAETIQUETA.AsCurrency;
        Detail.Height := cdsEtiquetaALTURAETIQUETA.AsVariant * 10 - 154;

        Linhas := cdsEtiquetaNUMEROLINHAS.AsInteger + 1;
        MargemInferior := cdsEtiquetaALTURAFOLHA.AsCurrency -
                          (Linhas * cdsEtiquetaALTURAETIQUETA.AsCurrency);
        rpEtiqueta.Margins.BottomMargin := MargemInferior;

        NumLinhas := cdsEtiquetaNUMEROCOLUNAS.AsInteger;

        if rgTraversal.ItemIndex = 0 then
        begin
          Skip := ((seLinhaIni.Value - 1) * cdsEtiquetaNUMEROCOLUNAS.AsInteger) +
                  (seColunaIni.Value - 1) ;
          Detail.Organization := goInRows;
        end
        else
        begin
          Skip := ((seColunaIni.Value - 1) * cdsEtiquetaNUMEROLINHAS.AsInteger) +
                  (seLinhaIni.Value - 1) ;
          Detail.Organization := goInColumns;
        end;

        if Configuracao.BordaEtiquetaProd then
        begin
          Detail.Borders.DrawBottom := True;
          Detail.Borders.DrawLeft := True;
          Detail.Borders.DrawRight := True;
          Detail.Borders.DrawTop := True;
        end
        else
        begin
          Detail.Borders.DrawBottom := False;
          Detail.Borders.DrawLeft := False;
          Detail.Borders.DrawRight := False;
          Detail.Borders.DrawTop := False;
        end;

        cdsEtq.Close;
        cdsEtq.CommandText := FSQL;
        cdsEtq.Open;

        FSkip := Skip + 1;

        case aSaida of
          0: rpEtiqueta.Preview;
          1: rpEtiqueta.Print;
        end;
      finally
        cdsEtiqueta.Close;
        Free;
      end

    { etiquetas de clientes }
    else if TipoEtq = teCliente then

      with TfrmPrevEtiquetaCliente.Create(Self) do
      try
        rpEtiqueta.PageSetup.PaperSize := fpCustom;
        rpEtiqueta.PageSetup.PaperHeight := cdsEtiquetaALTURAFOLHA.AsCurrency;
        rpEtiqueta.PageSetup.PaperWidth := cdsEtiquetaLARGURAFOLHA.AsCurrency;
        rpEtiqueta.Margins.TopMargin := cdsEtiquetaMARGEMSUPERIOR.AsCurrency;
        rpEtiqueta.Margins.LeftMargin := cdsEtiquetaMARGEMESQUERDA.AsCurrency;

        Detail.RealBounds.UsedUnit := buMilimeters;
        Detail.ColCount := cdsEtiquetaNUMEROCOLUNAS.AsInteger;
        Detail.ColSpacing := cdsEtiquetaDISTCOLHORIZ.AsCurrency;
        Detail.Margins.BottomMargin := cdsEtiquetaDISTACOLVERTICAL.AsCurrency;
        Detail.ColWidth := cdsEtiquetaLARGURAETIQUETA.AsCurrency;
        Detail.Height := Trunc(cdsEtiquetaALTURAETIQUETA.AsVariant * 10 - 154);

        Linhas := cdsEtiquetaNUMEROLINHAS.AsInteger + 1;
        MargemInferior := cdsEtiquetaALTURAFOLHA.AsCurrency -
                          (Linhas * cdsEtiquetaALTURAETIQUETA.AsCurrency);
        rpEtiqueta.Margins.BottomMargin := MargemInferior;

        NumLinhas := cdsEtiquetaNUMEROCOLUNAS.AsInteger;

        if rgTraversal.ItemIndex = 0 then
        begin
          Skip := ((seLinhaIni.Value - 1) * cdsEtiquetaNUMEROCOLUNAS.AsInteger) +
                  (seColunaIni.Value - 1);
          Detail.Organization := goInRows;
        end
        else
        begin
          Skip := ((seColunaIni.Value - 1) * cdsEtiquetaNUMEROLINHAS.AsInteger) +
                  (seLinhaIni.Value - 1);
          Detail.Organization := goInColumns;
        end;      

        if Configuracao.BordaEtiquetaCli then
        begin
          Detail.Borders.DrawBottom := True;
          Detail.Borders.DrawLeft := True;
          Detail.Borders.DrawRight := True;
          Detail.Borders.DrawTop := True;
        end
        else
        begin
          Detail.Borders.DrawBottom := False;
          Detail.Borders.DrawLeft := False;
          Detail.Borders.DrawRight := False;
          Detail.Borders.DrawTop := False;
        end;

        cdsEtq.Close;
        cdsEtq.CommandText := FSQL;
        cdsEtq.Open;

        FSkip := Skip + 1;

        case aSaida of
          0: rpEtiqueta.Preview;
          1: rpEtiqueta.Print;
        end;
      finally
        cdsEtiqueta.Close;
        Free;
      end;
  finally
  end;
end;

procedure TfrmImprimeEtiq.btnImprimirClick(Sender: TObject);
begin
  inherited;
  ConfiguraPagina(1);
end;

procedure TfrmImprimeEtiq.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  ConfiguraPagina(0);
end;

procedure TfrmImprimeEtiq.SetIdReferencia(const Value: Integer);
begin
  FReferencia := Value;
end;

procedure TfrmImprimeEtiq.SetSQL(const Value: String);
begin
  FSQL := Value;
end;

procedure TfrmImprimeEtiq.SetTipoEtq(const Value: TTipoEtiqueta);
begin
  FTipoEtq := Value;
end;

procedure TfrmImprimeEtiq.seLinhaIniExit(Sender: TObject);
begin
  inherited;

  if not cdsEtiqueta.Active then
    cdsEtiqueta.Open;

  if seLinhaIni.Value < 1 then
    seLinhaIni.Value := 1;
  if seLinhaIni.Value > cdsEtiquetaNUMEROLINHAS.AsInteger then
    seLinhaIni.Value := cdsEtiquetaNUMEROLINHAS.AsInteger;
end;

procedure TfrmImprimeEtiq.seColunaIniExit(Sender: TObject);
begin
  inherited;

  if not cdsEtiqueta.Active then
    cdsEtiqueta.Open;

  if seColunaIni.Value < 1 then
    seColunaIni.Value := 1;
  if seColunaIni.Value > cdsEtiquetaNUMEROCOLUNAS.AsInteger then
    seColunaIni.Value := cdsEtiquetaNUMEROCOLUNAS.AsInteger;
end;

procedure TfrmImprimeEtiq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if cdsEtiqueta.Active then
    cdsEtiqueta.Close;
  inherited;
end;

initialization
  RegisterClass(TfrmImprimeEtiq);
finalization
  UnRegisterClass(TfrmImprimeEtiq);
end.
