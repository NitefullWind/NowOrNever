#ifndef WORD_H
#define WORD_H

#include <QObject>
#include <QDebug>
class Word : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int index READ index WRITE setIndex)
    Q_PROPERTY(QString spell READ spell WRITE setSpell)
    Q_PROPERTY(QString mean READ mean WRITE setMean)
    Q_PROPERTY(int CET6_Frequency READ CET6_Frequency WRITE setCET6_Frequency)
    Q_PROPERTY(int CET4_Frequency READ CET4_Frequency WRITE setCET4_Frequency)
public:
    static int count;
    explicit Word(QObject *parent = 0);
    ~Word();
    Word(Word &word);

    int index() const {return wordIndex;}
    void setIndex(const int index) {this->wordIndex = index;}

    QString spell() const {return wordSpell;}
    void setSpell(const QString spell) {this->wordSpell = spell;}

    QString mean() const {return wordMean;}
    void setMean(const QString mean) {this->wordMean = mean;}

    int CET6_Frequency() const {return _CET6_Frequency;}
    void setCET6_Frequency(const int frequency) {this->_CET6_Frequency = frequency;}

    int CET4_Frequency() const {return _CET4_Frequency;}
    void setCET4_Frequency(const int frequency) {this->_CET4_Frequency = frequency;}

private:
    int wordIndex;
    QString wordSpell;
    QString wordMean;
    int _CET6_Frequency;
    int _CET4_Frequency;
};

#endif // WORD_H
