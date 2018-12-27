unit UnitCadastroAgendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, Data.DB, IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFormCadastroAgendamento = class(TFormCadastroPadrao)
    LabelCodigoAgendamento: TLabel;
    DBEditCodigoAgendamento: TDBEdit;
    LabelData: TLabel;
    DBEditData: TDBEdit;
    LabelHora: TLabel;
    DBEditHora: TDBEdit;
    LabelCodigoServico: TLabel;
    DBEditCodigoServico: TDBEdit;
    LabelCodigoCliente: TLabel;
    DBEditCodigoCliente: TDBEdit;
    LabelCodigoColaborador: TLabel;
    DBEditCodigoColaborador: TDBEdit;
    QueryCODIGO_AGENDAMENTO: TIntegerField;
    QueryDATA_ATENDIMENTO: TDateField;
    QueryHORA_ATENDIMENTO: TTimeField;
    QueryCODIGO_SERVICO: TIntegerField;
    QueryCODIGO_CLIENTE: TIntegerField;
    QueryCODIGO_COLABORADOR: TIntegerField;
    QueryNOME_CLIENTE: TIBStringField;
    QueryNOME_COLABORADOR: TIBStringField;
    QueryNOME_SERVICO: TIBStringField;
    LabelNomeCliente: TLabel;
    DBEditNomeCliente: TDBEdit;
    LabelNomeColaborador: TLabel;
    DBEditNomeColaborador: TDBEdit;
    LabelNomeServico: TLabel;
    DBEditNomeServico: TDBEdit;
    ButtonPesquisaServico: TSpeedButton;
    ButtonPesquisaCliente: TSpeedButton;
    ButtonPesquisaColaborador: TSpeedButton;
    GroupBoxBasicas: TGroupBox;
    GroupBoxServico: TGroupBox;
    GroupBoxCliente: TGroupBox;
    GroupBoxColaborador: TGroupBox;
    procedure ButtonEditarClick(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure DBEditCodigoServicoExit(Sender: TObject);
    procedure DBEditCodigoClienteExit(Sender: TObject);
    procedure DBEditCodigoColaboradorExit(Sender: TObject);
    procedure ButtonPesquisaClick(Sender: TObject);
    procedure ButtonPesquisaClienteClick(Sender: TObject);
    procedure ButtonPesquisaServicoClick(Sender: TObject);
    procedure ButtonPesquisaColaboradorClick(Sender: TObject);
    procedure DSStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroAgendamento: TFormCadastroAgendamento;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaAgendamento, UnitPesquisaCliente,
  UnitPesquisaColaborador, UnitPesquisaServico;

procedure TFormCadastroAgendamento.ButtonEditarClick(Sender: TObject);
begin
  inherited;
  DBEditData.SetFocus;
end;

procedure TFormCadastroAgendamento.ButtonNovoClick(Sender: TObject);
begin
  inherited;
  DBEditData.SetFocus;
  QueryDATA_ATENDIMENTO.AsDateTime:= Now;
end;

procedure TFormCadastroAgendamento.ButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  try
    FormPesquisaAgendamento:= TFormPesquisaAgendamento.Create(self);
    FormPesquisaAgendamento.ShowModal;
  finally
    if (FormPesquisaAgendamento.ModalResult=mrOk) then
    begin
      Query.Locate('CODIGO_AGENDAMENTO',FormPesquisaAgendamento.QueryCODIGO_AGENDAMENTO.AsInteger,[]);
    end;
    FormPesquisaAgendamento.Free;
  end;
end;

procedure TFormCadastroAgendamento.ButtonPesquisaClienteClick(Sender: TObject);
begin
  inherited;
  try
    FormPesquisaCliente:= TFormPesquisaCliente.Create(self);
    FormPesquisaCliente.ShowModal;
  finally
    if (FormPesquisaCliente.ModalResult=mrOk) then
    begin
      Query.Locate('CODIGO_CLIENTE',FormPesquisaCliente.QueryCODIGO_CLIENTE.AsInteger,[]);
    end;
    FormPesquisaCliente.Free;
  end;

end;

procedure TFormCadastroAgendamento.ButtonPesquisaColaboradorClick(
  Sender: TObject);
begin
  inherited;
  try
    FormPesquisaColaborador:= TFormPesquisaColaborador.Create(self);
    FormPesquisaColaborador.ShowModal;
  finally
    if (FormPesquisaColaborador.ModalResult=mrOk) then
    begin
      Query.Locate('CODIGO_COLABORADOR',FormPesquisaColaborador.QueryCODIGO_COLABORADOR.AsInteger,[]);
    end;
    FormPesquisaColaborador.Free;
  end;
end;

procedure TFormCadastroAgendamento.ButtonPesquisaServicoClick(Sender: TObject);
begin
  inherited;
  try
    FormPesquisaServico:= TFormPesquisaServico.Create(self);
    FormPesquisaServico.ShowModal;
  finally
    if (FormPesquisaServico.ModalResult=mrOk) then
    begin
      Query.Locate('CODIGO_SERVICO',FormPesquisaServico.QueryCODIGO_SERVICO.AsInteger,[]);
    end;
    FormPesquisaServico.Free;
  end;
end;

procedure TFormCadastroAgendamento.ButtonSalvarClick(Sender: TObject);
var
  numero:double;
begin
  if(trim(DBEditData.Text)='') then
  begin
    Application.MessageBox('Data obrigatória','Erro',MB_ICONERROR+MB_OK);
    DBEditData.SetFocus;
    exit;
  end;

  if(trim(DBEditHora.Text)='') then
  begin
    Application.MessageBox('Hora obrigatória','Erro',MB_ICONERROR+MB_OK);
    DBEditHora.SetFocus;
    exit;
  end;


  if(trim(DBEditCodigoServico.Text)='') then
  begin
    Application.MessageBox('Código do serviço obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditCodigoServico.SetFocus;
    exit;
  end;

  if(trim(DBEditCodigoCliente.Text)='') then
  begin
    Application.MessageBox('Código do cliente obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditCodigoCliente.SetFocus;
    exit;
  end;

  if(trim(DBEditCodigoColaborador.Text)='') then
  begin
    Application.MessageBox('Código do colaborador obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditCodigoColaborador.SetFocus;
    exit;
  end;

  if(trim(DBEditNomeCliente.Text)='') then
  begin
    Application.MessageBox('Nome do cliente obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditNomeCliente.SetFocus;
    exit;
  end;

if (TryStrToFloat(DBEditNomeCliente.Text,numero)) then
  begin
    Application.MessageBox('Nome do cliente inválido','Erro',MB_ICONERROR+MB_OK);
    DBEditNomeCliente.SetFocus;
    DBEditNomeCliente.Clear;
    exit;
  end;

  if(trim(DBEditNomeColaborador.Text)='') then
  begin
    Application.MessageBox('Nome do colaborador obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditNomeColaborador.SetFocus;
    exit;
  end;

  if(trim(DBEditNomeServico.Text)='') then
  begin
    Application.MessageBox('Nome do serviço obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditNomeServico.SetFocus;
    exit;
  end;
  inherited;

end;

procedure TFormCadastroAgendamento.DBEditCodigoClienteExit(Sender: TObject);
Var
  SQL:string;
begin
  inherited;

  if(DBEditCodigoCliente.Text='') then
  begin
    exit;
  end;
  SQL:='SELECT NOME_CLIENTE FROM CLIENTE WHERE CODIGO_CLIENTE ='+DBEditCodigoCliente.Text;
  conexao.alteraSQL(conexao.Query,SQL);
  //TESTAR SE NÃO RETORNOU RESULTADO
  if (conexao.Query.IsEmpty) then
  begin
    application.MessageBox('Registro não localizado!','ERRO',MB_ICONERROR+ MB_OK);
    DBEditCodigoCliente.SetFocus;
    exit;
  end;
  QueryNOME_CLIENTE.AsString:=conexao.Query.FieldByName('NOME_CLIENTE').AsString;
end;

procedure TFormCadastroAgendamento.DBEditCodigoColaboradorExit(Sender: TObject);
Var
  SQL:string;
begin
  inherited;

  if(DBEditCodigoColaborador.Text='') then
  begin
    exit;
  end;
  SQL:='SELECT NOME_COLABORADOR FROM COLABORADOR WHERE CODIGO_COLABORADOR ='+DBEditCodigoColaborador.Text;
  conexao.alteraSQL(conexao.Query,SQL);
  //TESTAR SE NÃO RETORNOU RESULTADO
  if (conexao.Query.IsEmpty) then
  begin
    application.MessageBox('Registro não localizado!','ERRO',MB_ICONERROR+ MB_OK);
    DBEditCodigoColaborador.SetFocus;
    exit;
  end;
  QueryNOME_COLABORADOR.AsString:=conexao.Query.FieldByName('NOME_COLABORADOR').AsString;
end;

procedure TFormCadastroAgendamento.DBEditCodigoServicoExit(Sender: TObject);
Var
  SQL:string;
begin
  inherited;

  if(DBEditCodigoServico.Text='') then
  begin
    exit;
  end;
  SQL:='SELECT NOME_SERVICO FROM SERVICO WHERE CODIGO_SERVICO ='+DBEditCodigoServico.Text;
  conexao.alteraSQL(conexao.Query,SQL);
  //TESTAR SE NÃO RETORNOU RESULTADO
  if (conexao.Query.IsEmpty) then
  begin
    application.MessageBox('Registro não localizado!','ERRO',MB_ICONERROR+ MB_OK);
    DBEditCodigoServico.SetFocus;
    exit;
  end;
  QueryNOME_SERVICO.AsString:=conexao.Query.FieldByName('NOME_SERVICO').AsString;
end;

procedure TFormCadastroAgendamento.DSStateChange(Sender: TObject);
begin
  inherited;
  ButtonPesquisaCliente.Enabled:=DS.State in [dsInsert,dsEdit];
  ButtonPesquisaServico.Enabled:=DS.State in [dsInsert,dsEdit];
  ButtonPesquisaColaborador.Enabled:=DS.State in [dsInsert,dsEdit];
end;

procedure TFormCadastroAgendamento.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  queryCODIGO_AGENDAMENTO.ASinteger:= conexao.geraPK('CODIGO_AGENDAMENTO','AGENDAMENTO');
end;

end.
