

function appendNotification(type, message) {
	var alerts = [
        { 'type' : 'success', 'message' : message },
        { 'type' : 'info', 'message' : message },
        { 'type' : 'warning', 'message' : message },
        { 'type' : 'danger', 'message' : message }
    ];

	var createAlert = function( alert_type, message ) {
		
        var alert = document.createElement( 'div' );
        alert.setAttribute( 'id', 'notification_row' );
        alert.setAttribute( 'class', 'alert alert-' + alert_type + ' alert-dismissable' );

        var button = document.createElement( 'button' );
        button.setAttribute( 'type', 'button' );
        button.setAttribute( 'class', 'close' );
        button.setAttribute( 'data-dismiss', 'alert' );
        button.setAttribute( 'aria-hidden', 'true' );
        button.appendChild( document.createTextNode( 'x' ) );

        var span = document.createElement( 'span' );
        span.setAttribute( 'id', 'notification_msg' );

        alert.appendChild( button );
        alert.appendChild( span );
        span.innerHTML += message;
//        alert.appendChild( document.createTextNode( message ) );

        return alert;
    };
    var hideAlert = function() {
        console.log( 'Hide alert' );
        $('#notification_row').alert( 'close' );
    };

    var showAlert = function() {
        console.log( 'Show alert' );
        var alert = alerts[type];
        $('#notification_col').append( createAlert( alert.type, alert.message ) );
    };
    
    hideAlert();
    showAlert();
}