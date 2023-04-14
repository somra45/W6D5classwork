class CatsController < ApplicationController 

    def index
        @cats = Cat.all 

        render :index
    end

    def show 
        @cat = Cat.find(params[:id]) 

        if @cat.save
            render :show 
        else 
           render @cat.errors.full_messages, status: 404 
        end 
    end 

    def create
        @cat = Cat.new(cat_params)

        if @cat.save
            render :show 
        else
            render @cat.errors.full_messages, status: 422
        end
    end

    private 

    def cat_params
        params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
    end 

end 