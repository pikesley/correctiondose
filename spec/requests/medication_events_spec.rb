describe 'MedicationEvents' do
  describe 'Manage medication events' do
    let(:user) { create :user }

    before :each do
      DatabaseCleaner.clean
      Timecop.freeze 2016, 01, 31, 10, 00
    end

    after :each do
      Timecop.return
    end

    it 'adds an event and displays the results' do
      DatabaseCleaner.clean

      visit new_medication_event_url(as: user)
      expect {
        fill_in 'Date and time', with: (Time.now - 3600)
        fill_in 'Dose', with: '10.0'
        select 'humalog', from: 'Insulin'
        click_button 'Add'
      }.to change(MedicationEvent, :count).by 1

      within 'th' do
        expect(page).to have_content 'Sunday January 31st'
      end
      expect(page).to have_content '09:00'
      expect(page).to have_content '10.0'
      expect(page).to have_content 'humalog'
    end

    it 'edits an event' do
      DatabaseCleaner.clean

      medication_event = create(:medication_event, datetime: '1992-06-15 12:00:00', dose: '7', insulin: 'humalog')
      visit medication_events_path(as: user)
      click_link '12:00'
      expect(page).to have_content 'Meds'
      expect(page).to have_content 'Delete'
    end

    it 'adds several measurements' do
      DatabaseCleaner.clean

      visit new_medication_event_url(as: user)
      fill_in 'Date and time', with: Time.now - 3600
      fill_in 'Dose', with: '10.5'
      select 'humalog', from: 'Insulin'
      click_button 'Add'

      expect(page.all('td').map { |cell| cell.text }).to eq ['09:00', 'Meds', '10.5 u', 'humalog']

      visit new_medication_event_url(as: user)
      fill_in 'Date and time', with: Time.now - 86400
      fill_in 'Dose', with: '5.5'
      select 'humalog', from: 'Insulin'
      click_button 'Add'

      visit new_medication_event_url(as: user)
      fill_in 'Date and time', with: Time.now - 24000
      fill_in 'Dose', with: '8.0'
      select 'lantus', from: 'Insulin'
      click_button 'Add'

      expect(page).to have_content 'Sunday January 31st'
      expect(page).to have_content '09:00'
      expect(page).to have_content '03:20'

      expect(page).to have_content 'Saturday January 30th'
      expect(page).to have_content '10:00'

      click_link '10:00'
      expect(page).to have_content 'Meds'
      expect(page).to have_field 'Date and time'
      expect(page).to have_select 'Insulin', options: ['humalog', 'lantus']
      expect(page).to have_selector 'input[type=submit][value="Update"]'
      expect(page).to have_link 'Delete', href: '/meds/2'
      expect(page).to have_link 'Back', href: '/'

      click_link 'Delete'
      expect(MedicationEvent.count).to eq 2
      expect(page).to have_link 'Add Meds', href: '/meds/new'
      expect(page).to_not have_content 'Sunday January 28th'
    end
  end
end
