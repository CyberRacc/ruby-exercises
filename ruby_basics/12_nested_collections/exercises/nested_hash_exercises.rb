def find_language_information(languages, language_name)
  # Take languages (a nested hash) and language_name as a symbol, return the
  # value for the language_name key (which will be another hash!)

  # the languages hash will look something like this:
  # {
  #   ruby: { initial_release: 'December 25, 1996', is_beautiful?: true },
  #   javascript: { initial_release: 'December 4, 1995', is_beautiful?: false }
  # }
  languages[language_name]
end

def add_information_about_language(languages, language_name, info_key, info_value)
  # Take languages and add the key/value pair info_key/info_value to the nested
  # hash of language_name, then return the updated languages hash
  languages[language_name][info_key] = info_value
  languages
end

def add_language(languages, language_name, language_info_value)
  # Take languages and add the key/value pair language_name/language_info_value
  # to it, then return languages
  languages[language_name] = language_info_value
  languages
end

def delete_information_about_language(languages, language_name, info_key)
  # Take languages and delete the key/value pair with key info_key from
  # language_name, then return languages
  languages[language_name].delete(info_key)
  languages
end

def delete_language(languages, language_name)
  # Take languages and delete the language_name key/value pair, then return
  # languages
  languages.delete(language_name)
  languages
end

def find_beautiful_languages(languages)
  # Take languages and return a hash containing only languages which have the
  # key/value pair { is_beautiful?: true } listed in their information
  languages.select { |language_name, language_name_hash | language_name_hash[:is_beautiful?] == true }
end

# def find_language_facts(languages, language_name, fact_index = 0)
#   # Take languages (now with additional facts added to each language with the
#   # key :facts and value of an array of strings) and return the fact
#   # language_name has at fact_index of its facts array, or at index 0 if this
#   # argument is not given

#   # the revised languages hash will look something like this:
#   # {
#   #   ruby: { facts: ['fact 0', 'fact 1'],
#   #           initial_release: 'December 25, 1996',
#   #           is_beautiful?: true },

#   #   javascript: { facts: ['fact 0', 'fact 1'],
#   #                 initial_release: 'December 4, 1995',
#   #                 is_beautiful?: false }
#   # }
#   languages.dig(language_name, :facts, fact_index)
# end

def find_language_facts(languages, language_name, fact_index = 0)
  # The method takes three parameters:
  # 1. languages: A hash where keys are symbols representing programming languages,
  #    and values are hashes containing information about those languages, including
  #    a :facts key with an array of facts.
  # 2. language_name: A symbol indicating the specific programming language we're interested
  #    in retrieving a fact for.
  # 3. fact_index: An optional parameter that defaults to 0. It specifies the index
  #    of the fact within the :facts array that we want to retrieve.

  # Use the dig method on the languages hash with three arguments:
  # 1. language_name: The variable holding the key for the specific language's hash we want to access.
  #    Unlike symbols, using a variable directly allows us to dynamically choose which part of the hash
  #    to dig into based on the method's input.
  # 2. :facts: A symbol that represents the key within the language's hash that points to the array of facts.
  # 3. fact_index: The index within the :facts array that we want to retrieve. Because it defaults to 0,
  #    if no specific index is provided, it will automatically return the first fact.
  # The dig method navigates through the nested hash structure. It first finds the hash corresponding
  # to the given language_name, then accesses the array of facts under the :facts key, and finally
  # retrieves the element at the specified fact_index. If any of these keys don't exist or the path
  # leads to nil at any point, dig will return nil, making it a safe way to navigate nested hashes.
  languages.dig(language_name, :facts, fact_index)
end
