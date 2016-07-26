class AddLongDescriptionToResources < ActiveRecord::Migration
  def change
    add_column :resources, :long_description, :text
  end
end
