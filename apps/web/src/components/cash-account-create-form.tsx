"use client";

import { useActionState } from "react";

import { FormFeedback } from "@/components/form-feedback";
import { SubmitButton } from "@/components/submit-button";
import { initialFormState } from "@/features/forms/state";
import { createCashAccountAction } from "@/server/setup-actions";

export function CashAccountCreateForm() {
  const [state, formAction] = useActionState(createCashAccountAction, initialFormState);

  return (
    <form action={formAction} className="stack-lg">
      <div className="form-grid">
        <label className="form-field">
          <span>Nova conta-caixa</span>
          <input name="name" placeholder="Ex.: Caixa Loja 2" required />
        </label>
      </div>

      <FormFeedback state={state} />

      <div className="form-actions">
        <SubmitButton idleLabel="Criar conta" pendingLabel="Criando conta..." />
      </div>
    </form>
  );
}
