class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(beats)
    beats.split.each { |beat| @list.append(beat) }
  end

  def count
    @list.count
  end

  def play
    beats = []

    current_node = @list.head

    while current_node
      beats << current_node.data
      current_node = current_node.next_node
    end

    `say -r 500 -v Boing #{beats.join(" ")}`
  end
end