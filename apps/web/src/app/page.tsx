import Link from "next/link";

import { Checklist } from "@/components/checklist";
import { SectionCard } from "@/components/section-card";
import { StatusBadge } from "@/components/status-badge";
import { buildStages, bootstrapChecklist, deliveryPrinciples } from "@/features/bootstrap/blueprint";

export default function LandingPage() {
  return (
    <main className="landing-shell">
      <section className="hero-panel">
        <p className="hero-kicker">Migracao WSCD</p>
        <h1>Uma base web limpa para o ERP legado de pequenos negocios.</h1>
        <p className="hero-copy">
          Este app nasce como uma reescrita do zero. O codigo Delphi continua como referencia de
          negocio, enquanto o produto web cresce a partir de servicos explicitos, PostgreSQL e
          fluxos operacionais modernos.
        </p>
        <div className="hero-actions">
          <Link href="/app" className="button-primary">
            Abrir painel de implementacao
          </Link>
          <Link href="/app/sales/orders" className="button-secondary">
            Ver o primeiro fluxo de valor
          </Link>
        </div>
      </section>

      <section className="landing-grid">
        <SectionCard
          eyebrow="Direcao do projeto"
          title="O que ja esta decidido"
          description="O app web nao e um projeto de ETL. Ele e uma reescrita controlada, com banco novo e um ERP focado no essencial."
        >
          <Checklist items={deliveryPrinciples} />
        </SectionCard>

        <SectionCard
          eyebrow="Inicializacao"
          title="Inicializacao por seeds"
          description="Como o projeto Delphi nunca entrou em producao, podemos trocar migracao de dados por um fluxo de seeds e configuracao inicial."
        >
          <Checklist items={bootstrapChecklist} />
        </SectionCard>

        <SectionCard
          eyebrow="Ordem de execucao"
          title="Fases de implementacao"
          description="Essas fases espelham a documentacao e mantem o primeiro slice operacional pequeno e coerente."
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
      </section>
    </main>
  );
}
