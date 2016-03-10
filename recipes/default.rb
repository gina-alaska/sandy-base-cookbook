#
# Cookbook Name:: sandy-base
# Recipe:: default
#
# Copyright (c) 2015 UAF-GINA Rights Reserved.
include_recipe 'chef-sugar'

include_recipe 'resolver::default'
include_recipe 'ntp::default'
include_recipe 'chef-client::config'
include_recipe 'chef-client::service'
include_recipe 'selinux::permissive'
include_recipe 'omnibus_updater'
include_recipe 'iptables-ng::default' unless docker?
include_recipe 'sandy-base::ssh'
include_recipe 'sandy-base::users'
