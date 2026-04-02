type DataPoint = {
  label: string;
  value: string;
};

type DataPointsProps = {
  items: DataPoint[];
};

export function DataPoints({ items }: DataPointsProps) {
  return (
    <dl className="data-points">
      {items.map((item) => (
        <div key={item.label} className="data-point">
          <dt>{item.label}</dt>
          <dd>{item.value}</dd>
        </div>
      ))}
    </dl>
  );
}
