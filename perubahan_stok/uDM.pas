unit uDM;

interface

uses
  SysUtils, Classes, MySQLMonitor, DB, mySQLDbTables, sSkinManager,
  Forms, Dialogs, Windows, Controls, AMReg, frxClass, frxDBSet, frxDesgn,
  frxExportDBF, frxExportODF, frxExportTXT, frxExportMail, frxExportCSV,
  frxExportText, frxExportImage, frxExportRTF, frxExportXML, frxExportXLS,
  frxExportHTML, frxExportPDF;

type
  TDM = class(TDataModule)
    mySQLDatabase1: TmySQLDatabase;
    mySQLQuery1: TmySQLQuery;
    mySQLQuery2: TmySQLQuery;
    sSkinManager1: TsSkinManager;
    frxDBDatasetStrukHeader: TfrxDBDataset;
    frxDBDatasetStrukDetail: TfrxDBDataset;
    mySQLQueryStrukDetail: TmySQLQuery;
    mySQLQueryStrukHeader: TmySQLQuery;
    rptstruk: TfrxReport;
    frxDesigner1: TfrxDesigner;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxGIFExport1: TfrxGIFExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxCSVExport1: TfrxCSVExport;
    frxMailExport1: TfrxMailExport;
    frxTXTExport1: TfrxTXTExport;
    frxODSExport1: TfrxODSExport;
    frxODTExport1: TfrxODTExport;
    frxDBFExport1: TfrxDBFExport;
    mySQLQueryPendapatan: TmySQLQuery;
    frxDBDatasetPendapatan: TfrxDBDataset;
    frxDBDatasetItems: TfrxDBDataset;
    frxDBDatasetModalterakhir: TfrxDBDataset;
    frxDBDatasetmodalawal: TfrxDBDataset;
    mySQLQueryItems: TmySQLQuery;
    mySQLQueryModalTerakhir: TmySQLQuery;
    mySQLQuerymodalawal: TmySQLQuery;
    frxDBDatasetProsentase: TfrxDBDataset;
    mySQLQueryProsentase: TmySQLQuery;
    AMReg1: TAMReg;
    frxDBDatasetStok: TfrxDBDataset;
    mySQLQueryStok: TmySQLQuery;
    mySQLQueryPerubahanStok: TmySQLQuery;
    frxDBDatasetPerubahanStok: TfrxDBDataset;
    mySQLQueryPendapatanBulanan: TmySQLQuery;
    frxDBDatasetPendapatanBulanan: TfrxDBDataset;
    frxDBDatasetPengeluaranBulanan: TfrxDBDataset;
    mySQLQueryPengeluaranBulanan: TmySQLQuery;
    mySQLQuery3: TmySQLQuery;
    frxDBDatasetTutupBukuHarian: TfrxDBDataset;
    mySQLQueryTutupBukuHarian: TmySQLQuery;
    frxReport: TfrxReport;
    mySQLQueryModal: TmySQLQuery;
    frxDBDatasetModal: TfrxDBDataset;
    mySQLQueryNilai_setelah_disc: TmySQLQuery;
    frxDBDatasetNilai_Setelah_Disc: TfrxDBDataset;
    mySQLQueryRekapPenjualan: TmySQLQuery;
    frxDBDatasetRekapPenjualan: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
    procedure rptstrukBeforePrint(Sender: TfrxReportComponent);
    procedure frxReportBeforePrint(Sender: TfrxReportComponent);
    procedure frxReportClickObject(Sender: TfrxView; Button: TMouseButton;
      Shift: TShiftState; var Modified: Boolean);
  private

  public

    {*database connecttion setting*}
    sDBServer,
      sDBUser,
      sDBPassword,
      sDBName: string;
    iDBPort: Integer;

    {*user login variable*}
    sAPPUser, sAPPPasswd: string;
    iAPPid: integer;
    bIsSinuhun: boolean;
    //variable pajak ------------------------>
    iPPN: integer;

    //<---------------------------------------
    bOnHrgSatFirstPage: boolean;
    bOnHrgSatFirstPageAccept: boolean;
    bOnHrgSatFirstPageAcceptPermanently: boolean;

    ViewerMode: Boolean;

    sStatus: string;

    sNamaPemberiIjin: string;
    sKet: string;

    bTutupBukuHariIni: boolean;

    //___ cal text
    CalenderText: string;

    //report parameter
    RPT_ID: integer;

    procedure ErrorHandle(ErrorClass, ErrorMSG, ErrorSQL, sPesan: string);
    procedure SavePerubahan(sKet: string; sNamaPembIjin: string = '');
    function ExecSQL(const sSQL: string; const Args: array of const; oQuery:
      TmySQLQuery; sPesan: string = ''): Boolean;
    function ValidSQLString(sSQL: string): string;
    function OpenConnection: boolean;
    function SaveSettings2Registry(userDefinedKey, Values: string): boolean;
    function ReadSettings2Registry(userDefinedKey: string): string;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}
