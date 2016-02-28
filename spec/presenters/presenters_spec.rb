describe CarbohydrateIntakePresenter do
  before :each do
    DatabaseCleaner.clean
  end

  let(:carbs) { create :carbohydrate_intake }
  let(:decorated_carbs) { CarbohydrateIntakePresenter.new carbs }

  it 'presents as a whole table row' do
    expect(decorated_carbs.to_tr).to eq (
      "<tr class='carbohydrate-intake'><td><a title=\"Edit Carbs\" href=\"/carbs/1/edit\">21:25</a></td><td>Carbs</td><td class='carbohydrate-intake-weight'><div class='value' data-toggle='tooltip' data-placement='top' title='70.0 grams'><span class='number'>70</span> <span class='units'>g</span></div></td><td class='carbohydrate-intake-description'>pasta bolognese</td></tr>"
    )
  end
end

describe PhysicalExercisePresenter do
  before :each do
    DatabaseCleaner.clean
  end

  let(:exercise) { create :physical_exercise }
  let(:decorated_exercise) { PhysicalExercisePresenter.new exercise }

  it 'presents as a whole table row' do
    expect(decorated_exercise.to_tr).to eq (
      "<tr class='physical-exercise'><td><a title=\"Edit Exercise\" href=\"/exercise/1/edit\">15:45</a></td><td>Exercise</td><td class='physical-exercise-duration'><div class='value' data-toggle='tooltip' data-placement='top' title='90.0 Minutes'><span class='number'>90</span> <span class='units'>mins</span></div></td><td class='physical-exercise-description'>drumming</td></tr>"
    )
  end
end

describe GlycatedHaemoglobinPresenter do
  before :each do
    DatabaseCleaner.clean
  end

  let(:hba1c) { create :glycated_haemoglobin }
  let(:decorated_hba1c) { GlycatedHaemoglobinPresenter.new hba1c }

  it 'presents as a whole table row' do
    expect(decorated_hba1c.to_tr padding: 1).to eq (
      "<tr class='glycated-haemoglobin'><td><a title=\"Edit HbA1c\" href=\"/hba1c/1/edit\">17:11</a></td><td>HbA1c</td><td class='glycated-haemoglobin-percentage'><div class='value' data-toggle='tooltip' data-placement='top' title='6.0 percent'><span class='number'>6</span><span class='units'>%</span></div></td><td class='filler'></td></tr>"
    )
  end
end

describe BloodPressurePresenter do
  before :each do
    DatabaseCleaner.clean
  end

  let(:bp) { create :blood_pressure }
  let(:decorated_bp) { BloodPressurePresenter.new bp }

  it 'presents as a whole table row' do
    expect(decorated_bp.to_tr padding: 1).to eq (
      "<tr class='blood-pressure'><td><a title=\"Edit Blood Pressure\" href=\"/bp/1/edit\">15:53</a></td><td>Blood Pressure</td><td class='blood-pressure-reading'><div class='value' data-toggle='tooltip' data-placement='top' title='130/82 Systolic/Diastolic'><span class='number'>130/82</span> <span class='units'>mmHg</span></div></td><td class='filler'></td></tr>"
    )
  end

  it 'knows how wide it is' do
    expect(decorated_bp.width).to eq 3
  end
end

describe MetricPresenter do
  context 'round numbers for display' do
    it 'leaves a straight integer alone' do
      expect(described_class.rounder 10).to eq 10
    end

    it 'does not fuck about with blood-pressure readings' do
      expect(described_class.rounder '140/32').to eq '140/32'
    end

    it 'trims a .0' do
      expect(described_class.rounder 6.0).to eq 6
    end

    it 'retains other decimal parts' do
      expect(described_class.rounder 12.3).to eq 12.3
    end
  end
end
