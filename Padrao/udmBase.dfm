object dmBase: TdmBase
  OldCreateOrder = False
  Height = 292
  HorizontalOffset = 350
  VerticalOffset = 213
  Width = 437
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF8
    Properties.Strings = (
      'AutoEncodeStrings=True'
      'controls_cp=CP_UTF8'
    )
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 3306
    Database = 'wscd'
    User = 'root'
    Password = 'mysqlrocks!'
    Protocol = 'mysql'
    Left = 128
    Top = 64
  end
end
