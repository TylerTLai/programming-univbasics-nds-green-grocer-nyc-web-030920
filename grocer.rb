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
    
    if cart_item && cart_item[i] >= coupons[i][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[i][:num]
        cart_item[:count] -= coupons[i][:num]
      else
        cart_item_with_coupon = {
          :item => couponed_item_name,
          
        }
    
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
