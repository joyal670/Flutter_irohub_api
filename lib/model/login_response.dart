class LoginResponse {
	bool? status;
	String? message;
	String? id;

	LoginResponse({this.status, this.message, this.id});

	factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
				status: json['status'] as bool?,
				message: json['message'] as String?,
				id: json['id'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'id': id,
			};
}
