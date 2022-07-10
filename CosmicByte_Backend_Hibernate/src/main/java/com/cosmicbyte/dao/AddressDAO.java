package com.cosmicbyte.dao;

import com.cosmicbyte.model.Address;

public interface AddressDAO {
	
	public boolean addAddress(Address address);
	public boolean updateAddress(Address address);
	public Address displayAddressById(int addressId);
}
