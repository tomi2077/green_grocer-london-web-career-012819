def consolidate_cart(cart)
  new_hash = {}
  cart.each do array
    array.each do |fruit, infos|
    new_hash[fruit] = infos
    new_hash[fruit][:count] = fruit.count
  end
  new_hash
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end


