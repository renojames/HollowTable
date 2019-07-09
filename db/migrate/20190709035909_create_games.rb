class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :summary
      t.integer :publisher_id
      t.integer :max_players
      t.string :play_time
      t.string :year_published
    end
  end
end
