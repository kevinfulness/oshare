class CreateMessages < ActiveRecord::Migration[6.0]
	def change
		create_table :messages do |t|
			t.text :body
			t.references :conversation, index: true
			t.references :user, index: true
			t.boolean :sender_read, default: false, null: false
			t.boolean :recipient_read, default: false, null: false

			t.timestamps
		end
	end
end
