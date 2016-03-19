#include "dbOp.h"
#include <QtSql/QSqlError>
#include <QSqlQuery>
#include <QSqlRecord>
#include <QDebug>

DBOp::DBOp(QObject *parent) : QObject(parent)
{

}

void DBOp::setDBInfo(QString driver, QString host, int port, QString DBName, QString use, QString pwd)
{
    db = QSqlDatabase::addDatabase(driver,driver);
    db.setHostName(host);
    db.setPort(port);
    db.setDatabaseName(DBName);
    db.setUserName(use);
    db.setPassword(pwd);
}

bool DBOp::open()
{
    if(!db.open()) {
        errorText = db.lastError().text();
        qDebug() << "数据库没打开"<<db.lastError();
        return false;
    }
    return true;
}
bool DBOp::close()
{
    if(db.open()) {
        db.close();
        return true;
    }
    return false;
}

QList<QList<QString>> DBOp::execSelect(QString sql)
{
    if(!db.isOpen()){
        return QList<QList<QString>>();
    }
    QSqlQuery query(db);
    QSqlRecord record;
    QList<QList<QString>> records;
    query.exec(sql);
    while(query.next()) {
        //获取查询到的记录
        record = query.record();
        int fieldCount = record.count();
        //将值存入链表
        QList<QString> recordList;
        for(int i=0; i<fieldCount; i++) {
            recordList.append(record.value(i).toString());
        }
        records.append(recordList);
    }
    return records;
}

DBOp::~DBOp()
{
    if(db.isOpen()) {
        db.close();
        qDebug() << "数据库"<<db.databaseName()<<"关闭";
    }
}
