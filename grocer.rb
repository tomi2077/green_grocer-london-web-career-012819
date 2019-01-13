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
  cart.each 
end

{
  "AVOCADO" => {:price => 3.0, :clearance => true, :count => 3},
  "KALE"    => {:price => 3.0, :clearance => false, :count => 1}
}
```
and a coupon for avocados that looks like this:

```ruby
{:item => "AVOCADO", :num => 2, :cost => 5.0}

```

then `apply_coupons` should return the following hash:

```ruby
{
  "AVOCADO" => {:price => 3.0, :clearance => true, :count => 1},
  "KALE"    => {:price => 3.0, :clearance => false, :count => 1},
  "AVOCADO W/COUPON" => {:price => 5.0, :clearance => true, :count => 1},
}
```

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end


