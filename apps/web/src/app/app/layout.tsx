import type { ReactNode } from "react";

import { AppShell } from "@/components/app-shell";

type InternalLayoutProps = {
  children: ReactNode;
};

export default function InternalLayout({ children }: InternalLayoutProps) {
  return <AppShell>{children}</AppShell>;
}
