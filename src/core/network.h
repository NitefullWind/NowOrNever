#ifndef NETWORK_H
#define NETWORK_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>

class Network : public QObject
{
    Q_OBJECT
public:
    explicit Network(QObject *parent = 0);
    Q_INVOKABLE void login(QString email, QString pwd);

signals:
    void finished(bool isOk, QString info);

public slots:
    void onReplyFinished(QNetworkReply *reply);

private:
    QNetworkAccessManager m_nam;
    QString m_meptyString;
    QString hostUrl;
};

#endif // NETWORK_H
