"use client";

import { useFormStatus } from "react-dom";

type SubmitButtonProps = {
  idleLabel: string;
  pendingLabel: string;
  variant?: "primary" | "secondary";
};

export function SubmitButton({
  idleLabel,
  pendingLabel,
  variant = "primary"
}: SubmitButtonProps) {
  const { pending } = useFormStatus();

  return (
    <button
      type="submit"
      className={variant === "primary" ? "button-primary" : "button-secondary"}
      disabled={pending}
    >
      {pending ? pendingLabel : idleLabel}
    </button>
  );
}
