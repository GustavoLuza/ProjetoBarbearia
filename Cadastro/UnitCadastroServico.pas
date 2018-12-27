unit UnitCadastroServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, Data.DB, IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFormCadastroServico = class(TFormCadastroPadrao)
    QueryCODIGO_SERVICO: TIntegerField;
    QueryNOME_SERVICO: TIBStringField;
    QueryVALOR_SERVICO: TIBBCDField;
    LabelCódigo: TLabel;
    DBEditCodigo: TDBEdit;
    LabelNome: TLabel;
    DBEditNome: TDBEdit;
    LabelValor: TLabel;
    DBEditValor: TDBEdit;
    GroupBoxServico: TGroupBox;
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure ButtonEditarClick(Sender: TObject);
    procedure ButtonPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroServico: TFormCadastroServico;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaServico;

procedure TFormCadastroServico.ButtonEditarClick(Sender: TObject);
begin
  inherited;
  DBEditNome.SetFocus;
end;

procedure TFormCadastroServico.ButtonNovoClick(Sender: TObject);
begin
  inherited;
  DBEditNome.SetFocus;
end;

procedure TFormCadastroServico.ButtonPesquisaClick(Sender: TObject);
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

procedure TFormCadastroServico.ButtonSalvarClick(Sender: TObject);
var
  numero:double;
begin
  if(trim(DBEditNome.Text)='') then
  begin
    Application.MessageBox('Serviço obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditNome.SetFocus;
    exit;
  end;

  if(trim(DBEditValor.Text)='') then
  begin
    Application.MessageBox('Valor do serviço obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditValor.SetFocus;
    exit;
  end;

  if (TryStrToFloat(DBEditNome.Text,numero)) then
  begin
    Application.MessageBox('Nome do serviço inválido','Erro',MB_ICONERROR+MB_OK);
    DBEditNome.SetFocus;
    DBEditNome.Clear;
    exit;
  end;

  inherited;

end;

procedure TFormCadastroServico.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  QueryCODIGO_SERVICO.ASinteger:= conexao.geraPK('CODIGO_SERVICO','SERVICO');
end;

end.
