require 'spec_helper'

describe Sheetsu do
  it 'return array of all rows from spreadsheet' do
    client = Sheetsu::Client.new('foo')
    response = client.get
    expect(JSON.parse(response.body)).to eql({"status"=>200, "success"=>true, "result"=>[]})
  end

  it 'raise error when API is not found' do
    client = Sheetsu::Client.new('blah')
    expect { client.get }.to raise_error('API with given URL is not found')
  end

  it 'raise error when something goes wrong' do
    client = Sheetsu::Client.new('baz')
    expect { client.get }.to raise_error('Something goes wrong')
  end

  it 'returns array of all row of chosen column' do
    client = Sheetsu::Client.new('foo')
    response = client.get_column('Name')
    expect(JSON.parse(response.body)).to eql({"status"=>200, "success"=>true, "result"=>["Peter", "Lois", "Meg", "Chris", "Stewie", "Brian"]})
  end
end
