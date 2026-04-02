import { CompanyProfileForm } from "@/components/company-profile-form";
import { DataPoints } from "@/components/data-points";
import { PageHeader } from "@/components/page-header";
import { SectionCard } from "@/components/section-card";
import { formatDateTime, formatText } from "@/lib/format";
import { getSetupSnapshot } from "@/server/setup";

export const dynamic = "force-dynamic";

export default async function CompanySetupPage() {
  const { organization, companyProfile } = await getSetupSnapshot();

  return (
    <div className="stack-xl">
      <PageHeader
        title="Perfil da empresa"
        description="Esta pagina agora le a identidade atual da organizacao no PostgreSQL. Ela e a base de relatorios, cabecalhos e futuras edicoes de configuracao."
      />

      <div className="dashboard-grid">
        <SectionCard
          eyebrow="Edicao"
          title="Atualizar dados da empresa"
          description="Este formulario ja grava em company_profiles e mantem o fluxo de configuracao dentro do app web."
        >
          <CompanyProfileForm
            values={{
              tradeName: companyProfile?.trade_name ?? organization?.name ?? "",
              legalName: companyProfile?.legal_name ?? "",
              documentNumber: companyProfile?.document_number ?? "",
              email: companyProfile?.email ?? "",
              phone: companyProfile?.phone ?? "",
              responsibleName: companyProfile?.responsible_name ?? "",
              addressLine: companyProfile?.address_line ?? "",
              neighborhood: companyProfile?.neighborhood ?? "",
              stateCode: companyProfile?.state_code ?? "",
              zipCode: companyProfile?.zip_code ?? "",
              logoAssetUrl: companyProfile?.logo_asset_url ?? ""
            }}
          />
        </SectionCard>

        <SectionCard
          eyebrow="Organizacao"
          title={organization ? organization.name : "Nenhuma organizacao encontrada"}
          description="O escopo atual usa a primeira organizacao como tenant ativo ate a autenticacao e os memberships entrarem."
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
                label: "Razao social",
                value: formatText(companyProfile?.legal_name)
              },
              {
                label: "Responsavel",
                value: formatText(companyProfile?.responsible_name)
              }
            ]}
          />
        </SectionCard>

        <SectionCard
          eyebrow="Contato"
          title="Identidade comercial"
          description="Esses campos ja sao suficientes para cabecalhos do ERP e relatorios HTML impressos."
        >
          <DataPoints
            items={[
              {
                label: "Documento",
                value: formatText(companyProfile?.document_number)
              },
              {
                label: "E-mail",
                value: formatText(companyProfile?.email)
              },
              {
                label: "Telefone",
                value: formatText(companyProfile?.phone)
              },
              {
                label: "Ultima atualizacao",
                value: formatDateTime(companyProfile?.updated_at ?? null)
              }
            ]}
          />
        </SectionCard>
      </div>

      <SectionCard
        eyebrow="Endereco"
        title="Localizacao e apresentacao"
        description="A camada de formulario ja veio, e a pagina expoe exatamente o contrato de dados que o fluxo de configuracao edita."
      >
        <DataPoints
          items={[
            {
              label: "Endereco",
              value: formatText(companyProfile?.address_line)
            },
            {
              label: "Bairro",
              value: formatText(companyProfile?.neighborhood)
            },
            {
              label: "Estado",
              value: formatText(companyProfile?.state_code)
            },
            {
              label: "CEP",
              value: formatText(companyProfile?.zip_code)
            },
            {
              label: "Logo",
              value: formatText(companyProfile?.logo_asset_url)
            }
          ]}
        />
      </SectionCard>
    </div>
  );
}
