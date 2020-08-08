# TheatreScript
A markup language for theatre scripts, inspired by [Fountain](https://fountain.io) and [Markdown](https://daringfireball.net/projects/markdown/)

## Goals
(in decreasing order of priority)
1. Make it easy for non-technical users to learn, read, edit, and write
   1. Don't look like markup - be printable as-is (like Fountain/Markdown, unlike LaTeX)
   2. Minimize syntax and semantic edge cases
   3. Minimize user effort as well as editing software requirements
2. Support non-Latin scripts (e.g. Devanagari) and non-English languages
3. Design syntax to be forgiving of the writer's errors
   * scripts can be long and subtle errors can be difficult to spot

## Advantages
1. Can be read, edited, and written by non-technical users
2. No special editor required
3. Intended to support keywords in all languages (unlike Fountain)
4. Don't need to specify language in multi-script texts (dammit, LaTeX/XeLaTeX 🙄)

## Disadvantages
1. Can't define character name once to easily update all uses of it (unlike LaTeX+Thalie)
2. Not user-extensible (unlike LaTeX+Thalie)
3. no-syntax markup + m17n for keywords = more complexity for the compiler (unlike Fountain)

## TODO
1. Think of a new name?
2. "As-is printing" vs soft-wrapping vs preserving newlines
   * Editor support - both hard-wrapping and soft-wrapping seem to require it.
   * Printing vs electronic reading - hard-wrapped is ready to be printed; soft-wrapped is easier for reading on different screens (classic dilemma...)
   * Could let the user decide, with the compiler being able to convert between the two (including hard-wrapping to a certain width).
3. Markdown has some cool ideas about reducing writer effort. Might be work looking into.
4. Do we really need to preserve newlines?
   * Is it necessary outside of poetry?

     My most annoying experience in working with with markup that doesn't (e.g. Markdown) is when trying to write poetry. But that's easily handled with our verse syntax.
5. An idea - anything that is indented either gets center-aligned, or centered (but still left aligned) by compilers.
   * An interesting way to deduce user intent, and introduce additional control, both in the source and in the output. Fits nicely with our verse syntax, which is usually centered, AFAIK.

## Contribute
Suggestions for the following are welcome.
1. changes to the name
2. additions or changes to, or removals from, the syntax
3. keywords for your language (see [Keywords in other languages](#keywords-in-other-languages))

Check the [TODO](#todo) as well as headings named "Comments" for areas where I would appreciate feedback.

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [TheatreScript](#theatrescript)
    - [Goals](#goals)
    - [Advantages](#advantages)
    - [Disadvantages](#disadvantages)
    - [TODO](#todo)
    - [Contribute](#contribute)
- [Syntax](#syntax)
    - [Document structure](#document-structure)
        - [Headings](#headings)
        - [Title page](#title-page)
        - [Dramatis personae](#dramatis-personae)
            - [Character names and descriptions](#character-names-and-descriptions)
            - [Character groups](#character-groups)
        - [Premiere cast (optional)](#premiere-cast-optional)
        - [Outline (optional)](#outline-optional)
        - [Body - the script itself](#body---the-script-itself)
        - [Acts and scenes](#acts-and-scenes)
            - [Comments](#comments)
    - [Dialogues](#dialogues)
        - [Multi-line dialogues](#multi-line-dialogues)
        - [Comments](#comments-1)
    - [Stage directions](#stage-directions)
        - [After the character name](#after-the-character-name)
        - [In the dialogue](#in-the-dialogue)
        - [Freestanding](#freestanding)
        - [Comments](#comments-2)
    - [Verse](#verse)
    - [Songs](#songs)
        - [Introducing](#introducing)
        - [Ending](#ending)
        - [Comments](#comments-3)
    - [Formatting](#formatting)
    - [Keywords in other languages](#keywords-in-other-languages)
        - [हिंदी](#हिंदी)
        - [Keyword language detection](#keyword-language-detection)
- [License](#license)

<!-- markdown-toc end -->

# Syntax
## Document structure
### Headings
Markdown's ATX headings. A line starting with one to seven # characters, followed by one or more whitespace characters, followed by at least one alphanumeric character, is a heading.
```
# a heading
## another heading
```

### Title page
An optional title page can be started by the title, which is written using Markdown's setext-style level 1 heading.
```Latin
THE IMPORTANCE OF BEING EARNEST
===============================

A Trivial Comedy for Serious People

Playwright: Oscar Wilde
Key: Value
Key with spaces: Value with spaces
```
Compilers could center everything on the title page (starting from title to the next heading)

Indentation is permitted (even with the heading, unlike Markdown), e.g. for centering in plain text.

### Dramatis personae
A level 1 heading with either the "Dramatis personae" keyword -

`# Dramatis personae`

...or, if you want to call it something other than "Dramatis Personae", make a heading with the actual text you want, followed by the keyword in parenthesis -
```
# The persons of the play (dramatis personae)
# Characters (dramatis personae)
```
In the second example, compilers may choose to remove the parenthesized expression.

#### Character names and descriptions
1. If there are `[square brackets]`, the text in the left-most pair is the character name
   * contentious, see comments
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
1. Notable special cases
   1. In Devanagari, differentiating between a line containing only a character name (e.g. "धोबन") and a line containing only a description, with no name requiring emphasis (e.g. "पार्क में खेलते बच्चे").

      In Latin, it's resolved with capitals, e.g.
      ```Latin
      CAPTAIN HORSTER
      Men of various conditions and occupations, a few women, and a troop of schoolboys--the audience at a public meeting.
      ```

   2. The character name coming at the end of the line, e.g. "His late GRANDFATHER", or "उसके स्वर्गवासी _दादा जी_".
2. For some reason, I don't like the look of square brackets for this purpose. Can we replace them with, say, emphasis markup?
   ```Devanagari
   आलोक शर्मा, एक ग्यारवी कक्षा का छात्र
   उसके स्वर्गवासी _दादा जी_
   साक्षी शर्मा, उसकी माँ
   अरुण शर्मा, उसके पिता
   _धोबन_
   _पड़ोसन १_
   _पड़ोसन २_
   ```
   ```Devanagari
   _आलोक शर्मा_, एक ग्यारवी कक्षा का छात्र
   उसके स्वर्गवासी _दादा जी_
   _साक्षी शर्मा_, उसकी माँ
   _अरुण शर्मा_, उसके पिता
   _धोबन_
   _पड़ोसन १_
   _पड़ोसन २_
   ```
   * Note that now we have to include the commas in the emphasis too, thanks to Markdown whitespace rules concerning whitespace. And fiddling with _those_ would be an even bigger tangle.
     + Only if using emphasis for character names everywhere. If you keep it to the places where the character name can't be determined automatically, it's okay.
   * A solution relying on blank lines wouldn't do, because those are useful for separating characters into groups.
   * Asterisks seem to add noise and don't really seem to emphasize (in plain text, without syntax highlighting); square brackets seem to suffer from the same problem; I'm liking underscores more, for these reasons.
   * Another issue is that now, the same syntax has different semantics in the Dramatis Personae vs the rest of the document. Inconsistencies like this make the syntax harder to learn.
3. A hack which could decrease the use of square brackets/underscores in a common situation - we subtly abuse the rule about the comma. Of course, this is at the expense of consistent appearance.
   ```Devanagari
   आलोक शर्मा, एक ग्यारवी कक्षा का छात्र
   उसके स्वर्गवासी _दादा जी_
   साक्षी शर्मा, उसकी माँ
   अरुण शर्मा, उसके पिता
   धोबन,
   पड़ोसन १,
   पड़ोसन २,
   ```
   * What if we stop supporting the rather uncommon case of highlighting an unnamed character in Devanagari?
   * We could even get by with not highlighting character names in lines not matching the comma/parenthesis rule - such lines are usually for minor characters.
4. What if characters are list items, character groups are sub-lists, and the branch point of sub-lists is the character group name?

   That would allow arbitrary text in the Dramatis Personae, which is often used to note the setting of the play. See the last paragraph in this example -

   ```Latin
   * KING DUSHYANTA.
   * BHARATA, nicknamed All-tamer, his son.
   * MADHAVYA, a clown, his companion.
   * His charioteer.
   * RAIVATAKA, a door-keeper.
   * BHADRASENA, a general.
   * KARABHAKA, a servant.
   * PARVATAYANA, a chamberlain.
   * SOMARATA, a chaplain.

   * KANVA, hermit-father.
   * His pupils
     + SHARNGARAVA
     + SHARADVATA
     + HARITA
   * DURVASAS, an irascible sage.
   * The chief of police.
   * Policemen
     + SUCHAKA
     + JANUKA

   * A fisherman.
   * SHAKUNTALA, foster-child of Kanva.
   * Her friends
     + ANUSUVA
     + PRIYAMVADA

   * GAUTAMI, hermit-mother.
   * KASHYAPA, father of the gods.
   * ADITI, mother of the gods.
   * MATALI, charioteer of heaven's king.
   * GALAVA, a pupil in heaven.
   * MISHRAKESHI, a heavenly nymph.

   * Stage-director and actress (in the prologue), hermits and hermit-women, two court poets, palace attendants, invisible fairies.

   The first four acts pass in Kanva's forest hermitage; acts five and six in the king's palace; act seven on a heavenly mountain. The time is perhaps seven years.
   ```
5. If the lack of character 'variables' (a la LaTeX+Thalie) is a deal breaker, we could extend the markup to support character "short names" which can be used instead of character names; compilers could choose to replace one with the other (which could be desirable, or not), but if printing as-is, the short name would be used.

   Of course, this complicates the markup and breaks goal 1.1 (printable as-is), so I want to avoid it.
#### Character groups
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
### Premiere cast (optional)
Actor: character 1, character 2

### Outline (optional)
### Body - the script itself
The body is introduced with either
1. A level 1 heading with the same text as the title on the Title Page, or
2. The last level 1 ATX heading of the document.
### Acts and scenes
Acts are introduced by level 2 ATX headings in the Body, with the keyword "ACT". They may be numbered, named, or both.

```
## ACT
## ACT 1
## ACT: Name
## ACT 1: Name
```

Scenes are introduced by level 3 ATX headings in the Body, with the keyword "SCENE". Like acts, they too may be numbered, named, or both.

```
### SCENE
### SCENE 1
### SCENE: Name
### SCENE 1: Name
```

It is recommended that compilers and editors warn of numbering mistakes. Advanced editors could even autocorrect them.

#### Comments
1. Can we use SEText style level 2 headings for Acts?

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

### Comments
But what if a character's dialogue happens to coincide with the syntax of a character name?
* A hacky workaround could be to start that dialogue with a single space.
* For the colon syntax, ensure that the line ends with a colon? That would cut down on collisons...
  + But still not eliminate them entirely 🤔
* A word limit for character names could be used as a last resort.
* What if it conflicts with the SONG: keyword?

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
### Comments
* Parenthesis for stage directions may conflict with writers wishing to use parenthesis in dialogues...if it becomes a dealbreaker, square brackets may be a viable alternative.

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
Songs are [verse](#verse) blocks with a number and/or name.

### Introducing
Songs are introduced with the "SONG" keyword (capitalization mandatory).

They must be either named or numbered, but can also be both.

```
SONG: Another Hundred People
SONG #2
SONG #33: On The Steps of the Palace
```

Compilers may warn of irregularities in numbering, but note that songs may be numbered like '12, 12a, 13'.

### Ending
Songs end when
1. We reach the end of the document
2. We find a line saying "SONG END"/"SONG ENDS"/"END SONG"/"END OF SONG", or
3. We reach the end of consecutive verse blocks, i.e. there is a dialogue or a stage direction.

### Comments
1. Not at ease with the idea of song blocks being interrupted by dialogues or stage directions. I can see why they might occur between a song.
   * But if we only rely on ending the song with a keyword, that's unforgiving syntax 🤔
## Formatting
```
*italic*
**bold**
***bold italic***
_underline_
~strikethrough~
```
## Keywords in other languages
I would like for users to suggest possible synonyms for all keywords, in the language they'd like to see supported.

### हिंदी
 Keywords | Synonyms
----------|--------
SONG      | गीत, गाना
"SONG END"/"SONG ENDS"/"END SONG"/"END OF SONG" | "गीत समाप्त"/"गाना समाप्त"

### Keyword language detection

# License
I dream of a world where all software is liberated - transparent, trustable, and accessible for anyone to use or improve. But I don't want to make demands or threats (e.g. via legal conditions) to get there.

I'd rather make a request - please do everything you can to help that dream come true. Please Unlicense as much software as you can.

TheatreScript is released under your choice of [Unlicense](https://unlicense.org/) or the [WTFPL](http://www.wtfpl.net/).

(See files [UNLICENSE](UNLICENSE) and [WTFPL](WTFPL)).

<!-- Local Variables: -->
<!-- eval: (save-excursion (make-local-variable 'before-save-hook) (add-hook 'before-save-hook 'markdown-toc-refresh-toc)) -->
<!-- End: -->
