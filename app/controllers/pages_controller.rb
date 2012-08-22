class PagesController < ApplicationController

  def search
    if request.post?
      @results = ['John Doe']
    end
  end

end
