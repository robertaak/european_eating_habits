class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show ]

  # GET /entries or /entries.json
  def index
    @entries = Entry.all.page(params[:page])
  end

  # GET /entries/1 or /entries/1.json
  def show
  end

  def country_top
    @entries = Entry.where("country like ?", "%#{params[:country]}%").order('mean DESC').limit(20)
  end  

  def country
    @entries = Entry.where("country like ?", "%#{params[:country]}%").order('mean DESC').page(params[:page])
  end

  def population_group_top
    @entries = Entry.where("population_group like ?", "%#{params[:population_group]}%").order('mean DESC').limit(20)
  end

  def population_group
    @entries = Entry.where("population_group like ?", "%#{params[:population_group]}%").order('mean DESC').page(params[:page])
  end

  def food_group_top
    @entries = Entry.where("food_group like ?", "%#{params[:food_group]}%").order('mean DESC').limit(20)
  end

  def food_group
    @entries = Entry.where("food_group like ?", "%#{params[:food_group]}%").order('mean DESC').page(params[:page])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:country, :population_group, :food_group, :subjects, :consumers, :mean)
    end
end
