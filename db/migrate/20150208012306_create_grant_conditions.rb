class CreateGrantConditions < ActiveRecord::Migration
  def change
    create_table :grant_conditions do |t|
      t.integer    :grant_id
      t.integer    :question_id
      t.integer    :question_option_id
      
      t.timestamps null: false
    end
  end
end
