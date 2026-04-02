import { Checklist } from "@/components/checklist";
import { DataPoints } from "@/components/data-points";
import { PageHeader } from "@/components/page-header";
import { SectionCard } from "@/components/section-card";
import { StatusBadge } from "@/components/status-badge";
import { buildStages, bootstrapChecklist } from "@/features/bootstrap/blueprint";
import { formatDateTime, formatText } from "@/lib/format";
import { getBootstrapState } from "@/server/bootstrap";
import { getSetupSnapshot } from "@/server/setup";

export const dynamic = "force-dynamic";

export default async function DashboardPage() {
  const [bootstrapState, setupSnapshot] = await Promise.all([
    getBootstrapState(),
    getSetupSnapshot()
  ]);

  const { organization, companyProfile, businessSettings, cashAccounts, seedCounts } =
    setupSnapshot;
  const counts = bootstrapState.ok ? bootstrapState.counts : null;

  const readinessStatus = bootstrapState.bootstrapReady ? "ready" : "next";

  return (
    <div className="stack-xl">
      <PageHeader
        title="Painel de implementacao"
        description="O primeiro slice ja esta conectado ao PostgreSQL. Este painel mostra se o bootstrap inicial ja tem configuracao suficiente para iniciar os modulos operacionais."
      />

      <div className="dashboard-grid">
        <SectionCard
          eyebrow="Status em tempo real"
          title="Prontidao do bootstrap"
          description="Este status agora vem do banco de dados, nao mais de dados estaticos de planejamento."
        >
          <div className="stack-lg">
            <div className="stage-head">
              <h3>Ambiente atual</h3>
              <StatusBadge status={readinessStatus} />
            </div>
            <DataPoints
              items={[
                {
                  label: "Organizacao",
                  value: organization ? organization.name : "Nenhuma organizacao encontrada"
                },
                {
                  label: "Bootstrap pronto",
                  value: bootstrapState.bootstrapReady ? "Sim" : "Nao"
                },
                {
                  label: "Perfis de empresa",
                  value: counts ? String(counts.company_profiles_count) : "-"
                },
                {
                  label: "Contas-caixa",
                  value: counts ? String(counts.cash_accounts_count) : "-"
                }
              ]}
            />
          </div>
        </SectionCard>

        <SectionCard
          eyebrow="Saude dos seeds"
          title="Dados fundacionais"
          description="Esses registros iniciais destravam os primeiros fluxos de catalogo e financeiro."
        >
          <DataPoints
            items={[
              {
                label: "Unidades",
                value: seedCounts ? String(seedCounts.units_count) : "-"
              },
              {
                label: "Grupos de produtos",
                value: seedCounts ? String(seedCounts.product_groups_count) : "-"
              },
              {
                label: "Aliquotas",
                value: seedCounts ? String(seedCounts.tax_rates_count) : "-"
              },
              {
                label: "Contas-caixa ativas",
                value: String(cashAccounts.filter((account) => !account.is_inactive).length)
              }
            ]}
          />
        </SectionCard>
      </div>

      <div className="dashboard-grid">
        <SectionCard
          eyebrow="Organizacao atual"
          title={organization ? organization.name : "Aguardando bootstrap"}
          description="Enquanto a autenticacao nao entra, o app web opera sobre a primeira organizacao disponivel."
        >
          <DataPoints
            items={[
              {
                label: "Slug",
                value: formatText(organization?.slug)
              },
              {
                label: "Nome fantasia",
                value: formatText(companyProfile?.trade_name)
              },
              {
                label: "Responsavel",
                value: formatText(companyProfile?.responsible_name)
              },
              {
                label: "Criado em",
                value: formatDateTime(organization?.created_at ?? null)
              }
            ]}
          />
        </SectionCard>

        <SectionCard
          eyebrow="Padroes atuais"
          title="Regras de vendas e financeiro"
          description="Esses sao os primeiros valores padrao que os servicos de vendas e compras vao consumir."
        >
          <DataPoints
            items={[
              {
                label: "Titulo do orcamento",
                value: formatText(businessSettings?.quotation_title)
              },
              {
                label: "Titulo da venda",
                value: formatText(businessSettings?.sale_title)
              },
              {
                label: "Conta-caixa padrao",
                value: formatText(businessSettings?.default_cash_account_name)
              },
              {
                label: "Atualizado em",
                value: formatDateTime(businessSettings?.updated_at ?? null)
              }
            ]}
          />
        </SectionCard>
      </div>

      <SectionCard
        eyebrow="Roadmap"
        title="Etapas de construcao"
        description="Estas sao as mesmas etapas refletidas na documentacao de migracao e no planejamento da API."
      >
        <div className="stage-list">
          {buildStages.map((stage) => (
            <article key={stage.title} className="stage-item">
              <div className="stage-head">
                <h3>{stage.title}</h3>
                <StatusBadge status={stage.status} />
              </div>
              <p>{stage.summary}</p>
            </article>
          ))}
        </div>
      </SectionCard>

      <SectionCard
        eyebrow="Foco imediato"
        title="O que vem agora"
          description="O checklist de planejamento continua util, mas agora sobre um ambiente inicializado e funcional."
      >
        <Checklist items={bootstrapChecklist.slice(0, 4)} />
      </SectionCard>
    </div>
  );
}
