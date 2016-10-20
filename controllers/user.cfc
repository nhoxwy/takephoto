
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
			email 		=rc.email?:"";
			password 	=rc.password?:"";
			if(email!="" && password!="")
			{
				var checkUser = variables.userService.login(email,password);
				if(checkUser.recordCount()==1)
				{
					SESSION.is_logged_in=true;
					SESSION.logged_in_user_id=checkUser.id;
					SESSION.name=checkUser.name;
					SESSION.email=checkUser.email;
					SESSION.password=checkUser.password;
					location("/",false);
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
			lastname=rc.lastname?:"";
			firstname=rc.firstname?:"";
			email=rc.email?:"";
			password=rc.password?:"";

			
			var registerUser=variables.userService.register(lastname,firstname,email,password);
			location("/index.cfm/main/default",false);
		}
	}
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
