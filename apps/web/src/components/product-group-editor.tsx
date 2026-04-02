"use client";

import { useActionState } from "react";

import { DataPoints } from "@/components/data-points";
import { FormFeedback } from "@/components/form-feedback";
import { SubmitButton } from "@/components/submit-button";
import { initialFormState } from "@/features/forms/state";
import { formatDateTime } from "@/lib/format";
import { updateProductGroupAction } from "@/server/catalog-actions";

type ProductGroupEditorProps = {
  group: {
    id: number;
    name: string;
    createdAt: string;
    updatedAt: string;
  };
};

export function ProductGroupEditor({ group }: ProductGroupEditorProps) {
  const [state, formAction] = useActionState(updateProductGroupAction, initialFormState);

  return (
    <article className="stage-item">
      <div className="stage-head">
        <h3>{group.name}</h3>
      </div>

      <DataPoints
        items={[
          {
            label: "Criado em",
            value: formatDateTime(group.createdAt)
          },
          {
            label: "Atualizado em",
            value: formatDateTime(group.updatedAt)
          }
        ]}
      />

      <form action={formAction} className="stack-lg">
        <input type="hidden" name="groupId" value={String(group.id)} />

        <div className="form-grid">
          <label className="form-field">
            <span>Nome do grupo</span>
            <input name="name" defaultValue={group.name} required />
          </label>
        </div>

        <FormFeedback state={state} />

        <div className="form-actions">
          <SubmitButton
            idleLabel="Salvar grupo"
            pendingLabel="Salvando grupo..."
            variant="secondary"
          />
        </div>
      </form>
    </article>
  );
}
