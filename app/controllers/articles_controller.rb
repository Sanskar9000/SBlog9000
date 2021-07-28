class ArticlesController < ApplicationController
	# shows a single article
	def show
	 	@article = Article.find(params[:id])
	end

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new()
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(params.require(:article).permit(:title, :description))
		# render plain: @article.inspect    #to render any plain text
 		if @article.save
 		  flash[:notice] = "Article created succesfully"
 		  redirect_to @article #article_path(@article)
		else
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(params.require(:article).permit(:title, :description))
			flash[:notice] = "Article Updated succesfully"
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy		
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end
end