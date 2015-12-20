$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
require 'sheetsu'
require 'webmock/rspec'
require 'codeclimate-test-reporter'
SimpleCov.start
CodeClimate::TestReporter.start
WebMock.disable_net_connect!(allow: 'codeclimate.com')

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, 'https://sheetsu.com/apis/foo')
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

    stub_request(:get, 'https://sheetsu.com/apis/blah')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        })
      .to_return(status: 404, body: nil, headers: {})

    stub_request(:get, 'https://sheetsu.com/apis/baz')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        })
      .to_return(status: 500, body: nil, headers: {})

    stub_request(:get, 'https://sheetsu.com/apis/foo/column/Name')
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

    stub_request(:get, 'https://sheetsu.com/apis/foo/column/baz')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        })
      .to_return(status: 404, body: nil, headers: {})

    stub_request(:post, 'https://sheetsu.com/apis/foo')
      .with(
        headers: {
          'Content-Type'=>'application/json'
        },
        body: '{"Id":"69","Name":"Alice","Score":"9999"}')
      .to_return(
        status: 201,
        body: nil,
        headers: {})

    stub_request(:post, 'https://sheetsu.com/apis/blah')
      .with(
        headers: {
          'Content-Type'=>'application/json'
        },
        body: '{"Id":"69","Name":"Alice","Score":"9999"}')
      .to_return(status: 404, body: nil, headers: {})
  end
end
