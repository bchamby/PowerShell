require 'spec_helper'
require 'chef/win32/version'

describe 'powershell::winrm' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'windows', version: '2012').converge(described_recipe)
  end

  it 'configures the winrm endpoint with quickconfig' do
    expect(chef_run).to run_powershell_script('enable winrm').with(code: "      winrm quickconfig -q\n")
  end
end
