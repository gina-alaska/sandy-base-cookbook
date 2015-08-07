module SandyBase
  module Helper
    def ssh_allowed_networks
      networks = node['sandy']['ssh']['allowed_networks'].select do |_network, allow|
        allow == true ? true : false
      end
      networks.keys.join(",")
    end
  end
end
