require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do
  before(:each) do
    @list = LinkedList.new
  end

  context 'Iteration 1' do
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

  context 'Iteration 2' do
    before(:each) do
        @list.append("plop")
        @list.append("suu")
    end

    describe '#prepend' do
      it 'adds new node to head' do
        expect(@list.to_string).to eq("plop suu")

        @list.prepend("dop")

        expect(@list.to_string).to eq("dop plop suu")
      end
    end

    describe '#insert' do
      it 'inserts new beat into specified index of list' do
        @list.prepend("dop")

        expect(@list.to_string).to eq("dop plop suu")
        
        @list.insert(1, "woo")

        expect(@list.to_string).to eq("dop woo plop suu")
        
        @list.insert(0, "yo")

        expect(@list.to_string).to eq("yo dop woo plop suu")
      end
    end
    context "find and includes? methods" do
      before(:each) do
        @list = LinkedList.new
  
        @list.append("deep")
        @list.append("woo")
        @list.append("shi")
        @list.append("shu")
        @list.append("blop")
      end

      describe '#find' do
        it 'finds the beat at a specific index' do
          expect(@list.find(2,1)).to eq("shi")
        end

        it 'finds the beat at the specified index plus additional nodes' do
          expect(@list.find(1,3)).to eq("woo shi shu")
        end
      end

      describe '#includes?' do
        it 'returns true if linked list includes specific data' do
          expect(@list.includes?("deep")).to eq(true)
        end
        
        it 'returns false if linked list does not include specific data' do
          expect(@list.includes?("dep")).to eq(false)
        end
      end
    end
  end
end