load File.expand_path('../../../../lib/ontrack/importer.rb', __FILE__)

module Ontrack
  describe Importer do
    let(:xml) {
      File.read(
        File.expand_path '../../../../spec/support/fixtures/incoming.xml',
                         __FILE__)
    }

    it 'turns XML into an array' do
      expect(described_class.arrayify(xml).count).to eq 9
      expect(described_class.arrayify(xml).first).to eq (
        {
          'id' => ['3649'],
          'datetime' => ['2016-01-30T14:05:00+00:00'],
          'type' => ['Medication'],
          'subtype' => ['Humalog'],
          'category' => ['Lunch'],
          'value' => ['6.0']
        }
      )
    end

    it 'maps the weird output from XmlSimple' do
      weird = {
        'id' => ['3649'],
        'datetime' => ['2016-01-30T14:05:00+00:00'],
        'type' => ['Medication'],
        'subtype' => ['Humalog'],
        'category' => ['Lunch'],
        'value' => ['6.0']
      }

      expect(described_class.fix_weirdness weird).to eq (
        {
          'id' => '3649',
          'datetime' => '2016-01-30T14:05:00+00:00',
          'type' => 'Medication',
          'subtype' => 'Humalog',
          'category' => 'Lunch',
          'value' => '6.0'
        }
      )
    end

    it 'makes JSON' do
      expect(described_class.make_json xml).to be_an Array
      expect(described_class.make_json(xml).count).to eq 9
      expect(described_class.make_json(xml).first).to eq (
        {
          'id' => '3649',
          'datetime' => '2016-01-30T14:05:00+00:00',
          'type' => 'Medication',
          'subtype' => 'Humalog',
          'category' => 'Lunch',
          'value' => '6.0'
        }
      )
    end
  end
end
