GridHash = {"A1k" => 0, "A2k" => 1, "A3k" => 0, "A4l" => 0, "A5l" => 0, "A6l" => 0, "A7m" => 8, "A8m" => 4, "A9m" => 0,
            "B1k" => 0, "B2k" => 7, "B3k" => 5, "B4l" => 0, "B5l" => 2, "B6l" => 6, "B7m" => 1, "B8m" => 0, "B9m" => 3,
            "C1k" => 0, "C2k" => 0, "C3k" => 4, "C4l" => 0, "C5l" => 8, "C6l" => 9, "C7m" => 0, "C8m" => 0, "C9m" => 0,
            "D1n" => 0, "D2n" => 5, "D3n" => 0, "D4o" => 3, "D5o" => 0, "D6o" => 0, "D7p" => 7, "D8p" => 0, "D9p" => 0,
            "E1n" => 7, "E2n" => 0, "E3n" => 2, "E4o" => 0, "E5o" => 0, "E6o" => 0, "E7p" => 6, "E8p" => 0, "E9p" => 1,
            "F1n" => 0, "F2n" => 0, "F3n" => 1, "F4o" => 0, "F5o" => 0, "F6o" => 7, "F7p" => 0, "F8p" => 8, "F9p" => 0,
            "G1q" => 0, "G2q" => 0, "G3q" => 0, "G4r" => 9, "G5r" => 7, "G6r" => 0, "G7s" => 5, "G8s" => 0, "G9s" => 8,
            "H1q" => 9, "H2q" => 0, "H3q" => 7, "H4r" => 8, "H5r" => 4, "H6r" => 0, "H7s" => 3, "H8s" => 6, "H9s" => 0,
            "I1q" => 0, "I2q" => 2, "I3q" => 8, "I4r" => 0, "I5r" => 0, "I6r" => 0, "I7s" => 0, "I8s" => 0, "I9s" => 4}

def CheckRow(x,y)
  checknum = 1
  possibleNums = ""
  (1..9).each do |i|
      row =  GridHash.select {|key,value| key.include? x}
      row.delete_if {|k| k.include? (x+y) }
      checkbool = row.values.include? checknum
      if checkbool == false
          possibleNums += checknum.to_s
      end
      checknum += 1
  end
  return possibleNums
end

def CheckColumn(x,y)
  checknum = 1
  possibleNums = ""
  (1..9).each do |i|
      column =  GridHash.select {|key,value| key.include? y}
      column.delete_if {|k| k.include? (x+y) }
      checkbool = column.values.include? checknum
      if checkbool == false
        possibleNums += checknum.to_s
      end
      checknum += 1
  end
  return possibleNums
end

def CheckBox(x,y)
  checknum = 1
  possibleNums = ""
  boxID = GridHash.select{|k,v| k.include? x+y}.keys()
  boxID = boxID[-1]
    (1..9).each do |i|
        box = GridHash.select {|key,value| key.include? boxID[-1]}
        box.delete_if {|k| k.include? (x+y)}
        checkbool = box.values.include? checknum
        if checkbool == false
          possibleNums += checknum.to_s
        end
        checknum += 1
    end
  return possibleNums
end

def SetPossibleValues(x,y)
possibleNums = ""
numarray = [CheckRow(x,y),CheckColumn(x,y),CheckBox(x,y)]
    (1..9).each do |i|
        if numarray.all? {|nums| nums.include? i.to_s}
            possibleNums += i.to_s
        end
    end
puts possibleNums
updateBlock = GridHash.select{|k,v| k.include? (x+y)}.keys()
print updateBlock

puts GridHash

end


SetPossibleValues("A","1")
