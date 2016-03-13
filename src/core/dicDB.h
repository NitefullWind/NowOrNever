#ifndef DICDB_H
#define DICDB_H

#include <QObject>
#include <QSqlDatabase>
#include "word.h"

class DicDB : public QObject
{
    Q_OBJECT
public:
    explicit DicDB(QObject *parent = 0);
    ~DicDB();
    Q_INVOKABLE bool connect(QString name);
    Q_INVOKABLE QList<QList<QString>> execSelect(QString sql);
    Q_INVOKABLE Word* getAWord(QString sql);
    Q_INVOKABLE Word* getAWordByIndex(int index);
    Q_INVOKABLE QString getErrorText() {return errorText;}

    //单词的各个属性在记录链表中的位置
    enum WordProperty {
        Index = 0,
        Spell = 1,
        Mean = 2
    };

private:
    QSqlDatabase db;
    QString errorText;
    Word *word;
};

#endif // DICDB_H
