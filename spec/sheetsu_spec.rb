require 'spec_helper'

describe Sheetsu do
  describe '.get' do
    it 'return array of all rows from spreadsheet' do
      client = Sheetsu::Client.new('foo')
      response = client.get
      expect(JSON.parse(response.body)).to eql('status' => 200, 'success' => true, 'result' => [])
    end

    it 'raise error when API is not found' do
      client = Sheetsu::Client.new('blah')
      expect { client.get }.to raise_error('API with given URL is not found')
    end

    it 'raise error when something goes wrong' do
      client = Sheetsu::Client.new('baz')
      expect { client.get }.to raise_error('Something goes wrong')
    end
  end

  describe '.get_column' do
    it 'returns array of all row of chosen column' do
      client = Sheetsu::Client.new('foo')
      response = client.get_column('Name')
      expect(JSON.parse(response.body)).to eql('status' => 200, 'success' => true, 'result' => %w(Peter Lois Meg Chris Stewie Brian))
    end

    it 'raise error when API is not found' do
      client = Sheetsu::Client.new('foo')
      expect { client.get_column('baz') }.to raise_error('API with given URL is not found')
    end
  end


  describe '.create' do
    it 'creates a row with given values' do
      client = Sheetsu::Client.new('foo')
      response = client.create({ Id: '69', Name: 'Alice', Score: '9999' })
      expect(response.code).to eql(201)
    end

    it 'raise error when API is not found' do
      client = Sheetsu::Client.new('blah')
      expect { client.create({ Id: '69', Name: 'Alice', Score: '9999' }) }.to raise_error('API with given URL is not found')
    end
  end
end
