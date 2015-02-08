class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.string         :name
      t.text           :description
      t.string         :link
      t.decimal        :amount

      t.timestamps null: false
    end
  end
end
