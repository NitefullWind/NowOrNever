#include "dicDB.h"
#include <QtSql/QSqlError>
#include <QSqlQuery>
#include <QSqlRecord>
#include <QDebug>

DicDB::DicDB(QObject *parent) : QObject(parent)
{
    word = new Word();
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
        word = getAWord(records.at(0));
    }
    return word;
}

Word* DicDB::getAWord(QList<QString> propertys)
{
    Word* aWord = new Word();
    if(propertys.length() >= int(WordProperty::Length))
    {
        aWord->setIndex(propertys.at(int(WordProperty::Index)).toInt());
        aWord->setSpell(propertys.at(int(WordProperty::Spell)));
        aWord->setMean(propertys.at(int(WordProperty::Mean)));
        aWord->setCET6_Frequency(propertys.at(int(WordProperty::CET6_Frequency)).toInt());
        aWord->setCET4_Frequency(propertys.at(int(WordProperty::CET4_Frequency)).toInt());
    }
    return aWord;
}

//根据索引值查询一个单词
Word* DicDB::getAWordByIndex(int index)
{
    if(index<0) {
        errorText = "索引值小于0";
        index = 0;
    }
    word = getAWord(QString("select * from table_words where id='%1'").arg(index));
    return word;
}

void DicDB::setWordList(QString tableName, int begin, int number)
{
    QString sql = QString("select * from '%1' limit %2, %3;").arg(tableName).arg(begin).arg(number);
    QList<QList<QString>> records = execSelect(sql);
    
    for(int i=0; i<records.length(); i++)
    {
        Word* aAword = getAWord(records.at(i));
        wordList.append(aAword);
    }
}

void DicDB::clearMemory()
{
    if(db.open()) {
        db.close();
    }
    qDeleteAll(wordList.begin(), wordList.end());
    wordList.clear();

}

DicDB::~DicDB()
{
    if(word!=NULL) {
        delete word;
    }
    qDebug() << "类DicDB销毁";
}
