unit ufmUsuarioItemMenu;

interface

uses
  Messages, ExtCtrls,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ActnList, StdCtrls, Buttons,   ComCtrls,
  Sqldb,ImgList, Menus, uClassesMenu,
  memds,  DBCtrls,ConstPadrao, Funcoes, unPadrao, unDmPrincipal, FMTBcd;

type
  TfrmUsuarioItemMenu = class(TfrmPadrao)
    sqldMenu: TSQLQuery;
    ilStatusMenu: TImageList;
    sqldLimpaAcessoUsuario: TSQLQuery;
    sqldInsereAcesso: TSQLQuery;
    dsAcesso: TDataSource;
    sqldMenuIDMENU: TIntegerField;
    sqldMenuMENUPAI: TIntegerField;
    sqldMenuORDEM: TIntegerField;
    sqldMenuMENUITEM: TStringField;
    sqldPadrao: TSQLQuery;
    dspPadrao: TTimer;
    cdsPadrao: TMemDataSet;
    cdsPadraoIDUSUARIOS: TIntegerField;
    cdsPadraoNOME: TStringField;
    cdsPadraoLOGIN: TStringField;
    cdsPadraoSENHA: TStringField;
    sqldAcesso: TSQLQuery;
    dspAcesso: TComponent;
    cdsAcesso: TMemDataSet;
    cdsAcessoIDMENU: TIntegerField;
    dbeSenha: TDBEdit;
    dbeLogin: TDBEdit;
    dbeNomeUsuario: TDBEdit;
    grpItemPermissao: TGroupBox;
    pmStatusMenu: TPopupMenu;
    mniLiberado: TMenuItem;
    mniBloqueado: TMenuItem;
    tvAcesso: TTreeView;
    procedure cdsPadraoSENHASetText(Sender: TField; const Text: string);
    procedure mniBloqueadoClick(Sender: TObject);
    procedure mniLiberadoClick(Sender: TObject);
    procedure tvAcessoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvAcessoCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure tvAcessoGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure tvAcessoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure cdsPadraoAfterCancel(DataSet: TDataSet);
    procedure cdsPadraoAfterScroll(DataSet: TDataSet);
    procedure cdsPadraoSENHAGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    ItemsMenu: TPLItemsMenu;

    function GetNodeById(pId: Integer): TTreeNode;
    function GetAcesso(TreeNode: TTreeNode): Boolean;
    
    procedure SetAcesso(TreeNode: TTreeNode; Liberado: Boolean;
      SetAcessoSubItems: Boolean; Manual: Boolean; RepaintTreeView: Boolean);
    procedure MarcaTreeViewAcessoUsuario;
    procedure DesmarcaTreeView;
    procedure MensagemAntesEditar;
    procedure LimpaAcessos(IdUsuario: Integer);
  protected
    procedure AntesSalvar; override;
    procedure DepoisSalvar; override;
  public
  end;

var
  frmUsuarioItemMenu: TfrmUsuarioItemMenu;

const
  IIBLOQUEADO : Integer = 0;
  IILIBERADO  : Integer = 1;

implementation

uses Math;

{$R *.dfm}

procedure TfrmUsuarioItemMenu.FormCreate(Sender: TObject);

  function AddTreeNode(PLMenuIndex: Integer): TTreeNode;
  var
    ParentNode : TTreeNode;
    PLItemMenu : TPLItemMenu;
  begin;
    PLItemMenu := ItemsMenu[PLMenuIndex];
    
    if PLItemMenu.IdParentItemMenu > 0 then
    begin
      ParentNode := GetNodeById(PLItemMenu.IdParentItemMenu);
      Result := tvAcesso.Items.AddChildObject(ParentNode, PLItemMenu.Caption, PLItemMenu);
    end
    else
    begin
      Result := tvAcesso.Items.AddChildObject(nil, PLItemMenu.Caption, PLItemMenu);
    end;  
  end;

var
  CompMenu : TComponent;
  MenuItem : TMenuItem;
  IsRoot   : Boolean;
