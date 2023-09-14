# frozen_string_literal: true

class AddMediasToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :medias, :text
  end
end
