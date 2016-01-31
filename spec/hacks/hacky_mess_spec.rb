load File.expand_path('../../../lib/dirty_hacky_mess.rb', __FILE__)

module Horrible
  describe Hacks do
    it 'says FOO' do
      expect(described_class.foo).to eq 'FOO'
    end

    it 'parses an XML file' do
      xml = File.read(File.expand_path '../../../spec/support/fixtures/incoming.xml', __FILE__)
      expect(described_class.munge xml).to be_an Array
      expect(described_class.munge(xml).count).to eq 9
      expect(described_class.munge(xml).first).to eq (
        {
          'id'=>'3649',
          'datetime'=>'2016-01-30T14:05:00+00:00',
          'type'=>'Medication',
          'subtype'=>'Humalog',
          'category'=>'Lunch',
          'value'=>'6.0'
        }
      )
    end
  end
end
