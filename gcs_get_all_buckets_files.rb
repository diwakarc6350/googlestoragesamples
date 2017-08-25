require 'google/cloud/storage'
require 'pry-byebug'

begin
  storage = Google::Cloud::Storage.new(
      project: "absolute-range-177915",
      keyfile: "./access_key.json")
  #binding.pry
  buckets = storage.buckets
  buckets.all do |bucket|
    puts "Bucket : #{bucket.name}"
    bucket.files.all do |f|
      puts "\tFile: #{f.name}"
    end
  end
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
end
