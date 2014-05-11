class ForumThread < ActiveRecord::Base	
	has_many :forum_messages ,  :foreign_key => 'forum_thread_id'
end
