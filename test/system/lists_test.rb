require "application_system_test_case"

class ListsTest < ApplicationSystemTestCase
  test "lets a signed in user create a new list and items" do
    login_as users(:anthony)
    visit new_list_path

    fill_in "list_name", with: "saturday shopping"
    click_on 'Create'

    assert_equal lists_path, page.current_path
    assert_selector ".list-name", text: "Saturday Shopping"

    save_and_open_screenshot

    click_on 'Saturday Shopping'

    click_on 'Add Item'
    fill_in "item_name", with: "bread"
    fill_in "item_note", with: "gluten free"
    fill_in "item_quantity", with: 3
    click_on 'Create'

    assert_selector "h4", text: "Bread"

    save_and_open_screenshot

  end
end
