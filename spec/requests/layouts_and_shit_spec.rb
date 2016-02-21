describe 'Layout' do
  describe 'Page has requisite elements' do
    let(:user) { create :user }

    it 'has the nav links' do
      visit glucose_measurements_url(as: user)
      within 'nav' do
        within(:xpath, '//ul[@id="main-menu"]') do
          expect(page.all('a').map { |link| link.text}).to eq [
            'Long-term metrics', 
            'All Metrics',
            'Glucose',
            'Meds',
            'Carbs',
            'Exercise',
            'HbA1c',
            'Blood Pressure'
          ]
        end
      end
    end
  end
end
