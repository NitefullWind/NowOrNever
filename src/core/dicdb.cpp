#include "dicDB.h"
#include <QtSql/QSqlError>
#include <QSqlQuery>
#include <QSqlRecord>
#include <QDebug>

DicDB::DicDB(QObject *parent) : QObject(parent),
    word(new Word())
{
    qDebug() << "类DicDB创建";
}

bool DicDB::connect(QString name)
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(name);
    if(!db.open()) {
        errorText = db.lastError().text();
        return false;
    }
    return true;
}

QList<QList<QString>> DicDB::execSelect(QString sql)
{
    if(!db.isOpen()){
        return QList<QList<QString>>();
    }
    QSqlQuery query;
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

//使用SQL语句查询一个单词
Word* DicDB::getAWord(QString sql)
{
    //调用execSelect取得其第一个元素
    QList<QList<QString>> records = execSelect(sql);

    if(!records.isEmpty()){
        QList<QString> record = records.at(0);
        word->setIndex(record.at(int(WordProperty::Index)).toInt());
        word->setSpell(record.at(int(WordProperty::Spell)));
        word->setMean(record.at(int(WordProperty::Mean)));
    }
    return word;
}

//根据索引值查询一个单词
Word* DicDB::getAWordByIndex(int index)
{
    if(index<0) {
        errorText = "索引值小于0";
        index = 0;
    }
    word = getAWord(QString("select * from Words where id='%1'").arg(index));
    return word;
}

DicDB::~DicDB()
{
    db.close();
    delete word;
    qDebug() << "类DicDB销毁";
}
