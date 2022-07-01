FactoryBot.define do
  factory :repository do
    transient do
      response { JSON.load_file(Rails.root.join('spec', 'support', 'api.github.com', 'repositories.json')) }
    end
    name { response.first['name'] }
    full_name { response.first['full_name'] }
    description { response.first['description'] }
    external_id { response.first['id'] }
    metadata { response.first }
  end
end
