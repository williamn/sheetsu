require 'spec_helper'

describe Sheetsu do
  it 'has a version number' do
    expect(Sheetsu::VERSION).not_to be nil
  end

  it 'return array of all rows from spreadsheet' do
    client = Sheetsu::Client.new('ebe5b0fa')
    response = client.get
    expect(JSON.parse(response.body)).to eql({"status"=>200, "success"=>true, "result"=>[]})
  end

  it 'return API not found when use an invalid ID' do
    client = Sheetsu::Client.new('foo')
    response = client.get
    expect(response.code).to eql(404)
  end
end
