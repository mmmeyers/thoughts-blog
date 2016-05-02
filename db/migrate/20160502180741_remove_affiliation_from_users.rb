class RemoveAffiliationFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :affiliation, :string
  end
end
