require 'spec_helper'

describe 'core_base::default' do
  # fauxhai gem does not support the latest and great OS versions. So the latest supported at the time are used.

  context 'Amazon' do
    let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'amazon', version: '2014.03').converge(described_recipe) }
    it 'should include yum-epel recipe' do
      expect(chef_run).to include_recipe('yum-epel')
    end
    it 'should install vim-enhanced' do
      expect(chef_run).to install_yum_package('vim-enhanced')
    end
    it 'should install htop' do
      expect(chef_run).to install_yum_package('htop')
    end
    it 'should install mlocate' do
      expect(chef_run).to install_yum_package('mlocate')
    end
  end

  context 'CentOS' do
    let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'centos', version: '7.0').converge(described_recipe) }
    it 'should include yum-epel recipe' do
      expect(chef_run).to include_recipe('yum-epel')
    end
    it 'should install vim-enhanced' do
      expect(chef_run).to install_yum_package('vim-enhanced')
    end
    it 'should install htop' do
      expect(chef_run).to install_yum_package('htop')
    end
    it 'should install mlocate' do
      expect(chef_run).to install_yum_package('mlocate')
    end
  end

  context 'Redhat' do
    let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'redhat', version: '7.0').converge(described_recipe) }
    it 'should include yum-epel recipe' do
      expect(chef_run).to include_recipe('yum-epel')
    end
    it 'should install vim-enhanced' do
      expect(chef_run).to install_yum_package('vim-enhanced')
    end
    it 'should install htop' do
      expect(chef_run).to install_yum_package('htop')
    end
    it 'should install mlocate' do
      expect(chef_run).to install_yum_package('mlocate')
    end
  end

  context 'Ubuntu' do
    let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe) }
    it 'should not include yum-epel recipe' do
      expect(chef_run).to_not include_recipe('yum-epel')
    end
    it 'should include apt recipe' do
      expect(chef_run).to include_recipe('apt')
    end
    it 'should install vim-enhanced' do
      expect(chef_run).to install_apt_package('vim')
    end
    it 'should install htop' do
      expect(chef_run).to install_apt_package('htop')
    end
    it 'should install mlocate' do
      expect(chef_run).to install_apt_package('mlocate')
    end
  end
end
