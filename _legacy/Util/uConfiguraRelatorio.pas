unit uConfiguraRelatorio;

interface

uses Classes, RLReport;

procedure PrintIfNotEmptyRL(report: TRLReport); overload;
procedure PrintIfNotEmptyRL(report: TRLReport; p: boolean); overload;
procedure ConfigRelatorioRL(report: TRLReport; memo: TRLMemo; img: TRLImage);

implementation

procedure PrintIfNotEmptyRL(report: TRLReport);
begin
  report.PreviewModal;
end;

procedure PrintIfNotEmptyRL(report: TRLReport; p: boolean);
begin
  if p then
    report.Print
  else
    report.PreviewModal;
end;

procedure ConfigRelatorioRL(report: TRLReport; memo: TRLMemo; img: TRLImage);
begin

end;

end.
