import 'data.dart';

class RegisterResponse {
	bool? status;
	String? message;
	Data? data;
	int? id;

	RegisterResponse({this.status, this.message, this.data, this.id});

	factory RegisterResponse.fromJson(Map<String, dynamic> json) {
		return RegisterResponse(
			status: json['status'] as bool?,
			message: json['message'] as String?,
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
			id: json['id'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'data': data?.toJson(),
				'id': id,
			};
}
