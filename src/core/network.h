#ifndef NETWORK_H
#define NETWORK_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>

class Network : public QObject
{
public:
    explicit Network(QObject *parent = 0);
    Q_INVOKABLE void signup(QString name, QString email, QString pwd);

protected:
    QString getReplyData(QNetworkReply *reply);
    QNetworkAccessManager m_nam;
    QString m_meptyString;
    QString hostUrl;
    bool hasError;
};

#endif // NETWORK_H
