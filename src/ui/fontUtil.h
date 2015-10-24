#ifndef FONTUTIL_H
#define FONTUTIL_H

#include <QObject>

class FontUtil : public QObject
{
    Q_OBJECT
public:
    explicit FontUtil(QObject *parent = 0);

    Q_INVOKABLE int pixelSize(int pointSize);
    Q_INVOKABLE int height(int pointSize);
    Q_INVOKABLE int width(int pointSize, QString text);
};

#endif // FONTUTIL_H
