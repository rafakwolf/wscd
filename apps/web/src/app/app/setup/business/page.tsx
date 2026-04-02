import { BusinessSettingsForm } from "@/components/business-settings-form";
import { DataPoints } from "@/components/data-points";
import { PageHeader } from "@/components/page-header";
import { SectionCard } from "@/components/section-card";
import { formatBoolean, formatCurrency, formatNumber, formatText } from "@/lib/format";
import { getSetupSnapshot } from "@/server/setup";

export const dynamic = "force-dynamic";

export default async function BusinessSettingsPage() {
  const { businessSettings } = await getSetupSnapshot();

  return (
    <div className="stack-xl">
      <PageHeader
        title="Regras do negocio"
        description="Os valores abaixo agora vem direto de business_settings e podem ser reutilizados pelos futuros servicos de vendas, compras e financeiro."
      />

      <div className="dashboard-grid">
        <SectionCard
          eyebrow="Edicao"
          title="Atualizar regras do negocio"
          description="Esses valores agora persistem direto em business_settings e ja podem alimentar os futuros fluxos de vendas e financeiro."
        >
          <BusinessSettingsForm
            values={{
              defaultInterestRate: businessSettings?.default_interest_rate ?? "0",
              defaultPaymentIntervalDays: businessSettings?.default_payment_interval_days ?? 30,
              defaultFirstDueDays: businessSettings?.default_first_due_days ?? 30,
              defaultInstallmentCount: businessSettings?.default_installment_count ?? 1,
              defaultCustomerCreditLimit:
                businessSettings?.default_customer_credit_limit ?? "0",
              defaultProductStock: businessSettings?.default_product_stock ?? "0",
              defaultProductDiscount: businessSettings?.default_product_discount ?? "0",
              quotationRequiresStock: businessSettings?.quotation_requires_stock ?? false,
              saleRequiresStock: businessSettings?.sale_requires_stock ?? true,
              warnOnOpenQuotations: businessSettings?.warn_on_open_quotations ?? true,
              warnOnOpenSales: businessSettings?.warn_on_open_sales ?? true,
              warnOnOpenPurchases: businessSettings?.warn_on_open_purchases ?? true,
              reportsZebraStriping: businessSettings?.reports_zebra_striping ?? true,
              quotationTitle: businessSettings?.quotation_title ?? "Orcamento",
              quotationFooterText: businessSettings?.quotation_footer_text ?? "",
              saleTitle: businessSettings?.sale_title ?? "Venda",
              saleFooterText: businessSettings?.sale_footer_text ?? ""
            }}
          />
        </SectionCard>

        <SectionCard
          eyebrow="Padroes financeiros"
          title="Cobranca e parcelamento"
          description="Essas regras substituem a parte util da configuracao local do Delphi, mas em formato orientado ao web."
        >
          <DataPoints
            items={[
              {
                label: "Taxa de juros",
                value: `${formatNumber(businessSettings?.default_interest_rate)}%`
              },
              {
                label: "Parcelas",
                value: String(businessSettings?.default_installment_count ?? 0)
              },
              {
                label: "Primeiro vencimento",
                value: String(businessSettings?.default_first_due_days ?? 0)
              },
              {
                label: "Intervalo entre parcelas",
                value: `${businessSettings?.default_payment_interval_days ?? 0} dias`
              },
              {
                label: "Limite de credito padrao",
                value: formatCurrency(businessSettings?.default_customer_credit_limit)
              }
            ]}
          />
        </SectionCard>

        <SectionCard
          eyebrow="Padroes de catalogo"
          title="Estoque e precificacao"
          description="Esses valores sao o fallback inicial quando o catalogo comecar a receber formularios reais de produto."
        >
          <DataPoints
            items={[
              {
                label: "Estoque padrao",
                value: formatNumber(businessSettings?.default_product_stock)
              },
              {
                label: "Desconto padrao",
                value: `${formatNumber(businessSettings?.default_product_discount)}%`
              },
              {
                label: "Aliquota padrao",
                value: formatText(businessSettings?.default_tax_rate_name)
              },
              {
                label: "Conta-caixa padrao",
                value: formatText(businessSettings?.default_cash_account_name)
              }
            ]}
          />
        </SectionCard>
      </div>

      <div className="dashboard-grid">
        <SectionCard
          eyebrow="Regras de fluxo"
          title="Guardas de vendas e compras"
          description="Esses controles depois vao dirigir validacoes e alertas no nivel de servico, nao apenas na interface."
        >
          <DataPoints
            items={[
              {
                label: "Orcamento exige estoque",
                value: formatBoolean(businessSettings?.quotation_requires_stock ?? false)
              },
              {
                label: "Venda exige estoque",
                value: formatBoolean(businessSettings?.sale_requires_stock ?? false)
              },
              {
                label: "Alertar orcamentos",
                value: formatBoolean(businessSettings?.warn_on_open_quotations ?? false)
              },
              {
                label: "Alertar vendas",
                value: formatBoolean(businessSettings?.warn_on_open_sales ?? false)
              },
              {
                label: "Alertar compras",
                value: formatBoolean(businessSettings?.warn_on_open_purchases ?? false)
              },
              {
                label: "Relatorios zebrados",
                value: formatBoolean(businessSettings?.reports_zebra_striping ?? false)
              }
            ]}
          />
        </SectionCard>

        <SectionCard
          eyebrow="Textos comerciais"
          title="Padroes de exibicao"
          description="Esses valores ja bastam para suportar relatorios HTML leves antes de um construtor de relatorios mais rico."
        >
          <DataPoints
            items={[
              {
                label: "Titulo do orcamento",
                value: formatText(businessSettings?.quotation_title)
              },
              {
                label: "Rodape do orcamento",
                value: formatText(businessSettings?.quotation_footer_text)
              },
              {
                label: "Titulo da venda",
                value: formatText(businessSettings?.sale_title)
              },
              {
                label: "Rodape da venda",
                value: formatText(businessSettings?.sale_footer_text)
              }
            ]}
          />
        </SectionCard>
      </div>
    </div>
  );
}
