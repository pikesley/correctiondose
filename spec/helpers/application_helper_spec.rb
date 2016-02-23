describe ApplicationHelper do
  describe '#class_for_table_cell' do
    let(:metric) { build :medication_event }
    it 'generates the correct class' do
      expect(helper.class_for_table_cell metric, 'insulin').to eq 'medication-event-insulin'
    end
  end

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

  describe '#button_name' do
    let(:glucose) { build :glucose_measurement }
    it 'generates the button name for the model' do
      expect(helper.button_name GlucoseMeasurement).to eq 'btn-glucose'
    end

    it 'generate the button name for an instance' do
      expect(helper.button_name glucose).to eq 'btn-glucose'
    end
  end

  describe '#param_name' do
    let(:bp) { build :blood_pressure }
    it 'generates a html-friendly name from an instance' do
      expect(helper.param_name bp).to eq 'blood-pressure'
    end

    it 'or from a model' do
      expect(helper.param_name BloodPressure).to eq 'blood-pressure'
    end
  end
end
