class RepositoriesController < ApplicationController
  before_action :set_repository, only: %i[show]

  def index
    @repositories = Repository.all
  end

  def show; end

  def create
    @repository = Repository.new(repository_params)

    respond_to do |format|
      if @repository.save
        format.html { redirect_to repository_url(@repository), notice: 'Repository was successfully created.' }
        format.json { render :show, status: :created, location: @repository }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @repository.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_repository
    @repository = Repository.find(params[:id])
  end

  def repository_params
    params.require(:repository).permit(:name, :full_name, :description, :external_id, metadata: {})
  end
end
