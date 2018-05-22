# Guidelines for reference

## Editing

### Metadata
* Date
* Publication
* Publication type (weekly, daily, periodical)
* Publication audience
* Editor
* Author (if possible)
* Personography
* Publication address?
* Source/Citation
### Body
* Paragraph organization
* Place references
* People references
* Direct references to personography
* Indirect references to unidentified people
* Political/class references
* This is a little bit difficult to parse? 
* What is a class reference? Reference to a person’s economic standing, so servant/master?
* Ghost references
* Framing devices

## Collecting
* “non-fiction”: news reports in a paper of record, or another newspaper that mostly publishes news stories and editorials
* Report of hoax
* Early report of haunting that turns out to be a hoax later
* Report of reaction to hoax
* “ambiguous non-fiction”: possibly fiction, possibly non-fiction, but framed as non-fiction. Usually repeating a story told to the author, who expresses doubt as to the authenticity of the haunting
* Alternatively, a true account which USES some ghost story as a tool to further some other idea, likely political
* “fictional reporting of ambiguity”: a most likely fictional account of a hoax or possible hoax, still framed as non-fiction reported to the author, the author expresses some doubt about the reliability of the ghost story
 
### Non-fiction
* Ambiguous non-fiction
* Fictional reporting of ambiguity:[Ghost Cut Ghost](../clippings/periodicals/ghostcutghost_chambers_1889.pdf)
* Something I don’t want (but will probably collect and then exclude anyway): [Ghost of a Ghost Story](../clippings/periodicals/ghostofastory_bentleys_1847.pdf)

## Copyright

<https://www.copyrightaid.co.uk/forum/viewtopic.php?t=1431>
<https://copyright.cornell.edu/publicdomain>

According to Copyright Aid, I am within my rights to make full transcriptions of texts (including electronically, with my own edits) that are out of copyright. Gale and other resources own the rights to the scans and photographs (much as they own the physical rights to the newspapers themselves) and own the images. For this reason, I cannot republish the images (oops) but I can republish the texts I derive from those images (hooray). Of course, I will need to cite where those texts came from (just like when I visit a library and photograph things there), but I don’t need to worry about them asking me to remove my texts, as they cannot legally own the copyright to something that old that they didn’t purchase and renew rights to.

Editorial Notes

Using ABBYY Finereader (FIGURE OUT WHICH VERSION) to create transcriptions of texts. There are a few issues with ABBYY that I need to either address or work around
1. Two column items sometimes are read the way a human would read them: left column and then right column. Other times, columns are read from left to right as a human would read a one-column text. This can happen in the same text, sort of an every-other-page deal. Fixing it consumes time, so this problem needs some attention.
1. Typographic long em dashes are longer than modern em dashes. Regardless, double em dashes are bad and single em dashes are good, so find all the double em dashes and replace them with single em dashes.
1. Quotation marks, question marks, and other punctuation should not be separated from letters with a space. Typographically this was done to improve readability, but with computer text it is distracting
1. Capital letters, especially ALL CAPS, can often be misread. Using Notepad ++ or another plain text editor with spell check features is helpful for catching these errors
1. Curly quotes should be used. David Birnbaum is partially to blame for this, but also when I go tag quotations the Regex is a heck of a lot easier.

## Tags
* `<TEI>`: This is the root element for every TEI document
* `<teiHeader`: Won't worry about this too much, we can fill in later, just copy and paste from example document
* `<text>`: this contains the text
* `<body>`: for my purposes we don't need both of these elements, but they're both required, so we'll have both
* `<p>`: for paragraphs
* `<q>`: for quotes, of all kinds
* `<ab>`: anonymous block, which I'm possibly abusing at the moment
* `<lb>`: line beginning, goes at the beginning of lines, is only ever a milestone tag
* `<pb>`: page beginning, goes at the beginning of pages (don't forget the first one!) HINT: in the cleaning stage, I used [PAGE BREAK] to denote page breaks