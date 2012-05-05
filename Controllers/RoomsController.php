<?php

class RoomsController {

	public function index_list() {
		// get available rooms by criteria (date, location, price .. )
		$post = $this -> request -> getPost();
		$rooms = Rooms::getAvailableRooms($post -> getCriteria());

		// render the page with the results
		$this -> smarty -> assign(array('rooms' => $rooms));
		$this -> smarty -> display('searchResults.tpl');
	}

	public function executeAction() {
		if ($post -> getAction() == "book_now") {
			// get booked room from post and apply it to the DB
			$post = $this -> request -> getPost();
			Bookings::save($post -> getRoomId(), $post -> getUserId(), $post -> getDates());
		}
		// redirect to history page
		$this -> redirect('myBooking.html');
	}

}
