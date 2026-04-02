export type BuildStage = {
  title: string;
  summary: string;
  status: "ready" | "next" | "later";
};

export const buildStages: BuildStage[] = [
  {
    title: "Fundacao",
    summary: "Bootstrap da organizacao, perfil da empresa, regras do negocio e contas-caixa padrao.",
    status: "ready"
  },
  {
    title: "Catalogo",
    summary: "Entregar grupos, unidades, fornecedores e produtos com CRUDs enxutos.",
    status: "next"
  },
  {
    title: "Vendas",
    summary: "Entregar orcamentos, vendas e baixa de estoque como primeiro loop operacional.",
    status: "next"
  },
  {
    title: "Financeiro",
    summary: "Adicionar contas a receber, contas a pagar, caixa e baixas apos consolidar vendas e compras.",
    status: "later"
  }
];

export const bootstrapChecklist = [
  "Criar o primeiro registro de organizacao.",
  "Vincular o primeiro usuario quando a autenticacao entrar.",
  "Popular perfil da empresa e regras padrao do negocio.",
  "Garantir ao menos uma conta-caixa, uma aliquota, uma unidade e um grupo de produto.",
  "Liberar o primeiro slice vertical: fornecedores -> produtos -> orcamentos -> vendas."
];

export const deliveryPrinciples = [
  "Tratar o Delphi como referencia de negocio, nao como molde de interface.",
  "Manter regras transacionais em servicos, nao em paginas ou formularios.",
  "Preferir inicializacao do zero com seeds em vez de importacao legada.",
  "Entregar o menor fluxo completo antes de ampliar o escopo."
];
