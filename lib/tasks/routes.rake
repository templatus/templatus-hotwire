task routes: :environment do
  # simplecov:disable
  puts `bundle exec rails routes`
  # simplecov:enable
end
