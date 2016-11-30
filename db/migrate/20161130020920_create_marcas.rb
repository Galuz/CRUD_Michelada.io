class CreateMarcas < ActiveRecord::Migration[5.0]
  def up
    create_table :marcas do |t|
      t.string "nombre", :limit => 50
      t.integer "position"
      t.timestamps
    end
  end
  def down
    drop_table :marcas
  end
end
