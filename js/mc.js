////////////////////////////////////////////
function getquerystring(varname)
{
  // First, we load the URL into a variable
  var url = window.location.href;
  var qparts = url.split("?");
  if (qparts.length == 0)
  {
    return "";
  }
  // Then find the querystring, everything after the ?
  var query = qparts[1];
  var vars = query.split("&");
  // Initialize the value with "" as default
  var value = "";
  // Iterate through vars, checking each one for varname
  for (i=0;i<vars.length;i++)
  {
    var parts = vars[i].split("=");  // Split the variable by =, which splits name and value
    // Check if the correct variable
    if (parts[0] == varname)
    {
      value = parts[1];
      break;
    }
  }
  // Convert escape code
  value = unescape(value);
  // Convert "+"s to " "s
  value.replace(/\+/g," ");
  // Return the value
  return value;
}
//////////////////////////////////////
function checkConnection() { 
	var networkState = navigator.network.connection.type;

	var states = {};
	states[Connection.UNKNOWN]  = 'Connection.UNKNOWN';
	states[Connection.ETHERNET] = 'Ethernet connection';
	states[Connection.WIFI]     = 'WiFi connection';
	states[Connection.CELL_2G]  = 'Cell 2G connection';
	states[Connection.CELL_3G]  = 'Cell 3G connection';
	states[Connection.CELL_4G]  = 'Cell 4G connection';
	states[Connection.NONE]     = 'Connection.NONE';

    return states[networkState];
}
/////////////////////////////////////////////
