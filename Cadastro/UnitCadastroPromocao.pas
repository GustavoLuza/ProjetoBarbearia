unit UnitCadastroPromocao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, IBX.IBCustomDataSet, IBX.IBUpdateSQL,
  IBX.IBQuery, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormCadastroPromocao = class(TFormCadastroPadrao)
    QueryCODIGO_PROMOCAO: TIntegerField;
    QueryNOME_PROMOCAO: TIBStringField;
    QueryVALOR_DESCONTO: TIBBCDField;
    LabelCodigo: TLabel;
    DBEditCodigo: TDBEdit;
    LabelNome: TLabel;
    DBEditNome: TDBEdit;
    LabelDesconto: TLabel;
    DBEditDesconto: TDBEdit;
    GroupBoxPromocao: TGroupBox;
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonEditarClick(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure ButtonPesquisaClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroPromocao: TFormCadastroPromocao;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaPromocao;

procedure TFormCadastroPromocao.ButtonEditarClick(Sender: TObject);
begin
  inherited;
  DBEditNome.SetFocus;
end;

procedure TFormCadastroPromocao.ButtonNovoClick(Sender: TObject);
begin
  inherited;
  DBEditNome.SetFocus;
end;

procedure TFormCadastroPromocao.ButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  try
    FormPesquisaPromocao:= TFormPesquisaPromocao.Create(self);
    FormPesquisaPromocao.ShowModal;
  finally
    if (FormPesquisaPromocao.ModalResult=mrOk) then
    begin
      Query.Locate('CODIGO_PROMOCAO',FormPesquisaPromocao.QueryCODIGO_PROMOCAO.AsInteger,[]);
    end;
    FormPesquisaPromocao.Free;
    end;
end;

procedure TFormCadastroPromocao.ButtonSalvarClick(Sender: TObject);
begin
  if(trim(DBEditNome.Text)='') then
  begin
    Application.MessageBox('Nome da promoção obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditNome.SetFocus;
    exit;
  end;

  if(trim(DBEditCodigo.Text)='') then
  begin
    Application.MessageBox('Código da promoção obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditCodigo.SetFocus;
    exit;
  end;

  if(trim(DBEditDesconto.Text)='') then
  begin
    Application.MessageBox('Valor do desconto obrigatório','Erro',MB_ICONERROR+MB_OK);
    DBEditDesconto.SetFocus;
    exit;
  end;

  inherited;
end;

procedure TFormCadastroPromocao.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  QueryCODIGO_PROMOCAO.AsInteger:=conexao.geraPK('CODIGO_PROMOCAO','PROMOCAO');
end;

end.
