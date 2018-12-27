unit UnitCadastroBairro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, Data.DB, IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFormCadastroBairro = class(TFormCadastroPadrao)
    QueryCODIGO_BAIRRO: TIntegerField;
    QueryNOME_BAIRRO: TIBStringField;
    QueryCODIGO_CIDADE: TIntegerField;
    QueryNOME_CIDADE: TIBStringField;
    LabelCodigoBairro: TLabel;
    DBEditCodigoBairro: TDBEdit;
    LabelNomeBairro: TLabel;
    DBEditNomeBairro: TDBEdit;
    LabelCodigoCidade: TLabel;
    DBEditCodigoCidade: TDBEdit;
    LabelNomeCidade: TLabel;
    DBEditNomeCidade: TDBEdit;
    GroupBoxCidade: TGroupBox;
    GroupBoxBairro: TGroupBox;
    ButtonPesquisaFK: TSpeedButton;
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonEditarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure DBEditCodigoCidadeExit(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonPesquisaClick(Sender: TObject);
    procedure ButtonPesquisaFKClick(Sender: TObject);
    procedure DSStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroBairro: TFormCadastroBairro;

implementation

{$R *.dfm}

uses UnitConexao, PesquisaBairro, UnitPesquisaCidade;

procedure TFormCadastroBairro.ButtonCancelarClick(Sender: TObject);
begin
  inherited;
  DBEditNomeBairro.SetFocus;
end;

procedure TFormCadastroBairro.ButtonEditarClick(Sender: TObject);
begin
  inherited;
  DBEditNomeBairro.SetFocus;
end;

procedure TFormCadastroBairro.ButtonNovoClick(Sender: TObject);
begin
  inherited;
  DBEditNomeBairro.SetFocus;
end;

procedure TFormCadastroBairro.ButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  try
    FormPesquisaBairro:= TFormPesquisaBairro.Create(self);
    FormPesquisaBairro.ShowModal;
  finally
    if (FormPesquisaBairro.ModalResult=mrOk) then
    begin
      Query.Locate('CODIGO_BAIRRO',FormPesquisaBairro.QueryCODIGO_BAIRRO.AsInteger,[]);
    end;
    FormPesquisaBairro.Free;
  end;
end;

procedure TFormCadastroBairro.ButtonPesquisaFKClick(Sender: TObject);
begin
  inherited;
  try
    FormPesquisaCidade:=TFormPesquisaCidade.Create(self);
    FormPesquisaCidade.ShowModal;
  finally
    if (FormPesquisaCidade.ModalResult = mrOk) then
    begin
      QueryCODIGO_CIDADE.AsInteger:=FormPesquisaCidade.QueryCODIGO_CIDADE.AsInteger;

      QueryNOME_CIDADE.AsString:=FormPesquisaCidade.QueryNOME_CIDADE.AsString;
    end;
  end;
  FormPesquisaCidade.Free;
end;

procedure TFormCadastroBairro.ButtonSalvarClick(Sender: TObject);
begin
  if(trim(DBEditNomeBairro.Text)='') then
  begin
    Application.MessageBox('Nome do bairro obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditNomeBairro.SetFocus;
    exit;
  end;

  if(trim(DBEditCodigoBairro.Text)='') then
  begin
    Application.MessageBox('Código do bairro obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditCodigoBairro.SetFocus;
    exit;
  end;

  if(trim(DBEditCodigoCidade.Text)='') then
  begin
    Application.MessageBox('Codigo da cidade obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditCodigoCidade.SetFocus;
    exit;
  end;

  if(trim(DBEditNomeCidade.Text)='') then
  begin
    Application.MessageBox('Nome da cidade obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditNomeCidade.SetFocus;
    exit;
  end;
  inherited;
end;

procedure TFormCadastroBairro.DBEditCodigoCidadeExit(Sender: TObject);
Var
  SQL:string;
begin
  inherited;

  if(DBEditCodigoCidade.Text='') then
  begin
    exit;
  end;
  SQL:='SELECT NOME_CIDADE FROM CIDADE WHERE CODIGO_CIDADE ='+DBEditCodigoCidade.Text;
  conexao.alteraSQL(conexao.Query,SQL);
  //TESTAR SE NÃO RETORNOU RESULTADO
  if (conexao.Query.IsEmpty) then
  begin
    application.MessageBox('Registro não localizado!','ERRO',MB_ICONERROR+ MB_OK);
    DBEditCodigoCidade.SetFocus;
    exit;
  end;
  QueryNOME_CIDADE.AsString:=conexao.Query.FieldByName('NOME_CIDADE').AsString;
end;

procedure TFormCadastroBairro.DSStateChange(Sender: TObject);
begin
  inherited;
  ButtonPesquisaFK.Enabled:=DS.State in [dsInsert,dsEdit];
end;

procedure TFormCadastroBairro.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
    QueryCODIGO_BAIRRO.AsInteger:=conexao.geraPK('CODIGO_BAIRRO','BAIRRO');
end;

end.
