import Link from "next/link";
import type { ReactNode } from "react";

import { navigation } from "@/features/shell/navigation";

type AppShellProps = {
  children: ReactNode;
};

export function AppShell({ children }: AppShellProps) {
  return (
    <div className="app-shell">
      <aside className="app-sidebar">
        <Link href="/" className="brand-mark">
          <span className="brand-kicker">WSCD</span>
          <strong>Web ERP</strong>
        </Link>
        <p className="brand-summary">
          Reescrita web do ERP legado em Delphi, pensada para pequenos negocios no Brasil.
        </p>

        <nav className="nav-stack" aria-label="Principal">
          {navigation.map((section) => (
            <section key={section.title} className="nav-section">
              <h2>{section.title}</h2>
              <ul>
                {section.items.map((item) => (
                  <li key={item.href}>
                    <Link href={item.href}>
                      <span>{item.label}</span>
                      <small>{item.description}</small>
                    </Link>
                  </li>
                ))}
              </ul>
            </section>
          ))}
        </nav>
      </aside>

      <main className="app-content">{children}</main>
    </div>
  );
}
