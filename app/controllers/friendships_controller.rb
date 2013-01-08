class FriendshipsController < ApplicationController
	def index
		@friendships = Friendship.where("user_id = ? AND accepted = ?", current_user.id, true)
	end
end
