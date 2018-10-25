require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('dear_diary_test')
else
  DatabaseConnection.setup('dear_diary')
end
