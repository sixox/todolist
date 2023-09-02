class HomeController < ApplicationController
	def index
		@latest_news = Post.where(kind: 'news').order(created_at: :desc).limit(3)
		@products = Product.all
		@latest_articles = Post.where.not(kind: 'news').order(created_at: :desc).limit(9)
		@application_posts = Post.where(kind: 'application')
	end
end
