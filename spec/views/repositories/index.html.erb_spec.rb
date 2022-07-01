require 'rails_helper'

RSpec.describe 'repositories/index', type: :view do
  before do
    assign(:repositories, [create(:repository, name: 'Name 1', external_id: '1'), create(:repository, name: 'Name 2', external_id: '2')])
  end

  it 'renders a list of repositories' do
    render

    expect(rendered).to match(/Name 1/)
    expect(rendered).to match(/Name 2/)
  end
end
