describe MedicationEventPresenter do
  before :each do
    DatabaseCleaner.clean
  end

  let(:meds) { create :medication_event }
  let(:decorated_meds) { MedicationEventPresenter.new meds }

  it 'has an Edit cell' do
    expect(decorated_meds.edit_cell).to eq '<td><a title="Edit Meds" href="/meds/1/edit">19:44</a></td>'
  end

  it 'has a Label cell' do
    expect(decorated_meds.label_cell).to eq '<td>Meds</td>'
  end

  it 'has a Number span' do
    expect(decorated_meds.number_span).to eq "<span class='number'>10</span>"
  end

  it 'has a Units span' do
    expect(decorated_meds.units_span).to eq "<span class='units'>u</span>"
  end

  it 'has a Value div' do
    expect(decorated_meds.value_div).to eq (
      "<div class='value' data-toggle='tooltip' data-placement='top' title='10.0 Insulin units'><span class='number'>10</span> <span class='units'>u</span></div>"
    )
  end

  it 'has a Measurement cell' do
    expect(decorated_meds.measurement_cell).to eq "<td class='medication-event-dose'><div class='value' data-toggle='tooltip' data-placement='top' title='10.0 Insulin units'><span class='number'>10</span> <span class='units'>u</span></div></td>"
  end

  it 'has a Medication cell' do
    expect(decorated_meds.meds_cell).to eq "<td class='medication-event-insulin'>humalog</td>"
  end

  it 'presents as a whole table row' do
    expect(decorated_meds.to_tr).to eq (
      "<tr><td><a title=\"Edit Meds\" href=\"/meds/1/edit\">19:44</a></td><td>Meds</td><td class='medication-event-dose'><div class='value' data-toggle='tooltip' data-placement='top' title='10.0 Insulin units'><span class='number'>10</span> <span class='units'>u</span></div></td><td class='medication-event-insulin'>humalog</td></tr>"
    )
  end

  describe '#insulin_for_time' do
    it 'defaults to humalog' do
      Timecop.freeze 2016, 02, 16, 12, 00 do
        expect(decorated_meds.insulin_for_time).to eq 'humalog'
      end
    end

    it 'knows lantus is for bedtime' do
      Timecop.freeze 2016, 02, 16, 22, 00 do
        expect(decorated_meds.insulin_for_time).to eq 'lantus'
      end
    end

    it 'thinks bedtime lasts until 06:00' do
      Timecop.freeze 2016, 02, 16, 06, 00 do
        expect(decorated_meds.insulin_for_time).to eq 'lantus'
      end
    end
  end
end
