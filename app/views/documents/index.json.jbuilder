json.array!(@documents) do |document|
  json.extract! document, :id, :documentId, :title, :description, :fileLocation
  json.url document_url(document, format: :json)
end
