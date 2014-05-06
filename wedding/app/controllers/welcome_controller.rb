class WelcomeController < ApplicationController
  def show
  end

  def index
  end

  def search
  		@pros = Product.find(:all, :conditions => ['description like ?', "%#{params[:q]}%"])
  end
end
