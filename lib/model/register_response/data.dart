class Data {
	String? fname;
	String? lname;
	String? email;
	String? mobile;
	String? gender;
	String? password;

	Data({
		this.fname, 
		this.lname, 
		this.email, 
		this.mobile, 
		this.gender, 
		this.password, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				fname: json['fname'] as String?,
				lname: json['lname'] as String?,
				email: json['email'] as String?,
				mobile: json['mobile'] as String?,
				gender: json['gender'] as String?,
				password: json['password'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'fname': fname,
				'lname': lname,
				'email': email,
				'mobile': mobile,
				'gender': gender,
				'password': password,
			};
}
