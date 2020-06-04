unit uClasses;

{$MODE Delphi}

interface

uses
  SysUtils, Classes, sqldb, DB, Forms, unDmPrincipal, uUtilFncs, inifiles;

type
  TConfigGlobal = class
  private
    sqldConfigGlobal: TSQLQuery;

    function GetIntervalo: Integer;
    function GetJuro: Real;
    function GetPrazoInicial: Integer;
    function GetParcelas: Integer;
    function GetLimiteCliente: Real;
    function GetTituloOrcamento: String;
    function GetColunaOrcamBobina: Integer;
    function GetMsgRodapeOrcam: string;
    function GetColunaVendaBobina: Integer;
    function GetMsgRodapeVenda: string;
    function GetTituloVenda: String;
    function GetLinhaBobinaOrcam: Integer;
    function GetLinhaBobinaVenda: Integer;
    function GetFTP_Dir: string;
    function GetFTP_Host: string;
    function GetFTP_Passive: Boolean;
    function GetFTP_Password: string;
    function GetFTP_TimeOut: Integer;
    function GetFTP_UserName: string;
    function GetIdadeCliente: Integer;
    function GetPortaImpVenda: string;
  public
    property Juro             : Real read GetJuro;
    property Intervalo        : Integer read GetIntervalo;
    property PrazoInicial     : Integer read GetPrazoInicial;
    property Parcelas         : Integer read GetParcelas;
    property LimiteCliente    : Real read GetLimiteCliente;
    property TituloOrcamento  : String read GetTituloOrcamento;
    property ColunaOrcamBobina: Integer read GetColunaOrcamBobina;
    property MsgRodapeOrcam   : string read GetMsgRodapeOrcam;
    property TituloVenda      : String read GetTituloVenda;
    property ColunaVendaBobina: Integer read GetColunaVendaBobina;
    property MsgRodapeVenda   : string read GetMsgRodapeVenda;
    property LinhaBobinaOrcam : Integer read GetLinhaBobinaOrcam;
    property LinhaBobinaVenda : Integer read GetLinhaBobinaVenda;
    property PortaImpVenda    : string read GetPortaImpVenda;
    property IdadeCliente     : Integer read GetIdadeCliente;
    property FTP_Host         : string read GetFTP_Host;
    property FTP_UserName     : string read GetFTP_UserName;
    property FTP_Password     : string read GetFTP_Password;
    property FTP_Dir          : string read GetFTP_Dir;
    property FTP_TimeOut      : Integer read GetFTP_TimeOut;
    property FTP_Passive      : Boolean read GetFTP_Passive;

    constructor Create;
    destructor Free;
    procedure Atualizar;
  end;

  TConfiguracao = class
  private
    sqldConfiguracao: TSQLQuery;
    function GetAliquotaPadrao: Integer;
    function GetAtalhos: Boolean;
    function GetBackup: Boolean;
    function GetBloqCliente: Boolean;
    function GetBordaEtiquetaCli: Boolean;
    function GetBordaEtiquetaProd: Boolean;
    function GetCaixaPadrao: Integer;
    function GetCompraConcluida: Boolean;
    function GetDescontoPadrao: Real;
    function GetDiretorioExportacao: String;
    function GetEditarCompra: Boolean;
    function GetEditarOrcam: Boolean;
    function GetEditarVenda: Boolean;
    function GetEstoqueOrc: Boolean;
    function GetEstoquePadrao: Real;
    function GetEstoqueSenha: Boolean;
    function GetEstoqueVenda: Boolean;
    function GetExibirDica: Boolean;
    function GetGravarErro: Boolean;
    function GetGravarLog: Boolean;
    function GetHintBalao: Boolean;
    function GetLetraNumCodBarra: Boolean;
    function GetOrcamConcluido: Boolean;
    function GetResolucao: Boolean;
    function GetSenhaCaixa: String;
    function GetSenhaEstoque: String;
    function GetVendaConcluida: Boolean;
    function GetVerImpressora: Boolean;
    function GetOrientPapelParede: string;
    function GetPapelParede: string;
    function GetLancCaixa90Dias: Boolean;
    function GetMostrarSaldoCaixa: Boolean;
    function getRelZebrado: Boolean;
    function GetVerificaUPD: Boolean;
    function GetContaCheque: Integer;
    function getInfoAvisos: Boolean;
  public
    property Atalhos             : Boolean read GetAtalhos;
    property HintBalao           : Boolean read GetHintBalao;
    property GravarErro          : Boolean read GetGravarErro;
    property Backup              : Boolean read GetBackup;
    property GravarLog           : Boolean read GetGravarLog;
    property BloqCliente         : Boolean read GetBloqCliente;
    property VerImpressora       : Boolean read GetVerImpressora;
    property EstoqueSenha        : Boolean read GetEstoqueSenha;
    property Resolucao           : Boolean read GetResolucao;
    property EstoqueOrc          : Boolean read GetEstoqueOrc;
    property CompraConcluida     : Boolean read GetCompraConcluida;
    property EstoquePadrao       : Real read GetEstoquePadrao;
    property DescontoPadrao      : Real read GetDescontoPadrao;
    property AliquotaPadrao      : Integer read GetAliquotaPadrao;
    property VendaConcluida      : Boolean read GetVendaConcluida;
    property EstoqueVenda        : Boolean read GetEstoqueVenda;
    property CaixaPadrao         : Integer read GetCaixaPadrao;
    property EditarVenda         : Boolean read GetEditarVenda;
    property ExibirDica          : Boolean read GetExibirDica;
    property OrcamConcluido      : Boolean read GetOrcamConcluido;
    property EditarOrcam         : Boolean read GetEditarOrcam;
    property EditarCompra        : Boolean read GetEditarCompra;
    property BordaEtiquetaProd   : Boolean read GetBordaEtiquetaProd;
    property DiretorioExportacao : String read GetDiretorioExportacao;
    property SenhaEstoque        : String read GetSenhaEstoque;
    property SenhaCaixa          : String read GetSenhaCaixa;
    property LetraNumCodBarra    : Boolean read GetLetraNumCodBarra;
    property BordaEtiquetaCli    : Boolean read GetBordaEtiquetaCli;
    property PapelParede         : string read GetPapelParede;
    property OrientPapelParede   : string read GetOrientPapelParede;
    property MostrarSaldoCaixa   : Boolean read GetMostrarSaldoCaixa;
    property LancCaixa90Dias     : Boolean read GetLancCaixa90Dias;
    property RelZebrado          : Boolean read GetRelZebrado;
    property VerificaUPD         : Boolean read GetVerificaUPD;
    property ContaCheque         : Integer read GetContaCheque;
    property InfoAvisos          : Boolean read getInfoAvisos;

    constructor Create;
    destructor Free;
    procedure Atualizar;
  end;

  TEmpresa = class
  private
    sqldEmpresa: TSQLQuery;
    function GetBairro: String;
    function GetCep: String;
    function GetCidade: String;
    function GetCnpj: String;
    function GetEmpresa: String;
    function GetEndereco: String;
    function GetEstado: String;
    function GetFax: String;
    function GetInscEstadual: String;
    function GetResponsavel: String;
    function GetTelefone: String;
    function getEmail: string;
  public
    property Nome        : String read GetEmpresa;
    property Cnpj        : String read GetCnpj;
    property InscEstadual: String read GetInscEstadual;
    property Endereco    : String read GetEndereco;
    property Cidade      : String read GetCidade;
    property Bairro      : String read GetBairro;
    property Cep         : String read GetCep;
    property Telefone    : String read GetTelefone;
    property Fax         : String read GetFax;
    property Estado      : String read GetEstado;
    property Responsavel : String read GetResponsavel;
    property Email       : string read getEmail;

    constructor Create;
    destructor Free;
    procedure Atualizar;
  end;

  TSistema = class
  private
    sqldSistema: TSQLQuery;
    function GetAppCaption: String;
    function GetDataAcesso: String;
    function GetDataValidade: String;
    function GetHD: String;
    function GetPastaSistema: string;
    function GetSerial: string;
    function GetVersaoApp: String;
    function GetVersaoDB: String;
  public
    property AppCaption   : String read GetAppCaption;
    property VersaoApp    : String read GetVersaoApp;
    property VersaoDB     : String read GetVersaoDB;
    property DataAcesso   : String read GetDataAcesso;
    property HD           : String read GetHD;
    property DataValidade : String read GetDataValidade;
    property PastaSistema : string read GetPastaSistema;
    property Serial       : string read GetSerial;

    constructor Create;
    destructor Free;
    procedure Atualizar;
  end;

