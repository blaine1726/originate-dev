class AddReadmeToResources < ActiveRecord::Migration
  def change
    add_column :resources, :readme, :text
  end
end
