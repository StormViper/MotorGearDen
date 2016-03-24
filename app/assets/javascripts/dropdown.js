function headerDrop() {
	document.getElementById("head-dropdown").classList.toggle("show");
}

function uheadDrop() {
	document.getElementById("uhead-dropdown").classList.toggle("show");
}

window.onHover = function(event) {
	if(!event.target.matches('.dropbtn')) {

		var dropdowns = document.getElementsByClassName("dropdown-content");
		var i;

		for(i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			if (openDropdown.classList.contains("show")) {
				openDropDown.classList.remove("show");
			}
		}
	}

	if(!event.target.matches('.udropbtn')) {
		var drops = document.getElementsByClassName("userdrop-content");
		var i;

		for(i = 0; i < drops.length; i++) {
			var openDrop = drops[i];
			if (openDrop.classList.contains("show")) {
				openDrop.classList.remove("show");
			}
		}
	}
}