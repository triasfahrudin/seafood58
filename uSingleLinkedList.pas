unit uSingleLinkedList;

interface

uses
  stdctrls, NxGrid;

type
  TPtrPesanan = ^TRecPesanan;
  TRecPesanan = record
    iMeja: integer; //untuk pembelian langsung, meja = 0
    iMenuId: integer;
    iBanyak: integer;
    iHarga: integer;
    sKeterangan: string;
    Next: TPtrPesanan;
  end;

procedure PtrAdd(var Head: TPtrPesanan; NewItem: TRecPesanan);
//procedure PtrDisplay(var Head:TPtrPesanan;Grid: TNextGrid);
function PtrFind(var Head: TPtrPesanan; iMeja: integer): boolean;
function PtrDelete(var Head: TPtrPesanan; iMeja: integer): boolean;

implementation

procedure PtrAdd(var Head: TPtrPesanan; NewItem: TRecPesanan);
var
  P: TPtrPesanan;
begin
  New(P);
  with NewItem do
  begin
    P^.iMeja := iMeja;
    P^.iMenuId := iMenuId;
    P^.iBanyak := iBanyak;
    P^.iHarga := iHarga;
    P^.sKeterangan := sKeterangan;
  end;
  P^.Next := Head;
  Head := P;
end;

function PtrFind(var Head: TPtrPesanan; iMeja: integer): boolean;
var
  P: TPtrPesanan;
  Found: boolean;
begin
  P := Head;
  Found := False;
  while (P <> nil) and (not Found) do
  begin
    if P^.iMeja = iMeja then
      Found := True
    else
      P := P^.Next;
  end;
  Result := True;
end;

function PtrDelete(var Head: TPtrPesanan; iMeja: integer): boolean;
var
  P, Pred: TPtrPesanan;
  Found: boolean;
begin
  P := Head;
  Pred := nil;
  Found := false;
  while (P <> nil) and (not Found) do
  begin
    if P^.iMeja = iMeja then
      Found := true
    else
    begin
      Pred := P;
      P := P^.Next;
    end;
  end;

  if Found then
  begin
    if Pred = nil then
      Head := Head^.Next
    else
      Pred^.Next := P^.Next;
    Dispose(P);
  end;
  Result := Found;
end;

end.

