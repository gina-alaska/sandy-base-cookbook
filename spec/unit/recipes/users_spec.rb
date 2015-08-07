require 'spec_helper'

describe 'sandy-base::users' do
  context 'When all attributes are default, on Centos 6.5' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(
        platform: 'centos',
        version: '6.5'
      )
      runner.converge(described_recipe)
    end

    before do
      stub_command("which sudo").and_return("/usr/bin/sudo")
    end

    it 'includes users::default' do
      expect(chef_run).to include_recipe("users::default")
    end

    it 'manages the sysadmin group' do
      expect(chef_run).to remove_users_manage('sysadmins')
      expect(chef_run).to create_users_manage('sysadmins')
    end

    it 'includes sudo::default' do
      expect(chef_run).to include_recipe('sudo::default')
    end
  end
end
