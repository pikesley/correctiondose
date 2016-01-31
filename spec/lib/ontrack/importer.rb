load File.expand_path('../../../../lib/ontrack/importer.rb', __FILE__)

module Ontrack
  describe Importer do
    it 'parses an XML file' do
      xml = File.read(File.expand_path '../../../../spec/support/fixtures/incoming.xml', __FILE__)
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
