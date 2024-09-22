class AboutController < ApplicationController
  def index
    render About::IndexView.new
  end
end