uses
  uFrmMySQLSettings, uLibrary, uSubWCRev;

procedure TDM.ErrorHandle(ErrorClass, ErrorMSG, ErrorSQL, sPesan: string);
var
  F: TextFile;
  FileHandle: integer;
begin
  ShortDateFormat := 'dd-mm-yyyy';
  if not FileExists(ExtractFilePath(Application.ExeName) +
    '\errorlogs\' + sDBName + '_' + DateToStr(NOW) + '.txt') then
  begin
    FileHandle := FileCreate(ExtractFilePath(Application.ExeName) +
      '\errorlogs\' + sDBName + '_' + DateToStr(NOW) + '.txt');
    FileClose(FileHandle);
  end;
  AssignFile(F, ExtractFilePath(Application.ExeName) +
    '\errorlogs\' + sDBName + '_' + DateToStr(NOW) + '.txt');
  Append(F);
  Writeln(F, '$Tanggal Error  : ' + DateTimeToStr(NOW));
  Writeln(F, '$SVN Revision   : ' + uSubWCRev.REVISION);
  WriteLn(F, '$SVN Commit     : ' + uSubWCRev.Date);
  Writeln(F, '$Error Class    : ', ErrorClass);
  WriteLn(F, '$Error Message  : ');
  WriteLn(F, ErrorMSG);
  WriteLn(F, '$Pesan          :', sPesan);
  Writeln(F, '$SQL Text       :');
  WriteLn(F, ErrorSQL);
  WriteLn(F, ' ');
  WriteLn(F,
    '******************************************************************');
  WriteLn(F, ' ');
  CloseFile(F);

  MessageDlg(
    'Kami mohon maaf, namun sepertinya Aplikasi mengalami Error'#13#10 +
    'ERROR    : '#13#10 + ErrorMSG + #13#10 +
    'DateTime : ' + DateTimeToStr(NOW) + #13#10 +
    'FileKeteranganError : ' + sDBName + '_' + DateToStr(NOW) +
    '.txt (tersimpan di folder errorlogs)' + #13#10 +
    'Mohon kirimkan / serahkan FileKeteranganError ke:' + #13#10 +
    'Administrator Aplikasi atau TEAM DEVELOPER', mtError, [mbOK], 0);
end;

function TDM.ExecSQL(const sSQL: string; const Args: array of const;
  oQuery: TmySQLQuery; sPesan: string): Boolean;
var
  bActive: Boolean;
begin
  if oQuery = nil then
    oQuery := mySQLQuery1;

  with oQuery do
  begin
    Close;
    if Length(Args) = 0 then
      SQL.Text := ValidSQLString(sSQL)
    else
      SQL.Text := ValidSQLString(Format(sSQL, Args));

    bActive := True;

    try
      mySQLDatabase1.StartTransaction;
      if (UpperCase(Copy(SQL.Text, 1, 4)) = 'SELE') then
      begin
        Open;
        bActive := (Active and not oQuery.IsEmpty);
        mySQLDatabase1.Commit;
      end
      else
      begin
        ExecSQL;
        mySQLDatabase1.Commit;
      end;
    except
      on E: Exception do
      begin
        mySQLDatabase1.Rollback;
        ShortDateFormat := 'dd-mm-yyyy';
        ErrorHandle(E.ClassName, E.Message, SQL.Text, sPesan);
        bActive := False;
      end;
    end;
  end;
  Result := bActive;
end;

function TDM.OpenConnection: boolean;
begin
  mySQLDatabase1.Connected := False;
  mySQLDatabase1.Host := sDBServer;
  mySQLDatabase1.Username := sDBUser;
  mySQLDatabase1.UserPassword := sDBPassword;
  mySQLDatabase1.DatabaseName := sDBName;
  mySQLDatabase1.Port := iDBPort;
  Result := true;
  try
    mySQLDatabase1.Connected := True;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar(E.Message), 'Error',
        MB_OK + MB_ICONSTOP);
      Application.CreateForm(TFrmMySQLSettings,
        FrmMySQLSettings);
      if FrmMySQLSettings.ShowModal <> mrOk then
      begin
        Result := false;
        FrmMySQLSettings.Free;
        exit;
      end
      else
      begin
        FrmMySQLSettings.Free;
        Result := OpenConnection;
      end;
    end;
  end;
end;

function TDM.ValidSQLString(sSQL: string): string;
begin
  Result := StringReplace(StringReplace(StringReplace(sSQL, '""', '""',
    [rfReplaceAll, rfIgnoreCase]), #39, #39 + #39,
    [rfReplaceAll, rfIgnoreCase]), '"', #39, [rfReplaceAll, rfIgnoreCase]);
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  CalenderText := EmptyStr;
  mySQLDatabase1.Connected := False;

  sDBServer := INIReadString('Database', 'server', '');
  iDBPort := StrToInt(INIReadString('Database', 'port', '3306'));
  sDBUser := INIReadString('Database', 'user', '');
  sDBPassword := INIReadString('Database', 'password', '');
  sDBName := INIReadString('Database', 'database', '');

  if INIReadString('askpermission', 'onHargaSatuanFirstPage', '') = 'Y' then
    bOnHrgSatFirstPage := True
  else
    bOnHrgSatFirstPage := False;

  sSkinManager1.SkinDirectory :=
    ExtractFileDir(Application.ExeName) + '\skin';
  sSkinManager1.SkinName := INIReadString('settings', 'skin',
    'beijing (internal)');

  if INIReadString('askpermission', 'onHargaSatuanFirstPage', '') = 'Y' then
    bOnHrgSatFirstPage := True
  else
    bOnHrgSatFirstPage := False;

  //pajak
  iPPN := StrToInt(INIReadString('pajak', 'ppn', '10'));

end;

function TDM.ReadSettings2Registry(userDefinedKey: string): string;
begin
  with AMReg1 do
  begin
    Active := True;
    Result := RString(userDefinedKey);
    Active := False;
  end;
end;

function TDM.SaveSettings2Registry(userDefinedKey, Values: string): boolean;
begin
  Result := True;
  try
    with AMReg1 do
    begin
      Active := True;
      WString(userDefinedKey, Values);
      Active := False;
    end;
  except
    Result := False;
  end;
end;

procedure TDM.SavePerubahan(sKet: string; sNamaPembIjin: string = '');
begin
  dm.ExecSQL(
    'insert into data_perubahan (id_pegawai,keterangan,Nama_Pemberi_ijin)'#13 +
    'values(%d,"%s","%s")', [iAPPid, sKet, dm.sNamaPemberiIjin],
    dm.mySQLQuery1);
end;

procedure TDM.rptstrukBeforePrint(Sender: TfrxReportComponent);
begin
  if CalenderText = EmptyStr then
  begin
    ExecSQL('select max(id) from data_pendapatan', [], mySQLQuery1);
    mySQLQueryStrukDetail.Params[0].AsInteger :=
      mySQLQuery1.Fields[0].AsInteger;
    mySQLQueryStrukHeader.Params[0].AsInteger :=
      mySQLQuery1.Fields[0].AsInteger;
  end;
end;

procedure TDM.frxReportBeforePrint(Sender: TfrxReportComponent);
var
  StringArray: TStringDynArray;
  strQry: string;
begin
  case RPT_ID of
    RPT_PENGELUARAN:
      begin
        ShortDateFormat := 'dd-MM-yyyy';
        if CalenderText = EmptyStr then
        begin
          CalenderText := DateToStr(NOW);

          mySQLQueryItems.Params[0].AsString := MySQLDateFormat(CalenderText);
          mySQLQueryModalTerakhir.Params[0].AsString :=
            MySQLDateFormat(CalenderText);
          mySQLQueryModalTerakhir.Params[1].AsString :=
            MySQLDateFormat(CalenderText);

          mySQLQuerymodalawal.Params[0].AsString :=
            MySQLDateFormat(CalenderText);
          mySQLQuerymodalawal.Params[1].AsString :=
            MySQLDateFormat(CalenderText);
        end
        else if (sender.Name) = 'Memo12' then
          (sender as TfrxCustomMemoView).Text := CalenderText;
      end;
    RPT_PENGELUARAN_BULANAN:
      begin
        ShortDateFormat := 'dd-MM-yyyy';
        strQry :=
          'select (sum(COALESCE(besar,0))-(select COALESCE(sum(banyak * harga_satuan),0)'#13 +
          '                                from data_pengeluaran'#13 +
          '                                where month(tgl) <= %d and'#13 +
          '           							       year(tgl) <= %d)) as modal'#13 +
          'from data_modal'#13 +
          'where month(tgl) <= %d and'#13 +
          '      year(tgl) <= %d';

        if CalenderText = EmptyStr then
        begin
          CalenderText := DateToStr(NOW);
          StringArray := Explode('-', CalenderText);
          mySQLQueryPengeluaranBulanan.Params[0].AsString := StringArray[1];
          mySQLQueryPengeluaranBulanan.Params[1].AsString := StringArray[2];

          if (sender.Name) = 'memolastmodal' then
          begin
            ExecSQL(strQry,
              [StrToInt(StringArray[1]),
              StrToInt(StringArray[2]),
                StrToInt(StringArray[1]),
                StrToInt(StringArray[2])], mySQLQuery1);
            if mySQLQuery1.Fields[0].AsString = '' then
              (sender as TfrxCustomMemoView).Text := 'Rp.0'
            else
              (sender as TfrxCustomMemoView).Text :=
                'Rp.' + FormatRp(mySQLQuery1.Fields[0].AsString);
          end;
        end
        else
        begin
          StringArray := Explode('-', CalenderText);
          if (sender.Name) = 'bln_tahun' then
            (sender as TfrxCustomMemoView).Text :=
              arrBulan[StrToInt(StringArray[1])] + ' ' + StringArray[2];

          if (sender.Name) = 'memolastmodal' then
          begin
            ExecSQL(strQry,
              [StrToInt(StringArray[1]),
              StrToInt(StringArray[2]),
                StrToInt(StringArray[1]),
                StrToInt(StringArray[2])], mySQLQuery1);
            if mySQLQuery1.Fields[0].AsString = '' then
              (sender as TfrxCustomMemoView).Text := 'Rp.0'
            else
              (sender as TfrxCustomMemoView).Text :=
                'Rp.' + FormatRp(mySQLQuery1.Fields[0].AsString);
          end;
        end;
      end;
    RPT_PENDAPATAN:
      begin
        ShortDateFormat := 'dd-MM-yyyy';
        if CalenderText = EmptyStr then
        begin
          CalenderText := DateToStr(NOW);
          mySQLQueryPendapatan.params[0].AsString :=
            MySQLDateFormat(CalenderText);
        end
        else if (sender.Name) = 'Memo9' then
          (sender as TfrxCustomMemoView).Text := CalenderText;
      end;
    RPT_PENDAPATAN_BULANAN:
      begin
        ShortDateFormat := 'dd-MM-yyyy';
        if CalenderText = EmptyStr then
        begin
          CalenderText := DateToStr(NOW);
          StringArray := Explode('-', CalenderText);
          mySQLQueryPendapatanBulanan.Params[0].AsString := StringArray[1];
          mySQLQueryPendapatanBulanan.Params[1].AsString := StringArray[2];
        end
        else
        begin
          StringArray := Explode('-', CalenderText);
          if (sender.Name) = 'bln_tahun' then
            (sender as TfrxCustomMemoView).Text :=
              arrBulan[StrToInt(StringArray[1])] + ' ' + StringArray[2];
        end;
      end;
    //pajak
    RPT_SPTPD, RPT_SSPD,RPT_REKAP_PENJUALAN:
      begin
        ShortDateFormat := 'dd-MM-yyyy';
        if CalenderText = EmptyStr then
        begin
          CalenderText := DateToStr(NOW);
          StringArray := Explode('-', CalenderText);
          mySQLQueryPendapatanBulanan.Params[0].AsString := StringArray[1];
          mySQLQueryPendapatanBulanan.Params[1].AsString := StringArray[2];
        end
        else
        begin
        end;
      end;
    RPT_STOK:
      begin
        ShortDateFormat := 'dd-MM-yyyy';
        if CalenderText = EmptyStr then
        begin
          CalenderText := DateToStr(NOW);
          StringArray := Explode('-', CalenderText);
          mySQLQueryPerubahanStok.Params[0].AsString := StringArray[1];
          mySQLQueryPerubahanStok.Params[1].AsString := StringArray[2];
        end
        else if (sender.Name) = 'Memo6' then
          (sender as TfrxCustomMemoView).Text := CalenderText;
      end;
    RPT_PERUBAHAN_STOK:
      begin
        ShortDateFormat := 'dd-MM-yyyy';
        if CalenderText = EmptyStr then
        begin
          CalenderText := DateToStr(NOW);
          StringArray := Explode('-', CalenderText);
          mySQLQueryPerubahanStok.Params[0].AsString := StringArray[1];
          mySQLQueryPerubahanStok.Params[1].AsString := StringArray[2];
        end
        else
        begin
          StringArray := Explode('-', CalenderText);
          if (sender.Name) = 'bln_tahun' then
            (sender as TfrxCustomMemoView).Text :=
              arrBulan[StrToInt(StringArray[1])] + ' ' + StringArray[2];
        end;
      end;
    RPT_MODAL:
      begin
        ShortDateFormat := 'dd-MM-yyyy';
        if CalenderText = EmptyStr then
        begin
          CalenderText := DateToStr(NOW);
          StringArray := Explode('-', CalenderText);
          mySQLQueryModal.Params[0].AsString := StringArray[1];
          mySQLQueryMOdal.Params[1].AsString := StringArray[2];
        end
        else
        begin
          StringArray := Explode('-', CalenderText);
          if (sender.Name) = 'bln_tahun' then
            (sender as TfrxCustomMemoView).Text :=
              arrBulan[StrToInt(StringArray[1])] + ' ' + StringArray[2];
        end;
      end;
    RPT_PROSENTASE:
      begin
        ShortDateFormat := 'dd-MM-yyyy';
        if CalenderText = EmptyStr then
        begin
          CalenderText := DateToStr(NOW);
          StringArray := Explode('-', CalenderText);
          mySQLQueryPerubahanStok.Params[0].AsString := StringArray[1];
          mySQLQueryPerubahanStok.Params[1].AsString := StringArray[2];
        end;
      end;

    RPT_TUTUP_BUKU_HARIAN:
      begin
        ShortDateFormat := 'dd-MM-yyyy';
        if CalenderText = EmptyStr then
        begin
          CalenderText := DateToStr(NOW);
          StringArray := Explode('-', CalenderText);
          mySQLQueryTutupBukuHarian.Params[0].AsString := StringArray[1];
          mySQLQueryTutupBukuHarian.Params[1].AsString := StringArray[2];
        end
        else
        begin
          StringArray := Explode('-', CalenderText);
          if (sender.Name) = 'bln_thn' then
            (sender as TfrxCustomMemoView).Text :=
              arrBulan[StrToInt(StringArray[1])] + ' ' + StringArray[2];
        end;
      end;
  end
end;

procedure TDM.frxReportClickObject(Sender: TfrxView; Button: TMouseButton;
  Shift: TShiftState; var Modified: Boolean);
begin
  case RPT_ID of
    RPT_PENDAPATAN:
      begin
        if sender.Name = 'pendapatanstruk' then
        begin
          dm.mySQLQueryStrukDetail.Close;
          dm.mySQLQueryStrukDetail.Params[0].Value := sender.TagStr;
          dm.mySQLQueryStrukHeader.Close;
          dm.mySQLQueryStrukHeader.Params[0].Value := sender.TagStr;
          rptstruk.ShowReport();
        end;
      end;
  end;
end;

end.

