unit UnitCadastroCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, Data.DB, IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFormCadastroCidade = class(TFormCadastroPadrao)
    QueryCODIGO_CIDADE: TIntegerField;
    QueryNOME_CIDADE: TIBStringField;
    QuerySIGLA_ESTADO: TIBStringField;
    LabelCodigo: TLabel;
    DBEditCodigo: TDBEdit;
    LabelNome: TLabel;
    DBEditNome: TDBEdit;
    LabelSigla: TLabel;
    ComboBoxSigla: TDBComboBox;
    GroupBoxCidade: TGroupBox;
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonEditarClick(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroCidade: TFormCadastroCidade;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaCidade;

procedure TFormCadastroCidade.ButtonCancelarClick(Sender: TObject);
begin
  inherited;
  DBEditNome.SetFocus;
end;

procedure TFormCadastroCidade.ButtonEditarClick(Sender: TObject);
begin
  inherited;
  DBEditNome.SetFocus;
end;

procedure TFormCadastroCidade.ButtonNovoClick(Sender: TObject);
begin
  inherited;
  DBEditNome.SetFocus;
end;

procedure TFormCadastroCidade.ButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  try
    FormPesquisaCidade:= TFormPesquisaCidade.Create(self);
    FormPesquisaCidade.ShowModal;
  finally
    if (FormPesquisaCidade.ModalResult=mrOk) then
    begin
      Query.Locate('CODIGO_CIDADE',FormPesquisaCidade.QueryCODIGO_CIDADE.AsInteger,[]);
    end;
    FormPesquisaCidade.Free;
  end;
end;

procedure TFormCadastroCidade.ButtonSalvarClick(Sender: TObject);
var
  numero:double;
begin
  if(trim(DBEditNome.Text)='') then
  begin
    Application.MessageBox('Nome da cidade obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditNome.SetFocus;
    exit;
  end;

  if (TryStrToFloat(DBEditNome.Text,numero)) then
  begin
    Application.MessageBox('Nome da cidade inválido','Erro',MB_ICONERROR+MB_OK);
    DBEditNome.SetFocus;
    DBEditNome.Clear;
    exit;
  end;

    if (ComboBoxSigla.ItemIndex= -1 ) then
  begin
    application.MessageBox('Selecione uma sigla', 'Erro',MB_ICONERROR+mb_ok);
    QuerySIGLA_ESTADO.AsString:='SC';
    exit;
  end;
  inherited;

end;

procedure TFormCadastroCidade.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  QueryCODIGO_CIDADE.ASinteger:= conexao.geraPK('CODIGO_CIDADE','CIDADE');
end;

end.
