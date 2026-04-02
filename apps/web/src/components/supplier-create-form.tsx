"use client";

import { useActionState } from "react";

import { FormFeedback } from "@/components/form-feedback";
import { SubmitButton } from "@/components/submit-button";
import { initialFormState } from "@/features/forms/state";
import { createSupplierAction } from "@/server/catalog-actions";

export function SupplierCreateForm() {
  const [state, formAction] = useActionState(createSupplierAction, initialFormState);

  return (
    <form action={formAction} className="stack-lg">
      <div className="form-grid two-columns">
        <label className="form-field">
          <span>Nome fantasia</span>
          <input name="tradeName" placeholder="Ex.: Distribuidora Central" required />
        </label>

        <label className="form-field">
          <span>Razao social</span>
          <input name="legalName" />
        </label>

        <label className="form-field">
          <span>Documento</span>
          <input name="documentNumber" />
        </label>

        <label className="form-field">
          <span>Telefone</span>
          <input name="phone" />
        </label>

        <label className="form-field">
          <span>E-mail</span>
          <input name="email" type="email" />
        </label>

        <label className="form-field">
          <span>Contato comercial</span>
          <input name="salesContactName" />
        </label>

        <label className="form-field">
          <span>Telefone do contato</span>
          <input name="salesContactPhone" />
        </label>

        <label className="form-field">
          <span>E-mail do contato</span>
          <input name="salesContactEmail" type="email" />
        </label>

        <label className="form-field full-width">
          <span>Observacoes</span>
          <textarea name="notes" rows={3} />
        </label>
      </div>

      <FormFeedback state={state} />

      <div className="form-actions">
        <SubmitButton
          idleLabel="Cadastrar fornecedor"
          pendingLabel="Cadastrando fornecedor..."
        />
      </div>
    </form>
  );
}
