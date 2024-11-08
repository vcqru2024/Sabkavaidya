using System.Collections.Generic;
public class EmailToOwner: Custom.Hybrid.CodeTyped
{
  // This generates the e-mail subject
  public string Subject() {
    return App.Resources.String("MailOwnerSubject");
  }

  // This generates the e-mail body
  public string Message(Dictionary<string,object> request)
  {
    var message = 
    @"<!doctype html>
    <html>
      <head>
        <meta name='viewport' content='width=device-width'>
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <style type='text/css'>
            body { font-family: Helvetica, sans-serif; }
        </style>
      </head>
      <body>" + App.Resources.String("MailOwnerIntroduction");

    foreach (var item in request) {
      message += "<div><strong>"  + item.Key + "</strong>: " + item.Value + "</div>";
    }

    message +=
      @"</body>
    </html>";

    return message;
  }
}