implementation

procedure TConfigGlobal.Atualizar;
begin
   sqldConfigGlobal.Close;
   sqldConfigGlobal.Open;
end;

constructor TConfigGlobal.Create;
begin
  sqldConfigGlobal := TSQLQuery.Create(nil);
  with sqldConfigGlobal do
  begin
    SQLConnection := DmPrincipal.Conexao;
    SQL.Text := 'select '+
                   ' TAXAJURO,'+
                   ' INTERVALO,'+
                   ' PRAZOINICIAL,'+
                   ' PARCELAS,'+
                   ' LIMITECLIENTE,'+
                   ' TITULOORCAM,'+
                   ' COLUNAORCAMBOBINA,'+
                   ' MSGRODAPEORCAM,'+
                   ' TITULOVENDA,'+
                   ' COLUNAVENDABOBINA,'+
                   ' MSGRODAPEVENDA,'+
                   ' LINHAPULARBOBINAVENDA,'+
                   ' LINHAPULARBOBINAORCAM,'+
                   ' PORTAIMPVENDA,'+
                   ' FTP_HOST,'+
                   ' FTP_USER_NAME,'+
                   ' FTP_PASSWORD,'+
                   ' FTP_TIMEOUT,'+
                   ' FTP_PASSIVE,'+
                   ' FTP_DIR, '+
                   ' IDADECADASTROCLIENTE '+
                   'from CONFIGURACAOGLOBAL '+
                   'where IDCONFIGGLOBAL = '+QuotedStr('1');
    Open;
  end;
