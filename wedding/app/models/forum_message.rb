class ForumMessage < ActiveRecord::Base
	belongs_to :forum_thread 
	belongs_to :user 
end
