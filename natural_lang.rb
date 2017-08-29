# Imports the Google Cloud client library
require "google/cloud/language"
require 'pry-byebug'

# Instantiates a client
language = Google::Cloud::Language.new(
    project: "absolute-range-177915",
    keyfile: "./access_key.json")

texts = {
    :neutral => "There are huge lines at the walmart." ,
    :neutral_factual => "China and India has move than two billion in population." ,
    :positive => "What a beauty! The life I have created for myself." ,
    :negative => "I had to wait for eight long fuc*** hours in line with no water and hot and humid weather."
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
