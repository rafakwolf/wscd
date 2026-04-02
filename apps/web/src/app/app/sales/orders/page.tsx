import { PlaceholderScreen } from "@/components/placeholder-screen";

export default function SalesPage() {
  return (
    <PlaceholderScreen
      title="Pedidos e vendas"
      description="Esta tela ancora o primeiro fluxo completo de valor: criar venda, baixar estoque e depois receber o pagamento."
      nextActions={[
        "Implementar CRUD de venda com snapshots dos itens.",
        "Criar o servico completeSale antes de ligar as acoes da interface.",
        "Validar estoque no nivel de servico quando as regras do negocio exigirem.",
        "Preparar acoes seguintes para recebimento e cancelamento."
      ]}
    />
  );
}
