describe 'GlucoseMeasurements' do
  describe 'Manage glucose measurements' do
    let(:user) { create :user }

    before :each do
      DatabaseCleaner.clean
      Timecop.freeze 2016, 01, 31, 10, 00
    end

    after :each do
      Timecop.return
    end

    it 'adds a measurement and displays the results' do
      visit new_glucose_measurement_url(as: user)
      expect {
        fill_in 'Date and time', with: Time.now.to_s
        fill_in 'Value', with: '5.6'
        click_button 'Add'
      }.to change(GlucoseMeasurement, :count).by 1
      within 'th' do
        expect(page).to have_content 'Sunday January 31st'
      end
      expect(page).to have_content '10:00'
      expect(page).to have_content '5.6'
    end

    it 'edits a measurement' do
      glucose_measurement = create(:glucose_measurement, datetime: '1992-06-15 12:00:00', value: '7')
      visit glucose_measurements_path(as: user)
      click_link '12:00'
      expect(page).to have_content 'Glucose'
      expect(page).to have_content 'Delete'
    end

    it 'adds several measurements' do
      DatabaseCleaner.clean

      visit new_glucose_measurement_url(as: user)
      fill_in 'Date and time', with: (Time.now - 3600).to_s
      fill_in 'Value', with: '5.6'
      click_button 'Add'

      visit new_glucose_measurement_url(as: user)
      fill_in 'Date and time', with: (Time.now - 7200).to_s
      fill_in 'Value', with: '9.6'
      click_button 'Add'

      visit new_glucose_measurement_url(as: user)
      fill_in 'Date and time', with: (Time.now - 1800).to_s
      fill_in 'Value', with: '6.5'
      click_button 'Add'

      expect(page).to have_content '09:30'
      expect(page).to have_content '09:00'
      expect(page).to have_content '08:00'

      click_link '09:30'
      expect(page).to have_content 'Glucose'
      expect(page).to have_field 'Date and time'
      expect(page).to have_selector 'input[type=submit][value="Update"]'
      expect(page).to have_link 'Delete', href: '/glucose/3'
      expect(page).to have_link 'Back', href: '/'

      click_link 'Delete'
      expect(GlucoseMeasurement.count).to eq 2
      expect(page).to have_link 'Add Glucose', href: '/glucose/new'
      within 'th' do
        expect(page).to have_content 'Sunday January 31st'
      end
    end
  end
end
