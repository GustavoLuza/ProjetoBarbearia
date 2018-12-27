/******************************************************************************/
/***          Generated by IBExpert 2012.02.21 23/09/2017 13:57:52          ***/
/******************************************************************************/

/******************************************************************************/
/***                                Domains                                 ***/
/******************************************************************************/



/******************************************************************************/
/***                               Exceptions                               ***/
/******************************************************************************/

/******************************************************************************/
/***                               Procedures                               ***/
/******************************************************************************/

SET TERM ^ ;

SET TERM ; ^



/******************************************************************************/
/***                            Tables and Views                            ***/
/******************************************************************************/

CREATE TABLE AGENDAMENTO (
    CODIGO_AGENDAMENTO INTEGER NOT NULL,
    DATA_ATENDIMENTO DATE NOT NULL,
    HORA_ATENDIMENTO TIME NOT NULL,
    CODIGO_SERVICO INTEGER NOT NULL,
    CODIGO_CLIENTE INTEGER NOT NULL,
    CODIGO_COLABORADOR INTEGER NOT NULL);


CREATE TABLE BAIRRO (
    CODIGO_BAIRRO INTEGER NOT NULL,
    NOME_BAIRRO VARCHAR(100) NOT NULL,
    CODIGO_CIDADE INTEGER NOT NULL);


CREATE TABLE CIDADE (
    CODIGO_CIDADE INTEGER NOT NULL,
    NOME_CIDADE VARCHAR(60) NOT NULL,
    SIGLA_ESTADO CHAR(2) NOT NULL);


CREATE TABLE CLIENTE (
    CODIGO_CLIENTE INTEGER NOT NULL,
    NOME_CLIENTE VARCHAR(100) NOT NULL,
    COMPLEMENTO VARCHAR(50),
    ENDERECO VARCHAR(100) NOT NULL,
    PONTO_REFERENCIA VARCHAR(50),
    DATA_NASCIMENTO DATE NOT NULL,
    SEXO CHAR(1) NOT NULL,
    NUMERO_CPF VARCHAR(14) NOT NULL,
    NUMERO_RG VARCHAR(10) NOT NULL,
    NUMERO_TELEFONE VARCHAR(16) NOT NULL,
    CODIGO_BAIRRO INTEGER NOT NULL,
    EMAIL VARCHAR(100) NOT NULL);


CREATE TABLE COLABORADOR (
    CODIGO_COLABORADOR INTEGER NOT NULL,
    NOME_COLABORADOR VARCHAR(100) NOT NULL,
    NUMERO_TELEFONE VARCHAR(16) NOT NULL,
    NUMERO_CPF VARCHAR(14) NOT NULL,
    NUMERO_RG VARCHAR(10) NOT NULL,
    ENDERECO VARCHAR(100) NOT NULL,
    COMPLEMENTO VARCHAR(50),
    PONTO_REFERENCIA VARCHAR(50),
    DATA_NASCIMENTO DATE NOT NULL,
    EMAIL VARCHAR(100) NOT NULL,
    CONTA_BANCARIA VARCHAR(16) NOT NULL,
    CODIGO_BAIRRO INTEGER NOT NULL);


CREATE TABLE FORNECEDOR (
    CODIGO_FORNECEDOR INTEGER NOT NULL,
    NOME_FORNECEDOR VARCHAR(100) NOT NULL,
    TELEFONE_FORNECEDOR VARCHAR(16) NOT NULL,
    EMAIL_FORNECEDOR VARCHAR(100) NOT NULL,
    ENDERECO_FORNECEDOR VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(18) NOT NULL,
    COMPLEMENTO VARCHAR(100),
    PONTO_REFERENCIA VARCHAR(50),
    CODIGO_BAIRRO INTEGER NOT NULL);


CREATE TABLE ITEM_PRODUTO (
    CODIGO_OS INTEGER NOT NULL,
    CODIGO_PRODUTO INTEGER NOT NULL,
    VALOR_VENDA NUMERIC(10,2) NOT NULL,
    QUANTIDADE_PRODUTO INTEGER NOT NULL);


CREATE TABLE ITEM_SERVICO (
    CODIGO_SERVICO INTEGER NOT NULL,
    CODIGO_OS INTEGER NOT NULL,
    VALOR_SERVICO NUMERIC(10,2) NOT NULL);


