require 'order'

describe Order do
  let(:time_klass){ double(:time_klass, new: 0) }
  subject(:order) { Order.new(time_klass) }

  let(:quantity){ 3 }
  let(:price) { 1 }
  let(:total) { quantity * price }
  let(:name) { 'Food' }
  let(:dish){ double(:dish, name: name, price: price)}
  let(:receipt){ "Your order has been placed and will be delivered at 3600:" \
    " #{name} x#{quantity} = #{pound_str(price * quantity)}. Total: " \
    "#{pound_str(total)}" }

  context '#initialize' do
    it 'sets @list to an empty array' do
      expect(order.list).to be_empty
    end
  end

  context '#add' do
    it 'adds the dish and quantity to @list' do
      order.add(dish, quantity)
      expect(order.list).to eq [{ dish: dish, quantity: quantity }]
    end
  end

  context '#total' do
    it 'returns the total value of @list' do
      2.times { order.add(dish, quantity) }
      expect(order.total).to eq(2 * quantity * price)
    end
  end

  context '#receipt' do
    it 'returns a formatted order receipt' do
      order.add(dish, quantity)
      expect(order.receipt).to eq receipt
    end
  end

end
