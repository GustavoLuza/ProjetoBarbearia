unit UnitMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TFormMenu = class(TForm)
    MainMenu1: TMainMenu;
    Agendamento: TMenuItem;
    Bairro: TMenuItem;
    Cidade: TMenuItem;
    Cliente: TMenuItem;
    Colaborador: TMenuItem;
    Fornecedor: TMenuItem;
    OS: TMenuItem;
    Pagamento: TMenuItem;
    Produto: TMenuItem;
    Promocao: TMenuItem;
    Usuario: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    CadastroAgendamento: TMenuItem;
    CadastroBairro: TMenuItem;
    PesquisaBairro: TMenuItem;
    CadastroCidade: TMenuItem;
    PesquisaCidade: TMenuItem;
    CadastroCliente: TMenuItem;
    PesquisaCliente: TMenuItem;
    CadastroColaborador: TMenuItem;
    PesquisaColaborador: TMenuItem;
    CadastroFornecedor: TMenuItem;
    PesquisaFornecedor: TMenuItem;
    CadastroPagamento: TMenuItem;
    PesquisaPagamento: TMenuItem;
    CadastroProduto: TMenuItem;
    PesquisaProduto: TMenuItem;
    CadastroPromocao: TMenuItem;
    PesquisaPromocao: TMenuItem;
    CadastroUsuario: TMenuItem;
    PesquisaUsuario: TMenuItem;
    Image: TImage;
    PesquisaAgendamento: TMenuItem;
    BarraStatus: TStatusBar;
    Timer1: TTimer;
    RelatorioGerencialOS: TMenuItem;
    RelatorioGerencialAgendamento: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CadastroBairroClick(Sender: TObject);
    procedure PesquisaBairroClick(Sender: TObject);
    procedure CadastroCidadeClick(Sender: TObject);
    procedure PesquisaCidadeClick(Sender: TObject);
    procedure CadastroClienteClick(Sender: TObject);
    procedure PesquisaClienteClick(Sender: TObject);
    procedure CadastroColaboradorClick(Sender: TObject);
    procedure PesquisaColaboradorClick(Sender: TObject);
    procedure CadastroFornecedorClick(Sender: TObject);
    procedure PesquisaFornecedorClick(Sender: TObject);
    procedure CadastroPagamentoClick(Sender: TObject);
    procedure PesquisaPagamentoClick(Sender: TObject);
    procedure CadastroProdutoClick(Sender: TObject);
    procedure PesquisaProdutoClick(Sender: TObject);
    procedure CadastroPromocaoClick(Sender: TObject);
    procedure PesquisaPromocaoClick(Sender: TObject);
    procedure CadastroUsuarioClick(Sender: TObject);
    procedure PesquisaUsuarioClick(Sender: TObject);
    procedure CadastroAgendamentoClick(Sender: TObject);
    procedure PesquisaAgendamentoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RelatorioGerencialAgendamentoClick(Sender: TObject);
    procedure CadastroOSClick(Sender: TObject);
    procedure PesquisaOSClick(Sender: TObject);
    procedure RelatorioGerencialOSClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenu: TFormMenu;

implementation

{$R *.dfm}

uses PesquisaBairro, UnitCadastroBairro, UnitCadastroCidade,
  UnitCadastroCliente, UnitCadastroColaborador, UnitCadastroFornecedor,
  UnitCadastroPadrao, UnitCadastroPagamento, UnitCadastroProduto,
  UnitCadastroPromocao, UnitCadastroServico, UnitCadastroUsuario, UnitConexao,
  UnitPesquisaCidade, UnitPesquisaCliente, UnitPesquisaColaborador,
  UnitPesquisaFormaPagamento, UnitPesquisaFornecedor, UnitPesquisaPadrao,
  UnitPesquisaProduto, UnitPesquisaPromocao, UnitPesquisaServico,
  UnitPesquisaUsuario, UnitLogin, UnitCadastroAgendamento,
  UnitPesquisaAgendamento, UnitCadastroOS, UnitPesquisaOS,
  UnitRelatorioAgendamento, UnitRelatorioOS;

