"use client";

import { useActionState } from "react";

import { DataPoints } from "@/components/data-points";
import { FormFeedback } from "@/components/form-feedback";
import { SubmitButton } from "@/components/submit-button";
import { initialFormState } from "@/features/forms/state";
import { formatDateTime, formatText } from "@/lib/format";
import { updateUnitAction } from "@/server/catalog-actions";

type UnitEditorProps = {
  unit: {
    id: number;
    name: string;
    abbreviation: string | null;
    createdAt: string;
    updatedAt: string;
  };
};

export function UnitEditor({ unit }: UnitEditorProps) {
  const [state, formAction] = useActionState(updateUnitAction, initialFormState);

  return (
    <article className="stage-item">
      <div className="stage-head">
        <h3>{unit.name}</h3>
      </div>

      <DataPoints
        items={[
          {
            label: "Sigla atual",
            value: formatText(unit.abbreviation)
          },
          {
            label: "Atualizado em",
            value: formatDateTime(unit.updatedAt)
          }
        ]}
      />

      <form action={formAction} className="stack-lg">
        <input type="hidden" name="unitId" value={String(unit.id)} />

        <div className="form-grid two-columns">
          <label className="form-field">
            <span>Nome da unidade</span>
            <input name="name" defaultValue={unit.name} required />
          </label>

          <label className="form-field">
            <span>Sigla</span>
            <input name="abbreviation" defaultValue={unit.abbreviation ?? ""} maxLength={10} />
          </label>
        </div>

        <FormFeedback state={state} />

        <div className="form-actions">
          <SubmitButton
            idleLabel="Salvar unidade"
            pendingLabel="Salvando unidade..."
            variant="secondary"
          />
        </div>
      </form>
    </article>
  );
}
