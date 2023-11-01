Dado('que acesso a api cadastrar usuário') do
  @cadastrar_usuario = 'https://reqres.in/api/users'
end

Quando('realizo o cadastro do usuário com dados válidos') do
  @cadastro_usuario_valido = HTTParty.post(@cadastrar_usuario, body:
  {
    "id": 30,
    "email": "george.bluth@reqres.in",
    "first_name": "George",
    "last_name": "Bluth",
    "avatar": "https://reqres.in/img/faces/1-image.jpg"
}.to_json)
end

Então('retorna usuário cadastrado com sucesso') do
  expect(@cadastro_usuario_valido.code).to eql 201
  expect(@cadastro_usuario_valido.message).to eql "Created"
  expect(@cadastro_usuario_valido['id']).not_to be_empty
  expect(@cadastro_usuario_valido['createdAt']).not_to be_empty
end

Quando('realizo a cadastro do usuário com dados inválidos') do
  @cadastro_usuario_invalido = HTTParty.post(@cadastrar_usuario, body:
  {
    "first_name": "test fail",
    "last_name": "test fail",
    "avatar": "test fail"
}.to_json)
end

Então('não retorna usuário cadastrado com sucesso') do
  expect(@cadastro_usuario_invalido.code).to eql 404
  expect(@cadastro_usuario_invalido.message).to eql "Found"
end
