class SitemapsController < ApplicationController
	def index
   			 @posts = Post.all # Replace with your logic to fetch pages for the sitemap
   			 @grades = Grade.all
   			 @products = Product.all
   			 @packings = Packing.all
   			 respond_to do |format|
   			 	format.xml do
   			 		headers['Content-Type'] = 'application/xml'
   			 	end
   			 end
   			end
   		end
