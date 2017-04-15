unit ConstPadrao;

interface

uses
  Winapi.Messages;

const
  WM_CONFIG_ALTERADO = WM_USER + 1000;
  WM_CONFIG_GLOBAL_ALTERADO = WM_USER + 1001;
  WM_AFTER_SHOW = WM_USER + 1003;
  WM_NOTIFY_OPEN_FORM = WM_USER + 1004;
  WM_CAIXA_INSERIDO = WM_USER + 1005;
  WM_EXCLUSAO_CAIXA = WM_USER  + 1006;
  WM_COMPRA_NAO_CONC = WM_USER + 1007;
  WM_COMPRA_CONCLUIDA = WM_USER + 1008;
  WM_VENDA_CONCLUIDA = WM_USER + 1009;
  WM_CONTA_PAGAR_PAGA = WM_USER + 1010;
  WM_CONTA_RECEBER_RECEBIDA = WM_USER + 1011;
  WM_CAMPO_CONFIG_NOTA = WM_USER + 1012;

  TAG_IGNORE_FECHPARAMS = 987;

  MSG_IMPRESSORA: string = 'Impressora';
  UM_PESQUISAVAZIO: string = 'Nenhum registro encontrado';
  UM_DATAINVALIDA: string = 'Data inválida';
  UM_FILTROINVALIDO: string = 'Filtro inválido';
  UM_OPCAO: string = 'Escolha uma opção';


  FN_AGENDA: string = '';
  DL_AGENDA: string = '';

  FN_DUPLICATA: string = '';
  DL_DUPLICATA: string = '';

  FN_CIDADES: string = '';
  DL_CIDADES: string = '';

  FN_CLIENTES: string = '';
  DL_CLIENTES: string = '';

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

  FN_CHEQUE: string = '';
  DL_CHEQUE: string = '';

  FN_BANCO: string = '';
  DL_BANCO: string = '';

  FN_FORN: string = '';
  DL_FORN: string = '';

  FN_PRODUTOS: string = '';
  DL_PRODUTOS: string = '';

  FN_CFOP: string = '';
  DL_CFOP: string = '';

  FN_CP: string = '';
  DL_CP: string = '';

  FN_ETQPROD: string = '';
  DL_ETQPROD: string = '';

  FN_VENDEDOR: string = '';
  DL_VENDEDOR: string = '';

  FN_PERDAS: string = '';
  DL_PERDAS: string = '';

  FN_PROMOCAO: string = '';
  DL_PROMOCAO: string = '';

  FN_GRUPOS: string = '';
  DL_GRUPOS: string = '';

  FN_USUARIOS: string = '';
  DL_USUARIOS: string = '';

  FN_ALIQUOTAS: string = '';
  DL_ALIQUOTAS: string = '';

  FN_UNIDADES: string = '';
  DL_UNIDADES: string = '';

  FN_CONFIGNOTA: string = '';
  DL_CONFIGNOTA: string = '';

  FN_ETQ: string = '';
  DL_ETQ: string = '';

  FN_PERFIL: string = '';
  DL_PERFIL: string = '';

implementation

end.
