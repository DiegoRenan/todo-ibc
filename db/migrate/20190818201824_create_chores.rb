class CreateChores < ActiveRecord::Migration[5.2]
  def change
    create_table :chores do |t|
      t.string :title
      t.text :description
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
