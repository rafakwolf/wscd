inherited dmCliente: TdmCliente
  OnCreate = DataModuleCreate
  OldCreateOrder = True
  Height = 221
  HorizontalOffset = 374
  VerticalOffset = 186
  Width = 526
  object ZQuery1: TZQuery[0]
    Connection = DmPrincipal.ZConnection1
    UpdateObject = ZUpdateSQL1
    SQL.Strings = (
      'select * from CLIENTES'
    )
    Params = <>
    Left = 144
    Top = 64
  end
  object ZUpdateSQL1: TZUpdateSQL[1]
    DeleteSQL.Strings = (
      'DELETE FROM CLIENTES'
      'WHERE'
      '  CLIENTES.CODCLIENTE = :OLD_CODCLIENTE'
    )
    InsertSQL.Strings = (
      'INSERT INTO CLIENTES'
      '  (TIPO, NOME, ENDERECO, CEP, BAIRRO, TELEFONE, FAX, CODCIDADE, UF, TEMPO_MORADIA, '
      '   END_ANTERIOR, E_MAIL, TRABALHO, CARGO, DATA_INICIO, SALARIO, ESTADO_CIVIL, '
      '   CONJUGUE, LOCAL_TRAB, DATA_NASC, PAI, MAE, CPF_CNPJ, RG_IE, REFER_PES, '
      '   REFER_COM, FONE_COM, CADASTRO, OBS, NATURALIDADE, LIMITE, FOTO)'
      'VALUES'
      '  (:TIPO, :NOME, :ENDERECO, :CEP, :BAIRRO, :TELEFONE, :FAX, :CODCIDADE, '
      '   :UF, :TEMPO_MORADIA, :END_ANTERIOR, :E_MAIL, :TRABALHO, :CARGO, :DATA_INICIO, '
      '   :SALARIO, :ESTADO_CIVIL, :CONJUGUE, :LOCAL_TRAB, :DATA_NASC, :PAI, :MAE, '
      '   :CPF_CNPJ, :RG_IE, :REFER_PES, :REFER_COM, :FONE_COM, :CADASTRO, :OBS, '
      '   :NATURALIDADE, :LIMITE, :FOTO)'
    )
    ModifySQL.Strings = (
      'UPDATE CLIENTES SET'
      '  TIPO = :TIPO,'
      '  NOME = :NOME,'
      '  ENDERECO = :ENDERECO,'
      '  CEP = :CEP,'
      '  BAIRRO = :BAIRRO,'
      '  TELEFONE = :TELEFONE,'
      '  FAX = :FAX,'
      '  CODCIDADE = :CODCIDADE,'
      '  UF = :UF,'
      '  TEMPO_MORADIA = :TEMPO_MORADIA,'
      '  END_ANTERIOR = :END_ANTERIOR,'
      '  E_MAIL = :E_MAIL,'
      '  TRABALHO = :TRABALHO,'
      '  CARGO = :CARGO,'
      '  DATA_INICIO = :DATA_INICIO,'
      '  SALARIO = :SALARIO,'
      '  ESTADO_CIVIL = :ESTADO_CIVIL,'
      '  CONJUGUE = :CONJUGUE,'
      '  LOCAL_TRAB = :LOCAL_TRAB,'
      '  DATA_NASC = :DATA_NASC,'
      '  PAI = :PAI,'
      '  MAE = :MAE,'
      '  CPF_CNPJ = :CPF_CNPJ,'
      '  RG_IE = :RG_IE,'
      '  REFER_PES = :REFER_PES,'
      '  REFER_COM = :REFER_COM,'
      '  FONE_COM = :FONE_COM,'
      '  CADASTRO = :CADASTRO,'
      '  OBS = :OBS,'
      '  NATURALIDADE = :NATURALIDADE,'
      '  LIMITE = :LIMITE,'
      '  FOTO = :FOTO'
      'WHERE'
      '  CLIENTES.CODCLIENTE = :OLD_CODCLIENTE'
    )
    UseSequenceFieldForRefreshSQL = False
    Left = 278
    Top = 64
    ParamData = <    
      item
        DataType = ftUnknown
        Name = 'TIPO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'NOME'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'ENDERECO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CEP'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'BAIRRO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'TELEFONE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'FAX'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CODCIDADE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'UF'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'TEMPO_MORADIA'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'END_ANTERIOR'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'E_MAIL'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'TRABALHO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CARGO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'DATA_INICIO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'SALARIO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'ESTADO_CIVIL'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CONJUGUE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'LOCAL_TRAB'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'DATA_NASC'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'PAI'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'MAE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CPF_CNPJ'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'RG_IE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'REFER_PES'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'REFER_COM'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'FONE_COM'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'CADASTRO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OBS'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'NATURALIDADE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'LIMITE'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'FOTO'
        ParamType = ptUnknown
      end    
      item
        DataType = ftUnknown
        Name = 'OLD_CODCLIENTE'
        ParamType = ptUnknown
      end>
  end
end
