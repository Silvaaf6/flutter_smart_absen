class KehadiranResponse {
  String? status;
  List<Data>? data;

  KehadiranResponse({this.status, this.data});

  KehadiranResponse.fromJson(Map<String, dynamic> json) {
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
  String? tanggal;
  String? jamMasuk;
  String? jamKeluar;
  String? jamKerja;
  String? suratDokter;
  String? status;
  String? createdAt;
  String? updatedAt;
  User? user;

  Data(
      {this.id,
      this.idUser,
      this.tanggal,
      this.jamMasuk,
      this.jamKeluar,
      this.jamKerja,
      this.suratDokter,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    tanggal = json['tanggal'];
    jamMasuk = json['jam_masuk'];
    jamKeluar = json['jam_keluar'];
    jamKerja = json['jam_kerja'];
    suratDokter = json['surat_dokter'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_user'] = this.idUser;
    data['tanggal'] = this.tanggal;
    data['jam_masuk'] = this.jamMasuk;
    data['jam_keluar'] = this.jamKeluar;
    data['jam_kerja'] = this.jamKerja;
    data['surat_dokter'] = this.suratDokter;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? nip;
  String? cover;
  int? idJabatan;
  String? tempatLahir;
  String? tglLahir;
  String? alamat;
  String? jenisKelamin;
  String? agama;
  String? noTelp;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.nip,
      this.cover,
      this.idJabatan,
      this.tempatLahir,
      this.tglLahir,
      this.alamat,
      this.jenisKelamin,
      this.agama,
      this.noTelp,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    nip = json['nip'];
    cover = json['cover'];
    idJabatan = json['id_jabatan'];
    tempatLahir = json['tempat_lahir'];
    tglLahir = json['tgl_lahir'];
    alamat = json['alamat'];
    jenisKelamin = json['jenis_kelamin'];
    agama = json['agama'];
    noTelp = json['no_telp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['nip'] = this.nip;
    data['cover'] = this.cover;
    data['id_jabatan'] = this.idJabatan;
    data['tempat_lahir'] = this.tempatLahir;
    data['tgl_lahir'] = this.tglLahir;
    data['alamat'] = this.alamat;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['agama'] = this.agama;
    data['no_telp'] = this.noTelp;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
