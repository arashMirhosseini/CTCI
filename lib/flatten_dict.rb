def flatten_dictionary(dict)
  result = {}
  dict.each do |key, value|
    if !value.is_a?(Hash)
      result[key.to_s] = value
    else
      new_hash = flatten_dictionary(value)
      new_hash.each do |k, v|
        if k != ''
          new_key = key.to_s + '.' + k.to_s 
        else
          new_key = key
        end
        result[new_key] = v
      end
      
    end
  end
  result 
end
dict = {"Key1" => "1", 
        "Key2" => {"a" => "2", "b" => "3", 
                  "c" => {"d" => "3", "e" =>"1"}
                  }
}
# output: {
#             "Key1" : "1",
#             "Key2.a" : "2",
#             "Key2.b" : "3",
#             "Key2.c.d" : "3",
#             "Key2.c.e" : "1"
#         }

p flatten_dictionary(dict)
