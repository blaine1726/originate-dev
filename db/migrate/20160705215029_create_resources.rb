class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :background
      t.string :github
      t.string :title
      t.string :description
      t.string :text

      t.timestamps null: false
    end
  end
end
