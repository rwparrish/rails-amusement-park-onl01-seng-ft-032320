class AttractionsController < ApplicationController 
    before_action :find_attraction, only: [:create, :show, :edit, :update]
     
    def index
        @attractions = Attraction.all
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else 
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            render :edit
        end
    end

    private 

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end 

    def find_attraction
        @attraction = Attraction.find_by(id: params[:id])
    end
end
