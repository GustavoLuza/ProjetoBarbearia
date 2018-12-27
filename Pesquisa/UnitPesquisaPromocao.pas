unit UnitPesquisaPromocao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, frxClass, frxDBSet;

type
  TFormPesquisaPromocao = class(TFormPesquisaPadrao)
    QueryCODIGO_PROMOCAO: TIntegerField;
    QueryNOME_PROMOCAO: TIBStringField;
    QueryVALOR_DESCONTO: TIBBCDField;
    DatasetPromocao: TfrxDBDataset;
    ReportPromocao: TfrxReport;
    procedure RadioFiltroClick(Sender: TObject);
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure ButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisaPromocao: TFormPesquisaPromocao;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TFormPesquisaPromocao.ButtonImprimirClick(Sender: TObject);
begin
  inherited;
  ReportPromocao.showreport();
end;

procedure TFormPesquisaPromocao.ButtonPesquisarClick(Sender: TObject);
Var
  SQLCodigo, SQLNome: string;
begin
  inherited;
  SQLCodigo:= 'SELECT * FROM PROMOCAO WHERE CODIGO_PROMOCAO = :CODIGO';
  SQLNome:= 'SELECT * FROM PROMOCAO WHERE NOME_PROMOCAO LIKE :NOME ORDER BY NOME_PROMOCAO';

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

procedure TFormPesquisaPromocao.RadioFiltroClick(Sender: TObject);
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
