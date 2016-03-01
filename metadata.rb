# rubocop:disable Style/SingleSpaceBeforeFirstArg

name             'core_security'
maintainer       'Chef Core Team'
maintainer_email 'levon.becker@chefcore.com'
license          'MIT'
description      'Wrapper Cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.1'

recipe 'core_security', 'Security Configuration'

depends 'core_library'
depends 'selinux'
depends 'firewall'

%w(debian ubuntu centos redhat windows).each do |os|
  supports os
end
