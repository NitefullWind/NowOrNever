#include "word.h"

Word::Word(QObject *parent) : QObject(parent)
{

}

Word::Word(Word &word)
{
    this->wordSpell = word.spell();
}
