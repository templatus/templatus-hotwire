module Cypress
  class CleanupController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def destroy
      return unless Rails.configuration.x.cypress

      tables = ActiveRecord::Base.connection.tables
      tables.delete 'schema_migrations'
      tables.each do |table|
        sanitized_table = ActiveRecord::Base.connection.quote_table_name(table)
        ActiveRecord::Base.connection.execute(
          "TRUNCATE #{sanitized_table} CASCADE",
        )
      end

      head :ok
    end
  end
end
