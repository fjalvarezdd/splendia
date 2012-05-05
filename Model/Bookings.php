<?php
class Bookings extends Model {

	// table name
	private $table_bookings = 'bookings';

	function Bookings() {
		parent::Model();
	}

	// get book by id
	function getByID($id) {
		$this -> db -> where('bk_id', $id);
		return $this -> db -> get($this -> table_bookings);
	}

	// get booked rooms from a user
	function getBookedRooms($userId) {
		$this -> db -> where('user_id', $userId);
		return $this -> db -> get($this -> table_bookings);
	}

	// add new room book
	function save($roomId, $userId, $dates) {
		$this -> db -> insert($this -> table_bookings, $roomId, $userId, $dates);
		return $this -> db -> insert_id();
	}

	// update book by id. Just update the dates
	function update($id, $dates) {
		$this -> db -> where('bk_id', $id);
		$this -> db -> update($this -> table_bookings, $dates);
	}

	// delete book by id
	function delete($id) {
		$this -> db -> where('bk_id', $id);
		$this -> db -> delete($this -> table_bookings);
	}

}
