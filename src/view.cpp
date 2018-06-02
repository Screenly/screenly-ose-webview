#include <QDebug>
#include <QFileInfo>
#include <QUrl>
#include <QStandardPaths>

#include "view.h"


View::View(QWidget* parent) : QWebView(parent)
{
    // Need to convert this to a new syntax
    connect(QWebView::page()->networkAccessManager(), SIGNAL(authenticationRequired(QNetworkReply*,QAuthenticator*)),
            this, SLOT(handleAuthRequest(QNetworkReply*,QAuthenticator*)));
}

void View::loadPage(const QString &uri)
{
    qDebug() << "Type: Webpage";
    stop();
    load(QUrl(uri));
}

void View::loadImage(const QString &preUri)
{
    qDebug() << "Type: Image";
    QFileInfo fileInfo = QFileInfo(preUri);
    QString uri;

    if (fileInfo.isFile())
    {
        qDebug() << "Location: Local File";
        uri = QUrl::fromLocalFile(fileInfo.absoluteFilePath()).toEncoded();
    }
    else if (preUri == "null")
    {
        qDebug() << "Black page";
    }
    else
    {
        qDebug() << "Location: Remote URL";
        uri = preUri;
    }

    QString script = "window.setimg=function(n){var o=new Image;o.onload=function()"
                     "{document.body.style.backgroundSize=o.width>window.innerWidth||o.height>window.innerHeight?\"contain\":\"auto\",document.body.style.backgroundImage=\"url(\"+n+\")\"},o.src=n};";
    QString styles = "background: #000 center no-repeat";

    stop();
    setHtml("<html><head><script>" + script + "</script></head><body onload='window.setimg(\"" + uri + "\");' style='" + styles + "'></body></html>");
}

void View::handleAuthRequest(QNetworkReply* reply, QAuthenticator* auth)
{
    Q_UNUSED(reply)
    Q_UNUSED(auth)
    load(QUrl::fromLocalFile(QStandardPaths::locate(QStandardPaths::DataLocation, "res/access_denied.html")));
}
