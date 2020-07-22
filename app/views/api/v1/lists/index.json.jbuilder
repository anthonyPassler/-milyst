json.array! @lists do |list|
  json.extract! list, :id, :name
end
