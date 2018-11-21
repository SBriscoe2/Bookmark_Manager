feature 'deleting bookmarks' do
  before(:each) {
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("TRUNCATE bookmarks;")
    connection.exec("INSERT INTO bookmarks(url, title) VALUES ('http://tomato-timer.com', 'tomato')")
  }
  scenario 'check tomato is included in list' do
    visit('/bookmarks')
    expect(page).to have_content('tomato')
  end
  scenario ' it allows a title to be selected and then deleted' do
    visit('/bookmarks')
    click_button 'Delete_tomato'
    expect(page).not_to have_content("tomato")
  end
end
