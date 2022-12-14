require_relative './label'
require 'json'

module LabelsJson
  def load_labels
    data = []
    file = "#{PATH_TO_JSON}labels.json"

    if File.exist?(file) && File.read(file) != ''
      json_array = JSON.parse(File.read(file))
      json_array.each do |label|
        label = JSON.parse(label)
        data.push(Label.new(label['title'], label['color'], label['id']))
      end
    end

    data
  end
end
