require "./lib/node"

RSpec.describe Node do
  context "Iteration 1" do
    before(:each) do 
      @node = Node.new("plop")
    end

    describe '#initialize' do
      it 'exists' do
        expect(@node).to be_a(Node)
      end

      it 'has readable attributes' do
        expect(@node.data).to eq("plop")
        expect(@node.next_node).to eq(nil)
      end
    end

    describe '#append_node' do
      it 'adds node to next node' do
        @node.append_node(Node.new('deep'))

        expect(@node.next_node).to be_a(Node)
        expect(@node.next_node.data).to eq('deep')
      end
    end
  end
end