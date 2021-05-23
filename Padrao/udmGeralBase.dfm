object dmGeralBase: TdmGeralBase
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 285
  Width = 378
  object zqDefault: TZQuery
    Connection = DmPrincipal.dbConn
    Params = <>
    Left = 96
    Top = 112
  end
end
