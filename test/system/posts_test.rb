require "application_system_test_case"
require 'sidekiq/testing'
Sidekiq::Testing.fake!

class PostsTest < ApplicationSystemTestCase
  test "visiting the home" do
    visit root_url
    save_and_open_screenshot

    assert_selector "p", text: "this is a post"
    assert_selector ".text-body", count: 2
    assert_selector "a", text: "Login"
  end

  test "lets a signed in user create a new post" do
    login_as users(:george)
    visit "/posts/new"

    click_on 'Create Post'

    fill_in "post_title", with: "The sky is blue"
    fill_in "post_content_raw", with: "** and violets are blue"

    click_on 'submit'
    save_and_open_screenshot

    assert_text "violets"
  end

  test "lets a user see his/her posts and its conversion status" do
    login_as users(:george)

    visit "/posts/new"

    click_on 'Create Post'

    fill_in "post_title", with: "The sky is blue"
    fill_in "post_content_raw", with: "** and violets are blue"

    click_on 'submit'

    visit "/posts"
    save_and_open_screenshot

    assert_selector "th", text: "Title"
    assert_selector "th", text: "Content"
    assert_selector "td", text: "violets"
    assert_selector "th", text: "Status"
    assert_selector "td", text: "Raw"
  end

end

