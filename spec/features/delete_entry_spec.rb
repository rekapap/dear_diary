feature 'Deleting a diary entry' do
  scenario 'A user can delete ann entry from Dear Diary' do
    entry = Entry.create(title: 'Blog Delete', body: "Blog Body")

    visit('/entries')
    click_button('Delete')

    expect(current_path).to eq '/entries'
    expect(page).not_to have_link('Blog Delete', href: "/entries/#{entry.id}")
  end
end
