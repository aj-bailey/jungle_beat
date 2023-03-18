require "./lib/jungle_beat"
require "./lib/linked_list"
require "./lib/node"

RSpec.describe JungleBeat do
  before(:each) do
    @jb = JungleBeat.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@jb).to be_a(JungleBeat)
    end

    it 'has readable attributes' do
      expect(@jb.list).to be_a(LinkedList)
    end
  end

  describe '#append' do
    it 'can append a single beat node' do
      @jb.append("deep")

      expect(@jb.list.head.data).to eq("deep")
    end

    it 'can append multiple beat nodes' do
      @jb.append("deep doo ditt")

      expect(@jb.list.head.data).to eq("deep")
      expect(@jb.list.head.next_node.data).to eq("doo")
      expect(@jb.list.head.next_node.next_node.data).to eq("ditt")

      @jb.append("woo hoo shu")
      fourth_node = @jb.list.head.next_node.next_node.next_node

      expect(fourth_node.data).to eq("woo")
      expect(fourth_node.next_node.data).to eq("hoo")
      expect(fourth_node.next_node.next_node.data).to eq("shu")
    end
  end
end