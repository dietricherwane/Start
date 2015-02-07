function initialize() {
	  var myLatlng = new google.maps.LatLng(42.1066074,-71.1836972); //http://itouchmap.com/latlong.html
	  var mapOptions = {
	    zoom: 15,
	    center: myLatlng
	  }
	  var map = new google.maps.Map(document.getElementById('GoogleMap'), mapOptions);

	  var marker = new google.maps.Marker({
	      position: myLatlng,
	      map: map,
	      title: 'START'
	  });
	}

	google.maps.event.addDomListener(window, 'load', initialize);
