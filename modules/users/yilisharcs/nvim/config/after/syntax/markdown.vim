hi mdTextInQuotes guifg=#fab387
hi userHandle guifg=#25be6a

syn match mdTextInQuotes /\v(["])%(\1@![^\\]|\\.)*\1/
syn match userHandle /\s@\w*/
