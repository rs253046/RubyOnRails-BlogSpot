class YourpostsController < ApplicationController
  def index
  	if current_user
  		@userpost = current_user.articles.all
  		
	else
		@userpost = Articles.all

  	end

  end
end
