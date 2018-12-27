unit UnitCadastroFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFormCadastroFornecedor = class(TFormCadastroPadrao)
    LabelCodigoFornecedor: TLabel;
    DBEditCodigoFornecedor: TDBEdit;
    LabelNomeFornecedor: TLabel;
    DBEditNome: TDBEdit;
    LabelTelefone: TLabel;
    DBEditTelefone: TDBEdit;
    LabelEMAIL: TLabel;
    DBEditEMAIL: TDBEdit;
    LabelEndereco: TLabel;
    DBEditEndereco: TDBEdit;
    LabelCNPJ: TLabel;
    DBEditCNPJ: TDBEdit;
    LabelReferencia: TLabel;
    DBEditReferencia: TDBEdit;
    LabelCodigoBairro: TLabel;
    DBEditCodigoBairro: TDBEdit;
    QueryCODIGO_FORNECEDOR: TIntegerField;
    QueryNOME_FORNECEDOR: TIBStringField;
    QueryTELEFONE_FORNECEDOR: TIBStringField;
    QueryEMAIL_FORNECEDOR: TIBStringField;
    QueryENDERECO_FORNECEDOR: TIBStringField;
    QueryCNPJ: TIBStringField;
    QueryPONTO_REFERENCIA: TIBStringField;
    QueryCODIGO_BAIRRO: TIntegerField;
    QueryCOMPLEMENTO: TIBStringField;
    LabelComplemento: TLabel;
    DBEditComplemento: TDBEdit;
    GroupBoxResidencia: TGroupBox;
    GroupBoxContato: TGroupBox;
    GroupBoxBasicas: TGroupBox;
    QueryNOME_BAIRRO: TIBStringField;
    LabelNomeBairro: TLabel;
    DBEditNomeBairro: TDBEdit;
    ButtonPesquisaFK: TSpeedButton;
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonEditarClick(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
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
  FormCadastroFornecedor: TFormCadastroFornecedor;

implementation

{$R *.dfm}

uses UnitConexao, PesquisaBairro, UnitPesquisaFornecedor;

procedure TFormCadastroFornecedor.ButtonEditarClick(Sender: TObject);
begin
  inherited;
  DBEditNome.SetFocus;
end;

procedure TFormCadastroFornecedor.ButtonNovoClick(Sender: TObject);
begin
  inherited;
  DBEditNome.SetFocus;
end;

procedure TFormCadastroFornecedor.ButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  try
    FormPesquisaFornecedor:= TFormPesquisaFornecedor.Create(self);
    FormPesquisaFornecedor.ShowModal;
  finally
    if (FormPesquisaFornecedor.ModalResult=mrOk) then
    begin
      Query.Locate('CODIGO_FORNECEDOR',FormPesquisaFornecedor.QueryCODIGO_FORNECEDOR.AsInteger,[]);
    end;
    FormPesquisaFornecedor.Free;
  end;
end;

procedure TFormCadastroFornecedor.ButtonPesquisaFKClick(Sender: TObject);
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

procedure TFormCadastroFornecedor.ButtonSalvarClick(Sender: TObject);
var
  numero: double;
begin
  if(trim(DBEditNome.Text)='') then
  begin
    Application.MessageBox('Nome do fornecedor obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditNome.SetFocus;
    exit;
  end;

  if(trim(DBEditTelefone.Text)='') then
  begin
    Application.MessageBox('Telefone do fornecedor obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditTelefone.SetFocus;
    exit;
  end;

  if (TryStrToFloat(DBEditNome.Text,numero)) then
  begin
    Application.MessageBox('Nome do fornecedor inválido','Erro',MB_ICONERROR+MB_OK);
    DBEditNome.SetFocus;
    DBEditNome.Clear;
    exit;
  end;

  if(trim(DBEditCodigoFornecedor.Text)='') then
  begin
    Application.MessageBox('Código do fornecedor obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditCodigoFornecedor.SetFocus;
    exit;
  end;

  if(trim(DBEditEMAIL.Text)='') then
  begin
    Application.MessageBox('E-mail obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditEMAIL.SetFocus;
    exit;
  end;

  if(trim(DBEditEndereco.Text)='') then
  begin
    Application.MessageBox('Endereço obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditEndereco.SetFocus;
    exit;
  end;

  if(trim(DBEditCNPJ.Text)='  .   .   /    -  ') then
  begin
    Application.MessageBox('CNPJ obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditEndereco.SetFocus;
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

  inherited;

end;

procedure TFormCadastroFornecedor.DBEditCodigoBairroExit(Sender: TObject);
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

procedure TFormCadastroFornecedor.DSStateChange(Sender: TObject);
begin
  inherited;
  ButtonPesquisaFK.Enabled:=DS.State in [dsInsert,dsEdit];
end;

procedure TFormCadastroFornecedor.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  QueryCODIGO_FORNECEDOR.ASinteger:= conexao.geraPK('CODIGO_FORNECEDOR','FORNECEDOR');
end;

end.
