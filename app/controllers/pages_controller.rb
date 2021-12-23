class PagesController < ApplicationController
    layout "main"
    def index
    end
    def show 
        @todos =Todo.all
    end
end