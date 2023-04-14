class CatsController < ApplicationController 

    def index
        @cats = Cat.all 

        render :cats 
    end

    def show 
        @cat = Cat.find(params[:id]) 

        if @cat.save
            render :show 
        else 
            @cat.errors.full_messages, status: 404 
        end 
    end 




    private 

    def cat_params
        params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
    end 

end 