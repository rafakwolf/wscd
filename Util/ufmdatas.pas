unit ufmDatas;

{$mode Delphi}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DateTimePicker;

type

  { TfmDatas }

  TfmDatas = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    fData1: TDateTime;
    fData2: TdateTime;

  public
         property Data1: TDateTime read fData1 write fData1;
         property Data2: TdateTime read fData2 write fData2;
  end;

var
  fmDatas: TfmDatas;

implementation

{$R *.lfm}

{ TfmDatas }

procedure TfmDatas.Button1Click(Sender: TObject);
begin
       Data1 := DateTimePicker1.Date;
       Data2 := DateTimePicker2.Date;
end;

procedure TfmDatas.Button2Click(Sender: TObject);
begin
  Close;
end;

end.

