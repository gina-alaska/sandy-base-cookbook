describe service('chef-client') do
  it { should be_running }
end

describe service('sshd') do
  it { should be_running }
end

describe sshd_config do
  its('PermitRootLogin') { should eq('no') }
end

describe command('getenforce') do
  its('stdout') { should match(/Permissive/) }
end
