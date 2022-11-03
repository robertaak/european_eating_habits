class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show ]

  # GET /entries or /entries.json
  def home
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
