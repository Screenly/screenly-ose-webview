#pragma once

#include <QMainWindow>
#include <QWebView>
#include <QNetworkDiskCache>

#include "view.h"

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow();

public slots:
    void loadPage(const QString &uri);
    void loadImage(const QString &uri);

private:
    QString cacheLocation;
    QNetworkAccessManager* manager;
    QNetworkDiskCache* diskCache;
    View *view;
};
