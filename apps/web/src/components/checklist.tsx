type ChecklistProps = {
  items: string[];
};

export function Checklist({ items }: ChecklistProps) {
  return (
    <ul className="checklist">
      {items.map((item) => (
        <li key={item}>{item}</li>
      ))}
    </ul>
  );
}
