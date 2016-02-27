describe ApplicationHelper do
  context 'paths' do
    describe '#new_path' do
      it 'generates the _new_ path' do
        expect(helper.new_path MedicationEvent).to eq :new_medication_event_path
      end
    end

    describe '#model_path' do
      let(:carbs) { build :carbohydrate_intake }
      it 'generates the _path' do
        expect(model_path carbs).to eq :carbohydrate_intake_path
      end
    end

    describe '#edit_path' do
      let(:meds) { build :medication_event }
      it 'generates the _edit_ path' do
        expect(helper.edit_path meds).to eq :edit_medication_event_path
      end
    end
  end
end
