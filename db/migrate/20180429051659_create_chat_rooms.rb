class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|
      t.string :title
      t.timestamps
    end

    create_table :chat_rooms_users, id: false do |t|
      t.belongs_to :chat_room, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
