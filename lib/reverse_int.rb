def reverse(x)
  st = x.to_s
  res_s = st.reverse
  res = res_s.to_i
  if res_s[-1] == '-'
    res = res * (-1)
  end
  return 0 if res < (-2).pow(31) || res > (2).pow(31)-1
  return res
end

p reverse(-123)