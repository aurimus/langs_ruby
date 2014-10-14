langs_ruby
==========

Using ruby for taking care of small json file operations.

The languages.json is a custom made file which contains languages in format of a single object literal (in JS Object Notation) from languages_orig.json that are living and have iso_639_2 standard defined.

cd to dir and type `ruby convert.rb`

OR

Cd to the directory and type `irb` to open ruby console

Two liner:
```
require 'json'

File.open('languages.json', 'w') { |f| f.write(JSON.parse(File.read("languages_orig.json")).select { |lang| lang.has_key?('iso_639_2b') && lang['type'] == "living"}.collect {|l| {l['iso_639_2b'] => l['name']} }.reduce(Hash.new, :merge).to_json)}
```
