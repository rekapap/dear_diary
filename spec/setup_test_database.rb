require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'dear_diary_test')
  connection.exec("TRUNCATE entries;")
end
