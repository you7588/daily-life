class CreateOrids < ActiveRecord::Migration[5.0]
  def change
    create_table :orids do |t|
      t.string :title
      t.date :date
      t.text :objective
      t.text :reflective
      t.text :interpretive
      t.text :decisional
      t.timestamps
    end
  end
end
