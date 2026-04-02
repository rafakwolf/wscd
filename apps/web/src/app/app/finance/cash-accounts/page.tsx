import { CashAccountCreateForm } from "@/components/cash-account-create-form";
import { CashAccountEditor } from "@/components/cash-account-editor";
import { DataPoints } from "@/components/data-points";
import { PageHeader } from "@/components/page-header";
import { SectionCard } from "@/components/section-card";
import { getSetupSnapshot } from "@/server/setup";

export const dynamic = "force-dynamic";

export default async function CashAccountsPage() {
  const { businessSettings, cashAccounts } = await getSetupSnapshot();

  const activeAccounts = cashAccounts.filter((account) => !account.is_inactive);

  return (
    <div className="stack-xl">
      <PageHeader
        title="Contas-caixa"
        description="Esta pagina do financeiro agora usa a tabela cash_accounts e ja mostra qual conta operacional sera usada por padrao."
      />

      <div className="dashboard-grid">
        <SectionCard
          eyebrow="Resumo operacional"
          title="Estrutura atual do caixa"
          description="Um ERP pequeno pode comecar com uma conta ativa, mas a estrutura ja suporta mais de uma."
        >
          <DataPoints
            items={[
              {
                label: "Total de contas",
                value: String(cashAccounts.length)
              },
              {
                label: "Contas ativas",
                value: String(activeAccounts.length)
              },
              {
                label: "Contas inativas",
                value: String(cashAccounts.length - activeAccounts.length)
              },
              {
                label: "Conta padrao para baixas",
                value: businessSettings?.default_cash_account_name ?? "-"
              }
            ]}
          />
        </SectionCard>

        <SectionCard
          eyebrow="Cadastro"
          title="Adicionar nova conta-caixa"
          description="Use isso antes de iniciar contas a receber, contas a pagar e baixas no caixa."
        >
          <CashAccountCreateForm />
        </SectionCard>
      </div>

      <SectionCard
        eyebrow="Registros atuais"
        title="Contas disponiveis hoje"
        description="A pagina ja expoe os registros reais que os fluxos financeiros vao usar para baixas e controle de caixa."
      >
        <div className="stage-list">
          {cashAccounts.map((account) => (
            <CashAccountEditor
              key={account.id}
              account={{
                id: account.id,
                name: account.name,
                isInactive: account.is_inactive,
                createdAt: account.created_at,
                updatedAt: account.updated_at
              }}
            />
          ))}
        </div>
      </SectionCard>
    </div>
  );
}
