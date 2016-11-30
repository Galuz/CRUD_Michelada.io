class CreateProductos < ActiveRecord::Migration[5.0]
  def up
    create_table :productos do |t|
      t.integer "marca_id"
      t.string "nombre", :limit => 50
      t.string "descripcion", :limit =>100
      t.string "precio", :limit =>50
      t.integer "position"
      t.timestamps
    end
    add_index("productos","marca_id")
  end
  def down
    drop_table :productos
  end
end
