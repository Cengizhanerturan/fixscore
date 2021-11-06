class Score {
  List<Stages>? stages;

  Score({this.stages});

  Score.fromJson(Map<String, dynamic> json) {
    if (json["Stages"] is List)
      this.stages = json["Stages"] == null
          ? null
          : (json["Stages"] as List).map((e) => Stages.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stages != null)
      data["Stages"] = this.stages!.map((e) => e.toJson()).toList();
    return data;
  }
}

class Stages {
  String? sid;
  String? snm;
  String? sds;
  String? scd;
  String? cid;
  String? cnm;
  String? csnm;
  String? ccd;
  String? ccdiso;
  String? compId;
  String? compN;
  String? compD;
  int? scu;
  int? chi;
  int? shi;
  String? sdn;
  List<Events>? events;

  Stages(
      {this.sid,
      this.snm,
      this.sds,
      this.scd,
      this.cid,
      this.cnm,
      this.csnm,
      this.ccd,
      this.ccdiso,
      this.compId,
      this.compN,
      this.compD,
      this.scu,
      this.chi,
      this.shi,
      this.sdn,
      this.events});

  Stages.fromJson(Map<String, dynamic> json) {
    if (json["Sid"] is String) this.sid = json["Sid"];
    if (json["Snm"] is String) this.snm = json["Snm"];
    if (json["Sds"] is String) this.sds = json["Sds"];
    if (json["Scd"] is String) this.scd = json["Scd"];
    if (json["Cid"] is String) this.cid = json["Cid"];
    if (json["Cnm"] is String) this.cnm = json["Cnm"];
    if (json["Csnm"] is String) this.csnm = json["Csnm"];
    if (json["Ccd"] is String) this.ccd = json["Ccd"];
    if (json["Ccdiso"] is String) this.ccdiso = json["Ccdiso"];
    if (json["CompId"] is String) this.compId = json["CompId"];
    if (json["CompN"] is String) this.compN = json["CompN"];
    if (json["CompD"] is String) this.compD = json["CompD"];
    if (json["Scu"] is int) this.scu = json["Scu"];
    if (json["Chi"] is int) this.chi = json["Chi"];
    if (json["Shi"] is int) this.shi = json["Shi"];
    if (json["Sdn"] is String) this.sdn = json["Sdn"];
    if (json["Events"] is List)
      this.events = json["Events"] == null
          ? null
          : (json["Events"] as List).map((e) => Events.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["Sid"] = this.sid;
    data["Snm"] = this.snm;
    data["Sds"] = this.sds;
    data["Scd"] = this.scd;
    data["Cid"] = this.cid;
    data["Cnm"] = this.cnm;
    data["Csnm"] = this.csnm;
    data["Ccd"] = this.ccd;
    data["Ccdiso"] = this.ccdiso;
    data["CompId"] = this.compId;
    data["CompN"] = this.compN;
    data["CompD"] = this.compD;
    data["Scu"] = this.scu;
    data["Chi"] = this.chi;
    data["Shi"] = this.shi;
    data["Sdn"] = this.sdn;
    if (this.events != null)
      data["Events"] = this.events!.map((e) => e.toJson()).toList();
    return data;
  }
}

class Events {
  String? eid;
  Pids? pids;
  String? eps;
  int? esid;
  int? epr;
  int? ecov;
  int? ernO;
  int? ern;
  String? ernInf;
  int? et;
  String? tr1;
  String? tr2;
  String? trh1;
  String? trh2;
  String? tr1Or;
  String? tr2Or;
  List<T1>? t1;
  List<T2>? t2;
  int? incsX;
  int? comX;
  int? luX;
  int? statX;
  int? subsX;
  int? sdFowX;
  int? sdInnX;
  int? esd;
  int? luUt;
  int? eds;
  int? edf;
  int? eo;
  int? eact;
  Stg? stg;
  int? ehid;
  Sids? sids;
  int? pid;
  int? spid;

  Events(
      {this.eid,
      this.pids,
      this.eps,
      this.esid,
      this.epr,
      this.ecov,
      this.ernO,
      this.ern,
      this.ernInf,
      this.et,
      this.tr1,
      this.tr2,
      this.trh1,
      this.trh2,
      this.tr1Or,
      this.tr2Or,
      this.t1,
      this.t2,
      this.comX,
      this.luX,
      this.statX,
      this.subsX,
      this.sdFowX,
      this.sdInnX,
      this.esd,
      this.luUt,
      this.eds,
      this.edf,
      this.eo,
      this.eact,
      this.stg,
      this.ehid,
      this.sids,
      this.pid,
      this.spid});

