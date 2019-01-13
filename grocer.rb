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
  coupons.each do |information|
    fruit_name = information[:item]
    new_coupon_hash = {
      :price => information[:cost],
      :clearance => "true",
      :count => information[:num]
    }
    
     if cart.key?(fruit_name)
      new_coupon_hash[:clearance] = cart[fruit_name][:clearance]
      if cart[fruit_name][:count]>= new_coupon_hash[:count]
        new_coupon_hash[:count] = (cart[fruit_name][:count]/new_coupon_hash[:count]).floor
        cart[fruit_name][:count] = (information[:num])%(cart[fruit_name][:count])
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
  cost = 0.00
  cart.each do |item|
    item.each do |name, attribute|
      unless coupons.nil?
        coupons.each do |coupon|
          if name == coupon[:item] && attribute[:count] >= coupon[:num]
            cost += coupon[:cost] * (attribute[:count]/coupon[:num])
            attribute[:count] = attribute[:count] % coupon[:num]
          end
        end
      end
      if attribute[:clearance]
        cost += (attribute[:price] * attribute[:count]) * 0.8
      else
        cost += attribute[:price] * attribute[:count]
      end
    end
  end

  over_5 = false

  cart.each do |item|
    item.each do |name, attribute| 
      over_5 = true if attribute[:price] > 5
    end
  end

  cost -= 10 unless over_5 || cost <= 10
  
  cost
end


