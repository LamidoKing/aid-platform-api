class AddRepublishToRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :republished, :string
  end
end
