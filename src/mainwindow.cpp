#include <QWebFrame>
#include <QStandardPaths>

#include "mainwindow.h"
#include "view.h"


MainWindow::MainWindow() : QMainWindow()
{
    QWebSettings::globalSettings()->setAttribute(QWebSettings::LocalStorageEnabled, true);

    manager = new QNetworkAccessManager(this);
    diskCache = new QNetworkDiskCache(this);
    cacheLocation = QStandardPaths::writableLocation(QStandardPaths::CacheLocation);

    diskCache->setCacheDirectory(cacheLocation);
    manager->setCache(diskCache);


    view = new View(this);
    view -> page()->setNetworkAccessManager(manager);
    view -> page()->settings()->setMaximumPagesInCache(1);
    view -> page()->mainFrame()->setScrollBarPolicy( Qt::Vertical, Qt::ScrollBarAlwaysOff );
    view -> page()->mainFrame()->setScrollBarPolicy( Qt::Horizontal, Qt::ScrollBarAlwaysOff );
    setCentralWidget(view);
}

void MainWindow::loadPage(const QString &uri)
{
    view->loadPage(uri);
}

void MainWindow:: loadImage(const QString &uri)
{
    view->loadImage(uri);
}
