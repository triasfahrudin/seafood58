unit DisableWinKeys;

interface

uses Windows;

type
  PKBDLLHOOKSTRUCT = ^TKBDLLHOOKSTRUCT;
  TKBDLLHOOKSTRUCT = packed record
    vkCode: DWORD;
    scanCode: DWORD;
    flags: DWORD;
    time: DWORD;
    dwExtraInfo: DWORD;
  end;

function DisableWindowsUI: Boolean;
function EnableWindowsUI: Boolean;
function IsWindowsUIDisabled: Boolean;

const
  WH_KEYBOARD_LL = 13;

const
  LLKHF_ALTDOWN = $0020;

var
  hKeyboardHook: HHOOK = 0;

implementation

function LowLevelKeyboardHook(nCode: Integer; wParam: WPARAM; lParam: LPARAM):
  HRESULT; stdcall;
var
  pkbhs: PKBDLLHOOKSTRUCT;
begin
  pkbhs := PKBDLLHOOKSTRUCT(lParam);
  if nCode = HC_ACTION then
  begin

    if (pkbhs^.vkCode = VK_ESCAPE) and WordBool(GetAsyncKeyState(VK_CONTROL) and
      $8000) then
    begin
      Result := 1;
      Exit;
    end;

    if (pkbhs^.vkCode = VK_TAB) and LongBool(pkbhs^.flags and LLKHF_ALTDOWN)
      then
    begin
      Result := 1;
      Exit;
    end;

    if (pkbhs^.vkCode = VK_ESCAPE) and LongBool(pkbhs^.flags and LLKHF_ALTDOWN)
      then
    begin
      Result := 1;
      Exit;
    end;

    if (pkbhs^.vkCode = VK_F4) and LongBool(pkbhs^.flags and LLKHF_ALTDOWN) then
    begin
      Result := 1;
      Exit;
    end;

    if (pkbhs^.vkCode = VK_LWIN) then
    begin
      Result := 1;
      Exit;
    end;

  end;
  Result := CallNextHookEx(hKeyboardHook, nCode, wParam, lParam);
end;

function DisableWindowsUI: Boolean;
begin
  if hKeyboardHook = 0 then
    hKeyboardHook := SetWindowsHookEx(WH_KEYBOARD_LL, @LowLevelKeyboardHook,
      HInstance, 0);
  Result := (hKeyboardHook <> 0)
end;

function EnableWindowsUI: Boolean;
begin
  Result := False;
  if (hKeyboardHook <> 0) and UnhookWindowsHookEx(hKeyboardHook) then
  begin
    hKeyboardHook := 0;
    Result := True;
  end;
end;

function IsWindowsUIDisabled: Boolean;
begin
  Result := (hKeyboardHook <> 0)
end;

end.
