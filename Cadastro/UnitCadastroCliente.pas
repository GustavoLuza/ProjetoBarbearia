unit UnitCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, Data.DB, IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFormCadastroCliente = class(TFormCadastroPadrao)
    QueryCODIGO_CLIENTE: TIntegerField;
    QueryNOME_CLIENTE: TIBStringField;
    QueryCOMPLEMENTO: TIBStringField;
    QueryENDERECO: TIBStringField;
    QueryPONTO_REFERENCIA: TIBStringField;
    QueryDATA_NASCIMENTO: TDateField;
    QuerySEXO: TIBStringField;
    QueryNUMERO_CPF: TIBStringField;
    QueryNUMERO_RG: TIBStringField;
    QueryNUMERO_TELEFONE: TIBStringField;
    QueryCODIGO_BAIRRO: TIntegerField;
    QueryEMAIL: TIBStringField;
    LabelCodigoCliente: TLabel;
    DBEditCodigoCliente: TDBEdit;
    LabelNome: TLabel;
    DBEditNome: TDBEdit;
    LabelComplemento: TLabel;
    DBEditComplemento: TDBEdit;
    LabelEndereco: TLabel;
    DBEditEndereco: TDBEdit;
    LabelReferencia: TLabel;
    DBEditReferencia: TDBEdit;
    LabelNascimento: TLabel;
    DBEditNascimento: TDBEdit;
    LabelSexo: TLabel;
    LabelCPF: TLabel;
    DBEditCPF: TDBEdit;
    LabelRG: TLabel;
    DBEditRG: TDBEdit;
    LabelTelefone: TLabel;
    DBEditTelefone: TDBEdit;
    LabelCodigoBairro: TLabel;
    DBEditCodigoBairro: TDBEdit;
    LabelEmail: TLabel;
    DBEditEmail: TDBEdit;
    DBComboBoxSexo: TDBComboBox;
    GroupBoxEndereco: TGroupBox;
    GroupBoxContato: TGroupBox;
    GroupBoxDocumentos: TGroupBox;
    GroupBoxInfoBasica: TGroupBox;
    QueryNOME_BAIRRO: TIBStringField;
    LabelNomeBairro: TLabel;
    DBEditNomeBairro: TDBEdit;
    ButtonPesquisaFK: TSpeedButton;
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonEditarClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
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
  FormCadastroCliente: TFormCadastroCliente;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaCliente, PesquisaBairro;

procedure TFormCadastroCliente.ButtonEditarClick(Sender: TObject);
begin
  inherited;
  DBEditNome.SetFocus;
end;

procedure TFormCadastroCliente.ButtonNovoClick(Sender: TObject);
begin
  inherited;
  DBEditNome.SetFocus;
end;

procedure TFormCadastroCliente.ButtonPesquisaClick(Sender: TObject);
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

procedure TFormCadastroCliente.ButtonPesquisaFKClick(Sender: TObject);
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

procedure TFormCadastroCliente.ButtonSalvarClick(Sender: TObject);
Var
  numero:double;
begin
  if(trim(DBEditCodigoCliente.Text)='') then
  begin
    Application.MessageBox('Código do cliente obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditCodigoCliente.SetFocus;
    exit;
  end;

  if(trim(DBEditNome.Text)='') then
  begin
    Application.MessageBox('Nome do cliente obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditNome.SetFocus;
    exit;
  end;

  if(trim(DBEditEndereco.Text)='') then
  begin
    Application.MessageBox('Endereço obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditEndereco.SetFocus;
    exit;
  end;

  if(trim(DBEditNascimento.Text)='  /  /    ') then
  begin
    Application.MessageBox('Data de nascimento obrigatória','Erro',MB_ICONERROR+MB_OK);
    DBEditNascimento.SetFocus;
    exit;
  end;

  if(trim(DBEditCPF.Text)='   .   .   -  ') then
  begin
    Application.MessageBox('Número do CPF obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditNascimento.SetFocus;
    exit;
  end;

  if(trim(DBEditRG.Text)='') then
  begin
    Application.MessageBox('Número do RG obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditRG.SetFocus;
    exit;
  end;

  if(trim(DBEditTelefone.Text)='      -    ') then
  begin
    Application.MessageBox('Número do telefone obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditTelefone.SetFocus;
    exit;
  end;

  if(trim(DBEditCodigoBairro.Text)='') then
  begin
    Application.MessageBox('Código do bairro obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditCodigoCliente.SetFocus;
    exit;
  end;

  if(trim(DBEditEmail.Text)='') then
  begin
    Application.MessageBox('E-mail  obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditEmail.SetFocus;
    exit;
  end;

  if (TryStrToFloat(DBEditNome.Text,numero)) then
  begin
    Application.MessageBox('Nome do cliente inválido','Erro',MB_ICONERROR+MB_OK);
    DBEditNome.SetFocus;
    DBEditNome.Clear;
    exit;
  end;

  if (DBComboBoxSexo.ItemIndex= -1 ) then
  begin
    application.MessageBox('Selecione uma sexo', 'Erro',MB_ICONERROR+mb_ok);
    QuerySEXO.AsString:='M';
    exit;
  end;


  inherited;

end;

procedure TFormCadastroCliente.DBEditCodigoBairroExit(Sender: TObject);
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

procedure TFormCadastroCliente.DSStateChange(Sender: TObject);
begin
  inherited;
  ButtonPesquisaFK.Enabled:=DS.State in [dsInsert,dsEdit];
end;

procedure TFormCadastroCliente.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  QueryCODIGO_CLIENTE.ASinteger:= conexao.geraPK('CODIGO_CLIENTE','CLIENTE');
end;

end.
