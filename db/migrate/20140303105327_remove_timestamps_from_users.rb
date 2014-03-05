class RemoveTimestampsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :timestamps, :string
  end
end
