class ChangeSomethingInShippings < ActiveRecord::Migration[6.1]
  def change
    rename_column :shippings, :custmer_id, :customer_id
  end
end
