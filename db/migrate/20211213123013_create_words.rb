class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.references :category, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
