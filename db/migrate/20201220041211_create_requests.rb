class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :type_of_request
      t.float :latitude
      t.float :longitude
      t.string :status

      t.timestamps
    end
  end
end
