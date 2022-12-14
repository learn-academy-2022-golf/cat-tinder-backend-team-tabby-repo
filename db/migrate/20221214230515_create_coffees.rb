class CreateCoffees < ActiveRecord::Migration[7.0]
  def change
    create_table :coffees do |t|
      t.string :name
      t.string :size
      t.string :milk_type
      t.string :bio
      t.text :image

      t.timestamps
    end
  end
end
