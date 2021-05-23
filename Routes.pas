unit Routes;

interface

uses Horse, Horse.Jhonson, BancoRoutes, ContaCaixaRoutes;

procedure StartApp;

procedure root(req: THorseRequest; resp: THorseResponse; Next: TProc);

var App: THorse;

implementation

procedure root(req: THorseRequest; resp: THorseResponse; Next: TProc);
begin
  resp.Status(200).Send('App is running fine :)');
end;

procedure StartApp;
begin
  App := THorse.Create(3001);
  App.Use(Jhonson());

  App.Get('/api', root);

  // Bancos
  App.Get('/bancos', BancoRoutes.List);
  App.Get('/bancos/:id', BancoRoutes.Find);
  App.Post('/bancos', BancoRoutes.Insert);
  App.Put('/bancos/:id', BancoRoutes.Update);
  App.Delete('/bancos/:id', BancoRoutes.Delete);

  // Contas Caixa
  App.Get('/contas-caixa', ContaCaixaRoutes.List);
  App.Get('/contas-caixa/:id', ContaCaixaRoutes.Find);
  App.Post('/contas-caixa', ContaCaixaRoutes.Insert);
  App.Put('/contas-caixa/:id', ContaCaixaRoutes.Update);
  App.Delete('/contas-caixa/:id', ContaCaixaRoutes.Delete);

  App.Start;
end;

end.
