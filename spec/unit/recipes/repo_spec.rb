require 'spec_helper'

describe 'nginx::repo' do
  context 'Debian' do
    let(:chef_run) do
      ChefSpec::Runner.new(:platform => 'debian', :version  => '7.0').converge(described_recipe)
    end

    it 'includes apt recipe' do
      expect(chef_run).to include_recipe('apt::default')
    end

    it 'adds apt repository' do
      expect(chef_run).to add_apt_repository('nginx')
    end

  end

  context 'Rhel' do
    let(:chef_run) do
      ChefSpec::Runner.new(:platform => 'centos', :version  => '6.5').converge(described_recipe)
    end

    it 'adds yum repository' do
      expect(chef_run).to create_yum_repository('nginx')
    end

  end

  context 'Fedora' do
    let(:chef_run) do
      ChefSpec::Runner.new(:platform => 'fedora', :version  => '20').converge(described_recipe)
    end

    it 'adds yum repository' do
      expect(chef_run).to create_yum_repository('nginx')
    end

  end

end
