inherited dmUser: TdmUser
  inherited zqDefault: TZQuery
    SQL.Strings = (
      'SELECT U.IDUSUARIOS, '
      '       U.NOME, '
      '       U.LOGIN, '
      '       U.SENHA'
      'FROM USUARIOS U')
  end
end