procedure TFormMenu.CadastroAgendamentoClick(Sender: TObject);
begin
  try
    FormCadastroAgendamento:=TFormCadastroAgendamento.Create(self);
    FormCadastroAgendamento.ShowModal;
  finally
    FormCadastroAgendamento.Free;
  end;
end;

procedure TFormMenu.CadastroBairroClick(Sender: TObject);
begin
  try
    FormCadastroBairro:=TFormCadastroBairro.Create(self);
    FormCadastroBairro.ShowModal;
  finally
    FormCadastroBairro.Free;
  end;
end;

procedure TFormMenu.CadastroCidadeClick(Sender: TObject);
begin
  try
    FormCadastroCidade:=TFormCadastroCidade.Create(self);
    FormCadastroCidade.ShowModal;
  finally
    FormCadastroCidade.Free;
  end;
end;

procedure TFormMenu.CadastroClienteClick(Sender: TObject);
begin
  try
    FormCadastroCliente:=TFormCadastroCliente.Create(self);
    FormCadastroCliente.ShowModal;
  finally
    FormCadastroCliente.Free;
  end;
end;

procedure TFormMenu.CadastroColaboradorClick(Sender: TObject);
begin
  try
    FormCadastroColaborador:=TFormCadastroColaborador.Create(self);
    FormCadastroColaborador.ShowModal;
  finally
    FormCadastroColaborador.Free;
  end;
end;

procedure TFormMenu.CadastroFornecedorClick(Sender: TObject);
begin
  try
    FormCadastroFornecedor:=TFormCadastroFornecedor.Create(self);
    FormCadastroFornecedor.ShowModal;
  finally
    FormCadastroFornecedor.Free;
  end;
end;

procedure TFormMenu.CadastroOSClick(Sender: TObject);
begin
    try
    FormCadastroOS:=TFormCadastroOS.Create(self);
    FormCadastroOS.ShowModal;
  finally
    FormCadastroOS.Free;
  end;
end;

procedure TFormMenu.CadastroPagamentoClick(Sender: TObject);
begin
  try
    FormCadastroPagamento:=TFormCadastroPagamento.Create(self);
    FormCadastroPagamento.ShowModal;
  finally
    FormCadastroPagamento.Free;
  end;
end;

procedure TFormMenu.CadastroProdutoClick(Sender: TObject);
begin
  try
    FormCadastroProduto:=TFormCadastroProduto.Create(self);
    FormCadastroProduto.ShowModal;
  finally
    FormCadastroProduto.Free;
  end;
end;

procedure TFormMenu.CadastroPromocaoClick(Sender: TObject);
begin
  try
    FormCadastroPromocao:=TFormCadastroPromocao.Create(self);
    FormCadastroPromocao.ShowModal;
  finally
    FormCadastroPromocao.Free;
  end;
end;

procedure TFormMenu.CadastroUsuarioClick(Sender: TObject);
begin
  try
    FormCadastroUsuario:=TFormCadastroUsuario.Create(self);
    FormCadastroUsuario.ShowModal;
  finally
    FormCadastroUsuario.Free;
  end;
end;

procedure TFormMenu.FormCreate(Sender: TObject);
begin
  try
  FormLogin:=TFormLogin.Create(self);
  FormLogin.ShowModal;
  finally
    if (FormLogin.ModalResult <> mrOk) then
    begin
      application.terminate;
    end;
    BarraStatus.Panels[2].Text:= 'Usuário logado:  ' +FormLogin.EditUsuario.Text;
    FormLogin.Free;
  end;
end;

procedure TFormMenu.PesquisaAgendamentoClick(Sender: TObject);
begin
  try
    FormPesquisaAgendamento:=TFormPesquisaAgendamento.Create(self);
    FormPesquisaAgendamento.ShowModal;
  finally
    FormPesquisaAgendamento.Free;
  end;