  Events.fromJson(Map<String, dynamic> json) {
    if (json["Eid"] is String) this.eid = json["Eid"];
    if (json["Pids"] is Map)
      this.pids = json["Pids"] == null ? null : Pids.fromJson(json["Pids"]);
    if (json["Eps"] is String) this.eps = json["Eps"];
    if (json["Esid"] is int) this.esid = json["Esid"];
    if (json["Epr"] is int) this.epr = json["Epr"];
    if (json["Ecov"] is int) this.ecov = json["Ecov"];
    if (json["ErnO"] is int) this.ernO = json["ErnO"];
    if (json["Ern"] is int) this.ern = json["Ern"];
    if (json["ErnInf"] is String) this.ernInf = json["ErnInf"];
    if (json["Et"] is int) this.et = json["Et"];
    if (json["Tr1"] is String) this.tr1 = json["Tr1"];
    if (json["Tr2"] is String) this.tr2 = json["Tr2"];
    if (json["Trh1"] is String) this.trh1 = json["Trh1"];
    if (json["Trh2"] is String) this.trh2 = json["Trh2"];
    if (json["Tr1OR"] is String) this.tr1Or = json["Tr1OR"];
    if (json["Tr2OR"] is String) this.tr2Or = json["Tr2OR"];
    if (json["T1"] is List)
      this.t1 = json["T1"] == null
          ? null
          : (json["T1"] as List).map((e) => T1.fromJson(e)).toList();
    if (json["T2"] is List)
      this.t2 = json["T2"] == null
          ? null
          : (json["T2"] as List).map((e) => T2.fromJson(e)).toList();
    if (json["IncsX"] is int) this.incsX = json["IncsX"];
    if (json["ComX"] is int) this.comX = json["ComX"];
    if (json["LuX"] is int) this.luX = json["LuX"];
    if (json["StatX"] is int) this.statX = json["StatX"];
    if (json["SubsX"] is int) this.subsX = json["SubsX"];
    if (json["SDFowX"] is int) this.sdFowX = json["SDFowX"];
    if (json["SDInnX"] is int) this.sdInnX = json["SDInnX"];
    if (json["Esd"] is int) this.esd = json["Esd"];
    if (json["LuUT"] is int) this.luUt = json["LuUT"];
    if (json["Eds"] is int) this.eds = json["Eds"];
    if (json["Edf"] is int) this.edf = json["Edf"];
    if (json["EO"] is int) this.eo = json["EO"];
    if (json["Eact"] is int) this.eact = json["Eact"];
    if (json["Stg"] is Map)
      this.stg = json["Stg"] == null ? null : Stg.fromJson(json["Stg"]);
    if (json["Ehid"] is int) this.ehid = json["Ehid"];
    if (json["Sids"] is Map)
      this.sids = json["Sids"] == null ? null : Sids.fromJson(json["Sids"]);
    if (json["Pid"] is int) this.pid = json["Pid"];
    if (json["Spid"] is int) this.spid = json["Spid"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["Eid"] = this.eid;
    if (this.pids != null) data["Pids"] = this.pids!.toJson();
    data["Eps"] = this.eps;
    data["Esid"] = this.esid;
    data["Epr"] = this.epr;
    data["Ecov"] = this.ecov;
    data["ErnO"] = this.ernO;
    data["Ern"] = this.ern;
    data["ErnInf"] = this.ernInf;
    data["Et"] = this.et;
    data["Tr1"] = this.tr1;
    data["Tr2"] = this.tr2;
    data["Trh1"] = this.trh1;
    data["Trh2"] = this.trh2;
    data["Tr1OR"] = this.tr1Or;
    data["Tr2OR"] = this.tr2Or;
    if (this.t1 != null) data["T1"] = this.t1!.map((e) => e.toJson()).toList();
    if (this.t2 != null) data["T2"] = this.t2!.map((e) => e.toJson()).toList();
    data["IncsX"] = this.incsX;
    data["ComX"] = this.comX;
    data["LuX"] = this.luX;
    data["StatX"] = this.statX;
    data["SubsX"] = this.subsX;
    data["SDFowX"] = this.sdFowX;
    data["SDInnX"] = this.sdInnX;
    data["Esd"] = this.esd;
    data["LuUT"] = this.luUt;
    data["Eds"] = this.eds;
    data["Edf"] = this.edf;
    data["EO"] = this.eo;
    data["Eact"] = this.eact;
    if (this.stg != null) data["Stg"] = this.stg!.toJson();
    data["Ehid"] = this.ehid;
    if (this.sids != null) data["Sids"] = this.sids!.toJson();
    data["Pid"] = this.pid;
    data["Spid"] = this.spid;
    return data;
  }
}

class Sids {
  String? sids1;
  String? sids6;
  String? sids8;
  String? sids12;
  String? sids15;

