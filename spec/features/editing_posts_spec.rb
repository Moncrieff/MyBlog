require "rails_helper"

RSpec.feature "Users can edit existing posts" do
  scenario "with valid attributes" do
    FactoryGirl.create(:post, header: "Запись для изменения")

    visit "/"
    click_link "Запись для изменения"
    click_link "Редактировать"
    fill_in "Тема", with: "Изменённая запись"
    click_button "Опубликовать"

    expect(page).to have_content "Запись была успешно изменена."
    expect(page).to have_content "Изменённая запись"
  end
end
