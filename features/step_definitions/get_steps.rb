Dado('que tenho um usuario {string}') do |user_type|
  @user = { 'valido' => 2, 'invalido' => 20 }.fetch(user_type, 1)

end

Quando('realizo a consulta na api') do
  @response = HTTParty.get("https://reqres.in/api/users/#{@user}")
end

Então('retorna dados do usuário com sucesso') do
  print @response.headers
  expect(@response.code).to eql 200
  expect(@response.message).to eql "OK"
  expect(@response['data']['id']).to be_a(Integer)
  expect(@response['data']['email']).not_to be_empty
  expect(@response['data']['first_name']).not_to be_empty
  expect(@response['data']['last_name']).not_to be_empty
  expect(@response['data']['avatar']).not_to be_empty
  expect(@response['support']).not_to be_empty
  expect(@response['support']['url']).not_to be_empty
  expect(@response['support']['text']).not_to be_empty
end

Então('não retorna dados do usuário com sucesso') do
  expect(@response.code).to eql 404
  expect(@response.message).to eql "Not Found"
end

Então('a api retorna o {string} no header') do |header|
  expect(@response.headers).to include(header)
end