begin
  inherited;
  
  FieldNames       := FN_USUARIOS;
  DisplayLabels    := DL_USUARIOS;
  aCaption         := 'Usu�rios';

  with sqldMenu do
  begin
    Open;
    
    while not Eof do
    begin
      CompMenu := Application.MainForm.FindComponent(sqldMenuMENUITEM.AsString);
      IsRoot   := sqldMenuMENUITEM.AsString = 'CPR';
      
      if (assigned(CompMenu) and (CompMenu is TMenuItem)) or (IsRoot) then
      begin
        MenuItem := TMenuItem(CompMenu);
        SetLength(ItemsMenu, Length(ItemsMenu) + 1);
        
        if not IsRoot then
        begin
          ItemsMenu[length(ItemsMenu) - 1] := TPLItemMenu.Create(sqldMenuIDMENU.AsInteger,
            sqldMenuMENUITEM.AsString,
            StringReplace(MenuItem.Caption, '&','', [rfReplaceAll]),
            sqldMenuMENUPAI.AsInteger);
        end
        else
        begin
          ItemsMenu[length(ItemsMenu) - 1] := TPLItemMenu.Create(sqldMenuIDMENU.AsInteger,
            sqldMenuMENUITEM.AsString, 'CPR Sistema Comercial',
            sqldMenuMENUPAI.AsInteger);
        end;    

        AddTreeNode(length(ItemsMenu) - 1);
      end;

      Next;
    end;
    
    tvAcesso.FullExpand;
  end;

  MarcaTreeViewAcessoUsuario;
  
  try
    tvAcesso.Selected := GetNodeById(1);
  except
  end;
end;

function TfrmUsuarioItemMenu.GetNodeById(pId: Integer): TTreeNode;
var
  x: Integer;
begin
  Result := nil;
  for x := 0 to tvAcesso.Items.Count - 1 do
  begin
    if TPLItemMenu(tvAcesso.Items[x].Data).IdItemMenu = pId then
    begin
      Result := tvAcesso.Items[x];
      Break;
    end;
  end;
end;

procedure TfrmUsuarioItemMenu.tvAcessoDblClick(Sender: TObject);
begin
  inherited;
  if EditModes then
  begin
    SetAcesso(tvAcesso.Selected, not GetAcesso(tvAcesso.Selected), True, True, True);
  end
  else
    MensagemAntesEditar;
end;

procedure TfrmUsuarioItemMenu.MensagemAntesEditar;
begin
  if (not cdsAcesso.Active) then
    MsgAviso('Voc� deve pesquisar o usu�rio (bot�o Procurar) antes de editar os acessos.')
  else
    MsgAviso('Voc� deve clicar em Alterar (ou tecla F5) para editar os acessos.');
end;

procedure TfrmUsuarioItemMenu.tvAcessoGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TfrmUsuarioItemMenu.tvAcessoCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  inherited;
  AllowCollapse := False;
end;

procedure TfrmUsuarioItemMenu.tvAcessoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//var
//  Pt: TPoint;
begin
  inherited;
//  if Button = mbRight then
//  begin
//    if EditModes then
//    begin
//      if assigned(tvAcesso.GetNodeAt(X,Y)) then
//      begin
//        tvAcesso.Selected := tvAcesso.GetNodeAt(X,Y);
//        Pt := tvAcesso.ClientToScreen(Point(X,Y));
//        pmStatusMenu.Popup(Pt.X, Pt.Y);
//      end;
//    end
//    else
//    begin
//      MensagemAntesEditar;
//    end;
//  end;
end;

procedure TfrmUsuarioItemMenu.mniLiberadoClick(Sender: TObject);
begin
  inherited;
  SetAcesso(tvAcesso.Selected, True, True, True, True);
end;

procedure TfrmUsuarioItemMenu.SetAcesso(TreeNode: TTreeNode; Liberado: Boolean;
  SetAcessoSubItems: Boolean; Manual: Boolean; RepaintTreeView: Boolean);
var
  x, Marcados : Integer;
  ParentNode  : TTreeNode;
begin
  if assigned(TreeNode) then
  begin
    //TreeNode.ImageIndex := ifThen(Liberado, IILIBERADO, IIBLOQUEADO);
    //
    //if SetAcessoSubItems then
    //begin
    //  for x := 0 to TreeNode.Count - 1 do
    //    SetAcesso(TreeNode.Item[x], Liberado, True, False, False);
    //end;
    //
    //if Manual then
    //begin
    //  if not (cdsAcesso.State in dsEditModes) then
    //    cdsAcesso.Edit;
    //
    //  if Liberado then
    //  begin
    //    if TPLItemMenu(TreeNode.Data).IdParentItemMenu > 0 then
    //    begin
    //      SetAcesso(GetNodeById(TPLItemMenu(TreeNode.Data).IdParentItemMenu),
    //        True, False, True, False);
    //    end;    
    //  end
    //  else
    //  begin
    //    Marcados := 0;
    //
    //    if TPLItemMenu(TreeNode.Data).IdParentItemMenu > 0 then
    //    begin
    //      ParentNode := GetNodeById(TPLItemMenu(TreeNode.Data).IdParentItemMenu);
    //
    //      for x := 0 to ParentNode.Count - 1 do
    //      begin
    //        if GetAcesso(ParentNode.Item[x]) then
    //        begin
    //          Marcados := 1;
    //          Break;
    //        end;
    //      end;
    //
    //      if Marcados = 0 then
    //      begin
    //        SetAcesso(ParentNode, False, False, True, False);
    //      end;  
    //    end;
     // end;
   // end;
  end;
  
  if RepaintTreeView then
    tvAcesso.Invalidate;
