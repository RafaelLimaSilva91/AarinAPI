# language: pt

@cadastro_usuarios
Funcionalidade: Incluir usuário

@cadastro_usuario_valido
Cenário: Cadastro de usuário válido com sucesso
  Dado que acesso a api cadastrar usuário
  Quando realizo o cadastro do usuário com dados válidos
  Então retorna usuário cadastrado com sucesso

@cadastro_usuario_invalido
Cenário: Cadastro de usuário inválido com sucesso
  Dado que acesso a api cadastrar usuário
  Quando realizo a cadastro do usuário com dados inválidos
  Então não retorna usuário cadastrado com sucesso