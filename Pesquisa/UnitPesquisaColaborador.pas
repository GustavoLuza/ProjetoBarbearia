unit UnitPesquisaColaborador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, frxClass, frxDBSet;

type
  TFormPesquisaColaborador = class(TFormPesquisaPadrao)
    QueryCODIGO_COLABORADOR: TIntegerField;
    QueryNOME_COLABORADOR: TIBStringField;
    QueryNUMERO_TELEFONE: TIBStringField;
    QueryDATA_NASCIMENTO: TDateField;
    QueryEMAIL: TIBStringField;
    QueryCONTA_BANCARIA: TIBStringField;
    ReportColaborador: TfrxReport;
    DataSetColaborador: TfrxDBDataset;
    procedure RadioFiltroClick(Sender: TObject);
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure ButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisaColaborador: TFormPesquisaColaborador;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TFormPesquisaColaborador.ButtonImprimirClick(Sender: TObject);
begin
  inherited;
  ReportColaborador.ShowReport();
end;

procedure TFormPesquisaColaborador.ButtonPesquisarClick(Sender: TObject);
Var
  SQLCodigo, SQLNome: string;
begin
  inherited;
  SQLCodigo:= 'SELECT * FROM COLABORADOR WHERE CODIGO_COLABORADOR = :CODIGO';
  SQLNome:= 'SELECT * FROM COLABORADOR WHERE NOME_COLABORADOR LIKE :NOME ORDER BY NOME_COLABORADOR';

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

procedure TFormPesquisaColaborador.RadioFiltroClick(Sender: TObject);
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
