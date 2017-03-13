require 'json'

begin
  gauge_version = `gauge -v --machine-readable`
  gauge_ruby_info = JSON.parse(gauge_version)['plugins'].find do |x|
    x['name'] == 'ruby'
  end
  version = gauge_ruby_info['version']
rescue
  version = nil
end

source_build = ENV['GAUGE_SOURCE_BUILD'] == 'true'

if source_build || (!version.nil? && version.include?('nightly'))
  v = version.split('.nightly').first
  File.open('Gemfile', 'w') do |file|
    gemfile_content <<-eot
    gem 'test-unit', :group => [:development, :test]
    gem 'gauge-ruby', '~>#{v}', :github => 'getgauge/gauge-ruby', :ref => 'HEAD', :group => [:development, :test]
    eot
    file.write(gemfile_content)
  end
else
  File.open('Gemfile', 'w') do |file|
    gemfile_content <<-eot
    source "https://rubygems.org"

    gem 'test-unit', :group => [:development, :test]
    gem 'gauge-ruby', '~>#{version}', :group => [:development, :test]
    eot
    file.write(gemfile_content)
  end
end

system %w(bundle install)

File.delete __FILE__