end;

destructor TConfigGlobal.Free;
begin
  sqldConfigGlobal.Free;
end;

function TConfigGlobal.GetColunaOrcamBobina: Integer;
begin
  Result := sqldConfigGlobal.FieldByName('COLUNAORCAMBOBINA').AsInteger;
end;

function TConfigGlobal.GetColunaVendaBobina: Integer;
begin
  Result := sqldConfigGlobal.FieldByName('COLUNAVENDABOBINA').AsInteger;
end;

function TConfigGlobal.GetFTP_Dir: string;
begin
  Result := sqldConfigGlobal.FieldByName('FTP_DIR').AsString;
end;

function TConfigGlobal.GetFTP_Host: string;
begin
  Result := sqldConfigGlobal.FieldByName('FTP_HOST').AsString;
end;

function TConfigGlobal.GetFTP_Passive: Boolean;
begin
  Result := (sqldConfigGlobal.FieldByName('FTP_PASSIVE').AsString = 'S');
end;

function TConfigGlobal.GetFTP_Password: string;
begin
  Result := sqldConfigGlobal.FieldByName('FTP_PASSWORD').AsString;
end;

function TConfigGlobal.GetFTP_TimeOut: Integer;
begin
  Result := sqldConfigGlobal.FieldByName('FTP_TIMEOUT').AsInteger;
end;

function TConfigGlobal.GetFTP_UserName: string;
begin
  Result := sqldConfigGlobal.FieldByName('FTP_USER_NAME').AsString;
end;

function TConfigGlobal.GetIdadeCliente: Integer;
begin
  Result := sqldConfigGlobal.FieldByName('IDADECADASTROCLIENTE').AsInteger;
end;

function TConfigGlobal.GetIntervalo: Integer;
begin
  Result := sqldConfigGlobal.FieldByName('INTERVALO').AsInteger;
end;

function TConfigGlobal.GetJuro: Real;
begin
  Result := sqldConfigGlobal.FieldByName('TAXAJURO').AsFloat;
end;

function TConfigGlobal.GetLimiteCliente: Real;
begin
  Result := sqldConfigGlobal.FieldByName('LIMITECLIENTE').AsFloat;
end;

function TConfigGlobal.GetLinhaBobinaOrcam: Integer;
begin
  Result := sqldConfigGlobal.FieldByName('LINHAPULARBOBINAORCAM').AsInteger;
end;

function TConfigGlobal.GetLinhaBobinaVenda: Integer;
begin
  Result := sqldConfigGlobal.FieldByName('LINHAPULARBOBINAVENDA').AsInteger;
end;

function TConfigGlobal.GetMsgRodapeOrcam: string;
begin
  Result := sqldConfigGlobal.FieldByName('MSGRODAPEORCAM').AsString;
end;

