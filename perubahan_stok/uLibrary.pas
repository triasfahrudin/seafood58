unit uLibrary;

interface
uses
  Forms, Classes, Windows, StrUtils, SysUtils, sButton, INIFiles,
  ComCtrls, CommCtrl, Printers, NxColumnClasses;

const
  arrBulan: array[1..12] of string[10] =
  ('Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember');

const
  RPT_PENDAPATAN = 100;
  RPT_PENGELUARAN = 200;
  RPT_PROSENTASE = 300;
  RPT_STOK = 400;
  RPT_PENDAPATAN_BULANAN = 500;
  RPT_PENGELUARAN_BULANAN = 600;
  RPT_TUTUP_BUKU_HARIAN = 700;
  RPT_PERUBAHAN_STOK = 800;
  RPT_MODAL = 900;
  //pajak
  RPT_SPTPD = 1000;
  RPT_SSPD = 1100;
  RPT_REKAP_PENJUALAN = 1200;

  RPT_PENDAPATAN_FILES = 'pendapatan.fr3';
  RPT_PENDAPATAN_BULANAN_FILE = 'pendapatanbulanan.fr3';
  RPT_PENGELUARAN_FILES = 'pengeluaran.fr3';
  RPT_PENGELUARAN_BULANAN_FILE = 'pengeluaranbulanan.fr3';
  RPT_PROSENTASE_FILE = 'prosentase.fr3';
  RPT_STOK_FILES = 'stok.fr3';
  RPT_STRUK_FILE = 'struk.fr3';
  RPT_TUTUP_BUKU_HARIAN_FILE = 'tutupbukuharian.fr3';
  RPT_PERUBAHAN_STOK_FILE = 'perubahan_stok.fr3';
  RPT_MODAL_FILE = 'modal.fr3';
  //pajak
  RPT_SPTPD_FILE = 'SPTPD.fr3';
  RPT_SSPD_FILE = 'sspd.fr3';
  RPT_REKAP_PENJUALAN_FILE = 'rekappenjualan.fr3';

  CALLED_FROM_FRMMAIN = 10;
  CALLER_FROM_SATUANKONV = 20;
  CALLED_FROM_EMPLOYEES = 30;
  CALLED_FROM_MENUITEMS = 40;
  CALLES_FROM_SUBJENISMENU = 50;
  CALLED_FROM_MODAL = 60;
  CALLED_FROM_PENGELUARAN = 70;
  CALLED_FROM_PEMBELIAN_BAHAN_UTAMA = 80;
  CALLED_FROM_MEJA = 90;
  CALLED_FROM_PENDAPATAN = 100;
  CALLED_FROM_SATUAN = 110;
  CALLED_FROM_JENISMENU = 120;

type
  TStringDynArray = array of string;

function Explode(const Separator, S: string; Limit: Integer = 0):
  TStringDynArray;
procedure ActivateForm(sFormName: string; InstanceClass: TComponentClass;
  var Reference);
procedure WindowShake(wHandle: THandle);
function WindowsExit(RebootParam: Longword): Boolean;
function MySQLDateFormat(sDate: string): string;

function FormatRp(nilai: string): string;
function UnFormatRp(nilai: string): string;

procedure FormatBtn(frm: TForm);
procedure ClearAllTextBox(frm: TForm);

procedure INIWriteString(Section, Ident, values: string);
function INIReadString(Section, Ident, Default: string): string;
procedure BoldTreeNode(treeNode: TTreeNode; Value: Boolean);
function GetDefaultPrinterName: string;

function GetIdJenisMenu(strJnsMenu: string): integer;
function GetIdSatuan(strSatuan: string): integer;
function GetIdSubJenisMenu(strSubJnsMenu: string): integer;
function GetNamaSubJenisMenu(iId: integer): string;

procedure FillCmbJenisMenu(var NextCbCol: TNxComboBoxColumn);
procedure FillCmbSubJenisMenu(var NextCbCol: TNxComboBoxColumn;
  Included_barcode: boolean = False);
