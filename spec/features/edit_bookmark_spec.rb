feature 'edit bookmarks' do
  before(:each) {
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("TRUNCATE bookmarks;")
    connection.exec("INSERT INTO bookmarks(url, title) VALUES ('http://tomato-timer.com', 'tomato')")
  }
  scenario 'check tomato is included in list' do
    visit('/bookmarks')
    expect(page).to have_content('tomato')
  end
  scenario ' it allows a title to be selected and then edited' do
    visit('/bookmarks')
    click_button 'Edit_tomato'
    fill_in('url', with: 'http://testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    expect(page).to have_content("Test Bookmark")
  end
end
