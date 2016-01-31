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
  end
end
