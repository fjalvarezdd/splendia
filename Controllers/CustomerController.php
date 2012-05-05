<?php

class CustomerController {

	public function index_signup() {
		$this -> smarty -> display('signup.tpl');
	}

	// We just show info bout the history to the user
	public function index_account() {
		// get booked rooms
		$userId = $this -> session -> getUserId();
		$bookedRooms = Bookings::getBookedRooms($userId);

		// render the page with the results
		$this -> smarty -> assign(array('bookedRooms' => $bookedRooms, 'userId' => $userId));
		$this -> smarty -> display('myBooking.tpl');
	}

	public function executeAction() {
		$post = $this -> request -> getPost();
		// Remove a book entry
		if ($post -> getAction() == "signup_button") {
			Customer::save($post -> getUsername(), $post -> getPassword(), $post -> getAddress(), $post -> getCreditCard());
		}

		// redirect to history page
		$this -> redirect('myBooking.html');
	}

}
