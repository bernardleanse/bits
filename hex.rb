class String
  def to_dec
    self.to_i(16)
  end
end

def hex_to_rgb(str)
  result = Hash.new
  result[:r] = str[1,2].to_dec
  result[:g] = str[3,2].to_dec
  result[:b] = str[5,2].to_dec
  return result
end

print hex_to_rgb("#FFFFFF") #---> {r: 255, g: 255, b:255}
