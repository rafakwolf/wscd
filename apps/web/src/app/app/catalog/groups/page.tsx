import { PageHeader } from "@/components/page-header";
import { ProductGroupCreateForm } from "@/components/product-group-create-form";
import { ProductGroupEditor } from "@/components/product-group-editor";
import { SectionCard } from "@/components/section-card";
import { getCatalogSnapshot } from "@/server/catalog";

export const dynamic = "force-dynamic";

export default async function ProductGroupsPage() {
  const { groups, counts } = await getCatalogSnapshot();

  return (
    <div className="stack-xl">
      <PageHeader
        title="Grupos de produtos"
        description="Grupos ajudam a organizar o catalogo, filtrar relatorios e manter produtos semelhantes sob a mesma classificacao."
      />

      <div className="dashboard-grid">
        <SectionCard
          eyebrow="Cadastro"
          title="Novo grupo"
          description="Comece pelos grupos que mais aparecem no dia a dia da operacao."
        >
          <ProductGroupCreateForm />
        </SectionCard>

        <SectionCard
          eyebrow="Resumo"
          title="Visao do modulo"
          description="Essa base sera reutilizada na tela de produtos e nos relatorios."
        >
          <ul className="detail-list">
            <li>Total de grupos cadastrados: {counts?.groups_count ?? 0}</li>
            <li>Os grupos sao unicos por organizacao.</li>
            <li>Produtos poderao filtrar e agrupar por este cadastro.</li>
          </ul>
        </SectionCard>
      </div>

      <SectionCard
        eyebrow="Cadastros atuais"
        title="Grupos disponiveis"
        description="Cada grupo pode ser ajustado sem apagar historico nem afetar outros modulos."
      >
        <div className="stage-list">
          {groups.length === 0 ? (
            <article className="stage-item">
              <p>Nenhum grupo cadastrado ainda.</p>
            </article>
          ) : (
            groups.map((group) => (
              <ProductGroupEditor
                key={group.id}
                group={{
                  id: group.id,
                  name: group.name,
                  createdAt: group.created_at,
                  updatedAt: group.updated_at
                }}
              />
            ))
          )}
        </div>
      </SectionCard>
    </div>
  );
}
