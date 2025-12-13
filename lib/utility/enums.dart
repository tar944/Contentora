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

enum MediaKind{
  none,
  movie,
  serial,
  documentary,
  learningCourse,
  onlineVideo,
  music,
  podcast
}

enum BookKind{
  none,
  fiction,
  nonFiction,
}