class ArticlesController < ApplicationController
# http_basic_authenticate_with name: "kyrie", password: "123456",
# except: [:index, :show, :search]

before_action :admin_authorize, :except => [:index, :show, :search]

	def index
		@articles = Article.all
		@article = Article.new
	end

	def new
		@article = Article.new
	end 

	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
		respond_to do |format|
      format.js
    end	
	end

	def search
		if params[:search].blank?
			@articles=Article.all
		else
			@articles=Article.search(params)
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			@articles = Article.all
			respond_to do |format|
	      format.js
	    end	
		else
			render 'edit'
		end
	end

	def create
		# render plain:params[:article].inspect
		@article = Article.new(article_params)
		if @article.save
			@articles = Article.all
			respond_to do |format|
	      format.js
	    end
		else
			p "error"
		end
	end

	def destroy
		@article = Article.find(params[:id])
		if @article.destroy
			@articles = Article.all
			respond_to do |format|
		    format.js
		  end
		end
	end

private
	def article_params
		params.require(:article).permit(:title,:text)
	end

end
