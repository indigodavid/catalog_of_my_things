class Label
  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(title, color, id = nil)
    @id = "label#{Random.rand(1..1_000_000)}"
    @title = title
    @color = color
    @items = []
  end

  def add_item(item_instance)
    @items.push(item_instance)
    item_instance.label = self
  end
end