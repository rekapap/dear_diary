feature 'Viewing list of entrie\'s body' do
  feature 'viewing entries\'s body' do
    scenario 'entry\'s body is visible' do
      entry = Entry.create(title: 't1', body: 'p1')
      visit('/entries')
      click_link(entry.title.to_s)
      expect(current_path).to eq "/entries/#{entry.id}"
      expect(page).to have_content(entry.title.to_s)
      expect(page).to have_content(entry.body.to_s)
    end
  end
end
