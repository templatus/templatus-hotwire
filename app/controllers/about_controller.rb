class AboutController < ApplicationController
  def index
    render Views::About::Index.new
  end
end
