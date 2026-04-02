export type FormState = {
  status: "idle" | "success" | "error";
  message: string;
};

export const initialFormState: FormState = {
  status: "idle",
  message: ""
};
