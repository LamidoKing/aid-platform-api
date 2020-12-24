class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :sender, null: false, foreign_key: { to_table: 'users' }
      t.references :receiver, null: false, foreign_key: { to_table: 'users' }
      t.references :request, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
