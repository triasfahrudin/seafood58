unit uFrmBackupRestoreDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, ComCtrls, sPageControl, acProgressBar,
  StdCtrls, sLabel, Mask, sMaskEdit, sCustomComboEdit, sTooledit, MySQLDump,
  sButton, DynPanel, sGroupBox, sMemo, MySQLBatch, MySQLTools, sComboBox,
  MySQLMonitor, sCheckBox, jpeg;

type
  TFrmBackupRestoreDB = class(TForm)
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sPanel1: TsPanel;
    MySQLDump1: TMySQLDump;
    sGroupBox1: TsGroupBox;
    btnStartbackup: TsButton;
    sLabel2: TsLabel;
    sProgressBar1: TsProgressBar;
    sGroupBox2: TsGroupBox;
    sFilenameEdit1: TsFilenameEdit;
    sLabel1: TsLabel;
    MySQLBatchExecute1: TMySQLBatchExecute;
    sMemo1: TsMemo;
    btnStartRestrore: TsButton;
    btnKeluar: TsButton;
    sTabSheet2: TsTabSheet;
    sMemo2: TsMemo;
    btnProcess: TsButton;
    MySQLTools1: TMySQLTools;
    sComboBox1: TsComboBox;
    sLabel3: TsLabel;
    sComboBox2: TsComboBox;
    sComboBox3: TsComboBox;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    shp1: TShape;
    img1: TImage;
    sLabelFX1: TsLabelFX;
    sTabSheet3: TsTabSheet;
    MySQLBatchExecute2: TMySQLBatchExecute;
    sComboBox4: TsComboBox;
    sLabel6: TsLabel;
    btnUpdate: TsButton;
    sMemo3: TsMemo;
    cbDebug: TsCheckBox;
    procedure btnStartbackupClick(Sender: TObject);
    procedure MySQLDump1Process(Sender: TObject; Table: string;
      Percent: Integer);
    procedure MySQLDump1Finish(Sender: TObject);
    procedure btnStartRestroreClick(Sender: TObject);
    procedure MySQLBatchExecute1BeforeStatement(Sender: TObject;
      SQLText: string; const StatementNo: Integer; var Allow: Boolean);
    procedure MySQLBatchExecute1AfterStatement(Sender: TObject;
      SQLText: string; const StatementNo, RowsAffected: Integer;
      const Success: Boolean);
    procedure btnKeluarClick(Sender: TObject);
    procedure btnProcessClick(Sender: TObject);
    procedure MySQLTools1Error(TableName, ErrorMessage: string);
    procedure MySQLTools1Success(TableName, Status: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MySQLBatchExecute2AfterStatement(Sender: TObject;
      SQLText: string; const StatementNo, RowsAffected: Integer;
      const Success: Boolean);
    procedure cbDebugClick(Sender: TObject);
  private

  public

  end;

var
  FrmBackupRestoreDB: TFrmBackupRestoreDB;
implementation

{$R *.dfm}
uses
  uDM;

procedure TFrmBackupRestoreDB.btnStartbackupClick(Sender: TObject);
begin
  ShortDateFormat := 'dd-mm-yyyy';
  dm.mySQLDatabase1.GetTableNames('', MySQLDump1.TableList, TRUE);

  MySQLDump1.SQLFile := ExtractFilePath(Application.ExeName) + '\backup\' +
    dm.sDBName + '-' + DateToStr(NOW) + '.sql';
  MySQLDump1.Execute;
end;

procedure TFrmBackupRestoreDB.MySQLDump1Process(Sender: TObject;
  Table: string; Percent: Integer);
begin

  sLabel2.Caption := 'Processing: ' + Table;
  sProgressBar1.Position := Percent;
end;

procedure TFrmBackupRestoreDB.MySQLDump1Finish(Sender: TObject);
begin
  MessageDlg('Backup selesai disimpan di folder backup',
    mtInformation, [mbOK], 0);
  sLabel2.Caption := '...';
end;

procedure TFrmBackupRestoreDB.btnStartRestroreClick(Sender: TObject);
begin
  if sFilenameEdit1.FileName = EmptyStr then
  begin
    MessageDlg('Nama file tidak boleh kosong', mtError, [mbOK], 0);
    Exit;
  end;
  if not FileExists(sFilenameEdit1.FileName) then
  begin
    MessageDlg('Nama file tidak ditemukan', mtError, [mbOK], 0);
    Exit;
  end;

  if MessageDlg(
    'Apakah anda yakin ingin melakukan ini?'#13 +
    'kesalahan pada saat restore (file sql corrupt atau lainnya)'#13 +
    'akan mengakibatkan database anda rusak!',
    mtWarning, [mbYes] + [mbNO], 0) <> mrYes then
    Exit;
  sleep(500);
  Application.ProcessMessages;
  sMemo1.Lines.Clear;
  MySQLBatchExecute1.Sql.LoadFromFile(sFilenameEdit1.FileName);
  try
    MySQLBatchExecute1.ExecSql;
    MessageDlg('Selesai', mtInformation, [mbOK], 0);
  except
    on E: Exception do
      MessageDlg('Error:' + E.ClassName + ''#13 +
        E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TFrmBackupRestoreDB.MySQLBatchExecute1BeforeStatement(
  Sender: TObject; SQLText: string; const StatementNo: Integer;
  var Allow: Boolean);
begin
  //  sMemo1.Lines.Add('#----------------------------------->');
  if cbDebug.Checked then
  begin
    sMemo1.Lines.Add(SQLText);
    Application.ProcessMessages;
  end;
end;

procedure TFrmBackupRestoreDB.MySQLBatchExecute1AfterStatement(
  Sender: TObject; SQLText: string; const StatementNo,
  RowsAffected: Integer; const Success: Boolean);
begin
  if cbDebug.Checked then
  begin
    if Success then
      sMemo1.Lines.Add('Success')
    else
    begin
      sMemo1.Lines.Add('ERROR!!!!!!!!!');
      sMemo1.Lines.SaveToFile(ExtractFilePath(Application.ExeName) + '\backup\'
        +
        sFilenameEdit1.FileName + '.err');
    end;
    sMemo1.Lines.Add('Rows Affected:' + IntToStr(RowsAffected));
    //  sMemo1.Lines.Add('<-----------------------------------#');
    sMemo1.Lines.Add('');
    Application.ProcessMessages;
  end;
end;

procedure TFrmBackupRestoreDB.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBackupRestoreDB.btnProcessClick(Sender: TObject);
begin

  dm.mySQLDatabase1.GetTableNames('', MySQLTools1.TableList);
  case sComboBox1.ItemIndex of
    0: MySQLTools1.CheckOption := coQuick;
    1: MySQLTools1.CheckOption := coFast;
    2: MySQLTools1.CheckOption := coMedium;
    3: MySQLTools1.CheckOption := coExtended;
    4: MySQLTools1.CheckOption := coChanged;
  end;

  case sComboBox2.ItemIndex of
    0: MySQLTools1.MySQLOperation := oOptimize;
    1: MySQLTools1.MySQLOperation := oCheck;
    2: MySQLTools1.MySQLOperation := oAnalyze;
    3: MySQLTools1.MySQLOperation := oRepair;

  end;

  case sComboBox2.ItemIndex of
    0: MySQLTools1.RepairOption := roQuick;
    1: MySQLTools1.RepairOption := roExtended;
  end;
  sMemo2.Lines.Add('>>Start     :' + DateTimeToStr(NOW));
  sMemo2.Lines.Add('>>Operation :' + sComboBox1.Text + ' ' + sComboBox2.Text);
  MySQLTools1.Execute;
  sMemo2.Lines.Add('>>End       :' + DateTimeToStr(NOW));
  sMemo2.Lines.Add(
    '----------------------------------------------------');
end;

procedure TFrmBackupRestoreDB.MySQLTools1Error(TableName,
  ErrorMessage: string);
begin
  sMemo2.Lines.Add('ERROR ON:' + TableName + ' Message:' + ErrorMessage);
end;

procedure TFrmBackupRestoreDB.MySQLTools1Success(TableName,
  Status: string);
begin
  sMemo2.Lines.Add(TableName + ' Status:' + Status);
end;

procedure TFrmBackupRestoreDB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmBackupRestoreDB.btnUpdateClick(Sender: TObject);
var
  i: byte;
  str: TStringList;
begin

  str := TStringList.Create;
  try
    sMemo3.Clear;
    dm.mySQLDatabase1.GetTableNames('', str);
    for i := 0 to str.Count - 1 do
      sMemo3.Lines.Add(
        'ALTER TABLE `' + dm.sDBName + '`.`' + str[i] + '` ENGINE ' +
        sComboBox4.Text + ';');
  finally
    str.Free;
  end;
  sMemo3.Lines.SaveToFile('_temp.sql');
  sMemo3.Lines.Clear;
  sleep(150);
  MySQLBatchExecute2.Sql.LoadFromFile('_temp.sql');
  try
    MySQLBatchExecute2.ExecSql;
    MessageDlg('Selesai Mengubah table Engine', mtInformation, [mbOK], 0);
  except
    on E: Exception do
      MessageDlg('Error:' + E.ClassName + ''#13 +
        E.Message, mtError, [mbOK], 0);
  end;
  DeleteFile('_temp.sql');
end;

procedure TFrmBackupRestoreDB.FormCreate(Sender: TObject);
begin
  sPageControl1.ActivePage := sTabSheet1;
end;

procedure TFrmBackupRestoreDB.MySQLBatchExecute2AfterStatement(
  Sender: TObject; SQLText: string; const StatementNo,
  RowsAffected: Integer; const Success: Boolean);
begin
  sMemo3.Lines.Add(SQLText);
end;

procedure TFrmBackupRestoreDB.cbDebugClick(Sender: TObject);
begin
  sMemo1.Visible := cbDebug.Checked;
end;

end.

