import type { Route } from "next";

export type NavItem = {
  href: Route;
  label: string;
  description: string;
};

export type NavSection = {
  title: string;
  items: NavItem[];
};

export const navigation: NavSection[] = [
  {
    title: "Inicio",
    items: [
      {
        href: "/",
        label: "Visao geral",
        description: "Resumo da reescrita e foco atual de entrega."
      },
      {
        href: "/app",
        label: "Painel",
        description: "Status da implementacao e checkpoints do primeiro slice."
      }
    ]
  },
  {
    title: "Configuracao",
    items: [
      {
        href: "/app/setup/company",
        label: "Empresa",
        description: "Identidade do negocio, contato e dados do perfil."
      },
      {
        href: "/app/setup/business",
        label: "Regras do negocio",
        description: "Padroes de juros, estoque, orcamentos e vendas."
      },
      {
        href: "/app/finance/cash-accounts",
        label: "Contas-caixa",
        description: "Contas operacionais usadas pelo caixa."
      }
    ]
  },
  {
    title: "Catalogo",
    items: [
      {
        href: "/app/catalog/groups",
        label: "Grupos",
        description: "Categorias de produtos."
      },
      {
        href: "/app/catalog/units",
        label: "Unidades",
        description: "Unidades comerciais e de estoque."
      },
      {
        href: "/app/catalog/suppliers",
        label: "Fornecedores",
        description: "Base de compras e origem dos produtos."
      },
      {
        href: "/app/catalog/products",
        label: "Produtos",
        description: "Catalogo, precos e estoque."
      }
    ]
  },
  {
    title: "Vendas",
    items: [
      {
        href: "/app/sales/quotations",
        label: "Orcamentos",
        description: "Criar propostas e converter em vendas."
      },
      {
        href: "/app/sales/orders",
        label: "Pedidos e vendas",
        description: "Criar, concluir e baixar vendas."
      }
    ]
  }
];
