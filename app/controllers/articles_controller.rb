class ArticlesController < ApplicationController

	before_action :set_article, only: [:show, :edit, :update, :destroy]

	def show
	 	
	end

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new()
	end

	def edit
		
	end

	def create
		@article = Article.new(params_require)
		# render plain: @article.inspect    #to render any plain text
 		if @article.save
 		  flash[:notice] = "Article created succesfully"
 		  redirect_to @article #article_path(@article)
		else
			render 'new'
		end
	end

	def update
		

		if @article.update(params_require)
			flash[:notice] = "Article Updated succesfully"
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy		
		
		@article.destroy
		redirect_to articles_path
	end

	private 

	def set_article
		@article = Article.find(params[:id])
	end

	def params_require
		params.require(:article).permit(:title, :description)
	end

end