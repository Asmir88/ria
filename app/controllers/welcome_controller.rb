class WelcomeController < ApplicationController
  
  skip_before_filter :authorize
  
  def hello
  end
end
