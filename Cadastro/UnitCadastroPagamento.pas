unit UnitCadastroPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, Data.DB, IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFormCadastroPagamento = class(TFormCadastroPadrao)
    QueryCODIGO_PAGAMENTO: TIntegerField;
    QueryFORMA_PAGAMENTO: TIBStringField;
    QueryPARCELA: TIBStringField;
    LabelCodigo: TLabel;
    DBEditCodigo: TDBEdit;
    LabelForma: TLabel;
    DBEditForma: TDBEdit;
    LabelParcela: TLabel;
    DBComboBoxParcela: TDBComboBox;
    GroupBoxInformacao: TGroupBox;
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonEditarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroPagamento: TFormCadastroPagamento;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaFormaPagamento;

procedure TFormCadastroPagamento.ButtonCancelarClick(Sender: TObject);
begin
  inherited;
  DBEditForma.SetFocus;
end;

procedure TFormCadastroPagamento.ButtonEditarClick(Sender: TObject);
begin
  inherited;
  DBEditForma.SetFocus;
end;

procedure TFormCadastroPagamento.ButtonNovoClick(Sender: TObject);
begin
  inherited;
  DBEditForma.SetFocus;
end;

procedure TFormCadastroPagamento.ButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  try
    FormPesquisaFormaPagamento:= TFormPesquisaFormaPagamento.Create(self);
    FormPesquisaFormaPagamento.ShowModal;
  finally
    if (FormPesquisaFormaPagamento.ModalResult=mrOk) then
    begin
      Query.Locate('CODIGO_PAGAMENTO',FormPesquisaFormaPagamento.QueryCODIGO_PAGAMENTO.AsInteger,[]);
    end;
    FormPesquisaFormaPagamento.Free;
  end;
end;

procedure TFormCadastroPagamento.ButtonSalvarClick(Sender: TObject);
var
  numero:double;
begin
  if(trim(DBEditForma.Text)='') then
  begin
    Application.MessageBox('Forma de pagamento obrigatória','Erro',MB_ICONERROR+MB_OK);
    DBEditForma.SetFocus;
    exit;
  end;

  if (TryStrToFloat(DBEditForma.Text,numero)) then
  begin
    Application.MessageBox('Forma de pagamento inválida','Erro',MB_ICONERROR+MB_OK);
    DBEditForma.SetFocus;
    DBEditForma.Clear;
    exit;
  end;

  if (DBComboBoxParcela.ItemIndex= -1 ) then
  begin
    application.MessageBox('Selecione uma parcela', 'Erro',MB_ICONERROR+mb_ok);
    QueryPARCELA.AsString:='00';
    exit;
  end;

inherited;

end;

procedure TFormCadastroPagamento.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  QueryCODIGO_PAGAMENTO.AsInteger:=conexao.geraPK('CODIGO_PAGAMENTO','PAGAMENTO');
end;

end.
