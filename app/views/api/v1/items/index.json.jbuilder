json.array! @items do |item|
  json.extract! item, :id, :name, :note, :quantity, :complete
end