end;

procedure TFormMenu.PesquisaBairroClick(Sender: TObject);
begin
  try
    FormPesquisaBairro:=TFormPesquisaBairro.Create(self);
    FormPesquisaBairro.ShowModal;
  finally
    FormPesquisaBairro.Free;
  end;
end;

procedure TFormMenu.PesquisaCidadeClick(Sender: TObject);
begin
  try
    FormPesquisaCidade:=TFormPesquisaCidade.Create(self);
    FormPesquisaCidade.ShowModal;
  finally
    FormPesquisaCidade.Free;
  end;
end;

procedure TFormMenu.PesquisaClienteClick(Sender: TObject);
begin
  try
    FormPesquisaCliente:=TFormPesquisaCliente.Create(self);
    FormPesquisaCliente.ShowModal;
  finally
    FormPesquisaCliente.Free;
  end;
end;

procedure TFormMenu.PesquisaColaboradorClick(Sender: TObject);
begin
  try
    FormPesquisaColaborador:=TFormPesquisaColaborador.Create(self);
    FormPesquisaColaborador.ShowModal;
  finally
    FormPesquisaColaborador.Free;
  end;
end;

procedure TFormMenu.PesquisaFornecedorClick(Sender: TObject);
begin
  try
    FormPesquisaFornecedor:=TFormPesquisaFornecedor.Create(self);
    FormPesquisaFornecedor.ShowModal;
  finally
    FormPesquisaFornecedor.Free;
  end;
end;

procedure TFormMenu.PesquisaOSClick(Sender: TObject);
begin
    try
    FormpesquisaOS:=TFormpesquisaOS.Create(self);
    FormpesquisaOS.ShowModal;
  finally
    FormpesquisaOS.Free;
  end;
end;

procedure TFormMenu.PesquisaPagamentoClick(Sender: TObject);
begin
  try
    FormPesquisaFormaPagamento:=TFormPesquisaFormaPagamento.Create(self);
    FormPesquisaFormaPagamento.ShowModal;
  finally
    FormPesquisaFormaPagamento.Free;
  end;
end;

procedure TFormMenu.PesquisaProdutoClick(Sender: TObject);
begin
  try
    FormPesquisaProduto:=TFormPesquisaProduto.Create(self);
    FormPesquisaProduto.ShowModal;
  finally
    FormPesquisaProduto.Free;
  end;
end;

procedure TFormMenu.PesquisaPromocaoClick(Sender: TObject);
begin
  try
    FormPesquisaPromocao:=TFormPesquisaPromocao.Create(self);
    FormPesquisaPromocao.ShowModal;
  finally
    FormPesquisaPromocao.Free;
  end;
end;

procedure TFormMenu.PesquisaUsuarioClick(Sender: TObject);
begin
  try
    FormPesquisaUsuario:=TFormPesquisaUsuario.Create(self);
    FormPesquisaUsuario.ShowModal;
  finally
    FormPesquisaUsuario.Free;
  end;
end;

procedure TFormMenu.RelatorioGerencialAgendamentoClick(Sender: TObject);
begin
    try
    FormRelatorioAgendamento:=TFormRelatorioAgendamento.Create(self);
    FormRelatorioAgendamento.ShowModal;
  finally
    FormRelatorioAgendamento.Free;
  end;

end;

procedure TFormMenu.RelatorioGerencialOSClick(Sender: TObject);
begin
    try
    FormRelatorioOS:=TFormRelatorioOS.Create(self);
    FormRelatorioOS.ShowModal;
  finally
    FormRelatorioOS.Free;
  end;
end;

procedure TFormMenu.Timer1Timer(Sender: TObject);
begin
  BarraStatus.Panels[0].Text:= 'Data:  ' + DateToStr(Now);
  BarraStatus.Panels[1].Text:= 'Hora:  ' + TimeToStr(Now);
end;

end.
