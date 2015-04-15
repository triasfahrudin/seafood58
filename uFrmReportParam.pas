unit uFrmReportParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ESBPCSPanel, ESBPCSCalEdit, DateUtils, printers,
  DB, mySQLDbTables, sButton;

type
  TFrmReportParam = class(TForm)
    cal: TESBCalEdit;
    Label1: TLabel;
    btnOK: TsButton;
    Label2: TLabel;
    cmbbulan: TComboBox;
    cbLangsungCetak: TCheckBox;
    Label3: TLabel;
    eTahun: TEdit;
    ComboBox1: TComboBox;
    mySQLQuery_stok_helper: TmySQLQuery;
    btnKeluar: TsButton;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbLangsungCetakClick(Sender: TObject);
    procedure eTahunKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnKeluarClick(Sender: TObject);
  private

  public

    procedure FillCmbBulan;
  end;

var
  FrmReportParam: TFrmReportParam;

implementation

{$R *.dfm}
uses
  uDM, uLibrary, frxClass;

procedure TFrmReportParam.btnOKClick(Sender: TObject);
var
  i: integer;
  CurrTgl: string;
begin
  if cal.Enabled then
    dm.CalenderText := cal.Text //dont mess with this!
  else
  begin
    dm.CalenderText := '1-' +
      IntToStr(cmbbulan.ItemIndex + 1) + '-' +
      eTahun.Text;
  end;

  case DM.RPT_ID of
    RPT_PENDAPATAN:
      begin
        with dm.mySQLQueryPendapatan, dm.frxReport do //dm.rptendapatan do
        begin
          LoadFromFile(ExtractFilePath(Application.ExeName) +
            '\report\' + RPT_PENDAPATAN_FILES);
          Close;
          params[0].AsString := MySQLDateFormat(cal.Text);
          Active := true;
          if cbLangsungCetak.Checked then
          begin
            if PrepareReport() then
            begin
              PrintOptions.ShowDialog := false;
              PrintOptions.Printer := ComboBox1.Text;
              print;
            end;
          end
          else
            ShowReport();
        end;
      end;
    RPT_PENDAPATAN_BULANAN:
      begin
        with Dm.mySQLQueryPendapatanBulanan, dm.frxReport do
          //DM.rptPendapatanBulanan do
        begin
          LoadFromFile(ExtractFilePath(Application.ExeName) +
            '\report\' + RPT_PENDAPATAN_BULANAN_FILE);
          Close;
          params[0].Value := IntToStr(cmbbulan.ItemIndex + 1);
          params[1].Value := eTahun.Text;
          Active := true;
          if cbLangsungCetak.Checked then
          begin
            if PrepareReport() then
            begin
              PrintOptions.ShowDialog := false;
              PrintOptions.Printer := ComboBox1.Text;
              print;
            end;
          end
          else
            ShowReport();
        end;
      end;

    RPT_PENGELUARAN:
      begin
        with DM.frxReport do
        begin
          LoadFromFile(ExtractFilePath(Application.ExeName) +
            '\report\' + RPT_PENGELUARAN_FILES);

          dm.mySQLQueryItems.Close;
          dm.mySQLQueryModalTerakhir.Close;
          dm.mySQLQuerymodalawal.Close;

          dm.mySQLQueryItems.Params[0].AsString := MySQLDateFormat(cal.Text);
          dm.mySQLQueryModalTerakhir.Params[0].AsString :=
            MySQLDateFormat(cal.Text);
          dm.mySQLQuerymodalawal.Params[0].AsString :=
            MySQLDateFormat(cal.Text);

          dm.mySQLQueryModalTerakhir.Params[1].AsString :=
            MySQLDateFormat(cal.Text);
          dm.mySQLQuerymodalawal.Params[1].AsString :=
            MySQLDateFormat(cal.Text);

          dm.mySQLQueryItems.Active := True;
          dm.mySQLQueryModalTerakhir.Active := True;
          dm.mySQLQuerymodalawal.Active := True;

          DecimalSeparator := ',';
          if cbLangsungCetak.Checked then
          begin
            if PrepareReport() then
            begin
              PrintOptions.ShowDialog := false;
              PrintOptions.Printer := ComboBox1.Text;
              print;
            end;
          end
          else
            ShowReport();
        end;
      end;
    RPT_PENGELUARAN_BULANAN:
      begin
        with DM.mySQLQueryPengeluaranBulanan,
          DM.frxReport do
        begin
          LoadFromFile(ExtractFilePath(Application.ExeName) +
            '\report\' + RPT_PENGELUARAN_BULANAN_FILE);

          Close;
          params[0].Value := IntToStr(cmbbulan.ItemIndex + 1);
          params[1].Value := eTahun.Text;
          Open;
          if cbLangsungCetak.Checked then
          begin
            if PrepareReport() then
            begin
              PrintOptions.ShowDialog := false;
              PrintOptions.Printer := ComboBox1.Text;
              print;
            end;
          end
          else
            ShowReport();
        end;
      end;
    RPT_PROSENTASE:
      begin
        if eTahun.Text = EmptyStr then
          Exit;
        dm.ExecSQL('delete from temp_report_3', [], dm.mySQLQuery1);

        for i := 1 to DaysInAMonth(StrToInt(eTahun.Text), cmbbulan.ItemIndex + 1)
          do
        begin
          CurrTgl :=
            eTahun.Text + '-' +
            IntToStr(cmbbulan.ItemIndex + 1) + '-' +
            IntToStr(i);
          dm.ExecSQL(
            'select func_GetPengeluaran("%s"),func_GetPendapatan("%s")',
            [CurrTgl, CurrTgl], dm.mySQLQuery2);
          dm.ExecSQL(
            'insert into temp_report_3 (tgl,pengeluaran,pendapatan) values("%s",%d,%d)',
            [CurrTgl,
            dm.mySQLQuery2.Fields[0].AsInteger,
              dm.mySQLQuery2.Fields[1].AsInteger], dm.mySQLQuery1);
        end;

        dm.mySQLQueryPerubahanStok.Close;
        dm.mySQLQueryPerubahanStok.Params[0].AsString :=
          IntToStr(cmbbulan.ItemIndex + 1);
        dm.mySQLQueryPerubahanStok.Params[1].AsString := eTahun.Text;
        dm.mySQLQueryPerubahanStok.Open;

        with dm.mySQLQueryProsentase, dm.frxReport do
        begin
          LoadFromFile(ExtractFilePath(Application.ExeName) +
            '\report\' + RPT_PROSENTASE_FILE);
          Close;
          Active := true;
          ThousandSeparator := '.';
          if cbLangsungCetak.Checked then
          begin
            if PrepareReport() then
            begin
              PrintOptions.ShowDialog := false;
              PrintOptions.Printer := ComboBox1.Text;
              print;
            end;
          end
          else
            ShowReport();
        end;
      end;

    RPT_STOK:
      begin
        dm.ExecSQL('delete from temp_report_stok', [], dm.mySQLQuery1);
        dm.ExecSQL(
          'select a.id,a.nama,b.nama,a.sort'#13 +
          'from data_subjenismenu a'#13 +
          'left join data_satuan b'#13 +
          'on a.id_satuan_laporan = b.id'#13 +
          'where a.is_stok = 1'#13 +
          'order by a.sort', [], dm.mySQLQuery1);

        dm.mySQLQuery1.First;
        DecimalSeparator := '.';
        while not dm.mySQLQuery1.Eof do
        begin
          CurrTgl := MySQLDateFormat(cal.Text);
          dm.ExecSQL(
            'select func_GetStokMasuk("%s",%d),'#13 +
            '       func_GetStokKeluar("%s",%d),'#13 +
            '       func_GetStokPengurangan("%s",%d),'#13 +
            '       func_GetStokPenambahan("%s",%d)',
            [CurrTgl, dm.mySQLQuery1.Fields[0].AsInteger,
            CurrTgl, dm.mySQLQuery1.Fields[0].AsInteger,
              CurrTgl, dm.mySQLQuery1.Fields[0].AsInteger,
              CurrTgl, dm.mySQLQuery1.Fields[0].AsInteger], dm.mySQLQuery3);

          dm.ExecSQL(
            'insert into temp_report_stok(id_subjenismenu,'#13 +
            '                             nama_items,'#13 +
            '                             nama_satuan,'#13 +
            '                             stok_masuk,'#13 +
            '                             stok_keluar,'#13 +
            '                             pengurangan_stok,'#13 +
            '                             penambahan_stok,'#13 +
            '                             sort)'#13 +
            'values(%d,"%s","%s",%f,%f,%f,%f,%d)',
            [dm.mySQLQuery1.Fields[0].AsInteger,
            dm.mySQLQuery1.Fields[1].AsString,
              dm.mySQLQuery1.Fields[2].AsString,
              dm.mySQLQuery3.Fields[0].AsFloat,
              dm.mySQLQuery3.Fields[1].AsFloat,
              dm.mySQLQuery3.Fields[2].AsFloat,
              dm.mySQLQuery3.Fields[3].AsFloat,
              dm.mySQLQuery1.Fields[3].AsInteger], dm.mySQLQuery2);
          dm.mySQLQuery1.Next;
        end;

        DecimalSeparator := ',';

        with DM.frxReport do
        begin
          LoadFromFile(ExtractFilePath(Application.ExeName) +
            '\report\' + RPT_STOK_FILES);
          dm.mySQLQueryPerubahanStok.Close;
          dm.mySQLQueryPerubahanStok.Params[0].AsString :=
            IntToStr(cmbbulan.ItemIndex + 1);
          dm.mySQLQueryPerubahanStok.Params[1].AsString := eTahun.Text;
          dm.mySQLQueryPerubahanStok.Open;

          dm.mySQLQueryStok.Close;
          dm.mySQLQueryStok.Active := True;
          if cbLangsungCetak.Checked then
          begin
            if PrepareReport() then
            begin
              PrintOptions.ShowDialog := false;
              PrintOptions.Printer := ComboBox1.Text;
              print;
            end;
          end
          else
            ShowReport();
        end;
      end;

    RPT_PERUBAHAN_STOK:
      begin
        with DM.frxReport do
        begin
          LoadFromFile(ExtractFilePath(Application.ExeName) +
            '\report\' + RPT_PERUBAHAN_STOK_FILE);
          dm.mySQLQueryPerubahanStok.Close;
          dm.mySQLQueryPerubahanStok.Params[0].AsString :=
            IntToStr(cmbbulan.ItemIndex + 1);
          dm.mySQLQueryPerubahanStok.Params[1].AsString := eTahun.Text;
          dm.mySQLQueryPerubahanStok.Open;

          if cbLangsungCetak.Checked then
          begin
            if PrepareReport() then
            begin
              PrintOptions.ShowDialog := false;
              PrintOptions.Printer := ComboBox1.Text;
              print;
            end;
          end
          else
            ShowReport();
        end;
      end;
    RPT_MODAL:
      begin
        with DM.frxReport do
        begin
          LoadFromFile(ExtractFilePath(Application.ExeName) +
            '\report\' + RPT_MODAL_FILE);
          dm.mySQLQueryModal.Close;
          dm.mySQLQueryModal.Params[0].AsString :=
            IntToStr(cmbbulan.ItemIndex + 1);
          dm.mySQLQueryModal.Params[1].AsString := eTahun.Text;
          dm.mySQLQueryModal.Open;

          if cbLangsungCetak.Checked then
          begin
            if PrepareReport() then
            begin
              PrintOptions.ShowDialog := false;
              PrintOptions.Printer := ComboBox1.Text;
              print;
            end;
          end
          else
            ShowReport();
        end;
      end;
    RPT_TUTUP_BUKU_HARIAN:
      begin
        with DM.mySQLQueryTutupBukuHarian,
          DM.frxReport do
        begin
          LoadFromFile(ExtractFilePath(Application.ExeName) +
            '\report\' + RPT_TUTUP_BUKU_HARIAN_FILE);
          Close;
          params[0].Value := IntToStr(cmbbulan.ItemIndex + 1);
          params[1].Value := eTahun.Text;
          Open;
          if cbLangsungCetak.Checked then
          begin
            if PrepareReport() then
            begin
              PrintOptions.ShowDialog := false;
              PrintOptions.Printer := ComboBox1.Text;
              print;
            end;
          end
          else
            ShowReport();
        end;
      end;

    RPT_SPTPD:
      begin
        {RPT_SPTPD menggunakan list variable yang sama dengan pendapatan bulanan}
        with Dm.mySQLQueryNilai_setelah_disc, dm.frxReport do
          //DM.rptPendapatanBulanan do
        begin
          LoadFromFile(ExtractFilePath(Application.ExeName) +
            '\report\' + RPT_SPTPD_FILE);
          Close;
          {ppn
          bln_huruf
          thn
          ppn
          bln
          thn

          }
          params[0].Value := DM.iPPN;
          Params[1].Value := arrBulan[cmbbulan.ItemIndex + 1];
          params[2].Value := eTahun.Text;
          params[3].Value := DM.iPPN;
          params[4].Value := IntToStr(cmbbulan.ItemIndex + 1);
          params[5].Value := eTahun.Text;

          Active := true;
          if cbLangsungCetak.Checked then
          begin
            if PrepareReport() then
            begin
              PrintOptions.ShowDialog := false;
              PrintOptions.Printer := ComboBox1.Text;
              print;
            end;
          end
          else
            ShowReport();
        end;
      end;

    RPT_SSPD:
      begin
        {RPT_SPTPD menggunakan list variable yang sama dengan pendapatan bulanan}
        with Dm.mySQLQueryNilai_setelah_disc, dm.frxReport do
          //DM.rptPendapatanBulanan do
        begin
          LoadFromFile(ExtractFilePath(Application.ExeName) +
            '\report\' + RPT_SSPD_FILE);
          Close;
          {ppn
          bln_huruf
          thn
          ppn
          bln
          thn

          }
          params[0].Value := DM.iPPN;
          Params[1].Value := arrBulan[cmbbulan.ItemIndex + 1];
          params[2].Value := eTahun.Text;
          params[3].Value := DM.iPPN;
          params[4].Value := IntToStr(cmbbulan.ItemIndex + 1);
          params[5].Value := eTahun.Text;

          Active := true;
          if cbLangsungCetak.Checked then
          begin
            if PrepareReport() then
            begin
              PrintOptions.ShowDialog := false;
              PrintOptions.Printer := ComboBox1.Text;
              print;
            end;
          end
          else
            ShowReport();
        end;

      end;

    RPT_REKAP_PENJUALAN:
      begin
        {RPT_SPTPD menggunakan list variable yang sama dengan pendapatan bulanan}
        with Dm.mySQLQueryRekapPenjualan, dm.frxReport do
          //DM.rptPendapatanBulanan do
        begin
          LoadFromFile(ExtractFilePath(Application.ExeName) +
            '\report\' + RPT_REKAP_PENJUALAN_FILE);
          Close;
          {ppn
          bln_huruf
          thn
          bln
          thn

          }
          params[0].Value := DM.iPPN;
          Params[1].Value := arrBulan[cmbbulan.ItemIndex + 1];
          params[2].Value := eTahun.Text;
          params[3].Value := IntToStr(cmbbulan.ItemIndex + 1);
          params[4].Value := eTahun.Text;

          Active := true;
          if cbLangsungCetak.Checked then
          begin
            if PrepareReport() then
            begin
              PrintOptions.ShowDialog := false;
              PrintOptions.Printer := ComboBox1.Text;
              print;
            end;
          end
          else
            ShowReport();
        end;
      end;
  end;
end;

procedure TFrmReportParam.FillCmbBulan;
var
  i: integer;
begin
  cmbbulan.Items.Clear;
  for i := 1 to 12 do
    cmbbulan.Items.Add(arrBulan[i]);
end;

procedure TFrmReportParam.FormShow(Sender: TObject);
begin
  cal.Enabled := false;
  eTahun.Enabled := false;
  cmbbulan.Enabled := false;

  case DM.RPT_ID of
    RPT_PENDAPATAN, RPT_PENGELUARAN, RPT_STOK:
      begin
        cal.Enabled := True;
      end;
    RPT_PROSENTASE, RPT_PENDAPATAN_BULANAN,
      RPT_PENGELUARAN_BULANAN, RPT_TUTUP_BUKU_HARIAN,
      RPT_PERUBAHAN_STOK, RPT_MODAL, RPT_SPTPD, RPT_SSPD,
      RPT_REKAP_PENJUALAN:
      begin
        eTahun.Enabled := true;
        cmbbulan.Enabled := true;
      end;
  end;
end;

procedure TFrmReportParam.FormCreate(Sender: TObject);
var
  tgl: TStringDynArray;
begin
  ComboBox1.Items.Assign(printer.printers);
  if ComboBox1.Items.Count > 0 then
    ComboBox1.ItemIndex := 0;
  FillCmbBulan;

  ShortDateFormat := 'dd-MM-yyyy';
  tgl := Explode('-', DateToStr(NOW));

  cmbbulan.ItemIndex := StrToInt(tgl[1]) - 1;
  eTahun.Text := tgl[2];
end;

procedure TFrmReportParam.cbLangsungCetakClick(Sender: TObject);
begin
  ComboBox1.Enabled := cbLangsungCetak.Checked;
end;

procedure TFrmReportParam.eTahunKeyPress(Sender: TObject; var Key: Char);
begin
  inherited KeyPress(Key);
  if key = #13 then
  begin
    btnOKClick(Sender);
    exit;
  end;

  if (key <> #8) then
    if (key < '0') or (key > '9') then
      key := #0;
end;

procedure TFrmReportParam.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmReportParam.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

end.

