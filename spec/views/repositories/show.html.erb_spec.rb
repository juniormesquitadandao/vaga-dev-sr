require 'rails_helper'

RSpec.describe 'repositories/show', type: :view do
  before do
    @repository = assign(:repository, create(:repository))
  end

  it 'renders attributes in <p>' do
    render

    expect(rendered).to match(/Name/)
  end
end
