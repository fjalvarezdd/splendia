<?php
class Customer extends Model {

	// table name
	private $table_customers = 'customers';

	function Customer() {
		parent::Model();
	}

	// get customer by id
	function getByID($id) {
		$this -> db -> where('cs_id', $id);
		return $this -> db -> get($this -> table_customers);
	}

	// add new customer
	function save($userId, $password, $address, $ccn) {
		$this -> db -> insert($userId, $password, $address, $ccn);
		return $this -> db -> insert_id();
	}

	// update customer by id. Just update the password
	function update($id, $password) {
		$this -> db -> where('cs_id', $id);
		$this -> db -> update($this -> table_customers, $password);
	}

	// delete customer by id
	function delete($id) {
		$this -> db -> where('cs_id', $id);
		$this -> db -> delete($this -> table_customers);
	}

}
