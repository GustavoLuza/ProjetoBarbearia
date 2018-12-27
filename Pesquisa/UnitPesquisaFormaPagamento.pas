unit UnitPesquisaFormaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, frxClass, frxDBSet;

type
  TFormPesquisaFormaPagamento = class(TFormPesquisaPadrao)
    QueryCODIGO_PAGAMENTO: TIntegerField;
    QueryFORMA_PAGAMENTO: TIBStringField;
    QueryPARCELA: TIBStringField;
    ReportPagamento: TfrxReport;
    DatasetPagamento: TfrxDBDataset;
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure RadioFiltroClick(Sender: TObject);
    procedure ButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisaFormaPagamento: TFormPesquisaFormaPagamento;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TFormPesquisaFormaPagamento.ButtonImprimirClick(Sender: TObject);
begin
  inherited;
  ReportPagamento.ShowReport();
end;

procedure TFormPesquisaFormaPagamento.ButtonPesquisarClick(Sender: TObject);
Var
  SQLCodigo, SQLNome: string;
begin
  inherited;
  SQLCodigo:= 'SELECT * FROM PAGAMENTO WHERE CODIGO_PAGAMENTO = :CODIGO';
  SQLNome:= 'SELECT * FROM PAGAMENTO WHERE FORMA_PAGAMENTO LIKE :NOME ORDER BY FORMA_PAGAMENTO';

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

procedure TFormPesquisaFormaPagamento.RadioFiltroClick(Sender: TObject);
begin
  inherited;
  case RadioFiltro.ItemIndex of
    0: EditPesquisa.EditMask:= '999999';
    1: EditPesquisa.EditMask:= '';
  end;
  EditPesquisa.Clear;
  EditPesquisa.SetFocus;
end;

end.
