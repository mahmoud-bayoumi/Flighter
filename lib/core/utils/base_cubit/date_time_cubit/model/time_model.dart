class TimeModel {
   int? year;
   int? month;
   int? day;
   int? hour;
   int? minute;
   int? seconds;
   int? milliSeconds;
   String? dateTime;
   String? date;
   String? time;
   String? timeZone;
   String? dayOfWeek;
   bool? dstActive;

  TimeModel({
     this.year,
     this.month,
     this.day,
     this.hour,
     this.minute,
     this.seconds,
     this.milliSeconds,
     this.dateTime,
     this.date,
     this.time,
     this.timeZone,
     this.dayOfWeek,
     this.dstActive,
  });

  factory TimeModel.fromJson(Map<String, dynamic> json) {
    return TimeModel(
      year: json['year'],
      month: json['month'],
      day: json['day'],
      hour: json['hour'],
      minute: json['minute'],
      seconds: json['seconds'],
      milliSeconds: json['milliSeconds'],
      dateTime: json['dateTime'],
      date: json['date'],
      time: json['time'],
      timeZone: json['timeZone'],
      dayOfWeek: json['dayOfWeek'],
      dstActive: json['dstActive'],
    );
  }
}
