class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show ]

  # GET /entries or /entries.json
  def home
    @entries_by_country  = Entry.select('DISTINCT country').order('country ASC')
    @entries_by_age  = Entry.select('DISTINCT population_group').order('population_group ASC')
    @entries_by_food  = Entry.select('DISTINCT food_group').order('food_group ASC')
  end

  def index
    if params[:search_by_country].present?
      @entries = Entry.search_by_country(params[:search_by_country]).order('mean DESC').limit(10)

    elsif params[:search_by_age].present?
      @entries = Entry.search_by_age(params[:search_by_age]).order('mean DESC').limit(10)

    elsif params[:search_by_food].present?
      @entries = Entry.search_by_food(params[:search_by_food]).order('mean DESC').limit(10)
    end

  end

  # GET /entries/1 or /entries/1.json
  def show
  end 

  def country
    @entries = Entry.where("country like ?", "%#{params[:country]}%").order('mean DESC').page(params[:page])
  end

  def population_group
    @entries = Entry.where("population_group like ?", "%#{params[:population_group]}%").order('mean DESC').page(params[:page])
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
