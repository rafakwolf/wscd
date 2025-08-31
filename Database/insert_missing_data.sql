-- Script para inserir dados que estão faltando
USE wscd;

-- Inserir dados básicos na tabela CIDADES
INSERT INTO CIDADES (CODCIDADE, DESCRICAO) 
VALUES (1, 'São Paulo');

-- Inserir dados básicos na tabela EMPRESA
INSERT INTO EMPRESA (ID, FANTASIA, RAZASOCIAL, CNPJ, IE, ENDERECO, IDCIDADE, BAIRRO, CEP, TELEFONE, FAX, UF, RESPONSAVEL, EMAIL) 
VALUES (1, 'Empresa Demo', 'Empresa Demo Ltda', '12.345.678/0001-90', '123456789', 'Rua das Flores, 123', 1, 'Centro', '12345-678', '(11) 1234-5678', '(11) 1234-5679', 'SP', 'João Silva', 'contato@empresademo.com.br');

-- Inserir dados básicos na tabela CAIXAS
INSERT INTO CAIXAS (CODIGO, NOME, INATIVO) 
VALUES (1, 'Caixa Principal', 'N');

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
