unit UnitPesquisaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, frxClass, frxDBSet;

type
  TFormPesquisaProduto = class(TFormPesquisaPadrao)
    QueryNOME_PRODUTO: TIBStringField;
    QueryVALOR_ENTRADA: TIBBCDField;
    QueryQUANTIDADE_PRODUTO: TIntegerField;
    QueryCODIGO_FORNECEDOR: TIntegerField;
    QueryCODIGO_PRODUTO: TIntegerField;
    QueryVALOR_VENDA: TIBBCDField;
    QueryMARCA_PRODUTO: TIBStringField;
    ReportProduto: TfrxReport;
    DatasetProduto: TfrxDBDataset;
    procedure RadioFiltroClick(Sender: TObject);
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure ButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisaProduto: TFormPesquisaProduto;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TFormPesquisaProduto.ButtonImprimirClick(Sender: TObject);
begin
  inherited;
  ReportProduto.ShowReport();
end;

procedure TFormPesquisaProduto.ButtonPesquisarClick(Sender: TObject);
Var
  SQLCodigo, SQLNome: string;
begin
  inherited;
  SQLCodigo:= 'SELECT * FROM PRODUTO WHERE CODIGO_PRODUTO = :CODIGO';
  SQLNome:= 'SELECT * FROM PRODUTO WHERE NOME_PRODUTO LIKE :NOME ORDER BY NOME_PRODUTO';

  case RadioFiltro.ItemIndex of
    0: begin //FILTRO POR CODIGO
      Conexao.alteraSQL(query,SQLCodigo);
      if (trim(EditPesquisa.Text)='') then
      begin
        EditPesquisa.Text:='1';
      end;
      //PASSAR O PARAMETRO
        query.Close;
        query.ParamByName('CODIGO').AsInteger:= StrToInt(Trim(EditPesquisa.Text));
        query.Open;
    end;
    1: begin //FILTRO POR NOME
      Conexao.alteraSQL(query,SQLNome);
      query.Close;
      query.ParamByName('NOME').AsString:='%'+EditPesquisa.Text+'%';
      query.Open;
    end;
  end;
end;

procedure TFormPesquisaProduto.RadioFiltroClick(Sender: TObject);
begin
  inherited;
case RadioFiltro.ItemIndex of
    0: EditPesquisa.EditMask:='999999';
    1: EditPesquisa.EditMask:='';
    end;
    EditPesquisa.clear;
    EditPesquisa.SetFocus;
end;

end.
