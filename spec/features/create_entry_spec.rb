feature 'Adding a new diary entry' do
  scenario 'A user can add an entry to Dear Diary' do
    visit('/entries/new')
    fill_in('title', with: 'My test entry title')
    fill_in('entry_body', with: 'My test entry body')
    click_button('Submit')
    expect(page).to have_content 'My test entry title My test entry body'
  end
end
