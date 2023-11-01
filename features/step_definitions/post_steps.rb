Dado('que acesso a api cadastrar usuário') do
  @base_url = 'https://reqres.in/api/users'
end

Quando('realizo o cadastro do usuário com dados válidos') do
  @response = HTTParty.post(@base_url, body:
  {
    "id": 30,
    "email": "george.bluth@reqres.in",
    "first_name": "George",
    "last_name": "Bluth",
    "avatar": "https://reqres.in/img/faces/1-image.jpg"
}.to_json)
end

Então('retorna usuário cadastrado com sucesso') do
  expect(@response.code).to eql 201
  expect(@response.message).to eql "Created"
  expect(@response['id']).not_to be_empty
  expect(@response['createdAt']).not_to be_empty
end

Quando('realizo a cadastro do usuário com dados inválidos') do
  @response = HTTParty.post(@base_url, body:
  {
    "first_name": "test fail",
    "last_name": "test fail",
    "avatar": "test fail"
}.to_json)
end

Então('não retorna usuário cadastrado com sucesso') do
  expect(@response.code).to eql 404
  expect(@response.message).to eql "Found"
end
