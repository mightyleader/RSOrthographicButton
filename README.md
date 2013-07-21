RSOrthographicButton
====================

A FlatUI-style UIButton subclass, UIAppearance compliant.

Good for iOS5 and above... currently tested in iOS6.1.2 and working fine...

Free to use/amend for personal or commercial use. 
All I ask is that I get a credit somewhere in the app or app store description, 
that you let me know and don't mind me mentioning you using it in blogs, social postings etc...

Using RSOrthographicButton
--------------------------

You can either add it straight to you .xib file by dragging in a UIButton an dthen changing the class to RSOrthographicButton
or you can instantiate in code with initWithFrame:

Since it's a UIButton subclass it's got all the rest of the standard behaviour.

Configuring RSOrthographicButton
--------------------------------
Check the header for the full lowdown on configurable properties and which are UIAppearance compliant.
However if you like to be told what to do, and I know I do....

**NSInteger shadowDrawnOffset** - the offset value for the shadow, applied to both x and y position (hence orthographic)

**CGFloat   shadowAlpha**       - opacity of the shadow 

**NSInteger cornerButtonRadius**      - applied to both the button and the shadow

**UIColor   *buttonColor**      - The unselected/highlighted button colour

**UIColor   *selectColor**      - The highlighted/selected button colour

**UIColor   *shadowColor**      - The colour of the shadow

UIAppearance compliance
-----------------------
In short, yes. Thanks to some good advice on NSHipster [here](http://nshipster.com/uiappearance/).
You can call the accessors of any of the above properties from the UIAppearance proxy and it'll behave.
Read the docs on UIAppearance as it's something we should all be doing...
