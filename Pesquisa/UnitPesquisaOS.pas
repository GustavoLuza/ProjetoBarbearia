unit UnitPesquisaOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaPadraoMestreDetalhe,
  Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons;

type
  TFormpesquisaOS = class(TFormPesquisaPadraoMesttreDetalhe)
    QueryServicoCODIGO_SERVICO: TIntegerField;
    QueryServicoCODIGO_OS: TIntegerField;
    QueryServicoVALOR_SERVICO: TIBBCDField;
    QueryServicoNOME_SERVICO: TIBStringField;
    QueryCODIGO_OS: TIntegerField;
    QueryDATA_OS: TDateField;
    QueryCODIGO_CLIENTE: TIntegerField;
    QueryCODIGO_PAGAMENTO: TIntegerField;
    QueryCODIGO_PROMOCAO: TIntegerField;
    QueryCODIGO_COLABORADOR: TIntegerField;
    QueryCODIGO_CLIENTE1: TIntegerField;
    QueryCODIGO_PAGAMENTO1: TIntegerField;
    QueryCODIGO_PROMOCAO1: TIntegerField;
    QueryCODIGO_COLABORADOR1: TIntegerField;
    queryProdutoCODIGO_OS: TIntegerField;
    queryProdutoCODIGO_PRODUTO: TIntegerField;
    queryProdutoVALOR_VENDA: TIBBCDField;
    queryProdutoQUANTIDADE_PRODUTO: TIntegerField;
    queryProdutoNOME_PRODUTO: TIBStringField;
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure RadioFiltroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormpesquisaOS: TFormpesquisaOS;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TFormpesquisaOS.ButtonPesquisarClick(Sender: TObject);
VAR
  SQLCodigoOS, SQLCodigoProduto, SQLCodigoServico : String;
begin

  SQLCodigoOS:= 'SELECT OS.*, CLIENTE.CODIGO_CLIENTE, PAGAMENTO.CODIGO_PAGAMENTO, PROMOCAO.CODIGO_PROMOCAO,COLABORADOR.CODIGO_COLABORADORFROM ORDEM_SERVICO OSINNER JOIN CLIENTE CLIENTE ON'
  +'(CLIENTE.CODIGO_CLIENTE = OS.CODIGO_CLIENTE) INNER JOIN PAGAMENTO PAGAMENTO ON(PAGAMENTO.CODIGO_PAGAMENTO = OS.CODIGO_PAGAMENTO)'
  +' INNER JOIN PROMOCAO PROMOCAO ON(PROMOCAO.CODIGO_PROMOCAO = PROMOCAO.CODIGO_PROMOCAO) INNER JOIN COLABORADOR COLABORADOR ON(COLABORADOR.CODIGO_COLABORADOR = OS.CODIGO_COLABORADOR)';

  SQLCodigoProduto:= ' SELECT IT.*, PRODUTO.NOME_PRODUTO FROM ITEM_PRODUTO it INNER JOIN PRODUTO ON(PRODUTO.CODIGO_PRODUTO = IT.CODIGO_PRODUTO) WHERE IT.CODIGO_OS = :NUMERO' ;
  SQLCodigoServico:= 'SELECT SER.*, SERVICO.NOME_SERVICO FROM ITEM_SERVICO SER INNER JOIN SERVICO ON(SERVICO.CODIGO_SERVICO = SER.CODIGO_SERVICO) WHERE SER.CODIGO_OS = :NUMERO'  ;


  inherited;
  case radioFiltro.ItemIndex of
    0:Begin //código
      if (Trim(EditPesquisa.Text)='') then Begin
        EditPesquisa.Text:='1';
      End;
      Conexao.alteraSQL(Query,SQLCodigoOS);
      //parametro
      Query.Close;
      Query.ParamByName('CODIGO').AsInteger:=
      StrToInt(Trim(EditPesquisa.Text));
      Query.Open;
    end;
    1:Begin //código
      if (Trim(EditPesquisa.Text)='') then Begin
        EditPesquisa.Text:='1';
      End;
      Conexao.alteraSQL(Query,SQLCodigoServico);
      //parametro
      Query.Close;
      Query.ParamByName('CODIGO').AsInteger:=
      StrToInt(Trim(EditPesquisa.Text));
      Query.Open;
    end;
    2:Begin //código
      if (Trim(EditPesquisa.Text)='') then Begin
        EditPesquisa.Text:='1';
      End;
      Conexao.alteraSQL(Query,SQLCodigoProduto);
      //parametro
      Query.Close;
      Query.ParamByName('CODIGO').AsInteger:=
      StrToInt(Trim(EditPesquisa.Text));
      Query.Open;
    end;
  end;
end;

procedure TFormpesquisaOS.RadioFiltroClick(Sender: TObject);
begin
  inherited;
    case radioFiltro.ItemIndex of
    0: EditPesquisa.EditMask:= '999999';
    1: EditPesquisa.EditMask:= '999999';
    2: EditPesquisa.EditMask:= '999999';
  end;
  EditPesquisa.Clear;
  EditPesquisa.SetFocus;
end;

end.
