class HomeController < ApplicationController
  def index
    render json: "Hello world"
  end
end
