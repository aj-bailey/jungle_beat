class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(beats)
    beats.split.each { |beat| @list.append(beat) }
  end
end