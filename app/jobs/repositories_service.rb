class RepositoriesService
  include ActiveModel::Model

  attr_accessor :language

  validates :language, presence: true

  def call
    call! if valid?
  end

  private

  def call!
    response = request

    if response.status == 200
      successful response.body
    else
      unsuccessful response.body
    end
  end

  def request
    Faraday.get url do |request|
      request.headers.merge!(
        Accept: 'application/vnd.github.v3+json',
        Authorization: "token #{ENV['GITHUB_PERSONAL_ACCESS_TOKEN']}"
      )
      request.params = params
    end
  end

  def url
    'https://api.github.com/search/repositories'
  end

  def params
    {
      sort: 'stars',
      order: 'desc',
      per_page: 1,
      q: "language:#{language}"
    }
  end

  def successful(body)
    result = JSON.parse(body)['items'].first

    Repository.create(
      language:,
      name: result['name'],
      full_name: result['full_name'],
      description: result['description'],
      external_id: result['id'],
      metadata: result
    )

    true
  end

  def unsuccessful(body)
    errors.add :base, body
    false
  end
end
