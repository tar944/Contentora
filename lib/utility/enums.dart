enum ContentState{
  newAdded,
  downloaded,
  bought,
  waiting,
  watched,
  read,
  listened,
  repeating,
}

enum ArchiveState{
  none,
  archiveList,
  mainList
}

enum ContentType{
  none,
  article,
  movie,
  serial,
  book,
  podcast,
  music,
  learningCourse,
  onlineVideo
}

enum PartUnit{
  none,
  page,
  line,
  minute,
  percent
}

enum VideoKind{
  none,
  movie,
  serial,
  documentary,
  learningCourse,
  onlineVideo
}

enum AudioKind{
  none,
  music,
  podcast
}

enum BookKind{
  none,
  fiction,
  nonFiction,
}