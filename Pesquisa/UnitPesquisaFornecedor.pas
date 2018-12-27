unit UnitPesquisaFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, frxClass, frxDBSet;

type
  TFormPesquisaFornecedor = class(TFormPesquisaPadrao)
    QueryCODIGO_FORNECEDOR: TIntegerField;
    QueryNOME_FORNECEDOR: TIBStringField;
    QueryTELEFONE_FORNECEDOR: TIBStringField;
    QueryEMAIL_FORNECEDOR: TIBStringField;
    DatasetFornecedor: TfrxDBDataset;
    ReportFornecedor: TfrxReport;
    procedure RadioFiltroClick(Sender: TObject);
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure ButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisaFornecedor: TFormPesquisaFornecedor;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TFormPesquisaFornecedor.ButtonImprimirClick(Sender: TObject);
begin
  inherited;
  ReportFornecedor.ShowReport();
end;

procedure TFormPesquisaFornecedor.ButtonPesquisarClick(Sender: TObject);
Var
  SQLCodigo, SQLNome: string;
begin
  inherited;
  SQLCodigo:= 'SELECT * FROM FORNECEDOR WHERE CODIGO_FORNECEDOR = :CODIGO';
  SQLNome:= 'SELECT * FROM FORNECEDOR WHERE NOME_FORNECEDOR LIKE :NOME ORDER BY NOME_FORNECEDOR';

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

procedure TFormPesquisaFornecedor.RadioFiltroClick(Sender: TObject);
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
