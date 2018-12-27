unit UnitPesquisaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, frxClass, frxDBSet;

type
  TFormPesquisaCliente = class(TFormPesquisaPadrao)
    QueryCODIGO_CLIENTE: TIntegerField;
    QueryNOME_CLIENTE: TIBStringField;
    QueryDATA_NASCIMENTO: TDateField;
    QueryEMAIL: TIBStringField;
    ReportCliente: TfrxReport;
    DatasetCliente: TfrxDBDataset;
    procedure RadioFiltroClick(Sender: TObject);
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure ButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesquisaCliente: TFormPesquisaCliente;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TFormPesquisaCliente.ButtonImprimirClick(Sender: TObject);
begin
  inherited;
  ReportCliente.ShowReport();
end;

procedure TFormPesquisaCliente.ButtonPesquisarClick(Sender: TObject);
Var
  SQLCodigo, SQLNome: string;
begin
  inherited;
  SQLCodigo:= 'SELECT * FROM CLIENTE WHERE CODIGO_CLIENTE = :CODIGO';
  SQLNome:= 'SELECT * FROM CLIENTE WHERE NOME_CLIENTE LIKE :NOME ORDER BY NOME_CLIENTE';

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

procedure TFormPesquisaCliente.RadioFiltroClick(Sender: TObject);
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
