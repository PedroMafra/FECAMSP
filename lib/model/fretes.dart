class Frete {
  final String origem;
  final String destino;
  final String distancia;
  final String frete;
  final String carga;
  final String eixos;
  final bool idaVolta;
  final bool retVazio;
  final String usuId;
  final String custo;

  Frete(this.origem, this.destino, this.distancia, this.frete,
      this.carga, this.eixos, this.idaVolta, this.retVazio, this.usuId, this.custo);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': usuId,
      'origem': origem,
      'destino': destino,
      'distancia': distancia,
      'frete': frete,
      'carga': carga,
      'eixos': eixos,
      'idaVolta': idaVolta,
      'retVazio': retVazio,
      'custo': custo,
    };
  }

  factory Frete.fromJson(Map<String, dynamic> json) {
    return Frete(
      json['uid'],
      json['origem'],
      json['destino'],
      json['distancia'],
      json['frete'],
      json['carga'],
      json['eixos'],
      json['idaVolta'],
      json['retVazio'],
      json['custo'],
    );
  }
}