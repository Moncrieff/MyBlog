require "rails_helper"

RSpec.feature "Users can edit existing posts" do
  before do
    FactoryGirl.create(:post, header: "Запись для изменения")

    visit "/"
    click_link "Запись для изменения"
    click_link "Редактировать"
  end

  scenario "with valid attributes" do
    fill_in "Тема", with: "Изменённая запись"
    click_button "Опубликовать"

    expect(page).to have_content "Запись была успешно изменена."
    expect(page).to have_content "Изменённая запись"
  end

  scenario "when providing invalid attributes" do
    fill_in "Тема", with: ""
    click_button "Опубликовать"

    expect(page).to have_content "Запись не была изменена."
    expect(page).not_to have_content "Запись для изменения"
  end
end
