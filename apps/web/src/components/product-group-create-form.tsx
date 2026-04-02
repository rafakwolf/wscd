"use client";

import { useActionState } from "react";

import { FormFeedback } from "@/components/form-feedback";
import { SubmitButton } from "@/components/submit-button";
import { initialFormState } from "@/features/forms/state";
import { createProductGroupAction } from "@/server/catalog-actions";

export function ProductGroupCreateForm() {
  const [state, formAction] = useActionState(createProductGroupAction, initialFormState);

  return (
    <form action={formAction} className="stack-lg">
      <div className="form-grid">
        <label className="form-field">
          <span>Novo grupo</span>
          <input name="name" placeholder="Ex.: Padaria" required />
        </label>
      </div>

      <FormFeedback state={state} />

      <div className="form-actions">
        <SubmitButton idleLabel="Cadastrar grupo" pendingLabel="Cadastrando grupo..." />
      </div>
    </form>
  );
}
