class Author
  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  def initialize(first_name, last_name, id = Random.rand(0..1_000_000))
    @first_name = first_name
    @last_name = last_name
    @id = id
    @items = []
  end

  def add_item(item)
    item.author = self
    @items << item unless @items.include?(item)
  end

  def to_json(*args)
    {
      json.create_id => self.class.name,
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name,
      'items' => @items
    }.to_json(*args)
  end

  def self.json_create(object)
    obj = new(
      object['first_name'],
      object['last_name'],
      object['id']
    )
    obj.items = object['items']
    obj
  end
end
