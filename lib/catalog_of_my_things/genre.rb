class Genre
  attr_reader :items
  attr_accessor :id, :name

  def initialize(name, id = Random.rand(1..1_000_000))
    @name = name
    @id = id
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
