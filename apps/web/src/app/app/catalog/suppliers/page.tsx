import { PageHeader } from "@/components/page-header";
import { SectionCard } from "@/components/section-card";
import { SupplierCreateForm } from "@/components/supplier-create-form";
import { SupplierEditor } from "@/components/supplier-editor";
import { getCatalogSnapshot } from "@/server/catalog";

export const dynamic = "force-dynamic";

export default async function SuppliersPage() {
  const { suppliers, counts } = await getCatalogSnapshot();

  return (
    <div className="stack-xl">
      <PageHeader
        title="Fornecedores"
        description="Fornecedores fazem parte do primeiro slice operacional porque sustentam produtos, compras e parte do contexto comercial."
      />

      <div className="dashboard-grid">
        <SectionCard
          eyebrow="Cadastro"
          title="Novo fornecedor"
          description="Cadastre primeiro os fornecedores principais para destravar o cadastro de produtos."
        >
          <SupplierCreateForm />
        </SectionCard>

        <SectionCard
          eyebrow="Resumo"
          title="Visao do modulo"
          description="Esse cadastro abastece produtos e, mais adiante, compras e entradas."
        >
          <ul className="detail-list">
            <li>Total de fornecedores: {counts?.suppliers_count ?? 0}</li>
            <li>Fornecedores ativos: {counts?.active_suppliers_count ?? 0}</li>
            <li>Fornecedores inativos continuam disponiveis para historico.</li>
          </ul>
        </SectionCard>
      </div>

      <SectionCard
        eyebrow="Cadastros atuais"
        title="Fornecedores disponiveis"
        description="Os registros abaixo ja podem ser editados e ativados ou inativados conforme o uso."
      >
        <div className="stage-list">
          {suppliers.length === 0 ? (
            <article className="stage-item">
              <p>Nenhum fornecedor cadastrado ainda.</p>
            </article>
          ) : (
            suppliers.map((supplier) => (
              <SupplierEditor
                key={supplier.id}
                supplier={{
                  id: supplier.id,
                  tradeName: supplier.trade_name,
                  legalName: supplier.legal_name,
                  documentNumber: supplier.document_number,
                  email: supplier.email,
                  phone: supplier.phone,
                  salesContactName: supplier.sales_contact_name,
                  salesContactPhone: supplier.sales_contact_phone,
                  salesContactEmail: supplier.sales_contact_email,
                  notes: supplier.notes,
                  isActive: supplier.is_active,
                  updatedAt: supplier.updated_at
                }}
              />
            ))
          )}
        </div>
      </SectionCard>
    </div>
  );
}
