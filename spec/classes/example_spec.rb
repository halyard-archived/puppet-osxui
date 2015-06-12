require 'spec_helper'

describe 'osxui' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "osxui class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('osxui::params') }
          it { is_expected.to contain_class('osxui::install').that_comes_before('osxui::config') }
          it { is_expected.to contain_class('osxui::config') }
          it { is_expected.to contain_class('osxui::service').that_subscribes_to('osxui::config') }

          it { is_expected.to contain_service('osxui') }
          it { is_expected.to contain_package('osxui').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'osxui class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('osxui') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
