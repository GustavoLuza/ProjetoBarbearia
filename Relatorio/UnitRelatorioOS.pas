unit UnitRelatorioOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, frxClass, frxDBSet, Vcl.ComCtrls,
  Vcl.Buttons;

type
  TFormRelatorioOS = class(TForm)
    GroupBoxOS: TGroupBox;
    Query: TIBQuery;
    DatasetOS: TfrxDBDataset;
    ReportOS: TfrxReport;
    ButtonImprimir: TBitBtn;
    ButtonFechar: TBitBtn;
    DataInicial: TDateTimePicker;
    DataFinal: TDateTimePicker;
    LabelInicial: TLabel;
    LabelFinal: TLabel;
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
    procedure ButtonImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelatorioOS: TFormRelatorioOS;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TFormRelatorioOS.ButtonImprimirClick(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('INICIAL').AsDate:=
  dataInicial.Date;
  Query.ParamByName('FINAL').AsDate:=
  dataFinal.Date;
  Query.Open;

  ReportOS.ShowReport();
end;

end.
