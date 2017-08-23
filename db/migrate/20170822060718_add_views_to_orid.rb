class AddViewsToOrid < ActiveRecord::Migration[5.0]
  def change
    add_column :orids, :views, :integer
  end
end
