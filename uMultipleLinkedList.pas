unit uMultipleLinkedList;

interface

type
  TPtrItemPesanan = ^TRecItemPesanan;
  TRecItemPesanan = record
    iMeja: integer; //untuk pembelian langsung, meja = 0
    iMenuId: integer;
    iBanyak: integer;
    iHarga: integer;
    sKeterangan: string;
    Next, Head: TPtrItemPesanan;
  end;

  TPtrMeja = ^TRecMeja;
  TRecMeja = record
    iNoMeja: integer;
    Next: TPtrMeja;
    ItemPesanan: TPtrItemPesanan;
  end;

procedure PtrAppendMeja(var Head: TPtrMeja; NewMeja: integer);
procedure PtrAppendItemPesanan(var M: TPtrMeja; ItemPesanan: TRecItemPesanan);
function PtrDelMeja(var Head: TPtrMeja; Meja: integer): boolean;
//function PtrDelItemPesanan();

implementation

procedure PtrAppendMeja(var Head: TPtrMeja; NewMeja: integer);
var
  P: TPtrMeja;
begin
  New(P);
  P^.iNoMeja := NewMeja;
  P^.Next := Head;
  P^.ItemPesanan := nil;
  Head := P;
end;

procedure PtrAppendItemPesanan(var M: TPtrMeja; ItemPesanan: TRecItemPesanan);
var
  P: TPtrItemPesanan;
begin
  if M = nil then
    Exit;
  New(P);
  with ItemPesanan do
  begin
    P^.iMeja := iMeja;
    P^.iMenuId := iMenuId;
    P^.iBanyak := iBanyak;
    P^.iHarga := iHarga;
    P^.sKeterangan := sKeterangan;
  end;
  P^.Next := M^.ItemPesanan;
  M^.ItemPesanan := P;
end;

function PtrDelMeja(var Head: TPtrMeja; Meja: integer): boolean;
var
  P, Pred: TPtrMeja;
  Found: Boolean;
begin
  P := Head;
  Pred := nil;
  Found := False;
  while (P <> nil) and (not Found) do
  begin
    if P^.iNoMeja = Meja then
      Found := True
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

