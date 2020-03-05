class RemoveIdFromAcct < ActiveRecord::Migration[6.0]
  def change
    remove_column :accts, :acct_id
  end
end
