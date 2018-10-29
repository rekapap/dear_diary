feature 'Editing a entry' do
  scenario 'A user can update a entry' do
    entry = Entry.create(title: 'Blog', body: "Blog Body")
    visit('/entries')
    expect(page).to have_link('Blog', href: "entries/#{entry.id}")

    first('.entry').click_button 'Edit'
    expect(current_path).to eq "/entries/#{entry.id}/edit"

    fill_in('title', with: "New Flog")
    fill_in('editordata', with: "My new flog body")
    click_button('Submit')

    expect(current_path).to eq "/entries/#{entry.id}"
    expect(page).not_to have_content('Blog')
    expect(page).not_to have_content('Blog Body')
    expect(page).to have_content('New Flog')
    expect(page).to have_content('My new flog body')
  end
end
