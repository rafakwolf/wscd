"use client";

import { useActionState } from "react";

import { FormFeedback } from "@/components/form-feedback";
import { SubmitButton } from "@/components/submit-button";
import { initialFormState } from "@/features/forms/state";
import { saveCompanyProfileAction } from "@/server/setup-actions";

type CompanyProfileFormProps = {
  values: {
    tradeName: string;
    legalName: string;
    documentNumber: string;
    email: string;
    phone: string;
    responsibleName: string;
    addressLine: string;
    neighborhood: string;
    stateCode: string;
    zipCode: string;
    logoAssetUrl: string;
  };
};

export function CompanyProfileForm({ values }: CompanyProfileFormProps) {
  const [state, formAction] = useActionState(saveCompanyProfileAction, initialFormState);

  return (
    <form action={formAction} className="stack-lg">
      <div className="form-grid two-columns">
        <label className="form-field">
          <span>Nome fantasia</span>
          <input name="tradeName" defaultValue={values.tradeName} required />
        </label>

        <label className="form-field">
          <span>Razao social</span>
          <input name="legalName" defaultValue={values.legalName} />
        </label>

        <label className="form-field">
          <span>Documento</span>
          <input name="documentNumber" defaultValue={values.documentNumber} />
        </label>

        <label className="form-field">
          <span>Responsavel</span>
          <input name="responsibleName" defaultValue={values.responsibleName} />
        </label>

        <label className="form-field">
          <span>E-mail</span>
          <input name="email" type="email" defaultValue={values.email} />
        </label>

        <label className="form-field">
          <span>Telefone</span>
          <input name="phone" defaultValue={values.phone} />
        </label>

        <label className="form-field full-width">
          <span>Endereco</span>
          <input name="addressLine" defaultValue={values.addressLine} />
        </label>

        <label className="form-field">
          <span>Bairro</span>
          <input name="neighborhood" defaultValue={values.neighborhood} />
        </label>

        <label className="form-field">
          <span>Estado</span>
          <input name="stateCode" maxLength={2} defaultValue={values.stateCode} />
        </label>

        <label className="form-field">
          <span>CEP</span>
          <input name="zipCode" defaultValue={values.zipCode} />
        </label>

        <label className="form-field full-width">
          <span>Logo (URL)</span>
          <input name="logoAssetUrl" type="url" defaultValue={values.logoAssetUrl} />
        </label>
      </div>

      <FormFeedback state={state} />

      <div className="form-actions">
        <SubmitButton idleLabel="Salvar perfil" pendingLabel="Salvando perfil..." />
      </div>
    </form>
  );
}
