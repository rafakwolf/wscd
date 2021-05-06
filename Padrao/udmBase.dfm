object dmBase: TdmBase
  OldCreateOrder = False
  Height = 292
  HorizontalOffset = 478
  VerticalOffset = 289
  Width = 437
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF8
    AutoEncodeStrings = True
    Properties.Strings = (
      'AutoEncodeStrings=True'
      'controls_cp=CP_UTF8'
    )
    HostName = 'localhost'
    Port = 3306
    Database = 'wscd'
    User = 'root'
    Password = 'mysqlrocks!'
    Protocol = 'mysql'
    Left = 300
    Top = 72
  end
end
