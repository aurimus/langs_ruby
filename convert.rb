require 'json'

langs = JSON.parse(File.read("languages_orig.json"))                                    # Read and parse JSON file
            .select  {|lang| lang.has_key?('iso_639_2b') && lang['type'] == "living"}   # Select only hashes that meet criteria
            .collect {|lang| {lang['iso_639_2b'] => lang['name']} }                     # Collect needed values from hashes and make a new hash
            .inject(:merge)                                                             # Change array of hashes into single hash

File.open('languages.json', 'w') { |f| f.write(langs.to_json) }