require "rails_helper"

RSpec.feature "Users can create blog posts" do
  scenario "with valid attributes" do
    visit "/"

    click_link "Новая запись"
    fill_in "Тема", with: "Новый пост"
    fill_in "Время чтения", with: "5 минут"
    fill_in "Краткое содержание", with: "Очень коротко о том, что тут будет."
    fill_in "Текст", with: "Новый пост, в котором рассказывается о том, как создать новый пост."
    click_button "Опубликовать"

    expect(page).to have_content "Новая запись успешно опубликована."
    expect(page).to have_content "Новый пост"
  end
end
