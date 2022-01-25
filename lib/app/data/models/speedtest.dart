

class Speedtest {

  final String ip;
  final String server;
  final String? location;
  final double upload;
  final double download;

  Speedtest({required this.ip, required this.server, this.location, required this.upload, required this.download});

  Speedtest copyWith({
    String? ip,
    String? server,
    String? location,
    double? upload,
    double? download}) {
    return Speedtest(
        ip: ip ?? this.ip,
        server: server ?? this.server,
        upload: upload ?? this.upload,
        download: download ?? this.download,
        location: location ?? this.location);
  }

  factory Speedtest.fromJson(Map<String, dynamic> json) {
    return Speedtest(ip: json['ip'], server: json['icon'], upload: json['upload'], download: json['download'], location: json['location']);
  }

  Map<String, dynamic> toJson() {
    return {
      'ip': ip,
      'server': server,
      'location': location,
      'upload': upload,
      'download': download
    };
  }

}