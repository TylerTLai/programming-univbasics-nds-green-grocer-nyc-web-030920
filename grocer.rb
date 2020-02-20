def find_item_by_name_in_collection(name, collection)
  
  i = 0
  
  while i < collection.length do

    if collection[i][:item] == name 
      
      return collection[i]
    
    end 

    i += 1
  end
  
end


def consolidate_cart(cart)
  new_cart = []
  i = 0

  while i < cart.length do
    
    new_item = find_item_by_name_in_collection(cart[i][:item], new_cart)
    
    if new_item != nil
      
      new_item[:count] +=1

    else 
      
      new_item = {
        :item => cart[i][:item],
        :price => cart[i][:price],
        :clearance => cart[i][:clearance],
        :count => 1
      }
      #add the new item to the new cart.
      new_cart << new_item

    end
  
    i += 1
  end
  
  #returns the new cart
  new_cart

end

def apply_coupons(cart, coupons)
  
  i = 0
  #loop through the cart.
  while i < cart.length do
    #compare cart item w/ coupons item.
    if cart[i][:item] == coupons[:item]
      #make a new coupon item
      item_name = "#{coupons[i][:item]} W/COUPON"
      new_coupon_item = {
        :item => item_name,
        :price => coupons[:cost] / coupons[:num],
        :clearance => cart[i][:clearance],
        :count => coupons[:num]
      }
      #udpate the original item
      cart[i][:count] = cart[i][:count] - new_coupon_item[:count]
      #add new_coupon_item to cart
      cart << new_coupon_item
      #return cart
      return pp cart
    end

    i += 1
  end

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
