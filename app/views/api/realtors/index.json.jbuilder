json.set! :items do
  json.partial! 'api/realtors/realtor', collection: @realtors, as: :realtor
end

json.set! :meta do
  json.partial! 'api/shared/pagination'
end
