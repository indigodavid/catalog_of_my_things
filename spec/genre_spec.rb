require_relative '../lib/catalog_of_my_things/music_album'
require_relative '../lib/catalog_of_my_things/genre'
# require_relative '../genre'

describe Genre do
  album = Genre.new('Life')
  item = MusicAlbum.new('2022-08-07', true)

  it 'expect album to be instance of Genre' do
    expect(album).to be_instance_of Genre
  end

  it 'expect add_items to add item in items array' do
    album.add_item(item)

    expect(album.items.length).to eq(1)
  end

  it 'expect item genre to be equal album' do
    expect(item.genre).to eq(album)
  end

  it 'expect add_items to add item in items array' do
    item2 = Item.new('2000-12-12', true)
    album.add_item(item2)

    expect(album.items.length).to eq(2)
  end
end
