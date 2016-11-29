FactoryGirl.define do
  factory :contract do
    customer
    delivery_address 'Rua Funchal'
    rental_period '10D'
    total_amount 100
    discount 10
    contact 'Moacir Otranto'
    number '123456789'
  end
end
