unit ConstPadrao;

interface

uses
  Messages;

const
  WM_CONFIG_ALTERADO = 1000;
  WM_AFTER_SHOW = 1003;
  WM_NOTIFY_OPEN_FORM =  1004;
  WM_CAIXA_INSERIDO = 1005;
  WM_EXCLUSAO_CAIXA = 1006;
  WM_CONTA_PAGAR_PAGA = 1010;
  WM_CONTA_RECEBER_RECEBIDA = 1011;

  TAG_IGNORE_FECHPARAMS = 987;

  MSG_IMPRESSORA: string = 'Impressora';
  UM_PESQUISAVAZIO: string = 'Nenhum registro encontrado';
  UM_DATAINVALIDA: string = 'Data inválida';
  UM_FILTROINVALIDO: string = 'Filtro inválido';
  UM_OPCAO: string = 'Escolha uma opção';


  FN_AGENDA: string = '';
  DL_AGENDA: string = '';

  FN_CIDADES: string = 'CODCIDADE;DESCRICAO';
  DL_CIDADES: string = 'Código;Descrição';

  FN_CLIENTES: string = 'NOME;TELEFONE;E_MAIL;CPF_CNPJ';
  DL_CLIENTES: string = 'Nome;Telefone;E-mail;Documento';

  FN_CR: string = '';
  DL_CR: string = '';

  FN_ENVELOPE: string = '';
  DL_ENVELOPE: string = '';

  FN_RECIBO: string = '';
  DL_RECIBO: string = '';

  FN_CAIXAS: string = '';
  DL_CAIXAS: string = '';

  FN_CAIXA: string = '';
  DL_CAIXA: string = '';

  FN_BANCO: string = '';
  DL_BANCO: string = '';

  FN_FORN: string = '';
  DL_FORN: string = '';

  FN_CP: string = '';
  DL_CP: string = '';

  FN_USUARIOS: string = '';
  DL_USUARIOS: string = '';

  FN_ETQ: string = '';
  DL_ETQ: string = '';

  FN_PERFIL: string = '';
  DL_PERFIL: string = '';

implementation

end.
