Endipoints 

Salvar novos membros:
http://localhost:8080/api/members

body: 

{
"name": "John Doe",
"gender": "Male",
"birthDate": "1980-04-22",
"profile": "Member",
"login": "johndoe",
"city": "Cityville",
"state": "State",
"zipCode": "12345",
"address": "1234 Street Rd",
"registrationDate": "2022-05-11T14:12:34"
}


Buscar todos os membros:
http://localhost:8080/api/members

Buscar pelo id:
http://localhost:8080/api/members/:id

Deletar membro:
http://localhost:8080/api/members/:id