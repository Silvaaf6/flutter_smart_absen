class PengajuanCutiResponse {
  String? status;
  List<Data>? data;

  PengajuanCutiResponse({this.status, this.data});

  PengajuanCutiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? idUser;
  String? tglPengajuan;
  String? kategoriCuti;
  String? tglMulai;
  String? tglSelesai;
  String? alasan;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.idUser,
      this.tglPengajuan,
      this.kategoriCuti,
      this.tglMulai,
      this.tglSelesai,
      this.alasan,
      this.status,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    tglPengajuan = json['tgl_pengajuan'];
    kategoriCuti = json['kategori_cuti'];
    tglMulai = json['tgl_mulai'];
    tglSelesai = json['tgl_selesai'];
    alasan = json['alasan'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_user'] = this.idUser;
    data['tgl_pengajuan'] = this.tglPengajuan;
    data['kategori_cuti'] = this.kategoriCuti;
    data['tgl_mulai'] = this.tglMulai;
    data['tgl_selesai'] = this.tglSelesai;
    data['alasan'] = this.alasan;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
