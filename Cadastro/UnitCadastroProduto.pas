unit UnitCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, Data.DB, IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFormCadastroProduto = class(TFormCadastroPadrao)
    QueryNOME_PRODUTO: TIBStringField;
    QueryQUANTIDADE_PRODUTO: TIntegerField;
    QueryCODIGO_FORNECEDOR: TIntegerField;
    QueryCODIGO_PRODUTO: TIntegerField;
    QueryVALOR_VENDA: TIBBCDField;
    QueryMARCA_PRODUTO: TIBStringField;
    QueryNOME_FORNECEDOR: TIBStringField;
    LabelNomeProduto: TLabel;
    DBEditNomeProduto: TDBEdit;
    LabelQuantidadeProduto: TLabel;
    DBEditQuantidade: TDBEdit;
    LabelCodigoFornecedor: TLabel;
    DBEditCodigoFornecedor: TDBEdit;
    LabelCodigoProduto: TLabel;
    DBEditCodigoProduto: TDBEdit;
    LabelValorVenda: TLabel;
    DBEditValorVenda: TDBEdit;
    LabelMarcaProduto: TLabel;
    DBEditMarca: TDBEdit;
    LabelNomeFornecedor: TLabel;
    DBEditNomeFornecedor: TDBEdit;
    GroupBoxFornecedor: TGroupBox;
    GroupBoxInfoVenda: TGroupBox;
    GroupBoxBasica: TGroupBox;
    QueryVALOR_ENTRADA: TIBBCDField;
    LabelValorEntrada: TLabel;
    DBEditValorEntrada: TDBEdit;
    ButtonPesquisaFK: TSpeedButton;
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonEditarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure DBEditCodigoFornecedorClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonPesquisaClick(Sender: TObject);
    procedure ButtonPesquisaFKClick(Sender: TObject);
    procedure DSStateChange(Sender: TObject);
    procedure DBEditCodigoFornecedorExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroProduto: TFormCadastroProduto;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaFornecedor, UnitPesquisaProduto;

procedure TFormCadastroProduto.ButtonCancelarClick(Sender: TObject);
begin
  inherited;
  DBEditNomeProduto.SetFocus;
end;

procedure TFormCadastroProduto.ButtonEditarClick(Sender: TObject);
begin
  inherited;
  DBEditNomeProduto.SetFocus;
end;

procedure TFormCadastroProduto.ButtonNovoClick(Sender: TObject);
begin
  inherited;
  DBEditNomeProduto.SetFocus;
end;

procedure TFormCadastroProduto.ButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  try
    FormPesquisaProduto:= TFormPesquisaProduto.Create(self);
    FormPesquisaProduto.ShowModal;
  finally
    if (FormPesquisaProduto.ModalResult=mrOk) then
    begin
      Query.Locate('CODIGO_PRODUTO',FormPesquisaProduto.QueryCODIGO_PRODUTO.AsInteger,[]);
    end;
    FormPesquisaProduto.Free;
  end;
end;

procedure TFormCadastroProduto.ButtonPesquisaFKClick(Sender: TObject);
begin
  inherited;
  try
    FormPesquisaFornecedor:=TFormPesquisaFornecedor.Create(self);
    FormPesquisaFornecedor.ShowModal;
  finally
    if (FormPesquisaFornecedor.ModalResult = mrOk) then
    begin
      QueryCODIGO_FORNECEDOR.AsInteger:=FormPesquisaFornecedor.QueryCODIGO_FORNECEDOR.AsInteger;

      QueryNOME_FORNECEDOR.AsString:=FormPesquisaFornecedor.QueryNOME_FORNECEDOR.AsString;
    end;
  end;
  FormPesquisaFornecedor.Free;
end;

procedure TFormCadastroProduto.ButtonSalvarClick(Sender: TObject);
begin
  if(trim(DBEditNomeProduto.Text)='') then
  begin
    Application.MessageBox('Nome do produto obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditNomeProduto.SetFocus;
    exit;
  end;

  if(trim(DBEditValorEntrada.Text)='') then
  begin
    Application.MessageBox('Valor de entrada obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditValorEntrada.SetFocus;
    exit;
  end;

  if(trim(DBEditValorVenda.Text)='') then
  begin
    Application.MessageBox('Valor de venda obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditValorVenda.SetFocus;
    exit;
  end;

  if(trim(DBEditQuantidade.Text)='') then
  begin
    Application.MessageBox('Quantidade do produto obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditQuantidade.SetFocus;
    exit;
  end;

  if(trim(DBEditMarca.Text)='') then
  begin
    Application.MessageBox('Marca do produto obrigatória','Erro',MB_ICONERROR+MB_OK);
    DBEditMarca.SetFocus;
    exit;
  end;

  if(trim(DBEditCodigoFornecedor.Text)='') then
  begin
    Application.MessageBox('Código do fornecedor obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditCodigoFornecedor.SetFocus;
    exit;
  end;
  inherited;

end;

procedure TFormCadastroProduto.DBEditCodigoFornecedorClick(Sender: TObject);
Var
  SQL:string;
begin
  inherited;

  if(DBEditCodigoFornecedor.Text='') then
  begin
    exit;
  end;
  SQL:='SELECT NOME_FORNECEDOR FROM FORNECEDOR WHERE CODIGO_FORNECEDOR ='+DBEditCodigoFornecedor.Text;
  conexao.alteraSQL(conexao.Query,SQL);
  //TESTAR SE NÃO RETORNOU RESULTADO
  if (conexao.Query.IsEmpty) then
  begin
    application.MessageBox('Registro não localizado!','ERRO',MB_ICONERROR+ MB_OK);
    DBEditCodigoFornecedor.SetFocus;
    exit;
  end;
  QueryNOME_FORNECEDOR.AsString:=conexao.Query.FieldByName('NOME_FORNECEDOR').AsString;
end;
procedure TFormCadastroProduto.DBEditCodigoFornecedorExit(Sender: TObject);
Var
  SQL:string;
begin
  inherited;

  if(DBEditCodigoFornecedor.Text='') then
  begin
    exit;
  end;
  SQL:='SELECT NOME_FORNECEDOR FROM FORNECEDOR WHERE CODIGO_FORNECEDOR ='+DBEditCodigoFornecedor.Text;
  conexao.alteraSQL(conexao.Query,SQL);
  //TESTAR SE NÃO RETORNOU RESULTADO
  if (conexao.Query.IsEmpty) then
  begin
    application.MessageBox('Registro não localizado!','ERRO',MB_ICONERROR+ MB_OK);
    DBEditCodigoFornecedor.SetFocus;
    exit;
  end;
  QueryNOME_FORNECEDOR.AsString:=conexao.Query.FieldByName('NOME_CIDADE').AsString;
end;

procedure TFormCadastroProduto.DSStateChange(Sender: TObject);
begin
  inherited;
  ButtonPesquisaFK.Enabled:=DS.State in [dsInsert,dsEdit];
end;

procedure TFormCadastroProduto.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  QueryCODIGO_PRODUTO.AsInteger:=conexao.geraPK('CODIGO_PRODUTO','PRODUTO');
end;

end.
