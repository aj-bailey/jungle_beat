require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do
  context 'Iteration 1' do
    before(:each) do
      @list = LinkedList.new
    end

    describe '#initialize' do
      it 'exists' do
        expect(@list).to be_a(LinkedList)
      end

      it 'has readable attributes' do
        expect(@list.head).to eq(nil)
      end
    end

    context '#instance methods' do
      before(:each) do
        @list.append("doop")
      end

      describe '#append' do
        it 'adds head node to list if the list is empty' do
          expect(@list.head.data).to eq("doop")
          expect(@list.head).to be_a(Node)
        end
        
        it 'appended node should not have an initial next node' do
          expect(@list.head.next_node).to eq(nil)
        end

        it 'appends node to the tail node' do
          @list.append("deep")

          expect(@list.head.next_node.data).to eq("deep")
        end
      end

      describe '#count' do
        it 'returns the number of nodes in the list' do
          expect(@list.count).to eq(1)

          @list.append("deep")

          expect(@list.count).to eq(2)
          
          @list.append("derp")
          
          expect(@list.count).to eq(3)
        end
      end

      describe '#to_string' do
        it 'converts node data into string' do
          expect(@list.to_string).to eq("doop")
          
          @list.append("deep")
          
          expect(@list.to_string).to eq("doop deep")
          
          @list.append("derp")
          
          expect(@list.to_string).to eq("doop deep derp")
        end
      end
    end
  end
end