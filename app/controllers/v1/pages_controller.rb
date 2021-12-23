class V1::PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end
  def missing
    
  end
  def dynamic
    @id = params[:dynamic]
  end
end
