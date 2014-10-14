require 'json'

langs = JSON.parse(File.read("languages_orig.json"))
            .select  {|lang| lang.has_key?('iso_639_2b') && lang['type'] == "living"}
            .collect {|lang| {lang['iso_639_2b'] => lang['name']} }
            .inject(:merge)

File.open('languages.json', 'w') { |f| f.write(langs.to_json) }