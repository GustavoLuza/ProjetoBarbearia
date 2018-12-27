unit UnitCadastroColaborador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, Data.DB, IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFormCadastroColaborador = class(TFormCadastroPadrao)
    QueryCODIGO_COLABORADOR: TIntegerField;
    QueryNOME_COLABORADOR: TIBStringField;
    QueryNUMERO_TELEFONE: TIBStringField;
    QueryNUMERO_CPF: TIBStringField;
    QueryNUMERO_RG: TIBStringField;
    QueryENDERECO: TIBStringField;
    QueryCOMPLEMENTO: TIBStringField;
    QueryPONTO_REFERENCIA: TIBStringField;
    QueryDATA_NASCIMENTO: TDateField;
    QueryEMAIL: TIBStringField;
    QueryCONTA_BANCARIA: TIBStringField;
    QueryCODIGO_BAIRRO: TIntegerField;
    LabelCodigoColaborador: TLabel;
    DBEditCodigoColaborador: TDBEdit;
    LabelNome: TLabel;
    DBEditNome: TDBEdit;
    LabelNumero: TLabel;
    DBEditNumero: TDBEdit;
    LabelCPF: TLabel;
    DBEditCPF: TDBEdit;
    LabelRG: TLabel;
    DBEditRG: TDBEdit;
    LabelEndereco: TLabel;
    DBEditEndereco: TDBEdit;
    LabelComplemento: TLabel;
    DBEditComplemento: TDBEdit;
    LabelReferencia: TLabel;
    DBEditReferencia: TDBEdit;
    LabelData: TLabel;
    DBEditData: TDBEdit;
    LabelEmail: TLabel;
    DBEditEmail: TDBEdit;
    LabelConta: TLabel;
    DBEditConta: TDBEdit;
    LabelCodigoBairro: TLabel;
    DBEditCodigoBairro: TDBEdit;
    LabelAgencia: TLabel;
    LabelNumeroConta: TLabel;
    LabelDigito: TLabel;
    GroupBoxResidencia: TGroupBox;
    GroupBoxContato: TGroupBox;
    GroupBoxCadastrais: TGroupBox;
    GroupBoxBasica: TGroupBox;
    QueryNOME_BAIRRO: TIBStringField;
    LabelNomeBairro: TLabel;
    DBEditNomeBairro: TDBEdit;
    ButtonPesquisaFK: TSpeedButton;
    procedure ButtonSalvarClick(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonEditarClick(Sender: TObject);
    procedure ButtonPesquisaClick(Sender: TObject);
    procedure ButtonPesquisaFKClick(Sender: TObject);
    procedure DSStateChange(Sender: TObject);
    procedure DBEditCodigoBairroExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroColaborador: TFormCadastroColaborador;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaColaborador, PesquisaBairro;

procedure TFormCadastroColaborador.ButtonEditarClick(Sender: TObject);
begin
  inherited;
  DBEditNome.SetFocus;
end;

procedure TFormCadastroColaborador.ButtonNovoClick(Sender: TObject);
begin
  inherited;
  DBEditNome.SetFocus;
end;

procedure TFormCadastroColaborador.ButtonPesquisaClick(Sender: TObject);
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

procedure TFormCadastroColaborador.ButtonPesquisaFKClick(Sender: TObject);
begin
  inherited;
  try
    FormPesquisaBairro:=TFormPesquisaBairro.Create(self);
    FormPesquisaBairro.ShowModal;
  finally
    if (FormPesquisaBairro.ModalResult = mrOk) then
    begin
      QueryCODIGO_BAIRRO.AsInteger:=FormPesquisaBairro.QueryCODIGO_BAIRRO.AsInteger;

      QueryNOME_BAIRRO.AsString:=FormPesquisaBairro.QueryNOME_BAIRRO.AsString;
    end;
  end;
  FormPesquisaBairro.Free;
end;

procedure TFormCadastroColaborador.ButtonSalvarClick(Sender: TObject);
var
  numero:double;
begin
  if(trim(DBEditNome.Text)='') then
  begin
    Application.MessageBox('Nome do colaborador obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditNome.SetFocus;
    exit;
  end;

  if (TryStrToFloat(DBEditNome.Text,numero)) then
  begin
    Application.MessageBox('Nome do colaborador inválido','Erro',MB_ICONERROR+MB_OK);
    DBEditNome.SetFocus;
    DBEditNome.Clear;
    exit;
  end;

  if(trim(DBEditCodigoColaborador.Text)='') then
  begin
    Application.MessageBox('Código do colaborador obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditCodigoColaborador.SetFocus;
    exit;
  end;

  if(trim(DBEditNumero.Text)='      -    ') then
  begin
    Application.MessageBox('Número do telefone obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditNumero.SetFocus;
    exit;
  end;

  if(trim(DBEditCPF.Text)='   .   .   -  ') then
  begin
    Application.MessageBox('Número do CPF obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditCPF.SetFocus;
    exit;
  end;

  if(trim(DBEditRG.Text)='') then
  begin
    Application.MessageBox('Número do RG obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditRG.SetFocus;
    exit;
  end;

  if(trim(DBEditEndereco.Text)='') then
  begin
    Application.MessageBox('Endereço obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditEndereco.SetFocus;
    exit;
  end;

  if(trim(DBEditData.Text)='  /  /    ') then
  begin
    Application.MessageBox('Data de nascimento obrigatória','Erro',MB_ICONERROR+MB_OK);
    DBEditData.SetFocus;
    exit;
  end;

  if(trim(DBEditEmail.Text)='') then
  begin
    Application.MessageBox('E-mail obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditEmail.SetFocus;
    exit;
  end;

  if(trim(DBEditCodigoBairro.Text)='') then
  begin
    Application.MessageBox('Código do bairro obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditCodigoBairro.SetFocus;
    exit;
  end;

  if(trim(DBEditNomeBairro.Text)='') then
  begin
    Application.MessageBox('Nome do bairro obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditNomeBairro.SetFocus;
    exit;
  end;

  if(trim(DBEditConta.Text)='            - ') then
  begin
    Application.MessageBox('Conta bancária obrigatória','Erro',MB_ICONERROR+MB_OK);
    DBEditConta.SetFocus;
    exit;
  end;

  inherited;

end;

procedure TFormCadastroColaborador.DBEditCodigoBairroExit(Sender: TObject);
Var
  SQL:string;
begin
  inherited;

  if(DBEditCodigoBairro.Text='') then
  begin
    exit;
  end;
  SQL:='SELECT NOME_BAIRRO FROM BAIRRO WHERE CODIGO_BAIRRO ='+DBEditCodigoBairro.Text;
  conexao.alteraSQL(conexao.Query,SQL);
  //TESTAR SE NÃO RETORNOU RESULTADO
  if (conexao.Query.IsEmpty) then
  begin
    application.MessageBox('Registro não localizado!','ERRO',MB_ICONERROR+ MB_OK);
    DBEditCodigoBairro.SetFocus;
    exit;
  end;
  QueryNOME_BAIRRO.AsString:=conexao.Query.FieldByName('NOME_BAIRRO').AsString;
end;

procedure TFormCadastroColaborador.DSStateChange(Sender: TObject);
begin
  inherited;
  ButtonPesquisaFK.Enabled:=DS.State in [dsInsert,dsEdit];
end;

procedure TFormCadastroColaborador.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  queryCODIGO_COLABORADOR.ASinteger:= conexao.geraPK('CODIGO_COLABORADOR','COLABORADOR');
end;

end.
