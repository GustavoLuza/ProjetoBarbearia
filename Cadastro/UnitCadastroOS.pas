unit UnitCadastroOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadraoMestreDetalhe,
  Data.DB, IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFormCadastroOS = class(TFormCadastroPadraoMestreDetalhe)
    QueryCODIGO_OS: TIntegerField;
    QueryDATA_OS: TDateField;
    QueryCODIGO_CLIENTE: TIntegerField;
    QueryCODIGO_PAGAMENTO: TIntegerField;
    QueryCODIGO_PROMOCAO: TIntegerField;
    QueryCODIGO_COLABORADOR: TIntegerField;
    LabelCodigoOS: TLabel;
    DBEditCodigoOS: TDBEdit;
    LabelData: TLabel;
    DBEditData: TDBEdit;
    LabelCodigoCLiente: TLabel;
    DBEditCodigoCLiente: TDBEdit;
    LabelCodigoPagamento: TLabel;
    DBEditCodigoPagamento: TDBEdit;
    LabelCodigoPromocao: TLabel;
    DBEditCodigoPromocao: TDBEdit;
    LabelCodigoColaborador: TLabel;
    DBEditCodigoColaborador: TDBEdit;
    queryProdutoCODIGO_OS: TIntegerField;
    queryProdutoCODIGO_PRODUTO: TIntegerField;
    queryProdutoVALOR_VENDA: TIBBCDField;
    queryProdutoQUANTIDADE_PRODUTO: TIntegerField;
    queryProdutoNOME_PRODUTO: TIBStringField;
    LabelCodigoProduto: TLabel;
    DBEditCodigoProduto: TDBEdit;
    LabelNomeProduto: TLabel;
    DBEditNomeProduto: TDBEdit;
    QueryServicoCODIGO_SERVICO: TIntegerField;
    QueryServicoCODIGO_OS: TIntegerField;
    QueryServicoVALOR_SERVICO: TIBBCDField;
    QueryServicoNOME_SERVICO: TIBStringField;
    LabelCodigoServico: TLabel;
    DBEditCodigoServico: TDBEdit;
    LabelNomeServico: TLabel;
    DBEditNomeServico: TDBEdit;
    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure ButtonPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroOS: TFormCadastroOS;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaOS;

procedure TFormCadastroOS.ButtonPesquisaClick(Sender: TObject);
begin
  inherited;
    try
    FormpesquisaOS:= TFormpesquisaOS.Create(self);
    FormpesquisaOS.ShowModal;
  finally
    if (FormpesquisaOS.ModalResult=mrOk) then
    begin
      Query.Locate('CODIGO_OS',FormpesquisaOS.QueryCODIGO_OS.AsInteger,[]);
    end;
    FormpesquisaOS.Free;
  end;
end;

procedure TFormCadastroOS.QueryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  queryProduto.Close;
  queryProduto.ParamByName('NUMERO').AsInteger:=
  QueryCODIGO_OS.AsInteger;
  queryProduto.Open;
end;

end.
