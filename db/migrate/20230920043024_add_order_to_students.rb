class AddOrderToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :order, :integer
  end
end
