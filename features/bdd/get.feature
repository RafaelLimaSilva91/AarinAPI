# language: pt

@consultar_usuarios
Funcionalidade: Consultar usuário

@consultar_usuario_valido
Cenário: Consulta de usuário válido 
  Dado que tenho um usuario "valido"
  Quando realizo a consulta na api
  Então retorna dados do usuário com sucesso

@consultar_usuario_invalido
Cenário: Consulta de usuário inválido
  Dado que tenho um usuario "invalido"
  Quando realizo a consulta na api
  Então não retorna dados do usuário com sucesso

@validar_header_content_type_get
Cenário: Validar se a api retonar o Content Type
  Dado que tenho um usuario "valido"
  Quando realizo a consulta na api
  Então a api retorna o "content-type" no header

@validar_header_content_type_get
Cenário: Validar se a api retonar o Content Type
  Dado que tenho um usuario "valido"
  Quando realizo a consulta na api
  Então a api retorna o "access-control-allow-origin" no header
