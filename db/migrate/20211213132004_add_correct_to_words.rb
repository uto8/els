class AddCorrectToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :correct, :boolean
  end
end
