feature 'Viewing list of entrie\'s title' do
  feature 'visiting the homepage' do
    scenario 'the page title is visible' do
      visit '/'
      expect(page).to have_content 'Dear Diary'
    end
  end

  feature 'viewing entries\'s title' do
    scenario 'entries title links are visible' do
      entry1 = Entry.create(title: 't1', body: 'p1')
      entry2 = Entry.create(title: 't2', body: 'p2')
      entry3 = Entry.create(title: 't3', body: 'p3')

      visit '/entries'

      expect(page).to have_link(entry1.title.to_s, href: "entries/#{entry1.id}")
      expect(page).to have_link(entry2.title.to_s,
                                href: "entries/#{entry2.id}")
      expect(page).to have_link(entry3.title.to_s, href: "entries/#{entry3.id}")
    end
  end
end
