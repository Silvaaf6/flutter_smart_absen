class JabatanResponse {
  final bool? success;
  final String? message;
  final List<Data>? data;

  JabatanResponse({
    this.success,
    this.message,
    this.data,
  });

  factory JabatanResponse.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];

    List<Data> parsedData = [];
    if (rawData is List) {
      parsedData = rawData.map((x) => Data.fromJson(x)).toList();
    } else if (rawData is Map) {
      parsedData = [Data.fromJson(rawData as Map<String, dynamic>)];
    }

    return JabatanResponse(
      success: json['success'],
      message: json['message'],
      data: parsedData,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.map((x) => x.toJson()).toList(),
      };
}

class Data {
  final int? id;
  final String? namaJabatan;

  Data({this.id, this.namaJabatan});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        namaJabatan: json['nama_jabatan'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama_jabatan': namaJabatan,
      };
}
