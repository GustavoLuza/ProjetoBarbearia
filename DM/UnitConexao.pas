unit UnitConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,
  IBX.IBDatabase, IniFiles, Vcl.Dialogs, Vcl.Forms;

type
  TConexao = class(TDataModule)
    DB: TIBDatabase;
    TRANSACAO: TIBTransaction;
    QUERY: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure alteraSQL(Query: TIBQuery; SQL: String);
    function geraPK(PK, table : string):integer;
  end;

var
  Conexao: TConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TConexao.alteraSQL(Query: TIBQuery; SQL: String);  //ALTERA O SQL AUTOMATICAMENTE
Begin
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add(SQL);
  Query.Open;
End;

procedure TConexao.DataModuleCreate(Sender: TObject);
Var
  arquivoIni : TIniFile;
  caminho : string;
begin
  arquivoIni:= TIniFile.Create('.\parametros.INI');
  try
    caminho:= arquivoIni.ReadString('BANCO','caminho','');
  finally
    arquivoIni.Free;
  end;
  //TENTAR CONECTAR O BANCO COM O CAMINHO LIDO
  try
    DB.Close;
    DB.DatabaseName:= caminho;
    DB.Open;
  except
    ShowMessage('Erro ao Conectar com o Banco de Dados');
    Application.terminate;
  end;
end;

function TConexao.geraPK(PK, table : string):integer; // GERA PK AUTOMATICAMENTE
Var
  SQL: string;
begin
  SQL:='SELECT MAX('+PK+') AS MAIOR FROM '+TABLE;
  alteraSQL(Query,SQL);
  geraPK:=query.FieldByName('MAIOR').AsInteger+1;
end;
end.
