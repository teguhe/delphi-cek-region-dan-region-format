unit umain;

interface

uses
  System.Diagnostics, Winapi.ShellAPI,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btCek: TButton;
    mmoStatus: TMemo;
    btBukaPengaturan: TButton;
    procedure CheckWindowsRegionSettings;
//    procedure SetUSRegionAndFormat;
//    procedure _ExecuteCommand(const Command: string);
    procedure FormCreate(Sender: TObject);
    procedure btCekClick(Sender: TObject);
    procedure btBukaPengaturanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin

  Position  := poScreenCenter;
  mmoStatus.Clear;

end;

function IsUSRegionAndFormat: Boolean;
var
  UserLCID: LCID;
  GeoID: Integer;
const
  GEOCLASS_NATION = 16;
  UNITED_STATES_GEOID = 244; // GeoID untuk United States
  US_ENGLISH_LCID = $0409;   // LCID untuk English (United States) - 1033
begin
  // 1. Cek Regional Format (Locale)
  // GetUserDefaultLCID mengambil setting "Current Format" di Windows
  UserLCID := GetUserDefaultLCID;

  // 2. Cek Location (GeoID)
  // GetUserGeoID mengambil setting "Home Location" di Windows
  GeoID := GetUserGeoID(GEOCLASS_NATION);

  // Validasi: Format harus English US ($0409) DAN Lokasi harus US (244)
  Result := (UserLCID = US_ENGLISH_LCID) and (GeoID = UNITED_STATES_GEOID);
end;


procedure TForm1.btBukaPengaturanClick(Sender: TObject);
begin

  ShellExecute(0, 'open', 'control', 'intl.cpl', nil, SW_SHOWNORMAL);

end;

procedure TForm1.btCekClick(Sender: TObject);
begin

  CheckWindowsRegionSettings;

end;

procedure TForm1.CheckWindowsRegionSettings;
begin

  if not IsUSRegionAndFormat then
  begin
    mmoStatus.Lines.Clear;
    mmoStatus.Lines.Add('Peringatan:');
    mmoStatus.Lines.Add('Wilayah (Region) atau Format Windows Anda tidak sesuai!');
    mmoStatus.Lines.Add('Pastikan Region adalah "United States" dan Format adalah "English (United States)".');
  end
  else
  begin
    mmoStatus.Lines.Clear;
    mmoStatus.Lines.Add('Region dan Format sudah benar (United States).');
  end;

end;

end.
