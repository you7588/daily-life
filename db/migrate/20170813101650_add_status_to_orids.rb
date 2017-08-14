class AddStatusToOrids < ActiveRecord::Migration[5.0]
  def change
    add_column :orids, :status, :string, :default => "draft"
  end
end
