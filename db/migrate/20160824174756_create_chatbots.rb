class CreateChatbots < ActiveRecord::Migration
  def change
    create_table :chatbots do |t|

      t.timestamps null: false
    end
  end
end
