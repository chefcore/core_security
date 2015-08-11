if node['core_security']['firewall']['type'] == 'iptables'
  include_recipe 'firewall'
  # TODO: Condition if this hash his nil or empty bail, but SSH setup above
  node['core_security']['firewall']['rules'].each do |rule, values|
    firewall_rule rule do
      port values[:port]
      protocol values[:protocol].to_s
      action values[:action].to_s
    end
  end
elsif node['core_security']['firewall']['type'] == 'windows'
  # Configure Windows Firewall
  # TODO: Add Winders Firewall Magic
  ChefCore::Output.report 'Really? Windows? :)'
else
  ChefCore::Output.error "No Matching Firewall Type Selected. This is Not a Known Firewall Type: (#{node['core_security']['firewall']['type']})"
end
