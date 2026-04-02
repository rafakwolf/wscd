"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";

import type { FormState } from "@/features/forms/state";
import { sql } from "@/server/db/client";
import { getPrimaryOrganization } from "@/server/setup";

const companyProfileSchema = z.object({
  tradeName: z.string().trim().min(2, "Informe o nome fantasia."),
  legalName: z.string().trim().nullable(),
  documentNumber: z.string().trim().nullable(),
  email: z.string().trim().email("Informe um e-mail valido.").nullable(),
  phone: z.string().trim().nullable(),
  responsibleName: z.string().trim().nullable(),
  addressLine: z.string().trim().nullable(),
  neighborhood: z.string().trim().nullable(),
  stateCode: z.string().trim().max(2, "Use a sigla do estado.").nullable(),
  zipCode: z.string().trim().nullable(),
  logoAssetUrl: z.string().trim().url("Informe uma URL valida.").nullable()
});

const businessSettingsSchema = z.object({
  defaultInterestRate: z.coerce.number().min(0),
  defaultPaymentIntervalDays: z.coerce.number().int().min(1),
  defaultFirstDueDays: z.coerce.number().int().min(0),
  defaultInstallmentCount: z.coerce.number().int().min(1),
  defaultCustomerCreditLimit: z.coerce.number().min(0),
  defaultProductStock: z.coerce.number().min(0),
  defaultProductDiscount: z.coerce.number().min(0),
  quotationRequiresStock: z.boolean(),
  saleRequiresStock: z.boolean(),
  warnOnOpenQuotations: z.boolean(),
  warnOnOpenSales: z.boolean(),
  warnOnOpenPurchases: z.boolean(),
  reportsZebraStriping: z.boolean(),
  quotationTitle: z.string().trim().min(1, "Informe o titulo do orcamento."),
  quotationFooterText: z.string().trim().nullable(),
  saleTitle: z.string().trim().min(1, "Informe o titulo da venda."),
  saleFooterText: z.string().trim().nullable()
});

const cashAccountSchema = z.object({
  accountId: z.coerce.number().int().positive(),
  name: z.string().trim().min(2, "Informe um nome com pelo menos 2 caracteres.")
});

function toNullableText(value: FormDataEntryValue | null) {
  if (typeof value !== "string") {
    return null;
  }

  const trimmed = value.trim();
  return trimmed.length > 0 ? trimmed : null;
}

function toBoolean(formData: FormData, fieldName: string) {
  return formData.get(fieldName) === "on";
}

function buildErrorState(error: unknown, fallback: string): FormState {
  if (error instanceof z.ZodError) {
    return {
      status: "error",
      message: error.issues[0]?.message ?? fallback
    };
  }

  if (error instanceof Error) {
    return {
      status: "error",
      message: error.message
    };
  }

  return {
    status: "error",
    message: fallback
  };
}

async function requireOrganizationId() {
  const organization = await getPrimaryOrganization();

  if (!organization) {
    throw new Error("Nenhuma organizacao foi encontrada para este bootstrap.");
  }

  return organization.id;
}

function revalidateSetupScreens() {
  revalidatePath("/app");
  revalidatePath("/app/setup/company");
  revalidatePath("/app/setup/business");
  revalidatePath("/app/finance/cash-accounts");
}

export async function saveCompanyProfileAction(
  _previousState: FormState,
  formData: FormData
): Promise<FormState> {
  try {
    const organizationId = await requireOrganizationId();
    const payload = companyProfileSchema.parse({
      tradeName: formData.get("tradeName"),
      legalName: toNullableText(formData.get("legalName")),
      documentNumber: toNullableText(formData.get("documentNumber")),
      email: toNullableText(formData.get("email")),
      phone: toNullableText(formData.get("phone")),
      responsibleName: toNullableText(formData.get("responsibleName")),
      addressLine: toNullableText(formData.get("addressLine")),
      neighborhood: toNullableText(formData.get("neighborhood")),
      stateCode: toNullableText(formData.get("stateCode")),
      zipCode: toNullableText(formData.get("zipCode")),
      logoAssetUrl: toNullableText(formData.get("logoAssetUrl"))
    });

    await sql`
      insert into company_profiles (
        organization_id,
        trade_name,
        legal_name,
        document_number,
        email,
        phone,
        responsible_name,
        address_line,
        neighborhood,
        state_code,
        zip_code,
        logo_asset_url
      )
      values (
        ${organizationId},
        ${payload.tradeName},
        ${payload.legalName},
        ${payload.documentNumber},
        ${payload.email},
        ${payload.phone},
        ${payload.responsibleName},
        ${payload.addressLine},
        ${payload.neighborhood},
        ${payload.stateCode},
        ${payload.zipCode},
        ${payload.logoAssetUrl}
      )
      on conflict (organization_id) do update
      set
        trade_name = excluded.trade_name,
        legal_name = excluded.legal_name,
        document_number = excluded.document_number,
        email = excluded.email,
        phone = excluded.phone,
        responsible_name = excluded.responsible_name,
        address_line = excluded.address_line,
        neighborhood = excluded.neighborhood,
        state_code = excluded.state_code,
        zip_code = excluded.zip_code,
        logo_asset_url = excluded.logo_asset_url,
        updated_at = now()
    `;

    revalidateSetupScreens();

    return {
      status: "success",
      message: "Perfil da empresa salvo com sucesso."
    };
  } catch (error) {
    return buildErrorState(error, "Nao foi possivel salvar o perfil da empresa.");
  }
}

