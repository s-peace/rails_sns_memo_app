require 'rails_helper'

describe 'Hello, world', type: :system do
  it 'shoud show tasks' do
    Task.create!(name: 'hello')
    Task.create!(name: 'world')

    visit root_path

    expect(page).to have_content 'hello'
    expect(page).to have_content 'world'
  end
end