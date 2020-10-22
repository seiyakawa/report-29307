class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.date :date,        null: false 
      t.string :name,      null: false 
      t.text :purpose,     null: false 
      t.text :outcome,     null: false 
      t.text :action_plan, null: false 
      t.text :other
      t.references :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end