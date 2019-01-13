def consolidate_cart(cart)
  new_hash = {}
  count = 0
  cart.each do |array|
    array.each do |fruit, infos|
      new_hash[fruit] = infos
      new_hash[fruit][:count] ||= 0
      new_hash[fruit][:count] += 1
    end
  end
  new_hash
end

def apply_coupons(cart, coupons)
  coupons.each do |information|    #coupon_hash
    fruit_name = coupon_hash[:item]
    new_coupon_hash = {
      :price => coupon_hash[:cost],
      :clearance => "true",
      :count => coupon_hash[:num]
    }
    
     if cart.key?(fruit_name)
      new_coupon_hash[:clearance] = cart[fruit_name][:clearance]
      if cart[fruit_name][:count]>= new_coupon_hash[:count]
        new_coupon_hash[:count] = (cart[fruit_name][:count]/new_coupon_hash[:count]).floor
        cart[fruit_name][:count] = (coupon_hash[:num])%(cart[fruit_name][:count])
      end
      cart[fruit_name + " W/COUPON"] = new_coupon_hash 
    end
    end
  return cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end


