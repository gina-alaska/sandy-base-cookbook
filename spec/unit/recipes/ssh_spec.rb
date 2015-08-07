require 'spec_helper'

describe 'sandy-base::ssh' do
  context 'When all attributes are default, on Centos 6.5' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(
        platform: 'centos',
        version: '6.5'
      )
      runner.converge(described_recipe)
    end

    it 'includes openssh::default' do
      expect(chef_run).to include_recipe("openssh::default")
    end

    it 'opens ssh ports' do
      expect(chef_run).to create_iptables_ng_rule('22-ssh-enable-gina-rcs-hosts').with(
        ip_version: 4,
        rule: '-m state --state NEW -p tcp -s 137.229.19.0/24,10.19.16.0/24,10.0.19.0/24,199.165.80/21 --dport 22 -j ACCEPT')
    end

    it 'includes ssh_known_hosts::default' do
      expect(chef_run).to include_recipe('ssh_known_hosts::default')
    end
  end
end