function TConfigGlobal.GetMsgRodapeVenda: string;
begin
  Result := sqldConfigGlobal.FieldByName('MSGRODAPEVENDA').AsString;
end;

function TConfigGlobal.GetParcelas: Integer;
begin
  Result := sqldConfigGlobal.FieldByName('PARCELAS').AsInteger;
end;

function TConfigGlobal.GetPortaImpVenda: string;
begin
  Result := sqldConfigGlobal.FieldByName('PORTAIMPVENDA').AsString;
end;

function TConfigGlobal.GetPrazoInicial: Integer;
begin
  Result := sqldConfigGlobal.FieldByName('PRAZOINICIAL').AsInteger;
end;

function TConfigGlobal.GetTituloOrcamento: String;
begin
  Result := sqldConfigGlobal.FieldByName('TITULOORCAM').AsString;
end;

function TConfigGlobal.GetTituloVenda: String;
begin
  Result := sqldConfigGlobal.FieldByName('TITULOVENDA').AsString;
end;

procedure TConfiguracao.Atualizar;
begin
  sqldConfiguracao.Close;
  sqldConfiguracao.Open;
end;

constructor TConfiguracao.Create;
begin
  sqldConfiguracao := TSQLQUery.Create(nil);
  with sqldConfiguracao do
  begin
    SQLConnection := DmPrincipal.Conexao;
    Close;
    SQL.Text := 'select'+
                   ' BARRAFERRAMENTA,'+
                   ' HINTBALAO,'+
                   ' GRAVAERRO,'+
                   ' BACKUP,'+
                   ' LOG,'+
                   ' IMPRESSORA,'+
                   ' RESOLUCAO,'+
                   ' LETRACODIGOBARRA,'+
                   ' EXIBEDICADIA,'+
                   ' AVISACLIENTEATRASO,'+
                   ' DIREXPORTPADRAO,'+
                   ' SENHAESTOQUE,'+
                   ' USARSENHAESTOQUE,'+
                   ' ESTOQUEPADRAO,'+
                   ' BORDAETQPROD,'+
                   ' BORDAETQCLIENTE,'+
                   ' ALIQUOTAPADRAO,'+
                   ' DESCPADRAOPROD,'+
                   ' CAIXAPADRAO,'+
                   ' SENHACAIXA,'+
                   ' PRODSEMESTOQORCAM,'+
                   ' EDITORCAMCONC,'+
                   ' ORCAMNAOCONC,'+
                   ' COMPRANAOCONC,'+
                   ' EDITCOMPRACONC,'+
                   ' VENDANAOCONC,'+
                   ' PRODSEMESTOQVENDA,'+
                   ' EDITVENDACONC,'+
                   ' MOSTRARSALDOCAIXA,'+
                   ' CAIXA90DIAS,'+
                   ' INFOAVISOS,'+
                   ' RELZEBRADO, '+
                   ' VERIFICA_UPD, '+
                   ' CONTACHEQUE '+
                   'from CONFIGURACAO '+
                   'where NOMECOMPUTADOR = :COMP';
    Params.ParamByName('COMP').AsString := GetComputerName;
    Open;

    if IsEmpty then
    begin
      with TSQLQuery.Create(nil) do
      try
        SQLConnection := DmPrincipal.Conexao;
        SQL.Text := 'STPCONFIGPADRAO';
        Params.ParamByName('COMPUTADOR').AsString := GetComputerName;
        Params.ParamByName('DIRETORIO').AsString  := ExtractFilePath( Application.ExeName );
        ExecSQL;
      finally
        Free;
      end;
    end;
  end;
end;

destructor TConfiguracao.Free;
begin
  sqldConfiguracao.Free;
end;

function TConfiguracao.GetAliquotaPadrao: Integer;
begin
  Result := sqldConfiguracao.FieldByName('ALIQUOTAPADRAO').AsInteger;
end;

function TConfiguracao.GetAtalhos: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('BARRAFERRAMENTA').AsString = 'S');
end;

function TConfiguracao.GetBackup: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('BACKUP').AsString = 'S');
end;

function TConfiguracao.GetBloqCliente: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('AVISACLIENTEATRASO').AsString = 'S');
end;

function TConfiguracao.GetBordaEtiquetaCli: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('BORDAETQCLIENTE').AsString = 'S');
end;

