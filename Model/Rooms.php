<?php
class Rooms extends Model {

	// table name
	private $table_rooms = 'rooms';

	function Bookings() {
		parent::Model();
	}

	// get room by id
	function getByID($id) {
		$this -> db -> where('room_id', $id);
		return $this -> db -> get($this -> table_rooms);
	}

	// get booked rooms from a user
	function getAvailableRooms($criteria) {
		$this -> db -> where('checkin_date', $criteria['checkin_date']);
		$this -> db -> where('checkout_date', $criteria['checkout_date']);
		$this -> db -> where('location', $criteria['location']);
		return $this -> db -> get($this -> table_rooms);
	}

	// add new room 
	function save($roomName, $roomDescription, $roomImage, $roomFacilities, $roomPrice) {
		$this -> db -> insert($this -> table_rooms, $roomName, $roomDescription, $roomImage, $roomFacilities, $roomPrice);
		return $this -> db -> insert_id();
	}

	// update book by id. Just update the prices
	function update($id, $price) {
		$this -> db -> where('room_id', $id);
		$this -> db -> update($this -> table_rooms, $price);
	}

	// delete book by id
	function delete($id) {
		$this -> db -> where('room_id', $id);
		$this -> db -> delete($this -> table_rooms);
	}

}
