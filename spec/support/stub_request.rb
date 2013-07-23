require 'webmock/rspec'

module StubRequest
  def stub_get(path)
    stub_request(:get, url_for(path))
  end

  def url_for(path)
    "#{WhenIWork.configuration.endpoint}#{path}"
  end

  def fixture_path
    File.expand_path("../../fixtures", __FILE__)
  end

  def fixture(file)
    JSON.load(File.new(fixture_path + '/' + file))
  end
end
