component output="false" accessors="true" persistent="true" {
	property userService; 
	property greetingService;

    public function init(required any fw){
        variables.fw =fw;
        return this;
    }
    
    
    function default(struct rc) {
	}

	
	function register(struct rc) {
		SESSION.location = variables.greetingService.location();
        SESSION.kind = variables.greetingService.kind();
		if (SESSION.isUserLoggedIn eq true) {
	        location ("/index.cfm",false);
		} else if (SESSION.isUserLoggedIn eq false) {
			rc.error_message = "";
			if(CGI.REQUEST_METHOD == "POST")
			{
				if(structKeyExists(form,"btnSubmit")){
					if(form.btnSubmit eq "Đăng ký") {
						day 		= form.dayOfBirth;
						month 		= form.monthOfBirth;
						year 		= form.yearOfBirth;
						date 		= createDate(year,month,day);
						dateOfBirth = dateFormat(createODBCDate(date),"yyyy-mm-dd");
						var registerUser = variables.userService.register(
							form.lastname,form.firstname,form.email,
							form.password,dateOfBirth,
							form.sex,form.classify);
						if(form.classify eq "Nhiếp ảnh gia") {
							var registerSkill = variables.userService.registerSkill(form.email);
						}
						location("/index.cfm/main/default",false);
					}else if(form.btnSubmit eq "Đăng nhập") {
						email 		= form.emaillogin;
						password 	= form.passwordlogin;
						if(email != "" && password != "")
						{
							var checkUser = variables.userService.login(email,password);
							if(checkUser.recordCount() == 1)
							{
								SESSION.isUserLoggedIn = true;
								SESSION.userLoggedIn = checkUser;
								SESSION.userLoggedInAlbum = variables.userService.getAlbum(SESSION.userLoggedIn.userID);
								SESSION.userLoggedInBook = variables.userService.getBook(SESSION.userLoggedIn.userID);
								location("/index.cfm",false);
							}
							else{
								rc.error_message = "Sai email hoặc mật khẩu";
							} 
						}	
					}
				}
			}
		} /* Complete login and register */
	}


	function updateInfo() {
		if (SESSION.isUserLoggedIn eq true) {
			if(CGI.REQUEST_METHOD=="POST"){
				if(structKeyExists(form,"btnSubmit")){
					if(form.btnSubmit eq "Cập nhật thông tin") {
						day = form.dayOfBirth;
						month = form.monthOfBirth;
						year = form.yearOfBirth;
						date = createDate(year,month,day);
						dateOfBirth = dateFormat(createODBCDate(date),"yyyy-mm-dd");
						var updateInfo = variables.userService.updateInfo(form.lastnameUpdate,form.firstnameUpdate,form.phoneUpdate,dateOfBirth);
						location("/index.cfm/user/editFreelancer",false);
					}
				}
			}
		}
	} /* Complete update Information */


	function changePassword() {
		if(SESSION.isUserLoggedIn eq true) {
			if(CGI.REQUEST_METHOD=="POST") {
				if(structKeyExists(form,"btnSubmit")){
					if(form.btnSubmit eq "Đổi mật khẩu") {
						oldPassword = encrypt(form.oldPassword,"taKepHoTO","CFMX_COMPAT","Base64");
						if(oldPassword eq SESSION.userLoggedIn.password) {
							// newPassword = form.newPassword;
							var updatePassword = variables.userService.updatePassword(form.newPassword);
							location("/index.cfm/user/editFreelancer",false);
						} else {
							rc.error_message = "Sai mật khẩu cũ";
						}
					}
				}
			}
		}
	}



	function exit()
	{
		SESSION.isUserLoggedIn = false;
		location("/index.cfm",false)
	}
}
