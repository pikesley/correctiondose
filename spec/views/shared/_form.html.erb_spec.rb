describe 'shared/_form.html.erb' do
  context 'time-appropriate medication' do
    it 'presents humalog by default' do
      Timecop.freeze 2016, 02, 16, 11, 00
      assign(:metric, build(:medication_event))
      render
      expect(rendered).to have_select('Insulin', selected: 'humalog')
      Timecop.return
    end

    it 'presents lantus at bedtime' do
      Timecop.freeze 2016, 02, 16, 23, 00
      assign(:metric, build(:medication_event))
      render
      expect(rendered).to have_select('Insulin', selected: 'lantus')
      Timecop.return
    end
  end
end
