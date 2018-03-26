class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
			  length: {minimum: 3}
	validates :text, presence: true,
			  length: {minimum: 2}

	def self.search(params)
		articles = Article.where("lower(text) LIKE ? or lower(title) LIKE ?", "%#{params[:search].downcase}%", 
			"%#{params[:search].downcase}%") if params[:search].present?
		articles #returns the articles containing the searching words
	end
end
