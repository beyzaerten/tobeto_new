class Event {
  final String title;
  final String date;
  final String teacher;
  final String time;

  const Event(
    this.title,
    this.date,
    this.teacher,
    this.time,
  );

  @override
  String toString() => title;
}

Map<String, List<Event>> events = {
  '21.01.2024': [
    Event("C# Programming", "21.01.2024", "Halit Enes Kalaycı", "09:00"),
  ],
  '08.02.2024': [
    Event("Object Oriented Programming (OOP) (Basic)", "08.02.2024",
        "Engin Demiroğ", "13:00")
  ],
  '18.02.2024': [
    Event("ASPNET Core Web API", "18.02.2024", "Halit Enes Kalaycı", "14:00"),
    Event("SQL Başlangıç Eğitimi", "18.02.2024", "Gürkan İlişen", "15:00"),
    Event("Örnek Ders ASPNET Core MVC (Basic)", "18.02.2024", "Semih Karduz",
        "15:00")
  ],
};
