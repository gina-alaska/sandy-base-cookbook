include_recipe 'users::default'

group 'sysadmins' do
  action :remove
end

users_manage 'sysadmin' do
  group_id 2300
  action [:remove, :create]
end

include_recipe 'sudo::default'
