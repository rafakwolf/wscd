unit unConfigNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  SqlExpr, DBClient, Datasnap.Provider,
  Grids, DBGrids, ConstPadrao, FMTBcd, System.Actions;

type
  TfrmConfigNota = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
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
    dbgrdCampos: TDBGrid;
    pmMenuGrid: TPopupMenu;
    miAlterarP: TMenuItem;
    miExcluirP: TMenuItem;
    N5: TMenuItem;
    miSearchP: TMenuItem;
    sbxNota: TScrollBox;
    pnlFundoScroll: TPanel;
    imgFitaEsquerda: TImage;
    pnlFundoNota: TPanel;
    imgFitaDireita: TImage;
    lbLinhaMeioNota: TLabel;
    btnGrade: TSpeedButton;
    procedure FormCreate(Sender: TObject);

    procedure ControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ControlMouseEnter(Sender: TObject);
    procedure ControlMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);

    procedure ControlClick(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure cdsPadraoAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure actOrdenarExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGradeClick(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
  private
    ExibirGrade: Boolean;
    ControleChecado: TLabel;

    procedure RefreshPosition(Sender: TObject);
    procedure CarregaPositions;
    procedure CarregaHints;
    
    function PixelToColumn(p: Integer): Integer;
    function PixelToLine(p: Integer): Integer;
    function ColumnToPixel(p: Integer): Integer;
    function LineToPixel(p: Integer): Integer;

    procedure CriaGrades(bExibir: Boolean);
  protected
    procedure CampoModificado(var Msg: TMessage); message WM_CAMPO_CONFIG_NOTA;
  public
    procedure DestacaCampo(pNomeComponent: string);
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

  miRelatorios.Visible := False;
  ReordenaBotoes([btnPrimeiro, btnAnterior, btnProximo, btnUltimo, btnNovo,
    btnAlterar, btnExcluir, btnConsultar, btnGrade, btnSair]);

  SetDialogForm(Self);
end;

procedure TfrmConfigNota.RefreshPosition(Sender: TObject);
begin
  cdsPadrao.Edit;
  cdsPadraoLINHA.AsInteger  := PixelToLine((Sender as TLabel).Top);
  cdsPadraoCOLUNA.AsInteger := PixelToColumn((Sender as TLabel).Left);
  cdsPadrao.ApplyUpdates(0);
end;

procedure TfrmConfigNota.ControlMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  MOVE = $F012;
var
  TempPanel: TPanel;
  Control: TControl;
begin
  ReleaseCapture;
  if Sender is TWinControl then
    TWinControl(Sender).Perform(WM_SYSCOMMAND, MOVE, 0)
  else
  begin
    Control   := TControl(Sender);
    TempPanel := TPanel.Create(Self);

    with TempPanel do
    try
      Caption := '';
      BevelOuter := bvNone;
      SetBounds(Control.Left, Control.Top, Control.Width, Control.Height);
      Parent := Control.Parent;
      Control.Parent := TempPanel;
      Perform(WM_SYSCOMMAND, MOVE, 0);
      Control.Parent := Parent;
      Control.Left := Left;
      Control.Top := Top;
    finally
      Free;
    end;
  end;
  RefreshPosition(Sender);
end;

procedure TfrmConfigNota.ControlMouseEnter(Sender: TObject);
begin
  //cdsPadrao.Locate('CAMPO', TLabel(Sender).Name, []);
end;

procedure TfrmConfigNota.CarregaPositions;
var
  Componente: TLabel;
begin
  cdsPadrao.First;
  cdsPadrao.DisableControls;
  while not cdsPadrao.Eof do
  begin
    if Assigned(FindComponent(cdsPadraoCAMPO.AsString)) then
    begin
      TLabel(FindComponent(cdsPadraoCAMPO.AsString)).Top :=
        LineToPixel(cdsPadraoLINHA.AsInteger);
      TLabel(FindComponent(cdsPadraoCAMPO.AsString)).Left :=
        ColumnToPixel(cdsPadraoCOLUNA.AsInteger);
      TLabel(FindComponent(cdsPadraoCAMPO.AsString)).Caption :=
        cdsPadraoLAYOUT.AsString;
      TLabel(FindComponent(cdsPadraoCAMPO.AsString)).Refresh;
    end
    else
    begin
      Componente         := TLabel.Create(Self);
      Componente.Name    := cdsPadraoCAMPO.AsString;
      Componente.Parent  := pnlFundoNota;
      Componente.Top     := LineToPixel(cdsPadraoLINHA.AsInteger);
      Componente.Left    := ColumnToPixel(cdsPadraoCOLUNA.AsInteger);
      Componente.Caption := cdsPadraoLAYOUT.AsString;
      {controle do mouse}
      Componente.OnMouseEnter := ControlMouseEnter;
      //Componente.OnMouseDown  := ControlMouseDown;
      Componente.OnMouseMove  := ControlMouseMove;

      Componente.OnClick      := ControlClick;
    end;
    cdsPadrao.Next;
  end;
  cdsPadrao.EnableControls;
  pnlFundoNota.Update;
end;

procedure TfrmConfigNota.FormShow(Sender: TObject);
begin
  inherited;
  CarregaPositions;
  CarregaHints;

  ExibirGrade := False;
  CriaGrades(ExibirGrade);

  sbxNota.VertScrollBar.Position := 0;
end;

procedure TfrmConfigNota.ControlMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  TControl(Sender).Cursor := crHandPoint;
end;

procedure TfrmConfigNota.CarregaHints;

  function Tipo(pTipo: String): string;
  begin
    case pTipo[1] of
      'C': Result := 'Cabeçalho';
      'T': Result := 'Texto Fixo';
      'I': Result := 'Itens da Nota';
      'R': Result := 'Rodapé';
    end;  
  end;

var
  x: Integer;
begin
  for x := 0 to ComponentCount-1 do
  begin
    if Components[x] is TLabel then
      if cdsPadrao.Locate('CAMPO', TLabel(Components[x]).Name, []) then
        TLabel(Components[x]).Hint :=
          'Coluna: '+IntToStr(cdsPadraoCOLUNA.AsInteger)+#13+
          'Linha: '+IntToStr(cdsPadraoLINHA.AsInteger)+#13+
          'Tipo: '+Tipo(cdsPadraoTIPO.AsString)+#13+
          'Ref: '+cdsPadraoREFERENCIA.AsString;

  end;
end;

function TfrmConfigNota.PixelToColumn(p: Integer): Integer;
begin
  Result := Round(p / 8);
end;

function TfrmConfigNota.PixelToLine(p: Integer): Integer;
begin
  Result := Round(p / 14);
end;

function TfrmConfigNota.ColumnToPixel(p: Integer): Integer;
begin
  Result := Round(p * 8);
end;

function TfrmConfigNota.LineToPixel(p: Integer): Integer;
begin
  Result := Round(p * 14);
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

procedure TfrmConfigNota.CampoModificado(var Msg: TMessage);
begin
  cdsPadrao.Close;
  cdsPadrao.Open;
  CarregaPositions;
  CarregaHints;
  Application.ProcessMessages;
end;

procedure TfrmConfigNota.cdsPadraoAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  inherited;
//  PostMessage(Handle, WM_CAMPO_CONFIG_NOTA, 0, 0);
end;

procedure TfrmConfigNota.actOrdenarExecute(Sender: TObject);
begin
  PostMessage(Handle, WM_CAMPO_CONFIG_NOTA, 0, 0);
end;

procedure TfrmConfigNota.actSearchExecute(Sender: TObject);
begin
  //Ed_Localizar(cdsPadrao, Self, dbgrdCampos);
end;

procedure TfrmConfigNota.DestacaCampo(pNomeComponent: string);
var
  i: Integer;
begin
  for i := 0 to ComponentCount-1 do
  begin
    if Components[i] is TLabel then
    begin
      TLabel(Components[i]).Font.Color := clBlack;
      TLabel(Components[i]).Font.Style := [];
    end;
  end;
  if Assigned(TLabel(FindComponent(pNomeComponent))) then
  begin
    TLabel(FindComponent(pNomeComponent)).Font.Color := clRed;
    TLabel(FindComponent(pNomeComponent)).Font.Style := [fsBold];
  end;
end;

procedure TfrmConfigNota.ControlClick(Sender: TObject);
begin
  DestacaCampo(TLabel(Sender).Name);
  ControleChecado := TLabel(Sender);
  cdsPadrao.Locate('CAMPO', TLabel(Sender).Name, []);
end;

procedure TfrmConfigNota.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Gravar: Boolean;  
begin
  inherited;
  Gravar := False;
  if (ssCtrl in Shift) then
  begin
    if Key = VK_LEFT then // 80 colunas
    begin
      Gravar := True;
      if ControleChecado.Left <= 2 then
        ControleChecado.Left := 2
      else
        ControleChecado.Left := ControleChecado.Left - 8;
    end;

    if Key = VK_RIGHT then // 80 colunas
    begin
      Gravar := True;
      if ControleChecado.Left >= (660 - ControleChecado.Width - 1) then
        ControleChecado.Left := (660 - ControleChecado.Width)
      else
        ControleChecado.Left := ControleChecado.Left + 8;
    end;

    if Key = VK_UP then  // 66 linhas
    begin
      Gravar := True;
      if ControleChecado.Top <= 1 then
        ControleChecado.Top := 2
      else
        ControleChecado.Top := ControleChecado.Top - 14;
    end;

    if Key = VK_DOWN then // 66 linhas
    begin
      Gravar := True;
      if ControleChecado.Top >= 887 then
        ControleChecado.Top := 887
      else
        ControleChecado.Top := ControleChecado.Top + 14;
    end;

    if Gravar then
    begin
      cdsPadrao.Edit;
      cdsPadraoLINHA.AsInteger  := PixelToLine(ControleChecado.Top);
      cdsPadraoCOLUNA.AsInteger := PixelToColumn(ControleChecado.Left);
      cdsPadrao.ApplyUpdates(0);
    end;
  end;
end;

procedure TfrmConfigNota.CriaGrades(bExibir: Boolean);
var
  i: Integer;
  Comp: TShape;
begin

    for i := 1 to 80 do
    begin
      if Assigned(FindComponent('sHorz'+IntToStr(i))) then
      begin
        TShape(FindComponent('sHorz'+IntToStr(i))).Visible := bExibir;
      end
      else
      begin
        Comp := TShape.Create(Self);
        Comp.Name      := 'sHorz'+IntToStr(i);
        Comp.Parent    := pnlFundoNota;
        Comp.Pen.Color := clSilver;
        Comp.Height    := 1;
        Comp.Left      := 0;
        Comp.Width     := pnlFundoNota.Width;
        Comp.Top       := (14 * i);
        Comp.Visible   := bExibir;
      end;
    end;


    for i := 1 to 80 do
    begin
      if Assigned(FindComponent('sVert'+IntToStr(i))) then
      begin
        TShape(FindComponent('sVert'+IntToStr(i))).Visible := bExibir;
      end
      else
      begin
        Comp := TShape.Create(Self);
        Comp.Name      := 'sVert'+IntToStr(i);
        Comp.Parent    := pnlFundoNota;
        Comp.Pen.Color := clSilver;
        Comp.Width     := 1;
        Comp.Left      := (8*i);
        Comp.Height    := pnlFundoNota.Height;
        Comp.Top       := 0;
        Comp.Visible   := bExibir;
      end;  
    end;

    pnlFundoNota.Update;
end;

procedure TfrmConfigNota.btnGradeClick(Sender: TObject);
begin
  inherited;
  ExibirGrade := (not ExibirGrade);
  CriaGrades(ExibirGrade);
end;

procedure TfrmConfigNota.dsPadraoStateChange(Sender: TObject);
begin
  //inherited;
end;

initialization
  RegisterClass(TfrmConfigNota);
finalization
  UnRegisterClass(TfrmConfigNota);
end.
