class LinkedList
  attr_reader :head

  def initialize
    @head
  end

  def append(beat)
    unless @head
      @head = Node.new(beat)
      return @head
    end
    
    tail_node = @head
    
    while tail_node.next_node
      tail_node = tail_node.next_node
    end

    tail_node.append_node(Node.new(beat))
  end

  def count  
    current_node = @head
    counter = 0

    while current_node
      counter += 1
      current_node = current_node.next_node
    end

    counter
  end

  def to_string
    string = []
    current_node = @head
    
    while current_node
      string << current_node.data
      current_node = current_node.next_node
    end

    string.join(" ")
  end

  def prepend(beat)
    new_head = Node.new(beat)
    new_head.append_node(@head)
    @head = new_head
  end

  def insert(index, beat)
    if index == 0 
      prepend(beat)
      return
    end

    previous_node = @head

    (index - 1).times { previous_node = previous_node.next_node } 
    
    inserted_node = Node.new(beat)
    inserted_node.append_node(previous_node.next_node)

    previous_node.append_node(inserted_node)
  end
end