require 'rails_helper'

RSpec.describe 'departments#index', type: :request do
  let!(:department1) { Department.create!(name: 'Safety') }
  let!(:department2) { Department.create!(name: 'Management') }

  it 'lists departments' do
    get '/api/departments'
    expect(response.status).to eq(200)
    expect(json_items.length).to eq(2)
    assert_payload(:department, department1, json_items[0])
    assert_payload(:department, department2, json_items[1])
  end
end
