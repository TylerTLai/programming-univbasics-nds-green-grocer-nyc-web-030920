def find_item_by_name_in_collection(name, collection)
  
  counter = 0
  
  while counter < collection.length do

    if collection[counter][:item] == name 
      
      return collection[counter]
    
    end 

    counter += 1
  end
  
end


def consolidate_cart(cart)
  new_cart = []
  counter = 0

  while counter < cart.length do
    
    new_item = find_item_by_name_in_collection(cart[counter][:item], new_cart)
    
    if new_item != nil
      
      new_item[:count] +=1

    else 
      
      new_item = {
        :item => cart[counter][:item],
        :price => cart[i][:price],
        :clearance => cart[i][:clearance],
        :count => 1
      }
      
      new_cart << new_item

    end
  
    i += 1
  end
  
  new_cart

end

def apply_coupons(cart, coupons)
  
  i = 0
  
  while i < coupons.length do
    
    cart_item = find_item_by_name_in_collection(coupons[i][:item], cart)
    couponed_item_name = "#{coupons[i][:item]} W/COUPONS"
    cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)
    
    if cart_item && cart_item[:count] >= coupons[i][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[i][:num]
        cart_item[:count] -= coupons[i][:num]
      else
        cart_item_with_coupon = {
          :item => couponed_item_name,
          :price => coupons[i][:cost] / coupons[i][:num],
          :count => coupons[i][:num],
          :clearance => cart_item[:clearance]
        }
      cart << cart_item_with_coupon
      cart_item[:count] -= coupons[i][:num]
    end 
  end 
    i += 1 
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
