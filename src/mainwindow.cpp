#include <QWebFrame>

#include "mainwindow.h"
#include "view.h"


MainWindow::MainWindow() : QMainWindow()
{
    view = new View(this);
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
