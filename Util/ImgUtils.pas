unit ImgUtils;

interface

uses Classes, Sysutils, Vcl.Graphics, Clipbrd, Vcl.Imaging.jpeg;

type
  TRGB_Pixel = packed record
    B1: Byte;
    B2: Byte;
    B3: Byte;
  end;
  TScanLine = array[0..(System.MaxInt div SizeOf(TRGB_Pixel))-1] of TRGB_Pixel;
  PScanLine = ^TScanLine;


procedure CopyConstToClipboard(const FB:array of byte);
function LoadJpegIntoBitmap(const FileName:string): TBitmap;


implementation

procedure CopyConstToClipboard(const FB:array of byte);
var s: string;
    i: Integer;
begin
  s := 'Name: array[0..' + IntToStr(High(FB)) + '] of Byte = ($' + IntToHex(FB[0], 2);
  for i:=1 to High(FB) do
    s := s + ', $' + IntToHex(FB[i],2);
  s := s + ');';
  Clipboard.AsText := s;
end;

function LoadJpegIntoBitmap(const FileName:string): TBitmap;
var F: TFileStream;
    Jpg: TJPEGImage;
    FirstBytes:array[0..17] of Byte;
    y,x: Integer;
    ScanLine: PScanLine;
const Marker_1: array[0..17] of Byte = ($FF, $D8, $FF, $EE, $00, $0E, $41, $64, $6F, $62, $65, $00, $64, $00, $00, $00, $00, $00);

  procedure SwapBytes(var A, B: Byte);
  var T: Byte;
  begin
    T := A;
    A := B;
    B := T;
  end;

begin
  F := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    Jpg := TJPEGImage.Create;
    try
      Jpg.LoadFromStream(F);
      F.Position := 0;
      F.Read(FirstBytes, SizeOf(FirstBytes));

      // CopyConstToClipboard(FirstBytes); // Uncomment this to copy those first bytes to cliboard

      Result := TBitmap.Create;
      Result.Assign(Jpg);

      if (Result.PixelFormat = pf24bit) and CompareMem(@Marker_1, @FirstBytes, SizeOf(FirstBytes)) then
      begin
        for y:=0 to Result.Height-1 do
        begin
          ScanLine := Result.ScanLine[y];
          for x:=0 to Result.Width-1 do
          begin
            SwapBytes(ScanLine[x].B1, ScanLine[x].B3);
          end;
        end;
      end;

    finally Jpg.Free;
    end;
  finally F.Free;
  end;
end;

end.
