-- Script para inserir dados básicos necessários para o funcionamento do sistema
USE wscd;

-- Inserir dados básicos na tabela SISTEMA
INSERT INTO SISTEMA (IDSISTEMA, VERSAO, DATAVALIDADE, DATA_ACESSO, SERIAL, HD) 
VALUES (1, '1.0.0', '2030-12-31', NOW(), 'DEMO-12345', 'DEMO-HD');

-- Inserir dados básicos na tabela CIDADES
INSERT INTO CIDADES (CODCIDADE, DESCRICAO) 
VALUES (1, 'São Paulo');

-- Inserir dados básicos na tabela EMPRESA
INSERT INTO EMPRESA (ID, FANTASIA, RAZASOCIAL, CNPJ, IE, ENDERECO, IDCIDADE, BAIRRO, CEP, TELEFONE, FAX, UF, RESPONSAVEL, EMAIL) 
VALUES (1, 'Empresa Demo', 'Empresa Demo Ltda', '12.345.678/0001-90', '123456789', 'Rua das Flores, 123', 1, 'Centro', '12345-678', '(11) 1234-5678', '(11) 1234-5679', 'SP', 'João Silva', 'contato@empresademo.com.br');

-- Inserir dados básicos na tabela CAIXAS
INSERT INTO CAIXAS (CODIGO, NOME, INATIVO) 
VALUES (1, 'Caixa Principal', 'N');

-- Inserir dados básicos na tabela CONFIGURACAO
INSERT INTO CONFIGURACAO (IDCONFIGURACAO, NOMECOMPUTADOR, CAIXAPADRAO, SENHACAIXA, MOSTRARSALDOCAIXA, CAIXA90DIAS, RELZEBRADO) 
VALUES (1, 'DEMO-PC', 1, '123456', 'S', 'N', 'N');

-- Verificar se os dados foram inseridos
SELECT 'SISTEMA' as tabela, COUNT(*) as total FROM SISTEMA
UNION ALL
SELECT 'EMPRESA' as tabela, COUNT(*) as total FROM EMPRESA
UNION ALL
SELECT 'CIDADES' as tabela, COUNT(*) as total FROM CIDADES
UNION ALL
SELECT 'CAIXAS' as tabela, COUNT(*) as total FROM CAIXAS
UNION ALL
SELECT 'CONFIGURACAO' as tabela, COUNT(*) as total FROM CONFIGURACAO;
