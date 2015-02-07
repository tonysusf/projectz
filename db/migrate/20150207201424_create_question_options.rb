class CreateQuestionOptions < ActiveRecord::Migration
  def change
    create_table :question_options do |t|
      t.text :text
      t.integer :question_id
      t.timestamps null: false
    end
  end
end
