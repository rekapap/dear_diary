require 'entry'
require 'database_helpers'

describe Entry do
  describe '.all' do
    it 'returns a list of entries' do
      entry = Entry.create(title: "My post 1", body: "BODY 1")
      
      Entry.create(title: "My post 2", body: "BODY 2")
      Entry.create(title: "My post 3", body: "BODY 3")

      entries = Entry.all

      expect(entries.length).to eq 3
      expect(entries.first).to be_a Entry
      expect(entries.first.id).to eq entry.id
      expect(entries.first.title).to eq 'My post 1'
      expect(entries.first.body).to eq 'BODY 1'
    end
  end

  describe '.create' do
    it 'creates a new entry' do
      entry = Entry.create(title: "My post 1", body: "BODY 1")
      persisted_data = persisted_data(id: entry.id, table: 'entries')

      expect(entry).to be_a Entry
      expect(entry.id).to eq persisted_data.first['id']
      expect(entry.title).to eq 'My post 1'
      expect(entry.body).to eq 'BODY 1'
    end
  end
end