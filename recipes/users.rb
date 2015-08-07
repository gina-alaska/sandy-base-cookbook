include_recipe 'users::default'

users_manage 'sysadmins' do
  group_id 2300
  action [:remove, :create]
end

include_recipe 'sudo::default'
