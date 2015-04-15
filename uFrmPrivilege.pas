unit uFrmPrivilege;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, ComCtrls, RzTreeVw, DB, mySQLDbTables;

type
  PMenu = ^Tmenu;
  TMenu = record
    iId: integer;
    sNama: string;
    iParent: integer;
  end;

  RMenu = record
    iId: integer;
    sNama: string;
    iParent: integer;
  end;

type
  TFrmPrivilege = class(TForm)
    ct: TRzCheckTree;
    btnKeluar: TsButton;
    mySQLQuery1: TmySQLQuery;
    procedure btnKeluarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

    aAppMenu: array of RMenu;
    iPegawai: integer;
    procedure LoadAllMenu;
    procedure ApplyItems;
    procedure FillMainMenu(tv: TRzCheckTree);
    procedure FillSubMenu(tv: TRzCheckTree; ParentNode: TTreeNode; iParent:
      integer);
    function isMenuActive(id_pegawai: integer; id_app_menu: integer): boolean;
  end;

var
  FrmPrivilege: TFrmPrivilege;

implementation

uses uDM;

{$R *.dfm}

procedure TFrmPrivilege.FillMainMenu(tv: TRzCheckTree);
var
  i: integer;
  myNode: TTreeNode;
  PDataMenu: PMenu;
begin
  for i := 0 to High(aAppMenu) do
  begin
    if aAppMenu[i].iParent = 0 then
    begin
      myNode := tv.Items.Add(nil, aAppMenu[i].sNama);
      New(PDataMenu);
      PDataMenu^.iId := aAppMenu[i].iId;
      PDataMenu^.iParent := aAppMenu[i].iParent;
      PDataMenu^.sNama := aAppMenu[i].sNama;
      myNode.Data := PDataMenu;
      FillSubMenu(tv, myNode, aAppMenu[i].iId);
    end;
  end;
end;

procedure TFrmPrivilege.FillSubMenu(tv: TRzCheckTree; ParentNode: TTreeNode;
  iParent: integer);
var
  i: integer;
  myNode: TTreeNode;
  PDataMenu: PMenu;
begin
  for i := 0 to High(aAppMenu) do
  begin
    if aAppMenu[i].iParent = iParent then
    begin
      myNode := tv.Items.AddChild(ParentNode, aAppMenu[i].sNama);
      New(PDataMenu);
      PDataMenu^.iId := aAppMenu[i].iId;
      PDataMenu^.iParent := aAppMenu[i].iParent;
      PDataMenu^.sNama := aAppMenu[i].sNama;
      myNode.Data := PDataMenu;
      FillSubMenu(tv, myNode, aAppMenu[i].iId);
    end;
  end;
end;

procedure TFrmPrivilege.LoadAllMenu;
begin
  dm.ExecSQL(
    'select id,parent,nama'#13 +
    'from data_app_menu'#13 +
    'order by id', [], dm.mySQLQuery1);
  ct.Items.Clear;
  SetLength(aAppMenu, 0);
  dm.mySQLQuery1.First;
  while not dm.mySQLQuery1.Eof do
  begin
    SetLength(aAppMenu, length(aAppMenu) + 1);
    aAppMenu[High(aAppMenu)].iId := dm.mySQLQuery1.Fields[0].AsInteger;
    aAppMenu[High(aAppMenu)].iParent := dm.mySQLQuery1.Fields[1].AsInteger;
    aAppMenu[High(aAppMenu)].sNama := dm.mySQLQuery1.Fields[2].AsString;
    dm.mySQLQuery1.Next;
  end;
  FillMainMenu(ct);
end;

procedure TFrmPrivilege.btnKeluarClick(Sender: TObject);
var
  activemenu: string;
  myNode: TTreeNode;
begin
  activemenu := EmptyStr;
  myNode := ct.Items.GetFirstNode;
  while myNode <> nil do
  begin
    if (ct.ItemState[myNode.AbsoluteIndex] = csChecked) or
      (ct.ItemState[myNode.AbsoluteIndex] = csPartiallyChecked) then
      activemenu := activemenu + ';' + IntToStr(PMenu(myNode.Data)^.iId);

    myNode := myNode.GetNext;
  end;

  dm.ExecSQL('update data_pegawai set privilege = "%s" where id = %d',
    [activemenu, iPegawai], dm.mySQLQuery1);
  close;
end;

function TFrmPrivilege.isMenuActive(id_pegawai,
  id_app_menu: integer): boolean;
begin
  Result := False;
  mySQLQuery1.Close;
  mySQLQuery1.SQL.Text :=

  'select count(id)'#13 +
    'from data_pegawai'#13 +
    'where id = ' + IntToStr(id_pegawai) + ' and'#13 +
    '      privilege like ''%' + IntToStr(id_app_menu) + '%''';
  mySQLQuery1.Open;

  if mySQLQuery1.Fields[0].AsInteger > 0 then
    Result := True;
end;

procedure TFrmPrivilege.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPrivilege.ApplyItems;
var
  myNode: TTreeNode;
begin
  myNode := ct.Items.GetFirstNode;
  while myNode <> nil do
  begin
    if isMenuActive(iPegawai, PMenu(myNode.Data)^.iId) then
      ct.ChangeNodeCheckState(myNode, csChecked)
    else
      ct.ChangeNodeCheckState(myNode, csUnchecked);
    myNode := myNode.GetNext;
  end;
end;

procedure TFrmPrivilege.FormShow(Sender: TObject);
begin
  LoadAllMenu;
  ApplyItems;
end;

end.
