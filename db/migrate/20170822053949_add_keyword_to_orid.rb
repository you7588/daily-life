class AddKeywordToOrid < ActiveRecord::Migration[5.0]
  def change
    add_column :orids, :keyword, :string
  end
end
