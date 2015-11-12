// // Place all the behaviors and hooks related to the matching controller here.
// // All this logic will automatically be available in application.js.

// window.onload = function () {
// 	var btn = document.querySelector("[value='Book Now']"),
// 			nestedForm = document.getElementsByClassName("nested-fields"),
// 			addBtn = document.querySelector(".add_fields"),
// 			removeBtn = document.getElementsByClassName("remove_fields");
	
// 	function checkBooking() {
// 		if (nestedForm.length == 0) {
// 			btn.setAttribute("disabled", true)	
// 		} else {
// 			btn.removeAttribute("disabled");
// 		}
// 	}

// 	checkBooking();

// 	addBtn.addEventListener("click", function () {
		
// 		for (var i = 0, len = removeBtn.length; i < len; i += 1) {
// 			console.log(removeBtn[i]);
// 		}


// 		checkBooking();
// 	});
// };