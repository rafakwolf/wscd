unit unPerfilPermissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, Menus, DB, ActnList, StdCtrls, Buttons,
  ExtCtrls, ComCtrls, DBClient, Provider, SqlExpr, Mask, DBCtrls,
   Grids, DBGrids, ImgList, unPrincipal, FMTBcd, System.Actions,
  System.ImageList, uniGUIClasses, uniEdit, uniDBEdit, uniButton, uniBitBtn,
  uniSpeedButton, uniPanel, uniGUIBaseClasses, uniStatusBar, uniGroupBox,
  uniBasicGrid, uniDBGrid, uniMainMenu;

type
  TfrmPerfilPermissao = class(TfrmPadrao)
    sqldPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    cdsPadrao: TClientDataSet;
    sqldPadraoPERFIL: TStringField;
    cdsPadraoPERFIL: TStringField;
    sqldPerfisConf: TSQLDataSet;
    cdsPerfisConf: TClientDataSet;
    dsLigaPerfis: TDataSource;
    cdsPadraosqldPerfisConf: TDataSetField;
    dsPerfisConf: TDataSource;
    Imagens: TImageList;
    sqldPadraoIDPERFIL: TIntegerField;
    sqldPerfisConfIDPERFIL: TIntegerField;
    sqldPerfisConfACAO_NOME: TStringField;
    sqldPerfisConfACAO_CAPTION: TStringField;
    sqldPerfisConfLIBERADO: TStringField;
    cdsPadraoIDPERFIL: TIntegerField;
    cdsPerfisConfIDPERFIL: TIntegerField;
    cdsPerfisConfACAO_NOME: TStringField;
    cdsPerfisConfACAO_CAPTION: TStringField;
    cdsPerfisConfLIBERADO: TStringField;
    sqldPerfisConfIDITEMPERFIL: TIntegerField;
    cdsPerfisConfIDITEMPERFIL: TIntegerField;
    dbePerfil: TUniDBEdit;
    grpItemMenu: TUniGroupBox;
    edtBuscaItemMenu: TUniEdit;
    dbgPerm: TUniDBGrid;
    pmLiberaBloqueia: TUniPopupMenu;
    miLiberar: TUniMenuItem;
    miBloquear: TUniMenuItem;
    N5: TUniMenuItem;
    miCarregarAcoes: TUniMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure miLiberarClick(Sender: TObject);
    procedure miBloquearClick(Sender: TObject);
    procedure miCarregarAcoesClick(Sender: TObject);
    procedure dbgPermCellClick(Column: TColumn);
    procedure cdsPadraoAfterInsert(DataSet: TDataSet);
    procedure edtBuscaItemMenuExit(Sender: TObject);
    procedure edtBuscaItemMenuChange(Sender: TObject);
    procedure edtBuscaItemMenuEnter(Sender: TObject);
    procedure dsPadraoStateChange(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure tvmMenuPrincChange(Sender: TObject; Node: TTreeNode);
    procedure tvmMenuPrincDblClick(Sender: TObject);
    procedure tvmMenuPrincGetSelectedIndex(Sender: TObject;
      Node: TTreeNode);
    procedure tvmMenuPrincCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
  private
    menu_item   : string;
    action_item : string;
    procedure InsertAction(IdPerfil: Integer; Nome, Caption, Permissao: string);
    procedure DropActions(IdPerfil: Integer);
  public
  end;

var
  frmPerfilPermissao: TfrmPerfilPermissao;

implementation

uses Funcoes, ConstPadrao, VarGlobal;

{$R *.dfm}

procedure TfrmPerfilPermissao.FormCreate(Sender: TObject);
begin
  inherited;
  actPrint.Visible := False;
  //miRelatorios.Visible := False;

//  ReordenaBotoes([btnPrimeiro, btnAnterior, btnProximo, btnUltimo, btnNovo,
//    btnAlterar, btnExcluir, btnSalvar, btnCancelar, btnConsultar, btnSair]);

  FieldNames := FN_PERFIL;
  DisplayLabels := DL_PERFIL;
  aCaption := 'Perfis/Permissões';

  //tvmMenuPrinc.MainMenu := frmPrincipal.mnPrincipal;
  //tvmMenuPrinc.ViewMenu := True;
end;

procedure TfrmPerfilPermissao.miLiberarClick(Sender: TObject);
begin
  inherited;
  cdsPadrao.Edit;
  try
    cdsPerfisConf.First;
    cdsPerfisConf.DisableControls;
    while not cdsPerfisConf.Eof do
    begin
      cdsPerfisConf.Edit;
      cdsPerfisConfLIBERADO.AsString := 'S';
      cdsPerfisConf.Post;
      cdsPerfisConf.Next;
    end;
    cdsPadrao.ApplyUpdates(0);
  finally
    cdsPerfisConf.EnableControls;
  end;
end;

procedure TfrmPerfilPermissao.miBloquearClick(Sender: TObject);
begin
  inherited;
  cdsPadrao.Edit;
  try
    cdsPerfisConf.First;
    cdsPerfisConf.DisableControls;
    while not cdsPerfisConf.Eof do
    begin
      cdsPerfisConf.Edit;
      cdsPerfisConfLIBERADO.AsString := 'N';
      cdsPerfisConf.Post;
      cdsPerfisConf.Next;
    end;
    cdsPadrao.ApplyUpdates(0);
  finally
    cdsPerfisConf.EnableControls;
  end;
end;

procedure TfrmPerfilPermissao.miCarregarAcoesClick(Sender: TObject);
var
  x: Integer;
begin
  inherited;
  if not MsgSN('Deseja recarregar as permissões deste perfil?' + #13#10 +
    'As permissões configuradas serão perdidas, continua?') then
    Exit;
  try
    try
      cdsPadrao.DisableControls;
      DropActions(cdsPadraoIDPERFIL.AsInteger);
      with frmPrincipal do
      begin
        for x := 0 to ComponentCount - 1 do
          if Components[x] is TAction then
            InsertAction(cdsPadraoIDPERFIL.AsInteger,
              TAction(Components[x]).Name,
              TAction(Components[x]).Caption, 'S');
      end;
    except
      raise Exception.Create('Erro recarregando permissões');
    end;
  finally
    cdsPadrao.Close;
    cdsPadrao.Open;
    cdsPadrao.EnableControls;
    MsgAviso('Permissões recarregadas!');
  end;
end;

procedure TfrmPerfilPermissao.dbgPermCellClick(Column: TColumn);
begin
  inherited;
  if not (cdsPadrao.State in [dsEdit, dsInsert]) then
    Exit;

  if (Column.Field.FieldName = 'LIBERADO') then
  begin
    cdsPerfisConf.Edit;
    if (cdsPerfisConfLIBERADO.AsString = 'N') then
      cdsPerfisConfLIBERADO.AsString := 'S'
    else
      cdsPerfisConfLIBERADO.AsString := 'N';
    cdsPerfisConf.Post;
  end;
end;

procedure TfrmPerfilPermissao.cdsPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  SetFocusIfCan(dbePerfil);
end;

procedure TfrmPerfilPermissao.edtBuscaItemMenuExit(Sender: TObject);
begin
  inherited;
  if Trim(edtBuscaItemMenu.Text) = '' then
    edtBuscaItemMenu.Text := 'Busca item do menu...';
end;

procedure TfrmPerfilPermissao.edtBuscaItemMenuChange(Sender: TObject);
begin
  inherited;
  cdsPerfisConf.Locate('ACAO_CAPTION', edtBuscaItemMenu.Text,
    [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmPerfilPermissao.edtBuscaItemMenuEnter(Sender: TObject);
begin
  inherited;
  if Trim(edtBuscaItemMenu.Text) = 'Busca item do menu...' then
    edtBuscaItemMenu.Clear;
end;

procedure TfrmPerfilPermissao.InsertAction(IdPerfil: Integer; Nome, Caption,
  Permissao: string);
begin
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := sqldPadrao.SQLConnection;
    CommandText :=
      'insert into ITEMPERFIL values (GEN_ID(GENIDITEMPERFIL, 1), :ID, :NOME, :CAPTION, :PERMISSAO)';
    Params.ParamByName('ID').AsInteger := IdPerfil;
    Params.ParamByName('NOME').AsString := Nome;
    Params.ParamByName('CAPTION').AsString := Caption;
    Params.ParamByName('PERMISSAO').AsString := Permissao;
    ExecSQL;
  finally
    Free;
  end;
end;

procedure TfrmPerfilPermissao.DropActions(IdPerfil: Integer);
begin
  with TSQLDataSet.Create(nil) do
  try
    SQLConnection := sqldPadrao.SQLConnection;
    CommandText := 'delete from ITEMPERFIL where IDPERFIL = ' +
      QuotedStr(IntToStr(IdPerfil));
    ExecSQL;
  finally
    Free;
  end;
end;

procedure TfrmPerfilPermissao.dsPadraoStateChange(Sender: TObject);
begin
  inherited;
  miCarregarAcoes.Enabled := not EditModes;
  miBloquear.Enabled := not EditModes;
  miLiberar.Enabled := not EditModes;
end;

procedure TfrmPerfilPermissao.actDeleteExecute(Sender: TObject);
begin
  try
    if MsgSN('Deseja realmente exluir este perfil?') then
    begin
      // deleta items
      with TSQLDataSet.Create(nil) do
      try
        SQLConnection := sqldPadrao.SQLConnection;
        CommandText := 'delete from ITEMPERFIL ip where ip.IDPERFIL = ' +
          QuotedStr(IntToStr(cdsPadraoIDPERFIL.AsInteger));
        ExecSQL;
      finally
        Free;
      end;

      // deleta perfil
      with TSQLDataSet.Create(nil) do
      try
        SQLConnection := sqldPadrao.SQLConnection;
        CommandText := 'delete from PERFIL p where p.IDPERFIL = ' +
          QuotedStr(IntToStr(cdsPadraoIDPERFIL.AsInteger));
        ExecSQL;
      finally
        Free;
      end;
    end;
  except
    on e: Exception do
    begin
      if Pos('exception 3', e.Message) > 0 then
      begin
        MsgErro('Não é permitida exclusão deste perfil.');
        Abort;
      end;
    end;
  end;
end;

procedure TfrmPerfilPermissao.tvmMenuPrincChange(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  menu_item   := TMenuItem(Node.Data).Name;

  if Assigned(TMenuItem(frmPrincipal.FindComponent(menu_item)).Action) then
  begin
    action_item := TMenuItem(frmPrincipal.FindComponent(menu_item)).Action.Name;
    cdsPerfisConf.Locate('ACAO_NOME',action_item,[]);
  end;
end;

procedure TfrmPerfilPermissao.tvmMenuPrincDblClick(Sender: TObject);
begin
  inherited;
  if cdsPerfisConf.Locate('ACAO_NOME',action_item,[]) then
  begin
    cdsPerfisConf.Edit;
    

    if cdsPerfisConfLIBERADO.AsString = 'S' then
      cdsPerfisConfLIBERADO.AsString := 'N'
    else
      cdsPerfisConfLIBERADO.AsString := 'S';

    cdsPerfisConf.Post;  
  end;
end;

procedure TfrmPerfilPermissao.tvmMenuPrincGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  if cdsPerfisConf.Locate('ACAO_NOME',action_item,[]) then
  begin
    if cdsPerfisConfLIBERADO.AsString = 'S' then
      Node.ImageIndex := 1
    else
      Node.ImageIndex := 0;  
  end;
end;

procedure TfrmPerfilPermissao.tvmMenuPrincCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  inherited;
  AllowCollapse := False;
end;

initialization
  RegisterClass(TfrmPerfilPermissao);
finalization
  UnRegisterClass(TfrmPerfilPermissao);

end.