export async function saveBusinessSettingsAction(
  _previousState: FormState,
  formData: FormData
): Promise<FormState> {
  try {
    const organizationId = await requireOrganizationId();
    const payload = businessSettingsSchema.parse({
      defaultInterestRate: formData.get("defaultInterestRate"),
      defaultPaymentIntervalDays: formData.get("defaultPaymentIntervalDays"),
      defaultFirstDueDays: formData.get("defaultFirstDueDays"),
      defaultInstallmentCount: formData.get("defaultInstallmentCount"),
      defaultCustomerCreditLimit: formData.get("defaultCustomerCreditLimit"),
      defaultProductStock: formData.get("defaultProductStock"),
      defaultProductDiscount: formData.get("defaultProductDiscount"),
      quotationRequiresStock: toBoolean(formData, "quotationRequiresStock"),
      saleRequiresStock: toBoolean(formData, "saleRequiresStock"),
      warnOnOpenQuotations: toBoolean(formData, "warnOnOpenQuotations"),
      warnOnOpenSales: toBoolean(formData, "warnOnOpenSales"),
      warnOnOpenPurchases: toBoolean(formData, "warnOnOpenPurchases"),
      reportsZebraStriping: toBoolean(formData, "reportsZebraStriping"),
      quotationTitle: formData.get("quotationTitle"),
      quotationFooterText: toNullableText(formData.get("quotationFooterText")),
      saleTitle: formData.get("saleTitle"),
      saleFooterText: toNullableText(formData.get("saleFooterText"))
    });

    await sql`
      update business_settings
      set
        default_interest_rate = ${payload.defaultInterestRate},
        default_payment_interval_days = ${payload.defaultPaymentIntervalDays},
        default_first_due_days = ${payload.defaultFirstDueDays},
        default_installment_count = ${payload.defaultInstallmentCount},
        default_customer_credit_limit = ${payload.defaultCustomerCreditLimit},
        default_product_stock = ${payload.defaultProductStock},
        default_product_discount = ${payload.defaultProductDiscount},
        quotation_requires_stock = ${payload.quotationRequiresStock},
        sale_requires_stock = ${payload.saleRequiresStock},
        warn_on_open_quotations = ${payload.warnOnOpenQuotations},
        warn_on_open_sales = ${payload.warnOnOpenSales},
        warn_on_open_purchases = ${payload.warnOnOpenPurchases},
        reports_zebra_striping = ${payload.reportsZebraStriping},
        quotation_title = ${payload.quotationTitle},
        quotation_footer_text = ${payload.quotationFooterText},
        sale_title = ${payload.saleTitle},
        sale_footer_text = ${payload.saleFooterText},
        updated_at = now()
      where organization_id = ${organizationId}
    `;

    revalidateSetupScreens();

    return {
      status: "success",
      message: "Regras de negocio atualizadas."
    };
  } catch (error) {
    return buildErrorState(error, "Nao foi possivel salvar as regras de negocio.");
  }
}

export async function createCashAccountAction(
  _previousState: FormState,
  formData: FormData
): Promise<FormState> {
  try {
    const organizationId = await requireOrganizationId();
    const name = z
      .string()
      .trim()
      .min(2, "Informe um nome com pelo menos 2 caracteres.")
      .parse(formData.get("name"));

    await sql`
      insert into cash_accounts (organization_id, name, is_inactive)
      values (${organizationId}, ${name}, false)
    `;

    revalidateSetupScreens();

    return {
      status: "success",
      message: "Conta-caixa criada com sucesso."
    };
  } catch (error) {
    return buildErrorState(error, "Nao foi possivel criar a conta-caixa.");
  }
}

export async function renameCashAccountAction(
  _previousState: FormState,
  formData: FormData
): Promise<FormState> {
  try {
    const organizationId = await requireOrganizationId();
    const payload = cashAccountSchema.parse({
      accountId: formData.get("accountId"),
      name: formData.get("name")
    });

    await sql`
      update cash_accounts
      set
        name = ${payload.name},
        updated_at = now()
      where id = ${payload.accountId}
        and organization_id = ${organizationId}
    `;

    revalidateSetupScreens();

    return {
      status: "success",
      message: "Conta-caixa atualizada."
    };
  } catch (error) {
    return buildErrorState(error, "Nao foi possivel atualizar a conta-caixa.");
  }
}

export async function toggleCashAccountStatusAction(
  _previousState: FormState,
  formData: FormData
): Promise<FormState> {
  try {
    const organizationId = await requireOrganizationId();
    const accountId = z.coerce.number().int().positive().parse(formData.get("accountId"));

    await sql`
      update cash_accounts
      set
        is_inactive = not is_inactive,
        updated_at = now()
      where id = ${accountId}
        and organization_id = ${organizationId}
    `;

    revalidateSetupScreens();

    return {
      status: "success",
      message: "Status da conta-caixa atualizado."
    };
  } catch (error) {
    return buildErrorState(error, "Nao foi possivel alterar o status da conta-caixa.");
  }
}
