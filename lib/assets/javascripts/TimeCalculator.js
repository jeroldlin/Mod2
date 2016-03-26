function timeCalculator(){
	var result = "";
	var year = "";
	var month = "";
	var date ="";
	var hour ="";
	var min = "";
	var dateEntry = ""
	var timeEntry = ""
	
	dateEntry = $("#datepicker").val()
	timeEntry = $("#timepicker").val()

	if (dateEntry != "" && timeEntry != ""){
		dateEntry = dateEntry.split("-");
		year = dateEntry[0];
		month = dateEntry[1];
		date = dateEntry[2];

		timeEntry = timeEntry.split(":");
		if (timeEntry[1][2] == "p"){
			hour = parseInt(timeEntry[0]) + 12
		}else{
			hour = timeEntry[0]
		};
		min = timeEntry[1][0] + timeEntry[1][1];

		result = year + "-" + month + "-" + date + " " + hour + ":" + min + ":00";

		$("#reservation_requested_date_time").val(result)
	}
}