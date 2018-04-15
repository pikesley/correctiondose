describe 'Welcome' do
  describe 'Show front page' do
    let(:user) { create :user }

    it 'has some add-stuff buttons' do
      DatabaseCleaner.clean

      visit root_path(as: user)
      within(:css, 'div#add-links') do
        expect(page.all('a').map { |link| link.text } ).to eq [
          '+ Glucose',
          '+ Meds',
          '+ Carbs',
          '+ Exercise'
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
        create(:medication_event, datetime: Time.now - 108000),
        create(:carbohydrate_intake, datetime: Time.now - 1800),
        create(:carbohydrate_intake, datetime: Time.now - 200000)
      ]
    end

    after :each do
      Timecop.return
    end

    it 'has a table of datas' do
      visit root_path(as: user)
      within 'table' do
        expect(page).to have_content /09:30.*Carbs.*70.*g.*pasta.*bolognese/
        expect(page).to have_content /09:00.*Glucose.*6.*mmol\/L/
        expect(page).to have_content /08:30.*Meds.*10.*u.*humalog/
        expect(page).to have_content /08:00.*Glucose.*6.*mmol\/L/
      end
    end
  end
end
