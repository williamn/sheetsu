require 'spec_helper'

describe Sheetsu do
  it 'has a version number' do
    expect(Sheetsu::VERSION).not_to be nil
  end

  it 'return array of all rows from spreadsheet' do
    client = Sheetsu::Client.new
    response = client.get
    expect(response.body).to eql([])
  end
end
