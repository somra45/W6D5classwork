class CatsController < ApplicationController 

    def index

    end 




    private 

    def cat_params
        params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
    end 

end 