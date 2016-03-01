# Default Firewall Package
default['core_security']['firewall']['type'] = 'iptables'

# Linux
# override['firewall']['allow_ssh'] = true
override['firewall']['redhat7_iptables'] = true
override['firewall']['ubuntu_iptables'] = true
override['firewall']['ipv6_enabled'] = false
# override['firewall']['allow_established'] = true
# override['firewall']['iptables']['defaults'][:policy] = {
#   input: 'DROP',
#   forward: 'ACCEPT',
#   output: 'ACCEPT'
# }

# Rules
# default['core_security']['firewall']['rules'] = Hash.new
# default['core_security']['firewall']['rules'] = {
#   icmp: {
#     protocol: :icmp,
#     command: :allow
#   },
#   loopback: {
#     interface: 'lo',
#     command: :allow
#   },
#   ssh: {
#     port: 22,
#     protocol: :tcp,
#     stateful: [:related, :established],
#     command: :allow
#   },
#   rsync: {
#     port: 873,
#     protocol: :tcp,
#     stateful: [:related, :established],
#     command: :allow
#   }
# }
default['core_security']['firewall']['rules'] = {
  loopback: '-A INPUT -i lo -j ACCEPT',
  established: '-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT',
  icmp: '-A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT',
  ssh: '-A INPUT -p tcp -m tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT',
  rsync: '-A INPUT -p tcp -m tcp --dport 873 -m state --state NEW,ESTABLISHED -j ACCEPT'
}
# Default Chain Rules
default['linux_base']['iptables']['rules'] = <<-EOH
-P INPUT DROP
-P OUTPUT ACCEPT
-P FORWARD ACCEPT

# Allow Loopback
-A INPUT -i lo -j ACCEPT

# Allow All Established and Related Conntections
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# Allow Ping
-A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT

# Allow SSH
-A INPUT -p tcp -m tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT

# Allow Rsync
-A INPUT -p tcp -m tcp --dport 873 -m state --state NEW,ESTABLISHED -j ACCEPT
EOH

# Windows
# override['firewall']['allow_winrm'] = true
