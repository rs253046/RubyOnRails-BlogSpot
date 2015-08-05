class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :upvotes, dependent: :destroy

  def score
    upvotes.count
  end
   def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%") 
  end
  
end
