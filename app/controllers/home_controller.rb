class HomeController < ApplicationController
  def index
  end
  
  def javascript_test
   render :text => "alert('Hello, world!')",
         :content_type => "text/javascript"
  end
end
