class CreateForumMessages < ActiveRecord::Migration
  def change
    create_table :forum_messages do |t|
      t.integer :forum_thread_id
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
