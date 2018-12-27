unit UnitPesquisaCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, frxClass, frxDBSet;

type
  TFormPesquisaCidade = class(TFormPesquisaPadrao)
    QueryCODIGO_CIDADE: TIntegerField;
    QueryNOME_CIDADE: TIBStringField;
    QuerySIGLA_ESTADO: TIBStringField;
    ReportCidade: TfrxReport;
    DataSetCidade: TfrxDBDataset;
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure RadioFiltroClick(Sender: TObject);
    procedure ButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisaCidade: TFormPesquisaCidade;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TFormPesquisaCidade.ButtonImprimirClick(Sender: TObject);
begin
  inherited;
  ReportCidade.ShowReport();
end;

procedure TFormPesquisaCidade.ButtonPesquisarClick(Sender: TObject);
Var
  SQLCodigo, SQLNome: string;
begin
  inherited;
  SQLCodigo:= 'SELECT * FROM CIDADE WHERE CODIGO_CIDADE = :CODIGO';
  SQLNome:= 'SELECT * FROM CIDADE WHERE NOME_CIDADE LIKE :NOME ORDER BY NOME_CIDADE';

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

procedure TFormPesquisaCidade.RadioFiltroClick(Sender: TObject);
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
