Dado('que acesso a api consultar usuário') do
  @api_user_valido = 'https://reqres.in/api/users/2'
  @api_user_invalido = 'https://reqres.in/api/users/20'
end

Quando('realizo a consulta com dados válidos') do
  @pesquisa_valida = HTTParty.get(@api_user_valido)
end

Então('retorna dados do usuário com sucesso') do
  expect(@pesquisa_valida.code).to eql 200
  expect(@pesquisa_valida.message).to eql "OK"
  expect(@pesquisa_valida['data']['id']).to eql (2)
  expect(@pesquisa_valida['data']['email']).to eql "janet.weaver@reqres.in"
  expect(@pesquisa_valida['data']['first_name']).to eql "Janet"
  expect(@pesquisa_valida['data']['last_name']).to eql "Weaver"
  expect(@pesquisa_valida['data']['avatar']).to eql "https://reqres.in/img/faces/2-image.jpg"
  expect(@pesquisa_valida['support']['url']).to eql "https://reqres.in/#support-heading"
  expect(@pesquisa_valida['support']['text']).to eql "To keep ReqRes free, contributions towards server costs are appreciated!"
end

Quando('realizo a consulta com dados inválidos') do
  @pesquisa_valida = HTTParty.get(@api_user_invalido)
end

Então('não retorna dados do usuário com sucesso') do
  expect(@pesquisa_valida.code).to eql 404
  expect(@pesquisa_valida.message).to eql "Not Found"
end
