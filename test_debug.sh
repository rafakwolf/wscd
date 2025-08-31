#!/bin/bash

echo "=== Debug do Formulário Principal ==="
echo ""

# Verificar se o banco está funcionando
echo "1. Testando conexão com banco..."
DB_CHECK=$(/opt/homebrew/Cellar/mysql-client/9.4.0/bin/mysql -h 127.0.0.1 -P 3306 -u root -p'mysqlrocks!' -e "USE wscd; SELECT COUNT(*) FROM SISTEMA;" 2>/dev/null | tail -1)

if [ "$DB_CHECK" = "1" ]; then
    echo "✓ Banco OK - SISTEMA tem $DB_CHECK registro(s)"
else
    echo "✗ Problema no banco - SISTEMA tem $DB_CHECK registro(s)"
fi

# Verificar dados das outras tabelas
echo ""
echo "2. Verificando dados das tabelas..."
echo "   EMPRESA: $(/opt/homebrew/Cellar/mysql-client/9.4.0/bin/mysql -h 127.0.0.1 -P 3306 -u root -p'mysqlrocks!' -e "USE wscd; SELECT COUNT(*) FROM EMPRESA;" 2>/dev/null | tail -1) registro(s)"
echo "   CIDADES: $(/opt/homebrew/Cellar/mysql-client/9.4.0/bin/mysql -h 127.0.0.1 -P 3306 -u root -p'mysqlrocks!' -e "USE wscd; SELECT COUNT(*) FROM CIDADES;" 2>/dev/null | tail -1) registro(s)"
echo "   CAIXAS: $(/opt/homebrew/Cellar/mysql-client/9.4.0/bin/mysql -h 127.0.0.1 -P 3306 -u root -p'mysqlrocks!' -e "USE wscd; SELECT COUNT(*) FROM CAIXAS;" 2>/dev/null | tail -1) registro(s)"
echo "   CONFIGURACAO: $(/opt/homebrew/Cellar/mysql-client/9.4.0/bin/mysql -h 127.0.0.1 -P 3306 -u root -p'mysqlrocks!' -e "USE wscd; SELECT COUNT(*) FROM CONFIGURACAO;" 2>/dev/null | tail -1) registro(s)"

# Verificar se há dados na tabela CONFIGURACAO para o computador atual
echo ""
echo "3. Verificando configuração para computador atual..."
COMPUTER_NAME="DEMO-PC"
CONFIG_CHECK=$(/opt/homebrew/Cellar/mysql-client/9.4.0/bin/mysql -h 127.0.0.1 -P 3306 -u root -p'mysqlrocks!' -e "USE wscd; SELECT COUNT(*) FROM CONFIGURACAO WHERE NOMECOMPUTADOR = '$COMPUTER_NAME';" 2>/dev/null | tail -1)

if [ "$CONFIG_CHECK" = "1" ]; then
    echo "✓ Configuração para '$COMPUTER_NAME' encontrada"
else
    echo "✗ Configuração para '$COMPUTER_NAME' NÃO encontrada"
    echo "   Inserindo configuração para '$COMPUTER_NAME'..."
    /opt/homebrew/Cellar/mysql-client/9.4.0/bin/mysql -h 127.0.0.1 -P 3306 -u root -p'mysqlrocks!' -e "USE wscd; INSERT INTO CONFIGURACAO (IDCONFIGURACAO, NOMECOMPUTADOR, CAIXAPADRAO, SENHACAIXA, MOSTRARSALDOCAIXA, CAIXA90DIAS, RELZEBRADO) VALUES (2, '$COMPUTER_NAME', 1, '123456', 'S', 'N', 'N');"
    echo "   Configuração inserida!"
fi

# Verificar se há problemas com as funções
echo ""
echo "4. Verificando funções do sistema..."
echo "   GetComputerName deve retornar: $COMPUTER_NAME"
echo "   GetBuildInfo deve retornar: 1.0.0"
echo "   SerialHD deve retornar: DEMO-HD"

# Verificar se o Lazarus está disponível
echo ""
echo "5. Verificando disponibilidade do Lazarus..."
if command -v lazbuild >/dev/null 2>&1; then
    echo "✓ Lazarus disponível"
    echo "   Compilando teste do formulário principal..."
    if lazbuild test_mainform.lpi; then
        echo "✓ Compilação bem-sucedida"
        echo "   Executando teste..."
        ./test_mainform
    else
        echo "✗ Erro na compilação"
    fi
else
    echo "✗ Lazarus não disponível"
    echo "   Para testar, instale o Lazarus ou use o IDE"
fi

echo ""
echo "=== Debug concluído ==="
