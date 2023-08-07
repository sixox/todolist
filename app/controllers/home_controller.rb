class HomeController < ApplicationController
	def index
		@latest_news = Post.where(kind: 'news').order(created_at: :desc).limit(3)
	end
end
