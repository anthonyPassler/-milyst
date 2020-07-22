json.extract! @list, :id, :name
json.items @list.items do |item|
  json.extract! item, :id, :name, :note, :quantity, :complete
end
