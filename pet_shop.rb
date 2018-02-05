def pet_shop_name(pet_shop)
  pet_shop_name = pet_shop[:name]
  return pet_shop_name
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash_value)
    pet_shop[:admin][:total_cash] += cash_value
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number_of_pets_sold)
  return pet_shop[:admin][:pets_sold] += number_of_pets_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].count
end

def pets_by_breed(pet_shop, breed_to_find)
  breeds_found = []
  for breed in pet_shop[:pets]
      if (breed[:breed] == breed_to_find)
        breeds_found.push(breed)
      end
  end
  return breeds_found
end

def find_pet_by_name(pet_shop, pet_name_to_find)
  for pet_name in pet_shop[:pets]
      if (pet_name[:name] == pet_name_to_find)
        return pet_name
      end
  end
  return nil
end

def remove_pet_by_name(pet_shop, pet_to_remove)
  array_of_pets = pet_shop[:pets]
  pet_to_delete = find_pet_by_name(pet_shop, pet_to_remove)

  array_of_pets.delete(pet_to_delete)
end

def add_pet_to_stock(pet_shop, new_pet_to_add)
  array_of_pets = pet_shop[:pets]
  return array_of_pets.push(new_pet_to_add)
end

def customer_pet_count(customer_pets)
  return customer_pets[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  return customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  return customer[:cash] > new_pet[:price]
end

def sell_pet_to_customer(petshop, pet_to_add, customer)
  if pet_to_add != nil && customer_can_afford_pet(customer, pet_to_add)
    add_pet_to_customer(customer, pet_to_add)
    increase_pets_sold(petshop, 1)
    amount = pet_to_add[:price]
    add_or_remove_cash(petshop, amount)
  end
end
