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
    - [Character, dialogue](#character-dialogue)
    - [Stage directions](#stage-directions)
        - [Inline](#inline)
        - [Separate](#separate)
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

## Advantages
1. Can be read, edited, and written by non-technical users
2. No special editor required
3. Intended to support keywords in all languages (unlike Fountain)
4. Don't need to specify language in multi-script texts (damnit, LaTeX/XeLaTeX 😠)

## Disadvantages
1. Can't define character name once to easily update all uses of it (unlike LaTeX+Thalie)
2. Not user-extensible (unlike LaTeX+Thalie)
3. no-syntax markup + m17n for keywords = more complexity for the compiler (unlike Fountain)

## Notes
* Line breaks preserved (like Fountain, unlike Markdown)
* Soft-wrapping recommended.
* Parenthesis for stage directions may conflict with writers wishing to use parenthesis in dialogues...if it becomes a real problem, square brackets may be a viable alternative.
* Have seen another style, which looks like this. Not a fan of the use of periods for delimiting character names, but it's an example of an alternative.
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
   * ...but not an option in Devanagari 🤔
2. title, dramatis personae, act, scene, song -  syntax for introducing these sections, and m17n for their keywords
3. Headings?
4. [x] Do we need Fountain's Dual Dialogue?
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

### Character groups

## Premiere cast (optional)
Actor: character 1, character 2

## Outline (optional)
## Sections
Act, scene

## Character, dialogue
```Latin
ALOK
Leave me alone, Mom.

ALOK: Leave me alone, Mom.

ALOK:
Leave me alone, Mom.
```
No capitals in Devanagari, so you must use colons.
```Devanagari
आलोक: माँ, आप जाओ।
आलोक:    माँ, आप जाओ।

आलोक:
माँ, आप जाओ।
```
NB - we _could_ do without colons in Devanagari - if a line followed by a blank line is treated as a character name. But I'm not too sure about it...maybe because it doesn't visually differentiate the character name?

## Stage directions
Anything in parenthesis
### Inline
```Latin
PETER STOCKMANN
I happened to be passing, and so—(looks into the dining-room). But you have company with you, I see.
```
```Devanagari
धोबन: अरे, दरवाज़ा तो खुला है—(कपड़ों की गठरी उठाए अंदर आती है) भाभीजी? भाभीजी, कहाँ हो? अच्छा, आप यहाँ पर हो। (कपड़े मेज़ पर रखती है) क्या हुआ भाभीजी?
```
### Separate
```Latin
(SCENE.—DR. STOCKMANN'S sitting-room. It is evening. The room is plainly but neatly appointed and furnished.)
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
