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
gem_branch = !ENV['GAUGE_RUBY_GEM_BRANCH'].nil? ? ENV['GAUGE_RUBY_GEM_BRANCH'] : 'master'

if source_build || (!version.nil? && version.include?('nightly'))
  v = version.split('.nightly').first
  File.open('Gemfile', 'w') do |file|
    gemfile_content = <<-eot
    source "https://rubygems.org"

    gem 'test-unit', :group => [:development, :test]
    gem 'gauge-ruby', '~>#{v}', :github => 'getgauge/gauge-ruby', :branch => '#{gem_branch}', :group => [:development, :test]
    eot
    file.write(gemfile_content)
  end
else
  version_string = version.nil? ? "" : ", '~>#{version}'"
  File.open('Gemfile', 'w') do |file|
    gemfile_content = <<-eot
    source "https://rubygems.org"

    gem 'test-unit', :group => [:development, :test]
    gem 'gauge-ruby' #{version_string}, :group => [:development, :test]
    eot
    file.write(gemfile_content)
  end
end

system "bundle install --path vendor/bundle"

File.delete __FILE__
