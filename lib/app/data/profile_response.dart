class ProfileResponse {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? nip;
  Null? cover;
  int? idJabatan;
  String? tempatLahir;
  String? tglLahir;
  String? alamat;
  String? jenisKelamin;
  String? agama;
  String? noTelp;
  String? createdAt;
  String? updatedAt;

  ProfileResponse(
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

  ProfileResponse.fromJson(Map<String, dynamic> json) {
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
