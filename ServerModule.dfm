object UniServerModule: TUniServerModule
  OldCreateOrder = False
  OnCreate = UniGUIServerModuleCreate
  TempFolder = 'temp\'
  Title = 'ERP'
  SuppressErrors = []
  Bindings = <>
  CustomFiles.Strings = (
    './files/styles.css'
    './files/font-awesome-4.7.0/css/font-awesome.min.css')
  SSL.SSLOptions.RootCertFile = 'root.pem'
  SSL.SSLOptions.CertFile = 'cert.pem'
  SSL.SSLOptions.KeyFile = 'key.pem'
  SSL.SSLOptions.Method = sslvTLSv1_1
  SSL.SSLOptions.SSLVersions = [sslvTLSv1_1]
  SSL.SSLOptions.Mode = sslmUnassigned
  SSL.SSLOptions.VerifyMode = []
  SSL.SSLOptions.VerifyDepth = 0
  ConnectionFailureRecovery.ErrorMessage = 'Connection Error'
  ConnectionFailureRecovery.RetryMessage = 'Retrying...'
  Height = 150
  Width = 215
end
