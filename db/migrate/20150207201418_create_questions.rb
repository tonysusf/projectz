class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text     :text
      t.integer  :input_type, :default => 0
      
      t.timestamps null: false
    end
  end
end
