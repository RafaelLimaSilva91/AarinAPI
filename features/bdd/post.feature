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

@validar_header_content_type_post
Cenário: Validar se a api retonar o Content Type
  Dado que acesso a api cadastrar usuário
  Quando realizo o cadastro do usuário com dados válidos
  Então a api retorna o "content-type" no header

@validar_header_content_type_post
Cenário: Validar se a api retonar o Content Type
  Dado que acesso a api cadastrar usuário
  Quando realizo o cadastro do usuário com dados válidos
  Então a api retorna o "access-control-allow-origin" no header