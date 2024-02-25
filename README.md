# FlutterDateFormatter

FlutterDateFormatter, Flutter uygulamalarında tarih ve saat bilgilerini biçimlendirmek için oluşturulmuş bir kütüphanedir.

## Kurulum

DateFormatter sınıfı easy_localization paketini kullanan ve

### Çoklu Dil Desteği ile Kurulum

- `easy_localization` paketini projenize dahil edin ve gerekli konfigürasyonları yapın, detaylı bilgi için [bu sayfaya](https://pub.dev/packages/easy_localization) göz atabilirsiniz.

- `multilanguage/translations` dizininin içerisinde bulunan `en-US.json` ve `tr-TR.json` dosyalarının içerisindeki anahtar-değer ikililerini kendi projenizde bulunan dil dosyalarınıza kopyalayın.

- `date_formatter.dart` dosyasını projenize dahil edin.

### Çoklu Dil Desteği Olmadan Kurulum

- `single_language` dizininin içerisinde bulunan `date_formatter_en.dart` veya `date_formatter_tr.dart` dosyasını projenize dahil edin.

## Örnek Kullanım

```dart
// Tarih biçimlendirme
String formattedDate = DateTimeFormatter.formatDate(
  date: DateTime.now(),
  includeWeekday: true,
  includeTime: true,
);
print(formattedDate); // 25 Şubat 2024 Cumartesi 14:30

// Tarih farkı biçimlendirme
String dateDifference = DateTimeFormatter.formatDateDifference(
  date: DateTime(2024, 2, 24, 14, 0),
);
print(dateDifference); // 1 gün önce
```

## Dil Desteği

FlutterDateFormatter, İngilizce (en-US) ve Türkçe (tr-TR) dilleri ile uyumlu çalışacak şekilde dil desteği sağlamaktadır.
