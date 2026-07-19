class AddKeysetIndexToClicks < ActiveRecord::Migration[8.1]
  # Keyset pagination is only fast when the index matches the ORDER BY of the
  # paginated set exactly - both the columns and their direction. `id` is part
  # of it to make the order unique, which keyset pagination requires.
  def change
    add_index :clicks,
              %i[created_at id],
              order: {
                created_at: :desc,
                id: :desc,
              },
              name: 'index_clicks_on_created_at_desc_id_desc'
  end
end
