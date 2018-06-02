#pragma once

#include <QWebView>
#include <QWebPage>
#include <QWidget>

class View : public QWebView
{
    Q_OBJECT

public:
    explicit View(QWidget* parent);

    void loadPage(const QString &uri);
    void loadImage(const QString &uri);

private slots:
    void handleAuthRequest(QNetworkReply*, QAuthenticator*);
};
