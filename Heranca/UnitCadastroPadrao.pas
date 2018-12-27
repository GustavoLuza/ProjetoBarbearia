unit UnitCadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IBX.IBCustomDataSet, IBX.IBUpdateSQL,
  Data.DB, IBX.IBQuery, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFormCadastroPadrao = class(TForm)
    Navegador: TDBNavigator;
    GroupBoxAcao: TGroupBox;
    ButtonNovo: TBitBtn;
    ButtonEditar: TBitBtn;
    ButtonSalvar: TBitBtn;
    ButtonCancelar: TBitBtn;
    ButtonExcluir: TBitBtn;
    ButtonFechar: TBitBtn;
    Query: TIBQuery;
    DS: TDataSource;
    Update: TIBUpdateSQL;
    ButtonPesquisa: TSpeedButton;
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonEditarClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
    procedure ButtonFecharClick(Sender: TObject);
    procedure DSStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QueryBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroPadrao: TFormCadastroPadrao;

implementation

{$R *.dfm}

uses UnitConexao;



procedure TFormCadastroPadrao.ButtonCancelarClick(Sender: TObject);
begin
  if (Application.MessageBox('Deseja cancelar?','Aviso',MB_ICONQUESTION+MB_YESNO)=idNo) then
  Begin
    Exit;
  End
  else
    query.CancelUpdates;

end;

procedure TFormCadastroPadrao.ButtonEditarClick(Sender: TObject);
begin
  Query.edit;
end;

procedure TFormCadastroPadrao.ButtonExcluirClick(Sender: TObject);
begin
  if (Application.MessageBox('Deseja excluir?','Aviso',MB_ICONQUESTION+MB_YESNO)=idNo) then
  Begin
    Exit;
  End;
  //INICIA TRANSAÇÃO
  if not(Conexao.Transacao.InTransaction) then BEgin
    Conexao.Transacao.StartTransaction;
  End;
  try
    //TENTA EXCLUIR
    query.Delete;
    //EFETIVA TRANSAÇÃO
    Conexao.Transacao.Commit;
  except
    //DEAFAZ TRANSAÇÃO
    Conexao.Transacao.Rollback;
    Application.MessageBox('ERRO ao Excluir',
    'ERRO',MB_ICONERROR+MB_OK);
  end;
  //ABRIR A QUERY
  query.Open;
end;

procedure TFormCadastroPadrao.ButtonFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCadastroPadrao.ButtonNovoClick(Sender: TObject);
begin
  Query.Append;
end;

procedure TFormCadastroPadrao.ButtonSalvarClick(Sender: TObject);
begin
  //VERIFICAR TRANSAÇÃO
  if not (conexao.Transacao.InTransaction) then
  begin
    conexao.Transacao.StartTransaction;
  end;

  //TENTAR GRAVAR
  try
    query.Post;
    conexao.Transacao.Commit;
  except
    conexao.Transacao.Rollback;
    application.MessageBox('ERRO AO GRAVAR','ERRO',MB_ICONERROR+MB_OK);
  end;

  //REABRIR A QUERY
  query.Open;
end;

procedure TFormCadastroPadrao.DSStateChange(Sender: TObject);
begin
  //HABILITAR E DESABILITAR BOTÕES
  buttonNovo.Enabled:= ds.State in [dsBrowse];
  buttonEditar.Enabled:= ds.State in [dsBrowse];
  buttonSalvar.Enabled:= ds.State in [dsInsert,dsEdit];
  ButtonCancelar.Enabled:= ds.State in [dsInsert,dsEdit];
  buttonExcluir.Enabled:= ds.State in [dsBrowse];
  buttonFechar.Enabled:= ds.State in [dsBrowse];
  ButtonPesquisa.Enabled:= ds.State in [dsBrowse];
  Navegador.Enabled:= ds.State in [dsBrowse];
end;

procedure TFormCadastroPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query.Close;
end;

procedure TFormCadastroPadrao.FormCreate(Sender: TObject);
begin
  Query.Open;
end;

procedure TFormCadastroPadrao.QueryBeforePost(DataSet: TDataSet);
begin
  if(DS.State = dsEdit) then
  begin
    exit;
  end;
end;

end.
