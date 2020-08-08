# Discarded ideas
## Automatic numbering of songs
Example -

`SONG #: Epiphany`

Reason - not printable as-is (goal 1.1)

## Conventional syntax
* Do not like the use of periods for character names
* Would prefer to make character names all caps, when the writing script allows it.
* Placing character names on the same line as the dialogue reduces ease of visual recognition; placing character names on their own line also increases space, which is good for as-is printing; actors use these spaces to write notes.
```
[Enter Jack.]

[Lane goes out.]

Algernon.  How are you, my dear Ernest?  What brings you up to town?

Jack.  Oh, pleasure, pleasure!  What else should bring one anywhere? Eating as usual, I see, Algy!

Algernon.  [Stiffly.]  I believe it is customary in good society to take some slight refreshment at five o'clock.  Where have you been since last Thursday?
```

## Assuming that a particular heading is the dramatis personae
> If we assume that e.g. the first ATX heading in a file is the dramatis personae, we lose flexibility.

## "Colon, inline" style for character name and dialogue
Character name is followed by a colon and one or more whitespace characters, followed by the dialogue on the same line. Making character name all-caps is optional.
* This is more compressed, but that can work against it - actors are frequently writing notes in their printed copies, so that extra space is useful!
* Note - doesn't look good with long soft-wrapped lines, unless your editor supports soft-wrapping + soft-indenting them
```Latin
BILLING:			Hovstad, don't you think the town ought to give Dr. Stockmann some sort of testimonial?
HOVSTAD:			I will suggest it, anyway.
BILLING:			And I will speak to Aslaksen about it.
DR. STOCKMANN:	No, my good friends, don't let us have any of that nonsense. I won't hear anything of the kind. And if the Baths Committee should think of voting me an increase of salary, I will not accept it. Do you hear, Katherine?—I won't accept it.
MRS. STOCKMANN:	You are quite right, Thomas.
```
```Devanagari
आलोक: यार, एक बात बता।
ध्रुव: हाँ?
आलोक: तूने कभी statues को बोलते हुए देखा है?
ध्रुव: हाँ! जब इंसान को भूख लगती है ना, तो सब कुछ बोलता हुआ दिखता है! भाई मुझे बहुत भूख लगी है। तू घर जा, और मुझे भी जाने दे।
आलोक: यार इतनी रात को अकेला ना छोड़ यार...वो भी इस statue के साथ!
ध्रुव: तो क्या करेगा? घर तू जाएगा नहीं...ढाबे पे सोएगा?
आलोक: बकवास मत कर।
ध्रुव: अ...footpath पर सोएगा? आधा India वहाँ सोता है!
आलोक: तू चुप कर यार!
```

With some whitespace for neatness -
```Devanagari
आलोक:	यार, एक बात बता।
ध्रुव:	हाँ?
आलोक: 	तूने कभी statues को बोलते हुए देखा है?
ध्रुव: 	हाँ! जब इंसान को भूख लगती है ना, तो सब कुछ बोलता हुआ दिखता है! भाई मुझे बहुत भूख लगी है। तू घर जा, और मुझे भी जाने दे।
आलोक: 	यार इतनी रात को अकेला ना छोड़ यार...वो भी इस statue के साथ!
ध्रुव: 	तो क्या करेगा? घर तू जाएगा नहीं...ढाबे पे सोएगा?
आलोक: 	बकवास मत कर।
ध्रुव: 	अ...footpath पर सोएगा? आधा India वहाँ सोता है!
आलोक: 	तू चुप कर यार!
```

## Fountain's [Dual Dialogue](https://fountain.io/syntax#section-dual)
Example -
```Fountain
BRICK
Screw retirement.

STEEL ^
Screw retirement.
```

Reasons -
* I see it as limited - just two simultaneous speakers?
* It seems unnecessary - could just write "Both:" or "The three of them:" or "Foo, Bar and Quux:" 🤷‍
* While it's cool to see simultaneous dialogues columnized in the output, the caret doesn't, by itself, say that "these two dialogues are simultaneous" (unless the caret is some scriptwriting convention I'm not aware of, which is widespread outside of Fountain). Which breaks goal 1.1 (printable as-is).