procedure FillCmbSatuanNameOnly(var NextCbCol: TNxComboBoxColumn);

function GetIdMeja(nama_meja: string): integer;
function GetNamaMeja(Id: integer): string;
function IsStrANumber(const S: string): Boolean;

function isAllowPriv(sPriv: string): boolean;
procedure InsertPriv(sPriv: string);
procedure DeletePriv(sPriv: string);
procedure ShowAuthorization(sPriv: string);
procedure InsertData_Perubahan(strAlasan: string);
function MySQLFloat(str: string): real;
procedure FillCmbSatuan(
  var NextCbCol: TNxComboBoxColumn;
  CurrIdSatuan: integer);

const
  NOT_IMPLEMENTED_YET = 'NOT IMPLEMENTED YET';

implementation

uses
  uDM, DB, uFrmNeedAuthorization;

function MySQLFloat(str: string): real;
begin
  Result :=
    StrToFloat(StringReplace(str, ',', '.', [rfReplaceAll] + [rfIgnoreCase]));
end;

procedure InsertData_Perubahan(strAlasan: string);
begin
  dm.ExecSQL(
    'insert into data_perubahan(id_pegawai,nama_pemberi_ijin,tgl,keterangan)'#13 +
    'values(%d,"%s",NOW(),"%s")',
    [dm.iAPPid, dm.sNamaPemberiIjin, strAlasan + ''#13 + dm.sKet],
    dm.mySQLQuery1);
end;

procedure ShowAuthorization(sPriv: string);
begin
  ActivateForm('FrmNeedAuthorization', TFrmNeedAuthorization,
    FrmNeedAuthorization);
  FrmNeedAuthorization.strPriv := sPriv;
  FrmNeedAuthorization.ShowModal;
end;

function isAllowPriv(sPriv: string): boolean;
begin
  dm.ExecSQL(
    'select count(*)'#13 +
    'From temp_priv'#13 +
    'where id_pegawai = %d and'#13 +
    '      strPriv = "%s"', [dm.iAPPid, sPriv], dm.mySQLQuery1);
  if dm.mySQLQuery1.Fields[0].AsInteger > 0 then
    Result := True
  else
    Result := False;
end;

procedure InsertPriv(sPriv: string);
begin
  dm.ExecSQL(
    'insert into temp_priv(id_pegawai,strPriv) values(%d,"%s")',
    [dm.iAPPid, sPriv], dm.mySQLQuery1);
end;

procedure DeletePriv(sPriv: string);
begin
  dm.ExecSQL(
    'delete from temp_priv'#13 +
    'where id_pegawai = %d and strPriv = "%s"',
    [dm.iAPPid, sPriv], dm.mySQLQuery1);
end;

function IsStrANumber(const S: string): Boolean;
var
  P: PChar;
begin
  P := PChar(S);
  Result := False;
  while P^ <> #0 do
  begin
    if not (P^ in ['0'..'9']) then
      Exit;
    Inc(P);
  end;
  Result := True;
end;

function GetNamaMeja(Id: integer): string;
begin
  dm.ExecSQL('select nama from data_meja where id = %d', [Id], dm.mySQLQuery1);
  Result := dm.mySQLQuery1.Fields[0].AsString;
end;

function GetIdMeja(nama_meja: string): integer;
begin
  dm.ExecSQL('select id from data_meja where nama = "%s"', [nama_meja],
    dm.mySQLQuery1);
  Result := dm.mySQLQuery1.Fields[0].AsInteger;
end;

procedure FillCmbJenisMenu(var NextCbCol: TNxComboBoxColumn);
begin
  NextCbCol.Items.Clear;
  dm.ExecSQL('select nama from data_jenismenu order by nama', [],
    dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    NextCbCol.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    dm.mySQLQuery1.Next;
  end;
end;

procedure FillCmbSatuan(
  var NextCbCol: TNxComboBoxColumn;
  CurrIdSatuan: integer);
begin
  dm.ExecSQL(
    'select nama'#13 +
    'from data_satuan'#13 +
    'where id in(select id_konversi'#13 +
    '            from data_satuankonv'#13 +
    '            where id_dasar = %d)'#13 +
    'order by nama', [currIdSatuan], dm.mySQLQuery1);
  NextCbCol.Items.Clear;
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    NextCbCol.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    dm.mySQLQuery1.Next;
  end;
end;

procedure FillCmbSubJenisMenu(var NextCbCol: TNxComboBoxColumn;
  Included_barcode: boolean = False);
begin
  NextCbCol.Items.Clear;
  if Included_barcode then
  begin

    dm.ExecSQL(
      'select nama'#13 +
      'from data_subjenismenu'#13 +
      'where is_stok = 1 order by nama', [], dm.mySQLQuery1);

    dm.mySQLQuery1.First;
    while not dm.mySQLQuery1.Eof do
    begin
      NextCbCol.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
      dm.mySQLQuery1.Next;
    end;

    //    dm.ExecSQL(
    //      'select barcode'#13 +
    //      'from data_subjenismenu'#13 +
    //      'where isbarcode = 1', [], dm.mySQLQuery1);
    //    dm.mySQLQuery1.First;
    //    while not dm.mySQLQuery1.Eof do
    //    begin
    //      NextCbCol.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    //      dm.mySQLQuery1.Next;
    //    end;
  end
  else
  begin
    dm.ExecSQL(
      'select nama'#13 +
      'from data_subjenismenu'#13 +
      'where isbarcode = 0 order by nama', [], dm.mySQLQuery1);
    dm.mySQLQuery1.First;
    while not dm.mySQLQuery1.Eof do
    begin
      NextCbCol.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
      dm.mySQLQuery1.Next;
    end;
  end;

end;

procedure FillCmbSatuanNameOnly(var NextCbCol: TNxComboBoxColumn);
begin
  NextCbCol.Items.Clear;
  dm.ExecSQL('select nama from data_satuan order by nama', [], dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    NextCbCol.Items.Add(dm.mySQLQuery1.Fields[0].AsString);
    dm.mySQLQuery1.Next;
  end;
end;

function GetIdJenisMenu(strJnsMenu: string):
  integer;
begin
  dm.ExecSQL('select id from data_jenismenu where nama = "%s"', [strJnsMenu],
    dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  result := dm.mySQLQuery1.Fields[0].AsInteger;
end;

function GetIdSatuan(strSatuan: string):
  integer;
begin
  dm.ExecSQL('select id from data_satuan where nama = "%s"', [strSatuan],
    dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  result := dm.mySQLQuery1.Fields[0].AsInteger;
end;

function GetNamaSubJenisMenu(iId: integer): string;
begin
  dm.ExecSQL(
    'select nama'#13 +
    'from data_subjenismenu'#13 +
    'where id = %d', [iId], dm.mySQLQuery1);
  dm.mySQLQuery1.First;
  Result := dm.mySQLQuery1.Fields[0].AsString;
end;

function GetIdSubJenisMenu(strSubJnsMenu: string): integer;
begin
  dm.ExecSQL(
    'select id'#13 +
    'from data_subjenismenu'#13 +
    'where nama = "%s"',
    [strSubJnsMenu],
    dm.mySQLQuery1);
  dm.mySQLQuery1.First;

  if dm.mySQLQuery1.RecordCount = 0 then
  begin
    dm.ExecSQL(
      'select id'#13 +
      'from data_subjenismenu'#13 +
      'where barcode = "%s"',
      [strSubJnsMenu], dm.mySQLQuery2);
    dm.mySQLQuery2.First;
    if dm.mySQLQuery2.RecordCount = 0 then

      Result := -1
    else

      result := dm.mySQLQuery2.Fields[0].AsInteger
  end
  else
    result := dm.mySQLQuery1.Fields[0].AsInteger;
end;

function GetDefaultPrinterName: string;
begin
  if (Printer.PrinterIndex > 0) then
    Result := Printer.Printers[Printer.PrinterIndex]
  else
    Result := '';
end;

procedure BoldTreeNode(treeNode: TTreeNode; Value: Boolean);
var
  treeItem: TTVItem;
begin
  if not Assigned(treeNode) then
    Exit;

  with treeItem do
  begin
    hItem := treeNode.ItemId;
    stateMask := TVIS_BOLD;
    mask := TVIF_HANDLE or TVIF_STATE;

    if Value then
      state := TVIS_BOLD
    else
      state := 0;
  end;

  TreeView_SetItem(treeNode.Handle, treeItem);
end;

procedure INIWriteString(Section, Ident, values: string);
var
  myINI: TIniFile;
begin
  myINI := TIniFile.Create('SeaFood58.ini');
  try
    myINI.WriteString(Section, Ident, values);
  finally
    myINI.Free;
  end;
end;

function INIReadString(Section, Ident, Default: string): string;
var
  myINI: TIniFile;
begin
  myINI := TIniFile.Create('SeaFood58.ini');
  try
    Result := myINI.ReadString(Section, Ident, Default);
  finally
    myINI.Free
  end;
end;

procedure FormatBtn(frm: TForm);
var
  i: integer;
begin
  for i := 1 to frm.ComponentCount - 1 do
  begin
    if (frm.Components[i] is TsButton) then
    begin
      (frm.Components[i] as TsButton).Font.Size :=
        StrToInt(INIReadString('settings', 'btnfontsize', '12'));
      (frm.Components[i] as TsButton).Font.Name := INIReadString('settings',
        'btnfontname', 'MS Sans Serif');
    end;
  end;
end;

procedure ClearAllTextBox(frm: TForm);
begin

end;

function FormatRp(nilai: string): string;
var
  n: string;
begin
  n := AnsiReplaceStr(FormatFloat('#,###', StrToCurr(Nilai)), ',', '.');
  if StrToCurr(nilai) <= 0 then
    n := '0';
  Result := n;
end;

function UnFormatRp(nilai: string): string;
var
  n: string;
begin
  n := AnsiReplaceStr(nilai, '.', '');
  Result := n;
end;

function MySQLDateFormat(sDate: string): string;
var
  StringArray: TStringDynArray;
begin
  StringArray := Explode('-', sDate);
  Result := StringArray[2] + '-' + StringArray[1] + '-' + StringArray[0]
end;

function StrPos(const Str1, Str2: PChar): PChar; assembler;
asm
        PUSH    EDI
        PUSH    ESI
        PUSH    EBX
        OR      EAX,EAX
        JE      @@2
        OR      EDX,EDX
        JE      @@2
        MOV     EBX,EAX
        MOV     EDI,EDX
        XOR     AL,AL
        MOV     ECX,0FFFFFFFFH
        REPNE   SCASB
        NOT     ECX
        DEC     ECX
        JE      @@2
        MOV     ESI,ECX
        MOV     EDI,EBX
        MOV     ECX,0FFFFFFFFH
        REPNE   SCASB
        NOT     ECX
        SUB     ECX,ESI
        JBE     @@2
        MOV     EDI,EBX
        LEA     EBX,[ESI-1]
@@1:    MOV     ESI,EDX
        LODSB
        REPNE   SCASB
        JNE     @@2
        MOV     EAX,ECX
        PUSH    EDI
        MOV     ECX,EBX
        REPE    CMPSB
        POP     EDI
        MOV     ECX,EAX
        JNE     @@1
        LEA     EAX,[EDI-1]
        JMP     @@3
@@2:    XOR     EAX,EAX
@@3:    POP     EBX
        POP     ESI
        POP     EDI
end;

function StrEnd(const Str: PChar): PChar; assembler;
asm
        MOV     EDX,EDI
        MOV     EDI,EAX
        MOV     ECX,0FFFFFFFFH
        XOR     AL,AL
        REPNE   SCASB
        LEA     EAX,[EDI-1]
        MOV     EDI,EDX
end;

function Explode(const Separator, S: string; Limit: Integer = 0):
  TStringDynArray;
var
  SepLen: Integer;
  F, P: PChar;
  ALen, Index: Integer;
begin
  SetLength(Result, 0);
  if (S = '') or (Limit < 0) then
    Exit;
  if Separator = '' then
  begin
    SetLength(Result, 1);
    Result[0] := S;
    Exit;
  end;
  SepLen := Length(Separator);
  ALen := Limit;
  SetLength(Result, ALen);

  Index := 0;
  P := PChar(S);
  while P^ <> #0 do
  begin
    F := P;
    P := StrPos(P, PChar(Separator));
    if (P = nil) or ((Limit > 0) and (Index = Limit - 1)) then
      P := StrEnd(F);
    if Index >= ALen then
    begin
      Inc(ALen, 5);
      SetLength(Result, ALen);
    end;
    SetString(Result[Index], F, P - F);
    Inc(Index);
    if P^ <> #0 then
      Inc(P, SepLen);
  end;
  if Index < ALen then
    SetLength(Result, Index);
end;

procedure ActivateForm(sFormName: string; InstanceClass: TComponentClass; var
  Reference);
begin
  if Application.FindComponent(sFormName) = nil then
    Application.CreateForm(InstanceClass, Reference);
end;

procedure WindowShake(wHandle: THandle);
const
  MAXDELTA = 4;
  SHAKETIMES = 500;
var
  oRect, wRect: TRect;
  deltax: integer;
  deltay: integer;
  cnt: integer;
  dx, dy: integer;
begin
  GetWindowRect(wHandle, wRect);
  oRect := wRect;

  Randomize;
  for cnt := 0 to SHAKETIMES do
  begin
    deltax := Round(Random(MAXDELTA));
    deltay := Round(Random(MAXDELTA));
    dx := Round(1 + Random(2));
    if dx = 2 then
      dx := -1;
    dy := Round(1 + Random(2));
    if dy = 2 then
      dy := -1;
    OffsetRect(wRect, dx * deltax, dy * deltay);
    MoveWindow(wHandle, wRect.Left, wRect.Top, wRect.Right - wRect.Left,
      wRect.Bottom - wRect.Top, true);
  end;

  MoveWindow(wHandle, oRect.Left, oRect.Top, oRect.Right - oRect.Left,
    oRect.Bottom - oRect.Top, true);
end;

function WindowsExit(RebootParam: Longword): Boolean;
var
  TTokenHd: THandle;
  TTokenPvg: TTokenPrivileges;
  cbtpPrevious: DWORD;
  rTTokenPvg: TTokenPrivileges;
  pcbtpPreviousRequired: DWORD;
  tpResult: Boolean;
  osVerInfo: TOSVersionInfo;
const
  SE_SHUTDOWN_NAME = 'SeShutdownPrivilege';
begin
  osVerInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(osVerInfo);
  if osVerInfo.dwPlatformId = VER_PLATFORM_WIN32_NT then
  begin
    tpResult := OpenProcessToken(GetCurrentProcess(),
      TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,
      TTokenHd);
    if tpResult then
    begin
      tpResult := LookupPrivilegeValue(nil,
        SE_SHUTDOWN_NAME,
        TTokenPvg.Privileges[0].Luid);
      TTokenPvg.PrivilegeCount := 1;
      TTokenPvg.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
      cbtpPrevious := SizeOf(rTTokenPvg);
      pcbtpPreviousRequired := 0;
      if tpResult then
        Windows.AdjustTokenPrivileges(TTokenHd,
          False,
          TTokenPvg,
          cbtpPrevious,
          rTTokenPvg,
          pcbtpPreviousRequired);
    end;
  end;
  Result := ExitWindowsEx(RebootParam, 0);
end;

end.

