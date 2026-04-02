import { PageHeader } from "@/components/page-header";
import { SectionCard } from "@/components/section-card";
import { UnitCreateForm } from "@/components/unit-create-form";
import { UnitEditor } from "@/components/unit-editor";
import { getCatalogSnapshot } from "@/server/catalog";

export const dynamic = "force-dynamic";

export default async function UnitsPage() {
  const { units, counts } = await getCatalogSnapshot();

  return (
    <div className="stack-xl">
      <PageHeader
        title="Unidades"
        description="As unidades definem como o produto sera vendido, comprado e exibido em estoque e relatorios."
      />

      <div className="dashboard-grid">
        <SectionCard
          eyebrow="Cadastro"
          title="Nova unidade"
          description="Use nomes claros e siglas curtas para facilitar produto, venda e impressao."
        >
          <UnitCreateForm />
        </SectionCard>

        <SectionCard
          eyebrow="Resumo"
          title="Visao do modulo"
          description="Unidades bem definidas evitam inconsistencias entre compra, estoque e venda."
        >
          <ul className="detail-list">
            <li>Total de unidades cadastradas: {counts?.units_count ?? 0}</li>
            <li>Cada unidade pode ter nome e sigla.</li>
            <li>Produtos vao depender desse cadastro para operar corretamente.</li>
          </ul>
        </SectionCard>
      </div>

      <SectionCard
        eyebrow="Cadastros atuais"
        title="Unidades disponiveis"
        description="As unidades iniciais ja podem ser ajustadas para a realidade do negocio."
      >
        <div className="stage-list">
          {units.length === 0 ? (
            <article className="stage-item">
              <p>Nenhuma unidade cadastrada ainda.</p>
            </article>
          ) : (
            units.map((unit) => (
              <UnitEditor
                key={unit.id}
                unit={{
                  id: unit.id,
                  name: unit.name,
                  abbreviation: unit.abbreviation,
                  createdAt: unit.created_at,
                  updatedAt: unit.updated_at
                }}
              />
            ))
          )}
        </div>
      </SectionCard>
    </div>
  );
}
