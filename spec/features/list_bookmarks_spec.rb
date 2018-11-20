feature 'view list of bookmarks' do
  scenario 'expect a list of bookmarks to be display' do
    visit '/bookmark'
    expect(page).to have_content "http://www.makersacademy.com"
  end
end
