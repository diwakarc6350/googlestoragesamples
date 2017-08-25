require 'google/cloud/storage'
require 'pry-byebug'

begin
  storage = Google::Cloud::Storage.new(
      project: "absolute-range-177915",
      keyfile: "./access_key.json")
  binding.pry
  bucket = storage.create_bucket "my-bucket-007-177915"
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
end
