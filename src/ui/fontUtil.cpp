#include "fontUtil.h"
#include <QScreen>
#include <QGuiApplication>
#include <QFont>
#include <QFontMetrics>

FontUtil::FontUtil(QObject *parent) : QObject(parent)
{
}

int FontUtil::pixelSize(int pointSize)
{
    QScreen *screen = qApp->primaryScreen();
    int ps = (pointSize * screen->logicalDotsPerInch()) / 72;
    return ps;
}

int FontUtil::height(int pointSize)
{
    QFont font = qApp->font();
    font.setPointSize(pointSize);
    QFontMetrics fm(font);
    return fm.height();
}

int FontUtil::width(int pointSize, QString text)
{
    QFont font = qApp->font();
    font.setPointSize(pointSize);
    QFontMetrics fm(font);
    return fm.width(text);
}
