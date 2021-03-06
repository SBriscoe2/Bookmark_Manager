describe '.list_of_bookmarks' do
 it 'returns a list of bookmarks' do
   connection = PG.connect(dbname: 'bookmark_manager_test')

   # Add the test data
   bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
   Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
   Bookmark.create(url: "http://www.google.com", title: "Google")

   bookmarks = Bookmark.list_of_bookmarks

   expect(bookmarks.length).to eq 3
   # expect(bookmarks.first).to be_a Bookmark
   # expect(bookmarks.first.id).to eq bookmark.first['id']
   # expect(bookmarks.first.title).to eq 'Makers Academy'
   # expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
  end
end

# describe '.create' do
#   it 'creates a new bookmark' do
#     bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark').first
#
#     expect(bookmark['url']).to eq 'http://www.testbookmark.com'
#     expect(bookmark['title']).to eq 'Test Bookmark'
#   end
# end

describe '.create' do
  it 'does not create a new bookmark if the URL is not valid' do
    Bookmark.create(url: 'not a real bookmark', title: 'not a real bookmark')
    expect(Bookmark.list_of_bookmarks).not_to include 'not a real bookmark'
  end
end
