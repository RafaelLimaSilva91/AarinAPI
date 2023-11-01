# language: pt

@consultar_usuarios
Funcionalidade: Consultar usuário

@consultar_usuario_valido
Cenário: Consulta de usuário válido com sucesso
  Dado que acesso a api consultar usuário
  Quando realizo a consulta com dados válidos
  Então retorna dados do usuário com sucesso

@consultar_usuario_invalido
Cenário: Consulta de usuário inválido com sucesso
  Dado que acesso a api consultar usuário
  Quando realizo a consulta com dados inválidos
  Então não retorna dados do usuário com sucesso
