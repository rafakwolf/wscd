"use client";

import { useActionState } from "react";

import { DataPoints } from "@/components/data-points";
import { FormFeedback } from "@/components/form-feedback";
import { StatusBadge } from "@/components/status-badge";
import { SubmitButton } from "@/components/submit-button";
import { initialFormState } from "@/features/forms/state";
import { formatDateTime, formatText } from "@/lib/format";
import {
  toggleSupplierStatusAction,
  updateSupplierAction
} from "@/server/catalog-actions";

type SupplierEditorProps = {
  supplier: {
    id: number;
    tradeName: string;
    legalName: string | null;
    documentNumber: string | null;
    email: string | null;
    phone: string | null;
    salesContactName: string | null;
    salesContactPhone: string | null;
    salesContactEmail: string | null;
    notes: string | null;
    isActive: boolean;
    updatedAt: string;
  };
};

export function SupplierEditor({ supplier }: SupplierEditorProps) {
  const [updateState, updateAction] = useActionState(updateSupplierAction, initialFormState);
  const [toggleState, toggleAction] = useActionState(
    toggleSupplierStatusAction,
    initialFormState
  );

  return (
    <article className="stage-item">
      <div className="stage-head">
        <h3>{supplier.tradeName}</h3>
        <StatusBadge status={supplier.isActive ? "ready" : "later"} />
      </div>

      <DataPoints
        items={[
          {
            label: "Razao social",
            value: formatText(supplier.legalName)
          },
          {
            label: "Documento",
            value: formatText(supplier.documentNumber)
          },
          {
            label: "Contato comercial",
            value: formatText(supplier.salesContactName)
          },
          {
            label: "Atualizado em",
            value: formatDateTime(supplier.updatedAt)
          }
        ]}
      />

      <div className="editor-grid">
        <form action={updateAction} className="stack-lg">
          <input type="hidden" name="supplierId" value={String(supplier.id)} />

          <div className="form-grid two-columns">
            <label className="form-field">
              <span>Nome fantasia</span>
              <input name="tradeName" defaultValue={supplier.tradeName} required />
            </label>

            <label className="form-field">
              <span>Razao social</span>
              <input name="legalName" defaultValue={supplier.legalName ?? ""} />
            </label>

            <label className="form-field">
              <span>Documento</span>
              <input name="documentNumber" defaultValue={supplier.documentNumber ?? ""} />
            </label>

            <label className="form-field">
              <span>Telefone</span>
              <input name="phone" defaultValue={supplier.phone ?? ""} />
            </label>

            <label className="form-field">
              <span>E-mail</span>
              <input name="email" type="email" defaultValue={supplier.email ?? ""} />
            </label>

            <label className="form-field">
              <span>Contato comercial</span>
              <input name="salesContactName" defaultValue={supplier.salesContactName ?? ""} />
            </label>

            <label className="form-field">
              <span>Telefone do contato</span>
              <input name="salesContactPhone" defaultValue={supplier.salesContactPhone ?? ""} />
            </label>

            <label className="form-field">
              <span>E-mail do contato</span>
              <input
                name="salesContactEmail"
                type="email"
                defaultValue={supplier.salesContactEmail ?? ""}
              />
            </label>

            <label className="form-field full-width">
              <span>Observacoes</span>
              <textarea name="notes" rows={3} defaultValue={supplier.notes ?? ""} />
            </label>
          </div>

          <FormFeedback state={updateState} />

          <div className="form-actions">
            <SubmitButton
              idleLabel="Salvar fornecedor"
              pendingLabel="Salvando fornecedor..."
              variant="secondary"
            />
          </div>
        </form>

        <form action={toggleAction} className="stack-lg">
          <input type="hidden" name="supplierId" value={String(supplier.id)} />

          <p className="muted-note">
            Fornecedores inativos saem do fluxo principal, mas continuam disponiveis para
            historico e referencia.
          </p>

          <FormFeedback state={toggleState} />

          <div className="form-actions">
            <SubmitButton
              idleLabel={supplier.isActive ? "Inativar fornecedor" : "Reativar fornecedor"}
              pendingLabel="Atualizando status..."
              variant="secondary"
            />
          </div>
        </form>
      </div>
    </article>
  );
}
