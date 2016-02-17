describe 'Layout' do
  describe 'Page has requisite elements' do
    let(:user) { create :user }

    it 'has the nav links' do
      visit glucose_measurements_url(as: user)

      within 'nav' do
        within 'ul' do
          expect(page.all('a').map { |link| link.text}).to eq [
            'Glucose',
            'Meds',
            'Carbs',
            'Exercise'
          ]
        end
      end
    end
  end
end
