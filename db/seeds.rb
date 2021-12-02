roles_list = [
  { name: 'admin', created_at: Time.now, updated_at: Time.now},
  { name: 'moderator', created_at: Time.now, updated_at: Time.now},
  { name: 'editor', created_at: Time.now, updated_at: Time.now},
  { name: 'commenter', created_at: Time.now, updated_at: Time.now}
]

if !Role.any?
  roles = Role.insert_all(roles_list)
end

admin_role = Role.admin.first

if !User.where(role_id: admin_role.id).any?
  user = User.new(role: admin_role)
  user.name = "Ali"
  user.surname = "Ammaar"
  user.email = "admin@gmail.com"
  user.password = "12345678"
  user.password_confirmation = "12345678"
  user.save
end
