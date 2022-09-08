require 'json'

class Genre
  attr_reader :items
  attr_accessor :id, :name

  def initialize(name, id = Random.rand(1..1_000_000))
    @name = name
    @id = id
    @items = []
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'name' => name,
      'id' => id
    }.to_json(*args)
  end

  def self.json_create(object)
    obj1 = new(object['name'], object['id'])
    obj1.items = object['items']
    obj1
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.genre = self
  end
end
