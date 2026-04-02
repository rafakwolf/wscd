import { PageHeader } from "@/components/page-header";
import { SectionCard } from "@/components/section-card";

type PlaceholderScreenProps = {
  title: string;
  description: string;
  nextActions: string[];
};

export function PlaceholderScreen({
  title,
  description,
  nextActions
}: PlaceholderScreenProps) {
  return (
    <div className="stack-lg">
      <PageHeader title={title} description={description} />
      <SectionCard
        eyebrow="Objetivo desta etapa"
        title="O que esta pagina deve destravar"
        description="Cada tela temporaria corresponde a um modulo real do plano de reescrita e esta pronta para receber formularios, listas e chamadas de servico."
      >
        <ul className="detail-list">
          {nextActions.map((action) => (
            <li key={action}>{action}</li>
          ))}
        </ul>
      </SectionCard>
    </div>
  );
}
