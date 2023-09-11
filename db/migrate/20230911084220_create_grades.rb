class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.string :name, null: false, default: ''
      t.integer :score, null: false, default: 0
      t.references :student, null: false, default: 0, foreign_key: true

      t.timestamps
    end
  end
end
