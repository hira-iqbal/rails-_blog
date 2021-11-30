option = Role.insert_all([
  { :name => 'admin' },
  { :name => 'moderator' },
  { :name => 'editor' },
  { :name => 'commenter'}])

User.create!([{name: "Ali", surname: "Ammar", email: "admin@gmail.com", password: "12345678", role: "admin"}])

