class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.datetime :date
      t.string :location
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