  Sids({this.sids1, this.sids6, this.sids8, this.sids12, this.sids15});

  Sids.fromJson(Map<String, dynamic> json) {
    if (json["1"] is String) this.sids1 = json["1"];
    if (json["6"] is String) this.sids6 = json["6"];
    if (json["8"] is String) this.sids8 = json["8"];
    if (json["12"] is String) this.sids12 = json["12"];
    if (json["15"] is String) this.sids15 = json["15"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["1"] = this.sids1;
    data["6"] = this.sids6;
    data["8"] = this.sids8;
    data["12"] = this.sids12;
    data["15"] = this.sids15;
    return data;
  }
}

class Stg {
  String? sid;
  String? snm;
  String? sds;
  String? scd;
  String? cid;
  String? cnm;
  String? csnm;
  String? ccd;
  String? ccdiso;
  String? compId;
  String? compN;
  String? compD;
  int? scu;
  int? chi;
  int? shi;
  String? sdn;

  Stg(
      {this.sid,
      this.snm,
      this.sds,
      this.scd,
      this.cid,
      this.cnm,
      this.csnm,
      this.ccd,
      this.ccdiso,
      this.compId,
      this.compN,
      this.compD,
      this.scu,
      this.chi,
      this.shi,
      this.sdn});

  Stg.fromJson(Map<String, dynamic> json) {
    if (json["Sid"] is String) this.sid = json["Sid"];
    if (json["Snm"] is String) this.snm = json["Snm"];
    if (json["Sds"] is String) this.sds = json["Sds"];
    if (json["Scd"] is String) this.scd = json["Scd"];
    if (json["Cid"] is String) this.cid = json["Cid"];
    if (json["Cnm"] is String) this.cnm = json["Cnm"];
    if (json["Csnm"] is String) this.csnm = json["Csnm"];
    if (json["Ccd"] is String) this.ccd = json["Ccd"];
    if (json["Ccdiso"] is String) this.ccdiso = json["Ccdiso"];
    if (json["CompId"] is String) this.compId = json["CompId"];
    if (json["CompN"] is String) this.compN = json["CompN"];
    if (json["CompD"] is String) this.compD = json["CompD"];
    if (json["Scu"] is int) this.scu = json["Scu"];
    if (json["Chi"] is int) this.chi = json["Chi"];
    if (json["Shi"] is int) this.shi = json["Shi"];
    if (json["Sdn"] is String) this.sdn = json["Sdn"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["Sid"] = this.sid;
    data["Snm"] = this.snm;
    data["Sds"] = this.sds;
    data["Scd"] = this.scd;
    data["Cid"] = this.cid;
    data["Cnm"] = this.cnm;
    data["Csnm"] = this.csnm;
    data["Ccd"] = this.ccd;
    data["Ccdiso"] = this.ccdiso;
    data["CompId"] = this.compId;
    data["CompN"] = this.compN;
    data["CompD"] = this.compD;
    data["Scu"] = this.scu;
    data["Chi"] = this.chi;
    data["Shi"] = this.shi;
    data["Sdn"] = this.sdn;
    return data;
  }
}

class T2 {
  String? nm;
  String? id;
  int? tbd;
  String? img;
  List<dynamic>? el;
  int? gd;
  Pids2? pids;
  String? coNm;
  String? coId;
  Shrt1? shrt;

  T2(
      {this.nm,
      this.id,
      this.tbd,
      this.img,
      this.el,
      this.gd,
      this.pids,
      this.coNm,
      this.coId,
      this.shrt});

