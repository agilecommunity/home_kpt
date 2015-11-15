json.array!(@memos) do |memo|
  json.extract! memo, :id, :kind, :content
end
