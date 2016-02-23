describe 'shared/_form.html.erb' do
  context 'time-appropriate medication' do
    it 'presents humalog by default' do
      Timecop.freeze 2016, 02, 16, 11, 00 do
        @metric = build :medication_event
        @decorated_metric = MedicationEventPresenter.new @metric
        render
        expect(rendered).to have_select('Insulin', selected: 'humalog')
      end
    end

    it 'presents lantus at bedtime' do
      Timecop.freeze 2016, 02, 16, 23, 00 do
        @metric = build :medication_event
        @decorated_metric = MedicationEventPresenter.new @metric
        render
        expect(rendered).to have_select('Insulin', selected: 'lantus')
      end
    end
  end
end
