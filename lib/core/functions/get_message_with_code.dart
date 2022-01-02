class GetMessageWithCode {
  String getMessage(String code) {
    switch (code) {
      case "AuthManagerNotFound":
        return "Eksik veya hatalı bilgi";

      case "AlreadyExist":
        return "Kullanımda";

      case "PermissionFilterNotAuthorized":
        return "Yetkisiz İstek";

      case "MailAlreadyExist":
        return "E-Posta Kullanılıyor";

      case "PasswordStandartError":
        return "Parola Standartlara Uymuyor";

      case "AuthManagerWrongPassword":
        return "Yanlış Parola";

      case "AnErrorHasOccured":
        return "Bir Hata Oluştu";

      case "AuthMiddlewareTokenNotFound":
        return "Geçersiz Token";

      default:
        return "";
    }
  }
}
