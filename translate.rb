# Imports the Google Cloud client library
require "google/cloud/translate"
require 'pry-byebug'
begin
  # Instantiates a client
  translate = Google::Cloud::Translate.new(
      project: "absolute-range-177915",
      keyfile: "./access_key.json")

  puts "Supported languages:"
  translate.languages.each do |language|
    puts "#{language.code} #{language.name}"
  end

  detections = translate.detect "chien", "chat", "bol", "hola"
  detections.each do |d|
    STDOUT.write "#{d.text} | "
    STDOUT.write "#{d.language} | "
    translated = translate.translate d.text, to: 'en' #translate the word to english
    STDOUT.write "#{translated} | "
    STDOUT.write "#{d.confidence} | \n"
  end

rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
end
