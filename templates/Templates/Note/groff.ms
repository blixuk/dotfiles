.de BL
.IP \(bu 2
..
.TL
Title
.AU
Author Name
.AI
Authors Institution
.AB
Abstract Text
.AE
.nr PS 11
.NH
Numbered Heading
.XS
Numbered Heading
.XE
.NH 2
Numbered Heading
.XS
	Numbered Heading
.XE
.NH 3
Numbered Heading
.XS
		Numbered Heading
.XE
.LP
Sets a paragraph without an initial indentation.
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

.PP
Sets a paragraph with an initial indentation.
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

.QP
Sets a paragraph that is indented at both left and right margins.
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

.LP
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
.RS
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
.RE
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

.B1
This should draw a box around a section of text.
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
.B2

.LP
Center
.EQ C
A * B = 30
.EN
Left
.EQ L
A * B = 30
.EN
Indent
.EQ I
A * B = 30
.EN

.B Bold ) (

.I Italic ) (

.CW Constant\0Width ) (

.BX Box\0Text

.UL Under\0Line -

.LG 
BIG

.SM 
small

.NL
Normal Text

\*{Super Script\*}

.PP
A bulleted list:
.IP \[bu] 2
Item 1
.IP \[bu]
Item 2
.IP \[bu]
Item 3

.nr step 1 1
A numbered list:
.IP \n[step] 2
Item
.IP \n+[step]
Item
.IP \n+[step]
Item

.IP \[bu] 2
Items:
.RS
.IP \[bu]
Sub-item
.IP \[bu]
Sub-item
.IP \[bu]
Sub-item
.RE
.IP \[bu]
Item

.FS [1]
this is some footnote
.FE
.FS 2
this is another footnote
.FE

.SH
.BL
hello
.BL
test
\# this is a comment
.TC