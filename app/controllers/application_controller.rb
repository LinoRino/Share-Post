class ApplicationController < ActionController::Base
  def show
    @article = Article.find(params[:id])
  end

  before_action :authenticate_user!
end
