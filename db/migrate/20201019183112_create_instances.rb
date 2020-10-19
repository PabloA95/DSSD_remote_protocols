class CreateInstances < ActiveRecord::Migration[6.0]
  def change
    create_table :instances do |t|
      t.datetime :fecha_inicio
      t.datetime :fecha_fin
      t.string :estado
      t.integer :puntaje
      t.integer :proyecto_id
      t.references :protocol, null: false, foreign_key: true

      t.timestamps
    end
  end
end
