include_recipe 'openssh::default'

unless docker?
  Chef::Resource::IptablesNgRule.send(:include, SandyBase::Helper)

  iptables_ng_rule '22-ssh-enable-gina-rcs-hosts' do
    ip_version 4
    rule "-m state --state NEW -p tcp -s #{ssh_allowed_networks} --dport 22 -j ACCEPT"
  end
end

include_recipe "ssh_known_hosts::default"