CREATE TABLE ORDEM_SERVICO (
    CODIGO_OS INTEGER NOT NULL,
    DATA_OS DATE NOT NULL,
    CODIGO_CLIENTE INTEGER NOT NULL,
    CODIGO_PAGAMENTO INTEGER NOT NULL,
    CODIGO_PROMOCAO INTEGER,
    CODIGO_COLABORADOR INTEGER NOT NULL);


CREATE TABLE PAGAMENTO (
    CODIGO_PAGAMENTO INTEGER NOT NULL,
    FORMA_PAGAMENTO VARCHAR(100) NOT NULL,
    PARCELA CHAR(2) NOT NULL);


CREATE TABLE PRODUTO (
    NOME_PRODUTO VARCHAR(100) NOT NULL,
    VALOR_ENTRADA NUMERIC(10,2) NOT NULL,
    QUANTIDADE_PRODUTO INTEGER NOT NULL,
    CODIGO_FORNECEDOR INTEGER NOT NULL,
    CODIGO_PRODUTO INTEGER NOT NULL,
    VALOR_VENDA NUMERIC(10,2) NOT NULL,
    MARCA_PRODUTO VARCHAR(100) NOT NULL);


CREATE TABLE PROMOCAO (
    CODIGO_PROMOCAO INTEGER NOT NULL,
    NOME_PROMOCAO VARCHAR(100) NOT NULL,
    VALOR_DESCONTO NUMERIC(10,2) NOT NULL);


CREATE TABLE SERVICO (
    CODIGO_SERVICO INTEGER NOT NULL,
    NOME_SERVICO VARCHAR(100) NOT NULL,
    VALOR_SERVICO NUMERIC(10,2) NOT NULL);


CREATE TABLE USUARIO (
    LOGIN VARCHAR(100) NOT NULL,
    SENHA VARCHAR(50) NOT NULL);




/******************************************************************************/
/***                              Primary keys                              ***/
/******************************************************************************/


ALTER TABLE AGENDAMENTO ADD CONSTRAINT PK_AGENDAMENTO PRIMARY KEY (CODIGO_AGENDAMENTO);
ALTER TABLE BAIRRO ADD CONSTRAINT PK_BAIRRO PRIMARY KEY (CODIGO_BAIRRO);
ALTER TABLE CIDADE ADD CONSTRAINT PK_CIDADE PRIMARY KEY (CODIGO_CIDADE);
ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE PRIMARY KEY (CODIGO_CLIENTE);
ALTER TABLE COLABORADOR ADD CONSTRAINT PK_COLABORADOR PRIMARY KEY (CODIGO_COLABORADOR);
ALTER TABLE FORNECEDOR ADD CONSTRAINT PK_FORNECEDOR PRIMARY KEY (CODIGO_FORNECEDOR);
ALTER TABLE ITEM_PRODUTO ADD CONSTRAINT PK_ITEM_PRODUTO PRIMARY KEY (CODIGO_OS, CODIGO_PRODUTO);
ALTER TABLE ITEM_SERVICO ADD CONSTRAINT PK_ITEM_SERVICO PRIMARY KEY (CODIGO_SERVICO, CODIGO_OS);
ALTER TABLE ORDEM_SERVICO ADD CONSTRAINT PK_ORDEM_SERVICO PRIMARY KEY (CODIGO_OS);
ALTER TABLE PAGAMENTO ADD CONSTRAINT PK_PAGAMENTO PRIMARY KEY (CODIGO_PAGAMENTO);
ALTER TABLE PRODUTO ADD CONSTRAINT PK_PRODUTO PRIMARY KEY (CODIGO_PRODUTO);
ALTER TABLE PROMOCAO ADD CONSTRAINT PK_PROMOCAO PRIMARY KEY (CODIGO_PROMOCAO);
ALTER TABLE SERVICO ADD CONSTRAINT PK_SERVICO PRIMARY KEY (CODIGO_SERVICO);
ALTER TABLE USUARIO ADD CONSTRAINT PK_USUARIO PRIMARY KEY (LOGIN);

/******************************************************************************/
/***                           Unique constraints                           ***/
/******************************************************************************/



/******************************************************************************/
/***                              Foreign keys                              ***/
/******************************************************************************/


