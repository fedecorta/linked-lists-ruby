class LinkedList

    attr_reader :head

    def initialize
        @head = nil
    end

    def append(value)
        if @head.nil?
            @head = Node.new(value) 
        else
            current_node = @head
            until current_node.next_node.nil?
                current_node = current_node.next_node
            end
            current_node.next_node = Node.new(value)
        end
    end

    def prepend(value)
        if @head.nil?
            @head = Node.new(value) 
        else
            new_node = Node.new(value)
            new_node.next_node = @head
            @head = new_node
        end
    end

    def size
        counter = 0
        current_node = @head
        until current_node.nil?
            counter += 1
            current_node = current_node.next_node
        end
        counter
    end

    def tail
        current_node = @head
        if current_node.nil?
            return current_node
        else
            until current_node.next_node.nil?
                current_node = current_node.next_node
            end
        end
        current_node
    end

    def at(index)
        counter = 0
        current_node = @head
        until current_node.nil?
            return current_node if counter == index
            current_node = current_node.next_node
            counter += 1
        end
        nil
    end

    def pop
        return nil if @head.nil?

        if @head.next_node.nil?
            popped_node = @head
            @head = nil
            return popped_node
        end

        current_node = @head
        until current_node.next_node.next_node.nil?
            current_node = current_node.next_node
        end
        popped_node = current_node.next_node
        current_node.next_node = nil  
        popped node
    end

    def contains?(value)
        return false if @head.nil?
        current_node = @head
        until current_node.nil?
            if current_node.value == value
                return true
            else
                current_node = current_node.next_node
            end
        end
        false
    end

    def find(value)
        return nil if @head.nil?
        current_node = @head
        index = 0
        until current_node.nil?
            return index if current_node.value == value
            current_node = current_node.next_node
            index += 1
        end
        nil
    end

    def to_s
        current_node = @head
        until current_node.nil?
            print "(#{current_node.value}) -> "
            current_node = current_node.next_node
        end
        print "nil"
    end

    def insert_at(value, index)
        new_node = Node.new(value)

        if index == 0
            new_node.next_node = @head
            @head = new_node
            return
        end

        current_node = @head
        counter = 0

        until current_node.nil?
            if counter + 1 == index
                new_node.next_node = current_node.next_node
                current_node.next_node = new_node
                return 
            else
                current_node = current_node.next_node
                counter += 1
            end
        end
        nil
    end

    def remove_at(index)
        return nil if @head.nil?
        if  index == 0
            @head = @head.next_node
            return
        end

        current_node = @head
        counter = 0

        until current_node.nil? || current_node.next_node.nil?
            if counter + 1 == index
                current_node.next_node = current_node.next_node.next_node
                return
            else
                current_node = current_node.next_node
                counter += 1
            end
        end
        nil
    end

        
end

class Node
    attr_accessor :value, :next_node

    def initialize(value=nil, next_node=nil)
        @value = value
        @next_node = next_node
    end
end


list = LinkedList.new
list.append(1)
list.append(2)
list.append(3)

puts list.to_s