def urlify(str, real_len)
  space_at_end = str.length - real_len
  i = real_len - 1
  move_offset = space_at_end
  while i > 0
    if str[i] != ' '
      str[i + move_offset] = str[i]
    else
      str[i + move_offset] = '0'
      str[i + move_offset - 1] = '2'
      str[i + move_offset - 2] = '%'
      move_offset -= 2
    end

    i -= 1
  end
  str
end

def urlify1(str, true_len)
  space_at_end = str.length - true_len
  index = true_len + space_at_end
  i = true_len - 1
  while i > 0
    if str[i] != ' '
      str[index - 1] = str[i]
      index -= 1
    else
      str[index - 1] = '0'
      str[index - 2] = '2'
      str[index - 3] = '%'
      index -= 3
    end
    i -= 1
  end
  
  str
end

p urlify1('mr john smith    ', 13)