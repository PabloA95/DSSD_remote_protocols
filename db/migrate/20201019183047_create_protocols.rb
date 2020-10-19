class CreateProtocols < ActiveRecord::Migration[6.0]
  def change
    create_table :protocols do |t|
      t.string :nombre
      t.string :actividades
      t.integer :duracion

      t.timestamps
    end
  end
end
