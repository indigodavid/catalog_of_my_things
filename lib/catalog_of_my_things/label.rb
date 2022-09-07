require 'json'

class Label
  attr_reader :items
  attr_accessor :title, :color, :id

  def initialize(title, color, id = nil)
    @id = id || Random.rand(1..1_000_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item_instance)
    @items.push(item_instance) unless @items.include?(item_instance)
    item_instance.label = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'color' => @color
    }.to_json(*args)
  end
end
