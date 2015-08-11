# Linux vs Windows
case node['os']
  when 'linux'
    ChefCore::Output.report 'Setting Policies for Linux'
    case node['platform']
      when 'debian', 'ubuntu'
        ChefCore::Output.report 'Setting Policies for Debian/Ubuntu'
      when 'redhat', 'centos', 'fedora'
        ChefCore::Output.report 'Setting Policies for redhat, centos or fedora'
        selinux_state 'Configuring SELinux' do
          action node['core_security']['policies']['selinux']['action'].to_s
        end
        # selinux_state 'Disabling SELinux' do
        #   action :disabled
        # end
      else
        ChefCore::Output.report 'Unknown Linux Distro'
    end
  when 'windows'
    # TODO: Add Winders Local Security Policies Magic
    ChefCore::Output.report 'Really? Windows? :)'
  else
    ChefCore::Output.break 'OS Family = Unknown'
end

  # TODO: WTF Announce... work damn you
  # ChefCore::Output.announce 'Configuring SELinux'
  #   # Disable SELinux
