type StatusBadgeProps = {
  status: "ready" | "next" | "later";
};

const labels: Record<StatusBadgeProps["status"], string> = {
  ready: "Pronto agora",
  next: "Proxima etapa",
  later: "Fase futura"
};

export function StatusBadge({ status }: StatusBadgeProps) {
  return <span className={`status-badge status-${status}`}>{labels[status]}</span>;
}
