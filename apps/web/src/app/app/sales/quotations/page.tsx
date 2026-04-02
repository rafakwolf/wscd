import { PlaceholderScreen } from "@/components/placeholder-screen";

export default function QuotationsPage() {
  return (
    <PlaceholderScreen
      title="Orcamentos"
      description="Orcamentos sao o primeiro alvo transacional e depois vao converter diretamente em vendas."
      nextActions={[
        "Implementar cabecalho e itens do orcamento com snapshots de preco.",
        "Recalcular totais no servidor.",
        "Adicionar fluxo de conversao para venda.",
        "Controlar transicoes de status como rascunho, aprovado e convertido."
      ]}
    />
  );
}
