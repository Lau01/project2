class PagesController < ApplicationController
  before_action :fetch_user
  def home
    render :home
  end
end
