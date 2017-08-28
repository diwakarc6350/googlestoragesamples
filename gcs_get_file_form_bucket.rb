require 'google/cloud/storage'
require 'pry-byebug'

begin
  storage = Google::Cloud::Storage.new(
      project: "absolute-range-177915",
      keyfile: "./access_key.json")

  bucket = storage.bucket "1_testbucket"
  file = bucket.file "sample.dat"
  #binding.pry
  downloaded = file.download 'sample.txt' #download the file
  downloaded.rewind #read the data to a string
  puts downloaded.read
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
end
