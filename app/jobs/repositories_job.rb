class RepositoriesJob < ApplicationJob
  queue_as :default

  def perform
    RepositoriesService.new.call
  end
end
