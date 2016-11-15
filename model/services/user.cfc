

component  {
	 function login(string email,string password) {
		qr=new Query();
		qr=queryExecute("SELECT * FROM user where email=? AND password=?",
			[{value=email,cfsqltype="cf_sql_varchar"},{value=encrypt(password,"taKepHoTO","CFMX_COMPAT","Base64"),cfsqltype="cf_sql_varchar"}],{datasource="takephoto"});
		return qr;
	}

	function register(string lastname,string firstname,string email,string password,Date dateOfBirth,string sex,string classify)
	{		
		queryExecute("INSERT INTO user(lastname,firstname,email,password,dateOfBirth,sex,classify) 
			VALUES (?,?,?,?,?,?,?)",[lastname,firstname,email,encrypt(password,"taKepHoTO","CFMX_COMPAT","Base64"),dateOfBirth,sex,classify],{datasource="takephoto"});
	}
	function updateInfo (string lastname,string firstname) {
		queryExecute("UPDATE user SET lastName=?, firstName=?
			WHERE userID=?",[{value=lastname,cfsqltype="cf_sql_varchar"},{firstname,cfsqltype="cf_sql_varchar"},SESSION.userID],{datasource="takephoto"});
	}

	function load_change_password()
	{
		qr=new Query();
		// qr=queryExecute("SELECT email FROM user where email=?",[{value=SESSION.email,cfsqltype="cf_sql_varchar"}],{datasource="takephoto"});
		return qr;
	}
}