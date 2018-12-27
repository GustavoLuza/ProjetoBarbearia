program Barbearia;

uses
  Vcl.Forms,
  UnitConexao in 'DM\UnitConexao.pas' {Conexao: TDataModule},
  UnitCadastroPadrao in 'Heranca\UnitCadastroPadrao.pas' {FormCadastroPadrao},
  UnitCadastroColaborador in 'Cadastro\UnitCadastroColaborador.pas' {FormCadastroColaborador},
  UnitCadastroServico in 'Cadastro\UnitCadastroServico.pas' {FormCadastroServico},
  UnitCadastroCidade in 'Cadastro\UnitCadastroCidade.pas' {FormCadastroCidade},
  UnitCadastroFornecedor in 'Cadastro\UnitCadastroFornecedor.pas' {FormCadastroFornecedor},
  UnitCadastroPromocao in 'Cadastro\UnitCadastroPromocao.pas' {FormCadastroPromocao},
  UnitCadastroBairro in 'Cadastro\UnitCadastroBairro.pas' {FormCadastroBairro},
  UnitCadastroCliente in 'Cadastro\UnitCadastroCliente.pas' {FormCadastroCliente},
  UnitCadastroUsuario in 'Cadastro\UnitCadastroUsuario.pas' {FormCadastroUsuario},
  UnitCadastroPagamento in 'Cadastro\UnitCadastroPagamento.pas' {FormCadastroPagamento},
  UnitCadastroProduto in 'Cadastro\UnitCadastroProduto.pas' {FormCadastroProduto},
  UnitPesquisaPadrao in 'Heranca\UnitPesquisaPadrao.pas' {FormPesquisaPadrao},
  PesquisaBairro in 'Pesquisa\PesquisaBairro.pas' {FormPesquisaBairro},
  UnitPesquisaCidade in 'Pesquisa\UnitPesquisaCidade.pas' {FormPesquisaCidade},
  UnitPesquisaServico in 'Pesquisa\UnitPesquisaServico.pas' {FormPesquisaServico},
  UnitPesquisaProduto in 'Pesquisa\UnitPesquisaProduto.pas' {FormPesquisaProduto},
  UnitPesquisaPromocao in 'Pesquisa\UnitPesquisaPromocao.pas' {FormPesquisaPromocao},
  UnitPesquisaFormaPagamento in 'Pesquisa\UnitPesquisaFormaPagamento.pas' {FormPesquisaFormaPagamento},
  UnitPesquisaCliente in 'Pesquisa\UnitPesquisaCliente.pas' {FormPesquisaCliente},
  UnitPesquisaColaborador in 'Pesquisa\UnitPesquisaColaborador.pas' {FormPesquisaColaborador},
  UnitPesquisaFornecedor in 'Pesquisa\UnitPesquisaFornecedor.pas' {FormPesquisaFornecedor},
  UnitMenu in 'Menu\UnitMenu.pas' {FormMenu},
  UnitPesquisaUsuario in 'Pesquisa\UnitPesquisaUsuario.pas' {FormPesquisaUsuario},
  UnitLogin in 'Login\UnitLogin.pas' {FormLogin},
  UnitCadastroAgendamento in 'Cadastro\UnitCadastroAgendamento.pas' {FormCadastroAgendamento},
  UnitPesquisaAgendamento in 'Pesquisa\UnitPesquisaAgendamento.pas' {FormPesquisaAgendamento},
  UnitRelatorioAgendamento in 'Relatorio\UnitRelatorioAgendamento.pas' {FormRelatorioAgendamento},
  UnitCadastroPadraoMestreDetalhe in 'Heranca\UnitCadastroPadraoMestreDetalhe.pas' {FormCadastroPadraoMestreDetalhe},
  UnitPesquisaPadraoMestreDetalhe in 'Heranca\UnitPesquisaPadraoMestreDetalhe.pas' {FormPesquisaPadraoMesttreDetalhe},
  UnitCadastroOS in 'Cadastro\UnitCadastroOS.pas' {FormCadastroOS},
  UnitRelatorioOS in 'Relatorio\UnitRelatorioOS.pas' {FormRelatorioOS},
  UnitPesquisaOS in 'Pesquisa\UnitPesquisaOS.pas' {FormpesquisaOS};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TConexao, Conexao);
  Application.CreateForm(TFormMenu, FormMenu);
  Application.Run;
end.
