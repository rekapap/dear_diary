feature 'index page' do
  scenario 'user can visit the index page' do
    visit '/'
    expect(page).to have_content 'Dear Diary'
  end
end
