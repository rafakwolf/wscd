"use client";

import { useActionState } from "react";

import { DataPoints } from "@/components/data-points";
import { FormFeedback } from "@/components/form-feedback";
import { StatusBadge } from "@/components/status-badge";
import { SubmitButton } from "@/components/submit-button";
import { initialFormState } from "@/features/forms/state";
import { formatDateTime } from "@/lib/format";
import {
  renameCashAccountAction,
  toggleCashAccountStatusAction
} from "@/server/setup-actions";

type CashAccountEditorProps = {
  account: {
    id: number;
    name: string;
    isInactive: boolean;
    createdAt: string;
    updatedAt: string;
  };
};

export function CashAccountEditor({ account }: CashAccountEditorProps) {
  const [renameState, renameAction] = useActionState(renameCashAccountAction, initialFormState);
  const [statusState, statusAction] = useActionState(
    toggleCashAccountStatusAction,
    initialFormState
  );

  return (
    <article className="stage-item">
      <div className="stage-head">
        <h3>{account.name}</h3>
        <StatusBadge status={account.isInactive ? "later" : "ready"} />
      </div>

      <DataPoints
        items={[
          {
            label: "Status",
            value: account.isInactive ? "Inativa" : "Ativa"
          },
          {
            label: "Criada em",
            value: formatDateTime(account.createdAt)
          },
          {
            label: "Atualizada em",
            value: formatDateTime(account.updatedAt)
          }
        ]}
      />

      <div className="editor-grid">
        <form action={renameAction} className="stack-lg">
          <input type="hidden" name="accountId" value={String(account.id)} />

          <div className="form-grid">
            <label className="form-field">
              <span>Nome da conta</span>
              <input name="name" defaultValue={account.name} required />
            </label>
          </div>

          <FormFeedback state={renameState} />

          <div className="form-actions">
            <SubmitButton
              idleLabel="Salvar nome"
              pendingLabel="Salvando nome..."
              variant="secondary"
            />
          </div>
        </form>

        <form action={statusAction} className="stack-lg">
          <input type="hidden" name="accountId" value={String(account.id)} />

          <p className="muted-note">
            Contas inativas permanecem no historico e podem ser reativadas depois.
          </p>

          <FormFeedback state={statusState} />

          <div className="form-actions">
            <SubmitButton
              idleLabel={account.isInactive ? "Reativar conta" : "Inativar conta"}
              pendingLabel="Atualizando status..."
              variant="secondary"
            />
          </div>
        </form>
      </div>
    </article>
  );
}
