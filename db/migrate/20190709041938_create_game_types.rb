class CreateGameTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :game_types do |t|
      t.integer :game_id
      t.integer :type_id
    end
  end
end
