
component output="false" accessors="true"  {
	property userService; 
	// ten model vs them chu Service phi sau nua

    public function init(required any fw){
        variables.fw =fw;
        return this;
    }
    
    function default(struct rc) {

	}
	function login(struct rc){
		SESSION.is_logged_in="";
		rc.error_message="";
		if(CGI.REQUEST_METHOD=="POST")
		{
			email 		=rc.emaillogin?:"";
			password 	=rc.passwordlogin?:"";

			if(email!="" && password!="")
			{
				var checkUser = variables.userService.login(email,password);
				if(checkUser.recordCount()==1)
				{
					SESSION.is_logged_in=true;
					SESSION.userID=checkUser.userID;
					SESSION.firstname=checkUser.firstName;
					SESSION.lastname=checkUser.lastName;
					SESSION.email=checkUser.email;
					SESSION.password=checkUser.password;
					SESSION.dateOfBirth=checkUser.dateOfBirth;
					location("/index.cfm",false);
				}
				else{
					rc.error_message="Sai email hoặc mật khẩu";
				} 
			}	
		}
	}

	function register(struct rc)
	{
		
		if(CGI.REQUEST_METHOD=="POST")
		{
			lastname	=rc.lastname?:"";
			firstname	=rc.firstname?:"";
			email		=rc.email?:"";
			password	=rc.password?:"";

			day 		=rc.dayOfBirth?:"";
			month 		=rc.monthOfBirth?:"";
			year 		=rc.yearOfBirth?:"";
			date 		=createDate(year,month,day);
			dateOfBirth =dateFormat(createODBCDate(date),"yyyy-mm-dd");
			if(rc.sex==0)
			{
				sex="Nữ";
			} else {
				sex="Nam";
			}

			if(rc.classify==0)
			{
				classify="Khách Hàng";
			} else {
				classify="Nhiếp ảnh gia";
			}

			var registerUser=variables.userService.register(lastname,firstname,email,password,dateOfBirth,sex,classify);
			location("/index.cfm/main/default",false);
		}
	}

	// function updateInfo (struct rc) {
	// 	if(CGI.REQUEST_METHOD=="POST" && SESSION.is_logged_in==true)
	// 	{
	// 		lastname	=rc.lastname?:"";
	// 		firstname	=rc.firstname?:"";
	// 		// phone 		=rc.phone?:"";
	// 		// day 		=rc.dayOfBirth?:"";
	// 		// month 		=rc.monthOfBirth?:"";
	// 		// year 		=rc.yearOfBirth?:"";
	// 		// date 		=createDate(year,month,day);
	// 		// dateOfBirth =dateFormat(createODBCDate(date),"yyyy-mm-dd");
			
	// 		var registerUser=variables.userService.register(lastname,firstname);
	// 		location("/index.cfm/main/default",false);
	// 	}
	// 	else {
	// 		rc.error_message="Cập nhật thất bại!";
	// 	}
	// }

	function exit()
	{
		SESSION.is_logged_in=false;
		SESSION.name="";
		location("/",false)
	}
	function load_change_passwod()
	{

	}
}
