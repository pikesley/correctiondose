load File.expand_path('../../../lib/dirty_hacky_mess.rb', __FILE__)

module Horrible
  describe Hacks do
    it 'says FOO' do
      expect(described_class.foo).to eq 'FOO'
    end
  end
end
