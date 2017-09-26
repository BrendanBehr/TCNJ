class Set

  def addElement(element, set)
    #will add an element to the set
    rng = rand(10000000000)
    set.store(rng, element)
    return set
  end

  def findUnion(set1, set2)
    #Finds the union of two sets and returns the output in a 3rd set
    set3 = set1.clone
    set2.each_value do |value|
      key = set2.key(value)
      set3.store(key, value)
    end


    return set3
  end

  def findIntersection(set1, set2)
    #Finds the intersection of two sets and stores the output in a 3rd
    set3 = Hash.new
    set1.each_value do |firstValue|
      set2.each_value do |secondValue|
        if firstValue == secondValue
          key = set1.key(firstValue)
          set3.store(key, firstValue)

        end
      end
    end
    return set3
  end

  def findCartesianProduct(set1, set2)
    #Finds the cartesian product of two sets and returns the output in a 3rd set
    set3 = Object.new
    set1.each_value do |firstValue|
      puts firstValue
      set2.each_value do |secondValue|
        puts secondValue
        set3.class.module_eval(attr_accessor: firstValue)
        set3.firstValue = secondValue
        
      end
      end

    return set3
  end

  def printSet(set)
    #prints the set
    set.each_value do |value|
      key = set.key(value)
      puts "#{key}: #{value}"
    end
  end

  def isEmpty(set)
    #checks to see if the set is empty
    if set.length > 0
      return false
    else
      return true
    end
  end

  def isFull(set)
    #Checks to see if the set is full
   if set.length > 0
    return false
   else
     return true
   end
  end
end

class FirstRubyApplication

  #Gets two files from a user and stores the contents into a Hash map
  print "Please insert the first file's name: "
  firstFile = gets.chomp
  firstFile = "#{firstFile}.CSV"
  firstFile.to_s
  firstSet = Hash.new
  file = File.open(firstFile, "r+").each_line do |line|
    split = line.split()
    key = split[0]
    value = split[1] + " " + split[2]
    firstSet.store(key, value)
  end
  print "Please insert the second file's name: "
  secondFile = gets.chomp
  secondFile = "#{secondFile}.CSV"
  secondFile.to_s
  secondSet = Hash.new
  file = File.open(secondFile, "r+").each_line do |line|
    split = line.split()
    key = split[0]
    value = split[1] + " " + split[2]
    secondSet.store(key, value)
  end

  puts "\n\nAdd elements\n"
  firstSet = Set.new.addElement('BRENDAN BEHRENS', firstSet)
  Set.new.printSet(firstSet)

  puts "\n\nUnion of two sets\n"
  union = Hash.new
  union = Set.new.findUnion(firstSet, secondSet)
  Set.new.printSet(union)

  puts "\n\nIntersection of two sets\n"
  intersection = Hash.new
  intersection = Set.new.findIntersection(firstSet, secondSet)
  Set.new.printSet(intersection)

  puts "\n\nCartesian product of two sets\n"
  cartesian = Hash.new
  cartesian = Set.new.findCartesianProduct(firstSet, secondSet)
  Set.new.printSet(cartesian)

  if Set.new.isEmpty(firstSet)
    puts "\n\nThe set is empty\n"
  else
    puts "\n\nThe set is not empty\n"
  end


  if Set.new.isFull(firstSet)
    puts "\n\nThe set is full\n"
  else
    puts "\n\nThe set is not full\n"
  end
end
