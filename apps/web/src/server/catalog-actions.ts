"use server";

import { revalidatePath } from "next/cache";
import { z } from "zod";

import type { FormState } from "@/features/forms/state";
import { sql } from "@/server/db/client";
import { getPrimaryOrganization } from "@/server/setup";

const groupSchema = z.object({
  groupId: z.coerce.number().int().positive().optional(),
  name: z.string().trim().min(2, "Informe um nome com pelo menos 2 caracteres.")
});

const unitSchema = z.object({
  unitId: z.coerce.number().int().positive().optional(),
  name: z.string().trim().min(2, "Informe o nome da unidade."),
  abbreviation: z.string().trim().max(10, "Use uma sigla curta.").nullable()
});

const supplierSchema = z.object({
  supplierId: z.coerce.number().int().positive().optional(),
  tradeName: z.string().trim().min(2, "Informe o nome fantasia."),
  legalName: z.string().trim().nullable(),
  documentNumber: z.string().trim().nullable(),
  email: z.string().trim().email("Informe um e-mail valido.").nullable(),
  phone: z.string().trim().nullable(),
  salesContactName: z.string().trim().nullable(),
  salesContactPhone: z.string().trim().nullable(),
  salesContactEmail: z.string().trim().email("Informe um e-mail valido.").nullable(),
  notes: z.string().trim().nullable()
});

function toNullableText(value: FormDataEntryValue | null) {
  if (typeof value !== "string") {
    return null;
  }

  const trimmed = value.trim();
  return trimmed.length > 0 ? trimmed : null;
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
    throw new Error("Nenhuma organizacao foi encontrada para este catalogo.");
  }

  return organization.id;
}

function revalidateCatalogScreens() {
  revalidatePath("/app");
  revalidatePath("/app/catalog/groups");
  revalidatePath("/app/catalog/units");
  revalidatePath("/app/catalog/suppliers");
  revalidatePath("/app/catalog/products");
}

export async function createProductGroupAction(
  _previousState: FormState,
  formData: FormData
): Promise<FormState> {
  try {
    const organizationId = await requireOrganizationId();
    const payload = groupSchema.parse({
      name: formData.get("name")
    });

    await sql`
      insert into product_groups (organization_id, name)
      values (${organizationId}, ${payload.name})
    `;

    revalidateCatalogScreens();

    return {
      status: "success",
      message: "Grupo cadastrado com sucesso."
    };
  } catch (error) {
    return buildErrorState(error, "Nao foi possivel cadastrar o grupo.");
  }
}

export async function updateProductGroupAction(
  _previousState: FormState,
  formData: FormData
): Promise<FormState> {
  try {
    const organizationId = await requireOrganizationId();
    const payload = groupSchema.parse({
      groupId: formData.get("groupId"),
      name: formData.get("name")
    });

    await sql`
      update product_groups
      set
        name = ${payload.name},
        updated_at = now()
      where id = ${payload.groupId ?? 0}
        and organization_id = ${organizationId}
    `;

    revalidateCatalogScreens();

    return {
      status: "success",
      message: "Grupo atualizado."
    };
  } catch (error) {
    return buildErrorState(error, "Nao foi possivel atualizar o grupo.");
  }
}

export async function createUnitAction(
  _previousState: FormState,
  formData: FormData
): Promise<FormState> {
  try {
    const organizationId = await requireOrganizationId();
    const payload = unitSchema.parse({
      name: formData.get("name"),
      abbreviation: toNullableText(formData.get("abbreviation"))
    });

    await sql`
      insert into units (organization_id, name, abbreviation)
      values (${organizationId}, ${payload.name}, ${payload.abbreviation})
    `;

    revalidateCatalogScreens();

    return {
      status: "success",
      message: "Unidade cadastrada com sucesso."
    };
  } catch (error) {
    return buildErrorState(error, "Nao foi possivel cadastrar a unidade.");
  }
}

