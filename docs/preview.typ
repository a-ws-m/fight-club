#import "@preview/fight-club:0.1.0": tekken
#set page(width: 150mm, height: auto, margin: 7mm, fill: white)
#set text(size: 12pt)
*Heihachi: Electric Wind God Fist* #h(1em) #tekken("f,n,d,df:2")

*Kazuya: Hellsweep* #h(1em) #tekken("f,n,d,df+4,1")

*Kazuya: Hellsweep without plus signs* #h(1em) #tekken("f,n,d,df+4,1", plus: false)

*Kazuya: Hellsweep without separators* #h(1em) #tekken("f,n,d,df+4,1", separator: false)

*Steve: string* #h(1em) #tekken("4,1,2~1")

*Ki Charge* #h(1em) #tekken("1+2+3+4", numbers: true)

*Law: combo*

#tekken("df+2, 4, u+3, df+1, 2, f, f+4, 1+2, df+1, 2, f, f+4", display: true)
