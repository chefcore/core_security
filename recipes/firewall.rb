# enable platform default firewall
# ChefCore::Output.action 'Running Firewall Cookbook Default Setup'
log 'ACTION: Running Firewall Cookbook Default Setup' do
  message 'ACTION: Running Firewall Cookbook Default Setup'
  level :info
end
firewall 'default' do
  action :install
end

if node['core_security']['firewall']['type'] == 'iptables'
  # include_recipe 'firewall'
  ChefCore::Output.action 'Adding Firewall Rules'

  # unless node['core_security']['firewall']['rules'].empty?
  #   node['core_security']['firewall']['rules'].each do |rule, values|
  #     firewall_rule rule do
  #       port { values[:port] unless values[:port].nil? }
  #       interface { values[:interface] unless values[:interface].nil? }
  #       stateful { values[:stateful] unless values[:stateful].nil? }
  #       protocol { values[:protocol].to_s }
  #       command { values[:command].to_s }
  #     end
  #   end
  # end
  unless node['core_security']['firewall']['rules'].empty?
    node['core_security']['firewall']['rules'].each do |rule, raw_parameters|
      firewall_rule rule do
        raw raw_parameters
      end
    end
  end

  # firewall_rule 'Drop_Input' do
  #   direction :in
  #   # position 1
  #   action :reject
  # end
elsif node['core_security']['firewall']['type'] == 'windows'
  # Configure Windows Firewall
  # TODO: Add Winders Firewall Magic
  ChefCore::Output.report 'Really? Windows? :)'
else
  ChefCore::Output.error "No Matching Firewall Type Selected. This is Not a Known Firewall Type: (#{node['core_security']['firewall']['type']})"
end
