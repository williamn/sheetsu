$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
require 'sheetsu'
require 'webmock/rspec'
require 'codeclimate-test-reporter'
SimpleCov.start
CodeClimate::TestReporter.start
WebMock.disable_net_connect!(allow: [/localhost/, '/codeclimate/'])

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, 'http://sheetsu.com/apis/foo/')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        })
      .to_return(
        status: 200,
        body: '{"status": 200, "success": true, "result": []}',
        headers: {})

    stub_request(:get, 'http://sheetsu.com/apis/blah/')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        })
      .to_return(status: 404, body: nil, headers: {})

    stub_request(:get, 'http://sheetsu.com/apis/baz/')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        })
      .to_return(status: 500, body: nil, headers: {})

    stub_request(:get, 'http://sheetsu.com/apis/foo/column/Name')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        })
      .to_return(
        status: 200,
        body: '{"status": 200, "success": true, "result": ["Peter", "Lois", "Meg", "Chris", "Stewie", "Brian"]}',
        headers: {})
  end
end
