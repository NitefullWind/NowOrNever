#include "word.h"

Word::Word(QObject *parent) : QObject(parent)
{
    qDebug() << "创建了一个新单词: "<< count++;
}

Word::Word(Word &word)
{
    this->wordIndex = word.index();
    this->wordSpell = word.spell();
    this->wordMean = word.mean();
    this->_CET4_Frequency = word.CET4_Frequency();
    this->_CET6_Frequency = word.CET6_Frequency();
}

Word::~Word()
{
    qDebug() << "销毁单词："+this->spell()<<count--;
}

int Word::count = 0;