function TConfiguracao.GetBordaEtiquetaProd: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('BORDAETQPROD').AsString = 'S');
end;

function TConfiguracao.GetCaixaPadrao: Integer;
begin
  Result := sqldConfiguracao.FieldByName('CAIXAPADRAO').AsInteger;
end;

function TConfiguracao.GetCompraConcluida: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('COMPRANAOCONC').AsString = 'S');
end;

function TConfiguracao.GetContaCheque: Integer;
begin
  Result := sqldConfiguracao.FieldByName('CONTACHEQUE').AsInteger;
end;

function TConfiguracao.GetDescontoPadrao: Real;
begin
  Result := sqldConfiguracao.FieldByName('DESCPADRAOPROD').AsFloat;
end;

function TConfiguracao.GetDiretorioExportacao: String;
begin
  Result := sqldConfiguracao.FieldByName('DIREXPORTPADRAO').AsString;
end;

function TConfiguracao.GetEditarCompra: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('EDITCOMPRACONC').AsString = 'S');
end;

function TConfiguracao.GetEditarOrcam: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('EDITORCAMCONC').AsString = 'S');
end;

function TConfiguracao.GetEditarVenda: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('VENDANAOCONC').AsString = 'S');
end;

function TConfiguracao.GetEstoqueOrc: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('PRODSEMESTOQORCAM').AsString = 'S');
end;

function TConfiguracao.GetEstoquePadrao: Real;
begin
  Result := sqldConfiguracao.FieldByName('ESTOQUEPADRAO').AsFloat;
end;

function TConfiguracao.GetEstoqueSenha: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('USARSENHAESTOQUE').AsString = 'S');
end;

function TConfiguracao.GetEstoqueVenda: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('PRODSEMESTOQVENDA').AsString = 'S');
end;

function TConfiguracao.GetExibirDica: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('EXIBEDICADIA').AsString = 'S');
end;

function TConfiguracao.GetGravarErro: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('GRAVAERRO').AsString = 'S');
end;

function TConfiguracao.GetGravarLog: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('LOG').AsString = 'S');
end;

function TConfiguracao.GetHintBalao: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('HINTBALAO').AsString = 'S');
end;

function TConfiguracao.getInfoAvisos: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('INFOAVISOS').AsString = 'S');
end;

function TConfiguracao.GetLancCaixa90Dias: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('CAIXA90DIAS').AsString = 'S');
end;

function TConfiguracao.GetLetraNumCodBarra: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('LETRACODIGOBARRA').AsString = 'S');
end;

function TConfiguracao.GetMostrarSaldoCaixa: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('MOSTRARSALDOCAIXA').AsString = 'S');
end;

function TConfiguracao.GetOrcamConcluido: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('ORCAMNAOCONC').AsString = 'S');
end;

function TConfiguracao.GetOrientPapelParede: string;
begin
  with TIniFile.Create(
    IncludeTrailingPathDelimiter( ExtractFilePath( Application.ExeName ))+'cfg.ini' )do
    try
      Result := ReadString('PapelParede', 'Orientacao','');
    finally
      free;
    end;

end;

function TConfiguracao.GetPapelParede: string;
begin
  with TIniFile.Create(
    IncludeTrailingPathDelimiter( ExtractFilePath( Application.ExeName ))+'cfg.ini' )do
    try
      Result := ReadString('PapelParede', 'Local','');
    finally
      free;
    end;
end;

function TConfiguracao.getRelZebrado: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('RELZEBRADO').AsString = 'S');
end;

function TConfiguracao.GetResolucao: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('RESOLUCAO').AsString = 'S');
end;

function TConfiguracao.GetSenhaCaixa: String;
begin
  Result := sqldConfiguracao.FieldByName('SENHACAIXA').AsString;
end;

function TConfiguracao.GetSenhaEstoque: String;
begin
  Result := sqldConfiguracao.FieldByName('SENHAESTOQUE').AsString;
end;

function TConfiguracao.GetVendaConcluida: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('VENDANAOCONC').AsString = 'S');
end;

function TConfiguracao.GetVerificaUPD: Boolean;
begin
  Result := sqldConfiguracao.FieldByName('VERIFICA_UPD').AsString = 'S';
end;

function TConfiguracao.GetVerImpressora: Boolean;
begin
  Result := (sqldConfiguracao.FieldByName('IMPRESSORA').AsString = 'S');
end;

