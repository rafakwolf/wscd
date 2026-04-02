"use client";

import { useActionState } from "react";

import { FormFeedback } from "@/components/form-feedback";
import { SubmitButton } from "@/components/submit-button";
import { initialFormState } from "@/features/forms/state";
import { createUnitAction } from "@/server/catalog-actions";

export function UnitCreateForm() {
  const [state, formAction] = useActionState(createUnitAction, initialFormState);

  return (
    <form action={formAction} className="stack-lg">
      <div className="form-grid two-columns">
        <label className="form-field">
          <span>Nome da unidade</span>
          <input name="name" placeholder="Ex.: Quilograma" required />
        </label>

        <label className="form-field">
          <span>Sigla</span>
          <input name="abbreviation" placeholder="Ex.: KG" maxLength={10} />
        </label>
      </div>

      <FormFeedback state={state} />

      <div className="form-actions">
        <SubmitButton idleLabel="Cadastrar unidade" pendingLabel="Cadastrando unidade..." />
      </div>
    </form>
  );
}
