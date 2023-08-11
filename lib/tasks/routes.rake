task routes: :environment do
  # :nocov:
  puts `bundle exec rails routes`
  # :nocov:
end