procedure TEmpresa.Atualizar;
begin
  sqldEmpresa.Close;
  sqldEmpresa.Open;
end;

constructor TEmpresa.Create;
begin
  sqldEmpresa := TSQLQuery.Create(nil);
  with sqldEmpresa do
  begin
    SQLConnection := DmPrincipal.Conexao;
    SQL.Text := 'select '+
                   'RAZAOSOCIAL, '+
                   'CNPJ, '+
                   'IE, '+
                   'ENDERECO, '+
                   'CIDADE, '+
                   'BAIRRO, '+
                   'CEP, '+
                   'TELEFONE, '+
                   'FAX, '+
                   'UF, '+
                   'RESPONSAVEL, '+
                   'LOGOEMPRESA, '+
                   'EMAIL '+
                   'from VIEWEMPRESA';
    Open;
  end;
end;

destructor TEmpresa.Free;
begin
  sqldEmpresa.Free;
end;

function TEmpresa.GetBairro: String;
begin
  Result := sqldEmpresa.FieldByName('BAIRRO').AsString;
end;

function TEmpresa.GetCep: String;
begin
  Result := sqldEmpresa.FieldByName('CEP').AsString;
end;

function TEmpresa.GetCidade: String;
begin
  Result := sqldEmpresa.FieldByName('CIDADE').AsString;
end;

function TEmpresa.GetCnpj: String;
begin
  Result := sqldEmpresa.FieldByName('CNPJ').AsString;
end;

function TEmpresa.getEmail: string;
begin
  Result := sqldEmpresa.FieldByName('EMAIL').AsString;
end;

function TEmpresa.GetEmpresa: String;
begin
  Result := sqldEmpresa.FieldByName('RAZAOSOCIAL').AsString;
end;

function TEmpresa.GetEndereco: String;
begin
  Result := sqldEmpresa.FieldByName('ENDERECO').AsString;
end;

function TEmpresa.GetEstado: String;
begin
  Result := sqldEmpresa.FieldByName('UF').AsString;
end;

function TEmpresa.GetFax: String;
begin
  Result := sqldEmpresa.FieldByName('FAX').AsString;
end;

function TEmpresa.GetInscEstadual: String;
begin
  Result := sqldEmpresa.FieldByName('IE').AsString;
end;

function TEmpresa.GetResponsavel: String;
begin
  Result := sqldEmpresa.FieldByName('RESPONSAVEL').AsString;
end;

function TEmpresa.GetTelefone: String;
begin
  Result := sqldEmpresa.FieldByName('TELEFONE').AsString;
end;

procedure TSistema.Atualizar;
begin
  sqldSistema.Close;
  sqldSistema.Open;
end;

constructor TSistema.Create;
begin
  sqldSistema := TSQLQuery.Create(nil);
  with sqldSistema do
  begin
    SQLConnection := DmPrincipal.Conexao;
    SQL.Text := 'select '+
                   '  s.IDSISTEMA,'+
                   '  s.VERSAO,'+
                   '  s.DATAVALIDADE,'+
                   '  s.DATA_ACESSO,'+
                   '  s.SERIAL,'+
                   '  s.HD '+
                   'from SISTEMA s '+
                   'where s.IDSISTEMA = 1';
    Open;
  end;
end;

destructor TSistema.Free;
begin
  sqldSistema.Free;
end;

function TSistema.GetAppCaption: String;
begin
  Result := 'CPR - Sistema Comercial';
end;

function TSistema.GetDataAcesso: String;
begin
  Result := sqldSistema.FieldByName('DATA_ACESSO').AsString;
end;

function TSistema.GetDataValidade: String;
begin
  Result := sqldSistema.FieldByName('DATAVALIDADE').AsString;
end;

function TSistema.GetHD: String;
begin
  Result := sqldSistema.FieldByName('HD').AsString;
end;

function TSistema.GetPastaSistema: string;
begin
  Result := IncludeTrailingBackslash(ExtractFilePath(Application.ExeName));
end;

function TSistema.GetSerial: string;
begin
  Result := sqldSistema.FieldByName('SERIAL').AsString;
end;

function TSistema.GetVersaoApp: String;
begin
  Result := GetBuildInfo(ParamStr(0));
end;

function TSistema.GetVersaoDB: String;
begin
  Result := sqldSistema.FieldByName('VERSAO').AsString;
end;

end.

