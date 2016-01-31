describe 'Welcome' do
  describe 'Show front page' do
    let(:user) { create :user }

    it 'has some add-stuff buttons' do
      DatabaseCleaner.clean

      visit root_path(as: user)

      within 'h1' do
        expect(page).to have_content 'Correction Dose'
      end

      within(:css, 'div#add-links') do
        expect(page.all('a').map { |link| link.text } ).to eq [
          'Add Glucose',
          'Add Carbs',
          'Add Meds',
          'Add Exercise'
        ]
      end
    end

    before :each do
      DatabaseCleaner.clean

      Timecop.freeze 2015, 01, 31, 10, 00
      @metrics = [
        create(:glucose_measurement, datetime: Time.now - 3600),
        create(:glucose_measurement, datetime: Time.now - 7200),
        create(:medication_event, datetime: Time.now - 5400),
        create(:carbohydrate_intake, datetime: Time.now - 1800)
      ]
    end

    after :each do
      Timecop.return
    end

    it 'has a table of datas' do
      visit root_path(as: user)
      within 'table' do
        expect(page).to have_content '09:30	Carbs	70.0 pasta bolognese'
        expect(page).to have_content '09:00	Glucose	6.0'
        expect(page).to have_content '08:30	Meds 10.0	humalog'
        expect(page).to have_content '08:00	Glucose	6.0'
      end
    end
  end
end
