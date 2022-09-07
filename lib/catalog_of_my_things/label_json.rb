require_relative './label'

module LabelsJson
  def save_labels(labels)
    data = labels.map do |label|
      {
        id: label.id
        title: label.title,
        color: label.color
      }
    end

    File.write('./lib/catalog_of_my_things/labels.json', JSON.pretty_generate(data))
  end

  def retrieve_labels
    data = []
    file = './lib/catalog_of_my_things/labels.json'

    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |label|
        data.push(Label.new(label['title'], label['color'], label['id']))
      end
    end

    data
  end
end