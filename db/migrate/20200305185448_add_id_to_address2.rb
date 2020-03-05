class AddIdToAddress2 < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :acct_id, :integer
  end
end
