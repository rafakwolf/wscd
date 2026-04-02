"use client";

import { useActionState } from "react";

import { FormFeedback } from "@/components/form-feedback";
import { SubmitButton } from "@/components/submit-button";
import { initialFormState } from "@/features/forms/state";
import { saveBusinessSettingsAction } from "@/server/setup-actions";

type BusinessSettingsFormProps = {
  values: {
    defaultInterestRate: string;
    defaultPaymentIntervalDays: number;
    defaultFirstDueDays: number;
    defaultInstallmentCount: number;
    defaultCustomerCreditLimit: string;
    defaultProductStock: string;
    defaultProductDiscount: string;
    quotationRequiresStock: boolean;
    saleRequiresStock: boolean;
    warnOnOpenQuotations: boolean;
    warnOnOpenSales: boolean;
    warnOnOpenPurchases: boolean;
    reportsZebraStriping: boolean;
    quotationTitle: string;
    quotationFooterText: string;
    saleTitle: string;
    saleFooterText: string;
  };
};

export function BusinessSettingsForm({ values }: BusinessSettingsFormProps) {
  const [state, formAction] = useActionState(saveBusinessSettingsAction, initialFormState);

  return (
    <form action={formAction} className="stack-lg">
      <div className="form-grid three-columns">
        <label className="form-field">
          <span>Juros padrao (%)</span>
          <input
            name="defaultInterestRate"
            type="number"
            min="0"
            step="0.01"
            defaultValue={values.defaultInterestRate}
            required
          />
        </label>

        <label className="form-field">
          <span>Intervalo entre parcelas</span>
          <input
            name="defaultPaymentIntervalDays"
            type="number"
            min="1"
            step="1"
            defaultValue={values.defaultPaymentIntervalDays}
            required
          />
        </label>

        <label className="form-field">
          <span>Primeiro vencimento</span>
          <input
            name="defaultFirstDueDays"
            type="number"
            min="0"
            step="1"
            defaultValue={values.defaultFirstDueDays}
            required
          />
        </label>

        <label className="form-field">
          <span>Parcelas padrao</span>
          <input
            name="defaultInstallmentCount"
            type="number"
            min="1"
            step="1"
            defaultValue={values.defaultInstallmentCount}
            required
          />
        </label>

        <label className="form-field">
          <span>Limite de credito</span>
          <input
            name="defaultCustomerCreditLimit"
            type="number"
            min="0"
            step="0.01"
            defaultValue={values.defaultCustomerCreditLimit}
            required
          />
        </label>

        <label className="form-field">
          <span>Estoque padrao</span>
          <input
            name="defaultProductStock"
            type="number"
            min="0"
            step="0.001"
            defaultValue={values.defaultProductStock}
            required
          />
        </label>

        <label className="form-field">
          <span>Desconto padrao (%)</span>
          <input
            name="defaultProductDiscount"
            type="number"
            min="0"
            step="0.01"
            defaultValue={values.defaultProductDiscount}
            required
          />
        </label>

        <label className="form-field">
          <span>Titulo do orcamento</span>
          <input name="quotationTitle" defaultValue={values.quotationTitle} required />
        </label>

        <label className="form-field">
          <span>Titulo da venda</span>
          <input name="saleTitle" defaultValue={values.saleTitle} required />
        </label>

        <label className="form-field full-width">
          <span>Rodape do orcamento</span>
          <textarea name="quotationFooterText" defaultValue={values.quotationFooterText} rows={3} />
        </label>

        <label className="form-field full-width">
          <span>Rodape da venda</span>
          <textarea name="saleFooterText" defaultValue={values.saleFooterText} rows={3} />
        </label>
      </div>

      <div className="toggle-grid">
        <label className="toggle-field">
          <input
            name="quotationRequiresStock"
            type="checkbox"
            defaultChecked={values.quotationRequiresStock}
          />
          <span>Orcamento exige estoque</span>
        </label>

        <label className="toggle-field">
          <input
            name="saleRequiresStock"
            type="checkbox"
            defaultChecked={values.saleRequiresStock}
          />
          <span>Venda exige estoque</span>
        </label>

        <label className="toggle-field">
          <input
            name="warnOnOpenQuotations"
            type="checkbox"
            defaultChecked={values.warnOnOpenQuotations}
          />
          <span>Alertar orcamentos em aberto</span>
        </label>

        <label className="toggle-field">
          <input
            name="warnOnOpenSales"
            type="checkbox"
            defaultChecked={values.warnOnOpenSales}
          />
          <span>Alertar vendas em aberto</span>
        </label>

        <label className="toggle-field">
          <input
            name="warnOnOpenPurchases"
            type="checkbox"
            defaultChecked={values.warnOnOpenPurchases}
          />
          <span>Alertar compras em aberto</span>
        </label>

        <label className="toggle-field">
          <input
            name="reportsZebraStriping"
            type="checkbox"
            defaultChecked={values.reportsZebraStriping}
          />
          <span>Relatorios com listras</span>
        </label>
      </div>

      <FormFeedback state={state} />

      <div className="form-actions">
        <SubmitButton idleLabel="Salvar regras" pendingLabel="Salvando regras..." />
      </div>
    </form>
  );
}
