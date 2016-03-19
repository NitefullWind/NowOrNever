#ifndef DBOP_H
#define DBOP_H

#include <QObject>
#include <QSqlDatabase>

class DBOp : public QObject
{
    Q_OBJECT
public:
    explicit DBOp(QObject *parent = 0);
    ~DBOp();
    Q_INVOKABLE bool open();
    Q_INVOKABLE bool close();
    Q_INVOKABLE QList<QList<QString>> execSelect(QString sql);
    Q_INVOKABLE QString getErrorText() {return errorText;}
    Q_INVOKABLE void setErrorText(const QString errorText) {this->errorText = errorText;}
private:
    QString errorText;
protected:
    QSqlDatabase db;
    void setDBInfo(QString driver, QString host, int port, QString DBName, QString use, QString pwd);
};

#endif // DBOP_H
