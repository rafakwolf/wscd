import type { FormState } from "@/features/forms/state";

type FormFeedbackProps = {
  state: FormState;
};

export function FormFeedback({ state }: FormFeedbackProps) {
  if (state.status === "idle" || !state.message) {
    return null;
  }

  return (
    <p className={state.status === "success" ? "form-feedback success" : "form-feedback error"}>
      {state.message}
    </p>
  );
}