export async function updateUnitAction(
  _previousState: FormState,
  formData: FormData
): Promise<FormState> {
  try {
    const organizationId = await requireOrganizationId();
    const payload = unitSchema.parse({
      unitId: formData.get("unitId"),
      name: formData.get("name"),
      abbreviation: toNullableText(formData.get("abbreviation"))
    });

    await sql`
      update units
      set
        name = ${payload.name},
        abbreviation = ${payload.abbreviation},
        updated_at = now()
      where id = ${payload.unitId ?? 0}
        and organization_id = ${organizationId}
    `;

    revalidateCatalogScreens();

    return {
      status: "success",
      message: "Unidade atualizada."
    };
  } catch (error) {
    return buildErrorState(error, "Nao foi possivel atualizar a unidade.");
  }
}

export async function createSupplierAction(
  _previousState: FormState,
  formData: FormData
): Promise<FormState> {
  try {
    const organizationId = await requireOrganizationId();
    const payload = supplierSchema.parse({
      tradeName: formData.get("tradeName"),
      legalName: toNullableText(formData.get("legalName")),
      documentNumber: toNullableText(formData.get("documentNumber")),
      email: toNullableText(formData.get("email")),
      phone: toNullableText(formData.get("phone")),
      salesContactName: toNullableText(formData.get("salesContactName")),
      salesContactPhone: toNullableText(formData.get("salesContactPhone")),
      salesContactEmail: toNullableText(formData.get("salesContactEmail")),
      notes: toNullableText(formData.get("notes"))
    });

    await sql`
      insert into suppliers (
        organization_id,
        trade_name,
        legal_name,
        document_number,
        email,
        phone,
        sales_contact_name,
        sales_contact_phone,
        sales_contact_email,
        notes,
        is_active
      )
      values (
        ${organizationId},
        ${payload.tradeName},
        ${payload.legalName},
        ${payload.documentNumber},
        ${payload.email},
        ${payload.phone},
        ${payload.salesContactName},
        ${payload.salesContactPhone},
        ${payload.salesContactEmail},
        ${payload.notes},
        true
      )
    `;

    revalidateCatalogScreens();

    return {
      status: "success",
      message: "Fornecedor cadastrado com sucesso."
    };
  } catch (error) {
    return buildErrorState(error, "Nao foi possivel cadastrar o fornecedor.");
  }
}

export async function updateSupplierAction(
  _previousState: FormState,
  formData: FormData
): Promise<FormState> {
  try {
    const organizationId = await requireOrganizationId();
    const payload = supplierSchema.parse({
      supplierId: formData.get("supplierId"),
      tradeName: formData.get("tradeName"),
      legalName: toNullableText(formData.get("legalName")),
      documentNumber: toNullableText(formData.get("documentNumber")),
      email: toNullableText(formData.get("email")),
      phone: toNullableText(formData.get("phone")),
      salesContactName: toNullableText(formData.get("salesContactName")),
      salesContactPhone: toNullableText(formData.get("salesContactPhone")),
      salesContactEmail: toNullableText(formData.get("salesContactEmail")),
      notes: toNullableText(formData.get("notes"))
    });

    await sql`
      update suppliers
      set
        trade_name = ${payload.tradeName},
        legal_name = ${payload.legalName},
        document_number = ${payload.documentNumber},
        email = ${payload.email},
        phone = ${payload.phone},
        sales_contact_name = ${payload.salesContactName},
        sales_contact_phone = ${payload.salesContactPhone},
        sales_contact_email = ${payload.salesContactEmail},
        notes = ${payload.notes},
        updated_at = now()
      where id = ${payload.supplierId ?? 0}
        and organization_id = ${organizationId}
    `;

    revalidateCatalogScreens();

    return {
      status: "success",
      message: "Fornecedor atualizado."
    };
  } catch (error) {
    return buildErrorState(error, "Nao foi possivel atualizar o fornecedor.");
  }
}

export async function toggleSupplierStatusAction(
  _previousState: FormState,
  formData: FormData
): Promise<FormState> {
  try {
    const organizationId = await requireOrganizationId();
    const supplierId = z.coerce.number().int().positive().parse(formData.get("supplierId"));

    await sql`
      update suppliers
      set
        is_active = not is_active,
        updated_at = now()
      where id = ${supplierId}
        and organization_id = ${organizationId}
    `;

    revalidateCatalogScreens();

    return {
      status: "success",
      message: "Status do fornecedor atualizado."
    };
  } catch (error) {
    return buildErrorState(error, "Nao foi possivel alterar o status do fornecedor.");
  }
}
