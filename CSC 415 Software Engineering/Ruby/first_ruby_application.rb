
#This class contains all of the methods that will be used to perform set operations
class Set
  #This will read a csv file and store the info into a hash table
  def getSet(message)
    #message is used to display input first/second file
    puts message
    file = gets.chomp
    file = "#{file}.csv"
    file.to_s
    set = Hash.new
    file = File.open(file, "r+").each_line do |line|
      split = line.split()
      key = split[0]
      #checks to see if there is only one name or if there is a first and last name
      if split.length == 3
        value = split[1] + " " + split[2]
      else
        value = split[1]
      end
      set.store(key, value)
    end

    return set
  end

  #this method adds an element to the set
  def addElement(element, set)
    #A set and element are passed in and the function generates the key
    key = rand(10000000000)
    set.store(key, element)
    return set
  end

  #Finds the union of set1 and set2 and stores them into set3
  def findUnion(set1, set2)
    #clone() must be used otherwise set3 will point to the same memory address as set1. Modifying
    #set3 will result in set 1 being modified. Cloning one set makes the code more efficient
    set3 = set1.clone
    set2.each_value do |value|
      key = set2.key(value)
      set3.store(key, value)
    end


    return set3
  end

  #Finds the intersection of two sets and stores the output in a 3rd
  def findIntersection(set1, set2)
    set3 = Hash.new
    set1.each_value do |firstValue|
      set2.each_value do |secondValue|
        #Checks to make sure the values are the same and gets the key for that value
        if firstValue == secondValue
          key = set1.key(firstValue)
          set3.store(key, firstValue)

        end
      end
    end
    return set3
  end

  #Finds the cartesian product of the two sets
  def findCartesianProduct(set1, set2)
    #Finds the cartesian product of two sets and returns the output in a 3rd set
    set3 = Hash.new
    set1.each_value do |firstValue|
      set2.each_value do |secondValue|
        key = rand(10000000000)
        #For this hash table a new key is generated and the element is the cartesian product
        #of set1 and set2.  "#{firstValue}, #{secondValue}" is one element
        set3.store(key, "#{firstValue}, #{secondValue}")
      end
    end

    return set3
  end

  #Given a set, this method will print a set
  def printSet(set)
    #prints the set
    set.each_value do |value|
      key = set.key(value)
      puts "#{key}: #{value}"
    end
  end

  #Given a set, this method will chec to see if it is empty by checking the length against 0
  def isEmpty(set)
    #checks to see if the set is empty
    if set.length > 0
      return false
    else
      return true
    end
  end

  #Given a set, this method will chec to see if it is empty by checking the length against the max
  def isFull(set, max)
    #Checks to see if the set is full
   if set.length < max
    return false
   else
     return true
   end
  end
end

class Subscriber
  #Creating the first set and instantiating the other sets as hashes
  message = "Please insert the first file's name: "
  firstSet = Set.new.getSet(message)
  union = Hash.new
  intersection = Hash.new
  cartesian = Hash.new
  exit = false
  while(!exit)
    #Prompts the user for an input and then stores the input in value
    puts "\n\nPlease select a set operation:\n1) Add elements\n2) Union of two sets\n3) Intersection of two sets\n" +
             "4) Cartesian product of two sets\n5) Check if the set is empty\n6) Check if the set is full\n" +
             "7) Print the set\n-1) To quit\nEnter number: "
    value = Integer(gets.chomp)

    #checks the value against different cases and then performs the intended functions
    case value
      when 1
        puts "What Subscriber would you like to add?"
        element = gets.chomp.upcase
        firstSet = Set.new.addElement(element, firstSet)
        puts "\nFinished!\n"
      when 2
        message = "Please insert the second file's name: "
        secondSet = Set.new.getSet(message)
        union = Set.new.findUnion(firstSet, secondSet)
        puts "\nFinished!\n"
      when  3
        message = "Please insert the second file's name: "
        secondSet = Set.new.getSet(message)
        intersection = Set.new.findIntersection(firstSet, secondSet)
        puts "\nFinished!\n"
      when 4
        message = "Please insert the second file's name: "
        secondSet = Set.new.getSet(message)
        cartesian = Set.new.findCartesianProduct(firstSet, secondSet)
        puts "\nFinished!\n"
      when 5
        if Set.new.isEmpty(firstSet)
          puts "\n\nThe set is empty\n"
        else
          puts "\n\nThe set is not empty\n"
        end
      when 6
        if Set.new.isFull(firstSet, firstSet.length + 1)
          puts "\n\nThe set is full\n"
        else
          puts "\n\nThe set is not full\n"
        end
      when 7
        #Gives the user the ability to print whichever set they want to see (original, union, intersection or cartesian)
        puts "Select a set to print:\n1) The original set\n2) The union set\n3) The intersection set\n4)The cartesian set"
        printChoice = Integer(gets.chomp.to_i)
        printSet = Hash.new
        case printChoice
          when 1
            printSet = firstSet
          when 2
            printSet = union
          when 3
            printSet = intersection
          when 4
            printSet = cartesian
          else
          puts "Please enter an integer between 1-4"
          printChoice = gets.chomp
        end
        Set.new.printSet(printSet)
      when -1
        exit = true
        break
      else
        puts "Please enter an integer between 1-7 or -1 to quit"
        value = gets.chomp
    end
  end

  #Lets the user know that they are done with the program
  puts "Good bye!"
end