end;

function TfrmUsuarioItemMenu.GetAcesso(TreeNode: TTreeNode): Boolean;
begin
  Result := TreeNode.ImageIndex = IILIBERADO;
end;

procedure TfrmUsuarioItemMenu.mniBloqueadoClick(Sender: TObject);
begin
  inherited;
  SetAcesso(tvAcesso.Selected, False, True, True, True);
end;

procedure TfrmUsuarioItemMenu.MarcaTreeViewAcessoUsuario;
begin
  DesmarcaTreeView;

  cdsAcesso.First;
  while not cdsAcesso.Eof do
  begin
    if not cdsAcessoIDMENU.IsNull then
      SetAcesso(GetNodeById(cdsAcessoIDMENU.AsInteger), True, False, False, False);

    cdsAcesso.Next;
  end;

  tvAcesso.Invalidate;
end;

procedure TfrmUsuarioItemMenu.DesmarcaTreeView;
var
  x: Integer;
begin
  for x := 0 to tvAcesso.Items.Count - 1 do
    SetAcesso(tvAcesso.Items[x], False, False, False, False);

  tvAcesso.Invalidate;
end;


procedure TfrmUsuarioItemMenu.cdsPadraoSENHASetText(Sender: TField;
  const Text: string);
begin
  inherited;
  //Sender.AsString := Encript(Text); TODO:
end;

procedure TfrmUsuarioItemMenu.AntesSalvar;
begin
  inherited;
  if ValidaFieldsVazios([cdsPadraoNOME, cdsPadraoLOGIN, cdsPadraoSENHA],
    ['Nome', 'Login', 'Senha']) <> '' then
    Abort;
end;

procedure TfrmUsuarioItemMenu.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DesmarcaTreeView;
end;

procedure TfrmUsuarioItemMenu.cdsPadraoAfterCancel(DataSet: TDataSet);
begin
  inherited;
  MarcaTreeViewAcessoUsuario;
end;

procedure TfrmUsuarioItemMenu.cdsPadraoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  cdsAcesso.Close;
  sqldAcesso.Params.ParamByName('IDUSUARIOS').AsInteger := cdsPadraoIDUSUARIOS.AsInteger;
  cdsAcesso.Open;

  MarcaTreeViewAcessoUsuario;
end;

procedure TfrmUsuarioItemMenu.LimpaAcessos(IdUsuario: Integer);
begin
  with sqldLimpaAcessoUsuario do
  begin
    Close;
    ParamByName('IDUSUARIOS').AsInteger := IdUsuario;
    ExecSQL;
  end;
end;

procedure TfrmUsuarioItemMenu.cdsPadraoSENHAGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
 // Text := Encript(Sender.AsString); TODO:
end;

procedure TfrmUsuarioItemMenu.DepoisSalvar;
var
  x        : Integer;
 // TranDesc : TDBXTransaction;
begin
  inherited;
  try
    //TranDesc := sqldInsereAcesso.SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);
    //
    //LimpaAcessos(cdsPadraoIDUSUARIOS.AsInteger);
    //
    //with sqldInsereAcesso do
    //begin
    //  for x := 0 to tvAcesso.Items.Count - 1 do
    //  begin
    //    if GetAcesso(tvAcesso.Items[x]) then
    //    begin
    //      Close;
    //      ParamByName('IDUSUARIOS').AsInteger := cdsPadraoIDUSUARIOS.AsInteger;
    //      ParamByName('IDMENU').AsInteger     := TPLItemMenu(tvAcesso.Items[x].Data).IdItemMenu;
    //      ExecSQL;
    //    end;
    //  end;
    //end;
    //
    //sqldInsereAcesso.SQLConnection.CommitFreeAndNil(TranDesc);
  except
    on e:Exception do
    begin
      //sqldInsereAcesso.SQLConnection.RollbackFreeAndNil(TranDesc);
      raise Exception.Create(e.Message);
    end;
  end;
end;

initialization
  RegisterClass(TfrmUsuarioItemMenu);
finalization
  UnregisterClass(TfrmUsuarioItemMenu);

end.

