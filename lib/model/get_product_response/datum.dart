class Datum {
	String? id;
	String? pname;
	String? size;
	String? prize;
	String? image;

	Datum({this.id, this.pname, this.size, this.prize, this.image});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['id'] as String?,
				pname: json['pname'] as String?,
				size: json['size'] as String?,
				prize: json['prize'] as String?,
				image: json['image'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'pname': pname,
				'size': size,
				'prize': prize,
				'image': image,
			};
}
