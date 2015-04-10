user = User.create(email: 'testemail@example.com', password: '12345')

user.competitors.create(name: 'test competitor')