ALTER TABLE AGENDAMENTO ADD CONSTRAINT FK_AGENDAMENTO_1 FOREIGN KEY (CODIGO_CLIENTE) REFERENCES CLIENTE (CODIGO_CLIENTE);
ALTER TABLE AGENDAMENTO ADD CONSTRAINT FK_AGENDAMENTO_2 FOREIGN KEY (CODIGO_SERVICO) REFERENCES SERVICO (CODIGO_SERVICO);
ALTER TABLE AGENDAMENTO ADD CONSTRAINT FK_AGENDAMENTO_3 FOREIGN KEY (CODIGO_COLABORADOR) REFERENCES COLABORADOR (CODIGO_COLABORADOR);
ALTER TABLE BAIRRO ADD CONSTRAINT FK_BAIRRO_1 FOREIGN KEY (CODIGO_CIDADE) REFERENCES CIDADE (CODIGO_CIDADE);
ALTER TABLE CLIENTE ADD CONSTRAINT FK_CLIENTE_1 FOREIGN KEY (CODIGO_BAIRRO) REFERENCES BAIRRO (CODIGO_BAIRRO);
ALTER TABLE COLABORADOR ADD CONSTRAINT FK_COLABORADOR_1 FOREIGN KEY (CODIGO_BAIRRO) REFERENCES BAIRRO (CODIGO_BAIRRO);
ALTER TABLE FORNECEDOR ADD CONSTRAINT FK_FORNECEDOR_1 FOREIGN KEY (CODIGO_BAIRRO) REFERENCES BAIRRO (CODIGO_BAIRRO);
ALTER TABLE ITEM_PRODUTO ADD CONSTRAINT FK_ITEM_PRODUTO_1 FOREIGN KEY (CODIGO_OS) REFERENCES ORDEM_SERVICO (CODIGO_OS);
ALTER TABLE ITEM_PRODUTO ADD CONSTRAINT FK_ITEM_PRODUTO_2 FOREIGN KEY (CODIGO_PRODUTO) REFERENCES PRODUTO (CODIGO_PRODUTO);
ALTER TABLE ITEM_SERVICO ADD CONSTRAINT FK_ITEM_SERVICO_1 FOREIGN KEY (CODIGO_SERVICO) REFERENCES SERVICO (CODIGO_SERVICO);
ALTER TABLE ITEM_SERVICO ADD CONSTRAINT FK_ITEM_SERVICO_2 FOREIGN KEY (CODIGO_OS) REFERENCES ORDEM_SERVICO (CODIGO_OS);
ALTER TABLE ORDEM_SERVICO ADD CONSTRAINT FK_ORDEM_SERVICO_1 FOREIGN KEY (CODIGO_CLIENTE) REFERENCES CLIENTE (CODIGO_CLIENTE);
ALTER TABLE ORDEM_SERVICO ADD CONSTRAINT FK_ORDEM_SERVICO_3 FOREIGN KEY (CODIGO_PAGAMENTO) REFERENCES PAGAMENTO (CODIGO_PAGAMENTO);
ALTER TABLE ORDEM_SERVICO ADD CONSTRAINT FK_ORDEM_SERVICO_4 FOREIGN KEY (CODIGO_SERVICO) REFERENCES SERVICO (CODIGO_SERVICO);
ALTER TABLE ORDEM_SERVICO ADD CONSTRAINT FK_ORDEM_SERVICO_7 FOREIGN KEY (CODIGO_PROMOCAO) REFERENCES PROMOCAO (CODIGO_PROMOCAO);
ALTER TABLE ORDEM_SERVICO ADD CONSTRAINT FK_ORDEM_SERVICO_5 FOREIGN KEY (CODIGO_PRODUTO) REFERENCES PRODUTO (CODIGO_PRODUTO);
ALTER TABLE ORDEM_SERVICO ADD CONSTRAINT FK_ORDEM_SERVICO_6 FOREIGN KEY (CODIGO_COLABORADOR) REFERENCES COLABORADOR (CODIGO_COLABORADOR);
ALTER TABLE PRODUTO ADD CONSTRAINT FK_PRODUTO_1 FOREIGN KEY (CODIGO_FORNECEDOR) REFERENCES FORNECEDOR (CODIGO_FORNECEDOR);

/******************************************************************************/
/***                           Check constraints                            ***/
/******************************************************************************/



/******************************************************************************/
/***                                Indices                                 ***/
/******************************************************************************/



/******************************************************************************/
/***                                Triggers                                ***/
/******************************************************************************/

SET TERM ^ ;

SET TERM ; ^

/******************************************************************************/
/***                               Procedures                               ***/
/******************************************************************************/

SET TERM ^ ;

SET TERM ; ^



/******************************************************************************/
/***                          Object descriptions                           ***/
/******************************************************************************/
