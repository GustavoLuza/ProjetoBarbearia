unit UnitRelatorioAgendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TFormRelatorioAgendamento = class(TForm)
    Query: TIBQuery;
    ReportAgendamento: TfrxReport;
    DatasetAgendamento: TfrxDBDataset;
    GroupBoxPesquisa: TGroupBox;
    DataInicial: TDateTimePicker;
    DataFinal: TDateTimePicker;
    ButtonImprime: TBitBtn;
    ButtonFechar: TBitBtn;
    LabelInicial: TLabel;
    LabelFinal: TLabel;
    QueryCODIGO_AGENDAMENTO: TIntegerField;
    QueryDATA_ATENDIMENTO: TDateField;
    QueryHORA_ATENDIMENTO: TTimeField;
    QueryCODIGO_SERVICO: TIntegerField;
    QueryCODIGO_CLIENTE: TIntegerField;
    QueryCODIGO_COLABORADOR: TIntegerField;
    QueryNOME_CLIENTE: TIBStringField;
    QueryNOME_COLABORADOR: TIBStringField;
    QueryNOME_SERVICO: TIBStringField;
    procedure ButtonImprimeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelatorioAgendamento: TFormRelatorioAgendamento;

implementation

{$R *.dfm}

uses UnitConexao;

procedure TFormRelatorioAgendamento.ButtonImprimeClick(Sender: TObject);
begin
  Query.Close;
  Query.ParamByName('INICIAL').AsDate:=
  dataInicial.Date;
  Query.ParamByName('FINAL').AsDate:=
  dataFinal.Date;
  Query.Open;

  ReportAgendamento.ShowReport();
end;

end.
