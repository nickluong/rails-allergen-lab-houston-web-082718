class CreateAllergens < ActiveRecord::Migration[5.2]
  def change
    create_table :allergens do |t|
      t.string :name
      t.belongs_to :user, foreign_key: true
      t.belongs_to :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
