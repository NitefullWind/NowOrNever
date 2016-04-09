#ifndef DICDB_H
#define DICDB_H

//#include <QObject>
#include <QSqlDatabase>
#include "word.h"
#include "dbOp.h"

class DicDB : public DBOp
{
    Q_OBJECT
public:
    explicit DicDB(QObject *parent = 0);
    ~DicDB();    
    Q_INVOKABLE Word* getAWord(QString sql);
    Q_INVOKABLE Word* getAWord(QList<QString> propertys);
    Q_INVOKABLE Word* getAWordByIndex(int index);
    Q_INVOKABLE void setWordList(QString tableName, int begin, int number);

    Q_INVOKABLE void clearMemory();

    bool isDbExists() const;

    //单词的各个属性在记录链表中的位置
    enum WordProperty {
        Index = 0,
        Spell = 1,
        Mean = 2,
        CET6_Frequency = 3,
        CET4_Frequency = 4,
        Length = 5
    };

private:
    Word *word;
    QList<Word*> wordList;
};

#endif // DICDB_H
