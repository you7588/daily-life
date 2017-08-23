class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id, :index => true
      t.string :nickname
      t.date :birthday
      t.string :location
      t.string :motto
      t.string :bio
      t.string :wechat
      t.timestamps
    end
  end
end
