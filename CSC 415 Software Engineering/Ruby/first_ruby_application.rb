class Methods

  def addElement(element, set)
    #will add an element to the set
    rng = rand(10000000000)
    set.store(rng, element)
    return set
  end

  def findUnion(set1, set2)
    #Finds the union of two sets and returns the output in a 3rd set
    set3 = Hash.new
    length1 = set1.length
    length2 = set2.length
    set1.each_value do

    end
    return set3
  end

  def findIntersection(set1, set2)
    #Finds the intersection of two sets and stores the output in a 3rd
    set3 = Has.new
    length1 = set1.length
    length2 = set2.length
    for i in 0..length1
      for j in i..length2
        if()
          #looks for the intersection of the two sets

        end
      end
    end
    return set3
  end

  def findCartesianProduct(set1, set2)
    #Finds the cartesian product of two sets and returns the output in a 3rd set
    set3 = Hash.new
    length1 = set1.length
    length2 = set2.length
    for i in 0..length1
      #will loop through each set and find the cartesian product
    end
    return set3
  end

  def printSet(set)
    #prints the set
    set.each_value{|value| puts value}
  end

  def isEmpty(set)
    #checks to see if the set is empty
    return bool
  end

  def isFull(set)
    #Checks to see if the set is full
    return bool
  end
end

class FirstRubyApplication

  #Gets a file from a user and stores the contents into a Hash map
  print "Input a file name: "
  name = gets.chomp
  name = "#{name}.CSV"
  name.to_s
  set = Hash.new
  file = File.open(name, "r+").each_line do |line|
    split = line.split()
    key = split[0]
    value = split[1] + " " + split[2]
    set.store(key, value)

  end

  set = Methods.new.addElement('BRENDAN BEHRENS', set)
  Methods.new.printSet(set)
  file.close
end
