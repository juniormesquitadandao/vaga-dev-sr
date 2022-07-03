class RepositoriesController < ApplicationController
  before_action :set_repository, only: :show

  def index
    respond_to do |format|
      format.html
      format.json do
        @filter = RepositoriesFilter.new filter_params
        @filter.search
        respond_with @filter
      end
    end
  end

  def show; end

  def create
    Repository.languages.keys.sample(5).each do |language|
      RepositoriesJob.perform_later language
    end
  end

  private

  def filter_params
    params.permit :sort, :order, :offset, :limit, :language, :name
  end

  def set_repository
    @repository = Repository.find params[:id]
  end
end
