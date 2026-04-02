import { DataPoints } from "@/components/data-points";
import { PageHeader } from "@/components/page-header";
import { SectionCard } from "@/components/section-card";
import { formatCurrency, formatDateTime, formatNumber, formatText } from "@/lib/format";
import { getCatalogSnapshot } from "@/server/catalog";

export const dynamic = "force-dynamic";

export default async function ProductsPage() {
  const { products, counts, groups, units, suppliers } = await getCatalogSnapshot();

  return (
    <div className="stack-xl">
      <PageHeader
        title="Produtos"
        description="Produtos sao o centro do modelo operacional. Esta pagina agora mostra o estado real do catalogo e o que ja esta pronto para o proximo CRUD."
      />

      <div className="dashboard-grid">
        <SectionCard
          eyebrow="Prontidao do catalogo"
          title="Base para o CRUD de produtos"
          description="Antes de cadastrar produtos em volume, vale garantir os cadastros de apoio."
        >
          <DataPoints
            items={[
              {
                label: "Grupos",
                value: String(groups.length)
              },
              {
                label: "Unidades",
                value: String(units.length)
              },
              {
                label: "Fornecedores",
                value: String(suppliers.length)
              },
              {
                label: "Produtos",
                value: String(counts?.products_count ?? 0)
              }
            ]}
          />
        </SectionCard>

        <SectionCard
          eyebrow="Proxima entrega"
          title="O que falta implementar"
          description="O proximo passo natural e transformar esta pagina em um CRUD completo com formulario, busca e arquivo."
        >
          <ul className="detail-list">
            <li>Criar formulario de produto com grupo, unidade, fornecedor e aliquota.</li>
            <li>Adicionar busca por nome, referencia e codigo de barras.</li>
            <li>Permitir arquivamento sem apagar historico.</li>
            <li>Manter movimentacoes de estoque fora do CRUD e dentro dos servicos.</li>
          </ul>
        </SectionCard>
      </div>

      <SectionCard
        eyebrow="Amostra atual"
        title="Produtos cadastrados"
        description="Mesmo antes do CRUD completo, a pagina ja mostra o estado real da tabela de produtos."
      >
        <div className="stage-list">
          {products.length === 0 ? (
            <article className="stage-item">
              <p>Nenhum produto cadastrado ainda.</p>
            </article>
          ) : (
            products.map((product) => (
              <article key={product.id} className="stage-item">
                <div className="stage-head">
                  <h3>{product.name}</h3>
                </div>
                <DataPoints
                  items={[
                    {
                      label: "Referencia",
                      value: formatText(product.reference)
                    },
                    {
                      label: "Codigo de barras",
                      value: formatText(product.barcode)
                    },
                    {
                      label: "Grupo",
                      value: formatText(product.group_name)
                    },
                    {
                      label: "Unidade",
                      value: formatText(product.unit_abbreviation)
                    },
                    {
                      label: "Fornecedor",
                      value: formatText(product.supplier_name)
                    },
                    {
                      label: "Preco de venda",
                      value: formatCurrency(product.sale_price)
                    },
                    {
                      label: "Estoque atual",
                      value: formatNumber(product.current_stock)
                    },
                    {
                      label: "Estoque minimo",
                      value: formatNumber(product.minimum_stock)
                    },
                    {
                      label: "Arquivado",
                      value: product.is_archived ? "Sim" : "Nao"
                    },
                    {
                      label: "Atualizado em",
                      value: formatDateTime(product.updated_at)
                    }
                  ]}
                />
              </article>
            ))
          )}
        </div>
      </SectionCard>
    </div>
  );
}
