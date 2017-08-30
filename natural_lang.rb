# Imports the Google Cloud client library
require "google/cloud/language"
require 'pry-byebug'
begin
  # Instantiates a client
  language = Google::Cloud::Language.new(
      project: "absolute-range-177915",
      keyfile: "./access_key.json")

  texts = {
      :neutral => "The lines are long in walmart on Sunday's." ,
      :neutral_factual => "China and India has more than two billion in population." ,
      :positve => "I had a great time with my friends and family last weekend!" ,
      :sarcasm => "Oh! What a beauty! The life I have created for myself." ,
      :negative => "I had to wait for eight long fuc*** hours in the line with no water and the weather was hot and humid."
  }

  texts.each do |t|
    text = language.document t[1]
    sentiment = text.sentiment
    puts text.annotate
    STDOUT.write "#{t[0]} | "
    STDOUT.write "#{t[1]} | "
    STDOUT.write "#{sentiment.score} | "
    STDOUT.write "#{sentiment.magnitude}\n\n"
end
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
end
