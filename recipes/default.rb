# Author::  Denis Uraganov (<github@uraganov.net>)
# Cookbook Name:: handbrake
# Recipe:: default
#
# Copyright 2013, Denis Uraganov
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

configure_options = node['handbrake']['configure_options'].join(" ")

include_recipe "build-essential"

pkgs = value_for_platform_family(
    [ "debian", "ubuntu" ] => %w{ yasm libtool zlib1g-dev libbz2-dev libxml2-dev libogg-dev libtheora-dev libvorbis-dev libsamplerate-dev libfribidi-dev libfreetype6-dev libfontconfig1-dev libass-dev },
    "default" => %w{ yasm libtool zlib1g-dev libbz2-dev libxml2-dev libogg-dev libtheora-dev libvorbis-dev libsamplerate-dev libfribidi-dev libfreetype6-dev libfontconfig1-dev libass-dev }
)


pkgs.each do |pkg|
  package pkg do
    action :install
  end
end

version = node['handbrake']['version']
#
#remote_file "/tmp/HandBrake-#{version}.tar.bz2" do
#  source "#{node['handbrake']['url']}/#{version}/HandBrake-#{version}.tar.bz2"
#  checksum node['handbrake']['checksum']
#  mode "0644"
#  not_if "which HandBrakeCLI"
#end

remote_file "/tmp/HandBrake-#{version}.tar.bz2" do
  source "#{node['handbrake']['url']}/#{version}/HandBrake-#{version}.tar.bz2"
  checksum node['handbrake']['checksum']
  mode "0644"
  not_if "which HandBrakeCLI"
end
#
#bash "build handbrake" do
#  cwd "/tmp"
#  code <<-EOF
#  tar -jxvf HandBrake-#{version}.tar.bz2
#  EOF
#end


bash "build handbrake" do
  cwd "/tmp"
  code <<-EOF
  tar -jxvf HandBrake-#{version}.tar.bz2
  (cd HandBrake-#{version} && ./configure #{configure_options})
  (cd HandBrake-#{version}/build && sudo make install)
  EOF
  not_if "which HandBrakeCLI"
end