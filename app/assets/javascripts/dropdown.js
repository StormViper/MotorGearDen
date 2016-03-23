function headerDrop() {
	document.getElementById("head-dropdown").classList.toggle("show");
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
}