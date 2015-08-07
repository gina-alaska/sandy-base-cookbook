#
# Cookbook Name:: sandy-base
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'sandy-base::default' do
  context 'When all attributes are default, on Centos 6.5' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(
        platform: 'centos',
        version: '6.5'
      )
      runner.converge(described_recipe)
    end

    before do
      stub_command('which sudo').and_return "/usr/bin/sudo"
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'includes resolver::default' do
      expect(chef_run).to include_recipe "resolver::default"
    end

    it 'includes npt::default' do
      expect(chef_run).to include_recipe "ntp::default"
    end

    it 'includes chef_client' do
      expect(chef_run).to include_recipe "chef-client::config"
      expect(chef_run).to include_recipe "chef-client::service"
    end

    it 'includes selinux::permissive' do
      expect(chef_run).to include_recipe "selinux::permissive"
    end

    it 'includes omnibus_updater' do
      expect(chef_run).to include_recipe "omnibus_updater"
    end

    it 'includes ssh' do
      expect(chef_run).to include_recipe "sandy-base::ssh"
    end
  end
end
