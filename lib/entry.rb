require_relative 'database_connection'

class Entry
  attr_reader :id, :title, :body

  def initialize(id:, title:, body:)
    @id = id
    @title = title
    @body = body
  end

  def self.all
    entries = DatabaseConnection.query('SELECT * FROM entries;')
    entries.map do |entry|
      Entry.new(
        title: entry['title'],
        body: entry['body'],
        id: entry['id']
      )
    end
  end

  def self.create(title:, body:)
    result = DatabaseConnection.query("INSERT INTO entries (title, body) VALUES('#{title}', '#{body}') RETURNING id, title, body;")
    result = result.first
    Entry.new(id: result['id'], title: result['title'], body: result['body'])
  end
end