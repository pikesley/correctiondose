describe 'welcome/index.html.erb' do
  it 'presents data' do
    assign(:metrics, [create(:glucose_measurement)])
    assign(:widest, 4)
    render
    expect(rendered).to have_content 'Glucose'
  end
end
