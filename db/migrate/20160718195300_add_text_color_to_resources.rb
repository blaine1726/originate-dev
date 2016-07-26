class AddTextColorToResources < ActiveRecord::Migration
  def change
    add_column :resources, :text_color, :string
  end
end
