import 'datum.dart';

class GetProductResponse {
	bool? status;
	String? message;
	List<Datum>? data;

	GetProductResponse({this.status, this.message, this.data});

	factory GetProductResponse.fromJson(Map<String, dynamic> json) {
		return GetProductResponse(
			status: json['status'] as bool?,
			message: json['message'] as String?,
			data: (json['data'] as List<dynamic>?)
						?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'data': data?.map((e) => e.toJson()).toList(),
			};
}