  T2.fromJson(Map<String, dynamic> json) {
    if (json["Nm"] is String) this.nm = json["Nm"];
    if (json["ID"] is String) this.id = json["ID"];
    if (json["tbd"] is int) this.tbd = json["tbd"];
    if (json["Img"] is String) this.img = json["Img"];
    if (json["EL"] is List) this.el = json["EL"] ?? [];
    if (json["Gd"] is int) this.gd = json["Gd"];
    if (json["Pids"] is Map)
      this.pids = json["Pids"] == null ? null : Pids2.fromJson(json["Pids"]);
    if (json["CoNm"] is String) this.coNm = json["CoNm"];
    if (json["CoId"] is String) this.coId = json["CoId"];
    if (json["Shrt"] is Map)
      this.shrt = json["Shrt"] == null ? null : Shrt1.fromJson(json["Shrt"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["Nm"] = this.nm;
    data["ID"] = this.id;
    data["tbd"] = this.tbd;
    data["Img"] = this.img;
    if (this.el != null) data["EL"] = this.el;
    data["Gd"] = this.gd;
    if (this.pids != null) data["Pids"] = this.pids!.toJson();
    data["CoNm"] = this.coNm;
    data["CoId"] = this.coId;
    if (this.shrt != null) data["Shrt"] = this.shrt!.toJson();
    return data;
  }
}

class Shrt1 {
  String? bs;
  String? sl;
  String? nmb;
  bool? sq;
  bool? st;
  bool? hst;
  bool? spl;
  String? sld;

  Shrt1(
      {this.bs,
      this.sl,
      this.nmb,
      this.sq,
      this.st,
      this.hst,
      this.spl,
      this.sld});

  Shrt1.fromJson(Map<String, dynamic> json) {
    if (json["Bs"] is String) this.bs = json["Bs"];
    if (json["Sl"] is String) this.sl = json["Sl"];
    if (json["Nmb"] is String) this.nmb = json["Nmb"];
    if (json["Sq"] is bool) this.sq = json["Sq"];
    if (json["St"] is bool) this.st = json["St"];
    if (json["Hst"] is bool) this.hst = json["Hst"];
    if (json["Spl"] is bool) this.spl = json["Spl"];
    if (json["Sld"] is String) this.sld = json["Sld"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["Bs"] = this.bs;
    data["Sl"] = this.sl;
    data["Nmb"] = this.nmb;
    data["Sq"] = this.sq;
    data["St"] = this.st;
    data["Hst"] = this.hst;
    data["Spl"] = this.spl;
    data["Sld"] = this.sld;
    return data;
  }
}

class Pids2 {
  List<String>? pids21;
  List<String>? pids26;
  List<String>? pids28;
  List<String>? pids212;
  List<String>? pids215;

  Pids2({this.pids21, this.pids26, this.pids28, this.pids212, this.pids215});

  Pids2.fromJson(Map<String, dynamic> json) {
    if (json["1"] is List)
      this.pids21 = json["1"] == null ? null : List<String>.from(json["1"]);
    if (json["6"] is List)
      this.pids26 = json["6"] == null ? null : List<String>.from(json["6"]);
    if (json["8"] is List)
      this.pids28 = json["8"] == null ? null : List<String>.from(json["8"]);
    if (json["12"] is List)
      this.pids212 = json["12"] == null ? null : List<String>.from(json["12"]);
    if (json["15"] is List)
      this.pids215 = json["15"] == null ? null : List<String>.from(json["15"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pids21 != null) data["1"] = this.pids21;
    if (this.pids26 != null) data["6"] = this.pids26;
    if (this.pids28 != null) data["8"] = this.pids28;
    if (this.pids212 != null) data["12"] = this.pids212;
    if (this.pids215 != null) data["15"] = this.pids215;
    return data;
  }
}

class T1 {
  String? nm;
  String? id;
  int? tbd;
  String? img;
  List<dynamic>? el;
  int? gd;
  Pids1? pids;
  String? coNm;
  String? coId;
  Shrt? shrt;

  T1(
      {this.nm,
      this.id,
      this.tbd,
      this.img,
      this.el,
      this.gd,
      this.pids,
      this.coNm,
      this.coId,
      this.shrt});

  T1.fromJson(Map<String, dynamic> json) {
    if (json["Nm"] is String) this.nm = json["Nm"];
    if (json["ID"] is String) this.id = json["ID"];
    if (json["tbd"] is int) this.tbd = json["tbd"];
    if (json["Img"] is String) this.img = json["Img"];
    if (json["EL"] is List) this.el = json["EL"] ?? [];
    if (json["Gd"] is int) this.gd = json["Gd"];
    if (json["Pids"] is Map)
      this.pids = json["Pids"] == null ? null : Pids1.fromJson(json["Pids"]);
    if (json["CoNm"] is String) this.coNm = json["CoNm"];
    if (json["CoId"] is String) this.coId = json["CoId"];
    if (json["Shrt"] is Map)
      this.shrt = json["Shrt"] == null ? null : Shrt.fromJson(json["Shrt"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["Nm"] = this.nm;
    data["ID"] = this.id;
    data["tbd"] = this.tbd;
    data["Img"] = this.img;
    if (this.el != null) data["EL"] = this.el;
    data["Gd"] = this.gd;
    if (this.pids != null) data["Pids"] = this.pids!.toJson();
    data["CoNm"] = this.coNm;
    data["CoId"] = this.coId;
    if (this.shrt != null) data["Shrt"] = this.shrt!.toJson();
    return data;
  }
}

class Shrt {
  String? bs;
  String? sl;
  String? nmb;
  bool? sq;
  bool? st;
  bool? hst;
  bool? spl;
  String? sld;

  Shrt(
      {this.bs,
      this.sl,
      this.nmb,
      this.sq,
      this.st,
      this.hst,
      this.spl,
      this.sld});

  Shrt.fromJson(Map<String, dynamic> json) {
    if (json["Bs"] is String) this.bs = json["Bs"];
    if (json["Sl"] is String) this.sl = json["Sl"];
    if (json["Nmb"] is String) this.nmb = json["Nmb"];
    if (json["Sq"] is bool) this.sq = json["Sq"];
    if (json["St"] is bool) this.st = json["St"];
    if (json["Hst"] is bool) this.hst = json["Hst"];
    if (json["Spl"] is bool) this.spl = json["Spl"];
    if (json["Sld"] is String) this.sld = json["Sld"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["Bs"] = this.bs;
    data["Sl"] = this.sl;
    data["Nmb"] = this.nmb;
    data["Sq"] = this.sq;
    data["St"] = this.st;
    data["Hst"] = this.hst;
    data["Spl"] = this.spl;
    data["Sld"] = this.sld;
    return data;
  }
}

class Pids1 {
  List<String>? pids11;
  List<String>? pids16;
  List<String>? pids18;
  List<String>? pids112;

  Pids1({this.pids11, this.pids16, this.pids18, this.pids112});

  Pids1.fromJson(Map<String, dynamic> json) {
    if (json["1"] is List)
      this.pids11 = json["1"] == null ? null : List<String>.from(json["1"]);
    if (json["6"] is List)
      this.pids16 = json["6"] == null ? null : List<String>.from(json["6"]);
    if (json["8"] is List)
      this.pids18 = json["8"] == null ? null : List<String>.from(json["8"]);
    if (json["12"] is List)
      this.pids112 = json["12"] == null ? null : List<String>.from(json["12"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pids11 != null) data["1"] = this.pids11;
    if (this.pids16 != null) data["6"] = this.pids16;
    if (this.pids18 != null) data["8"] = this.pids18;
    if (this.pids112 != null) data["12"] = this.pids112;
    return data;
  }
}

class Pids {
  String? pids1;
  String? pids6;
  String? pids8;
  String? pids12;
  String? pids15;

  Pids({this.pids1, this.pids6, this.pids8, this.pids12, this.pids15});

  Pids.fromJson(Map<String, dynamic> json) {
    if (json["1"] is String) this.pids1 = json["1"];
    if (json["6"] is String) this.pids6 = json["6"];
    if (json["8"] is String) this.pids8 = json["8"];
    if (json["12"] is String) this.pids12 = json["12"];
    if (json["15"] is String) this.pids15 = json["15"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["1"] = this.pids1;
    data["6"] = this.pids6;
    data["8"] = this.pids8;
    data["12"] = this.pids12;
    data["15"] = this.pids15;
    return data;
  }
}
