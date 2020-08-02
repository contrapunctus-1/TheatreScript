<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [About](#about)
    - [Goals](#goals)
    - [Advantages](#advantages)
    - [Disadvantages](#disadvantages)
    - [Notes](#notes)
    - [TODO](#todo)
    - [Tested with](#tested-with)
- [Syntax](#syntax)
    - [Headings](#headings)
    - [Title page (optional)](#title-page-optional)
    - [Dramatis personae](#dramatis-personae)
        - [Characters](#characters)
        - [Character groups](#character-groups)
    - [Premiere cast (optional)](#premiere-cast-optional)
    - [Outline (optional)](#outline-optional)
    - [Sections](#sections)
    - [Dialogues](#dialogues)
        - [Multi-line dialogues](#multi-line-dialogues)
    - [Stage directions](#stage-directions)
        - [After the character name](#after-the-character-name)
        - [In the dialogue](#in-the-dialogue)
        - [Freestanding](#freestanding)
    - [Verse](#verse)
    - [Songs](#songs)
    - [Formatting](#formatting)
- [License](#license)

<!-- markdown-toc end -->

# About
* Inspired by https://fountain.io and Markdown

## Goals
1. Don't look like markup (like Fountain and Markdown, unlike LaTeX) - printable as-is
2. Reuse existing conventions
3. Must support Devanagari
4. Design syntax to be forgiving of the writer's errors
5. Minimize user effort and editing software requirements

## Advantages
1. Can be read, edited, and written by non-technical users
2. No special editor required
3. Intended to support keywords in all languages (unlike Fountain)
4. Don't need to specify language in multi-script texts (dammit, LaTeX/XeLaTeX 🙄)

## Disadvantages
1. Can't define character name once to easily update all uses of it (unlike LaTeX+Thalie)
2. Not user-extensible (unlike LaTeX+Thalie)
3. no-syntax markup + m17n for keywords = more complexity for the compiler (unlike Fountain)

## Notes
* Line breaks preserved (like Fountain, unlike Markdown)
* Soft-wrapping recommended.
* Parenthesis for stage directions may conflict with writers wishing to use parenthesis in dialogues...if it becomes a real problem, square brackets may be a viable alternative.
* As an example of an alternative, this is the plain text style I've seen most often. Not a fan of the use of periods for delimiting character names.
  ```
  [Enter Jack.]

  [Lane goes out.]

  Algernon.  How are you, my dear Ernest?  What brings you up to town?

  Jack.  Oh, pleasure, pleasure!  What else should bring one anywhere? Eating as usual, I see, Algy!

  Algernon.  [Stiffly.]  I believe it is customary in good society to take some slight refreshment at five o'clock.  Where have you been since last Thursday?
  ```

## TODO
1. Dramatis personae - differentiate between just a character name (e.g. "Captain Horster") and a description line with no character name (e.g. "Men of various conditions and occupations, a few women, and a troop of schoolboys--the audience at a public meeting.")
   * it's possible with capitals in Latin ("CAPTAIN HORSTER" is a character name, the other line doesn't have capital words, so is just a description)...
   * ...but that's not an option in Devanagari 🤔
2. Title, dramatis personae, act, scene, song -  syntax for introducing these sections
   + and m17n for their keywords
3. Headings?
4. Verse dramas
5. [x] Do we need Fountain's Dual Dialogue?
   * I see it as limited - just two simultaneous speakers?
   * It also seems unnecessary - could just write "Both:" or "The three of them:" or "Foo, Bar and Quux:" 🤷‍♀

## Tested with
1. <https://en.wikisource.org/wiki/An_Enemy_of_the_People_(Ibsen)>
2. https://www.gutenberg.org/cache/epub/844/pg844.txt

# Syntax
## Headings
Markdown's ATX headings. A line starting with one to seven # characters, followed by one or more whitespace characters, followed by at least one alphanumeric character, is a heading.
```
# a heading
## another heading
```

## Title page (optional)
```
Key: Value
Key with spaces: Value
```
## Dramatis personae

### Characters
1. If there are `[square brackets]`, the text in the left-most pair is the character name
2. Failing that, if there are `CONSECUTIVE UPPERCASE WORDS`, the left-most set is the character name
3. Failing that, if there is a comma or parenthesis, the text before the left-most comma or opening parenthesis is the character name
4. Failing that, there is no character name; the whole line is the the character _description_

The character name is emphasized to stand out from the description.

```Latin
ALOK SHARMA, a boy studying in class 11
His late GRANDFATHER
A WASHERWOMAN
```

```Devanagari
आलोक शर्मा, एक ग्यारवी कक्षा का छात्र
उसके स्वर्गवासी [दादा जी]
साक्षी शर्मा, उसकी माँ
अरुण शर्मा, उसके पिता
[धोबन]
[पड़ोसन १]
[पड़ोसन २]
```

You may want to use square brackets everywhere, then, for consistency...
```Devanagari
[आलोक शर्मा], एक ग्यारवी कक्षा का छात्र
उसके स्वर्गवासी [दादा जी]
[साक्षी शर्मा], उसकी माँ
[अरुण शर्मा], उसके पिता
[धोबन]
[पड़ोसन १]
[पड़ोसन २]
```

Comments
1. For some reason, I don't like the look of square brackets for this purpose. Can we replace them with, say, emphasis markup?
   ```Devanagari
   *आलोक शर्मा,* एक ग्यारवी कक्षा का छात्र
   उसके स्वर्गवासी *दादा जी*
   *साक्षी शर्मा,* उसकी माँ
   *अरुण शर्मा,* उसके पिता
   *धोबन*
   *पड़ोसन १*
   *पड़ोसन २*
   ```
   * Note that now we have to include the commas in the emphasis too, thanks to Markdown whitespace rules concerning whitespace. And fiddling with _those_ would be an even bigger tangle.
2. A solution relying on blank lines wouldn't do, because those are useful for separating characters into groups.

### Character groups
Character groups in a dramatis personae are started with a blank line, the group name, a new line, and the member characters of the group as a (Markdown) list of character names.

Blank lines between the list items can be used to group them further.

An example -
```Latin
Characters on TV
* Husband
* Wife
* Son

* News anchor
* News reporter
```
## Premiere cast (optional)
Actor: character 1, character 2

## Outline (optional)
## Sections
Act, scene

## Dialogues
There are two styles -
1. All caps - a blank line, followed by the character name in all-caps, followed by a new line, and the dialogue.

   ```Latin
   BILLING
   Hovstad, don't you think the town ought to give Dr. Stockmann some sort of testimonial?

   HOVSTAD
   I will suggest it, anyway.

   BILLING
   And I will speak to Aslaksen about it.

   DR. STOCKMANN
   No, my good friends, don't let us have any of that nonsense. I won't hear anything of the kind. And if the Baths Committee should think of voting me an increase of salary, I will not accept it. Do you hear, Katherine?—I won't accept it.

   MRS. STOCKMANN
   You are quite right, Thomas.
   ```
2. Colon - a blank line, followed by the character name ending with a colon, followed by a new line, and the dialogue. Making the character name all-caps is optional, but improves legibility.
   ```Latin
   BILLING:
   Hovstad, don't you think the town ought to give Dr. Stockmann some sort of testimonial?

   HOVSTAD:
   I will suggest it, anyway.

   BILLING:
   And I will speak to Aslaksen about it.

   DR. STOCKMANN:
   No, my good friends, don't let us have any of that nonsense. I won't hear anything of the kind. And if the Baths Committee should think of voting me an increase of salary, I will not accept it. Do you hear, Katherine?—I won't accept it.

   MRS. STOCKMANN:
   You are quite right, Thomas.
   ```
There are no capitals in Devanagari, so you must use the colon style.
```Devanagari
आलोक:
यार, एक बात बता।

ध्रुव:
हाँ?

आलोक:
तूने कभी statues को बोलते हुए देखा है?

ध्रुव:
हाँ! जब इंसान को भूख लगती है ना, तो सब कुछ बोलता हुआ दिखता है! भाई मुझे बहुत भूख लगी है। तू घर जा, और मुझे भी जाने दे।

आलोक:
यार इतनी रात को अकेला ना छोड़ यार...वो भी इस statue के साथ!

ध्रुव:
तो क्या करेगा? घर तू जाएगा नहीं...ढाबे पे सोएगा?

आलोक:
बकवास मत कर।

ध्रुव:
अ...footpath पर सोएगा? आधा India वहाँ सोता है!

आलोक:
तू चुप कर यार!
```

### Multi-line dialogues
Once a character has been specified, we want it to apply to all following lines, until the next character is specified. In most cases, I expect this to work. An example -

```
KING (listening)
I think I hear some one to the right of the grove. I must find out. (He walks and looks about.) Ah, here are hermit-girls, with watering-pots just big enough for them to handle. They are coming in this direction to water the young trees. They are charming!

  The city maids, for all their pains,
    Seem not so sweet and good;
  Our garden blossoms yield to these
    Flower-children of the wood.

I will draw back into the shade and wait for them. (He stands, gazing toward them. Enter SHAKUNTALA, as described, and her two friends.)

FIRST FRIEND
It seems to me, dear, that Father Kanva cares more for the hermitage trees than he does for you. You are delicate as a jasmine blossom, yet he tells you to fill the trenches about the trees.
```

But what if a character's dialogue happens to coincide with the syntax of a character name?
* A hacky workaround could be to start that dialogue with a single space.

## Stage directions
Anything in parenthesis is displayed as stage directions.
### After the character name
```Latin
PETRA (lifting her glass)
Your health, father!
```
If using a colon, it comes last -
```Latin
PETRA (lifting her glass):
Your health, father!
```
### In the dialogue
```Latin
PETER STOCKMANN
I happened to be passing, and so—(looks into the dining-room). But you have company with you, I see.
```
```Devanagari
धोबन:
अरे, दरवाज़ा तो खुला है—(कपड़ों की गठरी उठाए अंदर आती है) भाभीजी? भाभीजी, कहाँ हो? अच्छा, आप यहाँ पर हो। (कपड़े मेज़ पर रखती है) क्या हुआ भाभीजी?
```
### Freestanding
```Latin
(SCENE.—DR. STOCKMANN'S sitting-room. It is evening. The room is plainly but neatly appointed and furnished.)
```
## Verse
Indent lines with two or more spaces
```
  The meanest vesture glows
    On beauty that enchants:
  The lotus lovelier shows
    Amid dull water-plants;

  The moon in added splendour
    Shines for its spot of dark;
  Yet more the maiden slender
    Charms in her dress of bark.
```
## Songs

## Formatting
```
*italic*
**bold**
***bold italic***
_underline_
~strikethrough~
```

# License
I dream of a world where all software is liberated - transparent, trustable, and accessible for anyone to use or improve. But I don't want to make demands or threats (e.g. via legal conditions) to get there.

I'd rather make a request - please do everything you can to help that dream come true. Please Unlicense as much software as you can.

TheatreScript is released under your choice of [Unlicense](https://unlicense.org/) or the [WTFPL](http://www.wtfpl.net/).

(See files [UNLICENSE](UNLICENSE) and [WTFPL](WTFPL)).

<!-- Local Variables: -->
<!-- eval: (progn (make-local-variable 'before-save-hook) (add-hook 'before-save-hook 'markdown-toc-refresh-toc)) -->
<!-- End: -->
