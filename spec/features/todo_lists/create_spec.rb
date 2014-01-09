require 'spec_helper'

describe "Creating todo lists"  do
	it "redirects to the todo lists page on success" do
		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")


		fill_in "Title", with: "My todo list"
		fill_in "Description", with: "This is my todo list"
		click_button "Create Todo list"

		expect(page).to have_content("My todo list")
	end
	it "displays an error when no title" do
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")


		fill_in "Title", with: ""
		fill_in "Description", with: "This is my todo list"
		click_button "Create Todo list"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("This is my todo list")

	end
end