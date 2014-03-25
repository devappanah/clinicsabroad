jQuery ->
  window.locationMap.loadScript()

window.locationMapApiReady = ->
  window.locationMap.generateMap()

window.locationMap = 
  loadScript: ->
    google_map = document.createElement("script")
    google_map.type = "text/javascript"
    google_map.src = "https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places&" + "callback=locationMapApiReady"
    document.body.appendChild(google_map)

  generateMap: ->
    latitude = $('#location_lat').val() || -34.397
    longitude =  $('#location_lng').val() || 150.644

    mapOptions =
      zoom: 8
      center: new google.maps.LatLng(latitude, longitude)

    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions)

    latLng = new google.maps.LatLng(latitude, longitude)

    marker = new google.maps.Marker
      position: latLng
      map: map
      draggable: true

    google.maps.event.addListener marker, 'dragend', ->
      $("#location_lat").val(marker.getPosition().lat())
      $("#location_lng").val(marker.getPosition().lng())