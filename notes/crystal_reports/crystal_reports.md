# Crystal Reports

## As much as I hate crystal, here are a couple of helpful function examples:

### Format Phone numbers using "Picture"

```if length({EVXBILLING2.BILLTOPHONE})= 10 then Picture({EVXBILLING2.BILLTOPHONE}, "(xxx) xxx-xxxx") else {EVXBILLING2.BILLTOPHONE}```


```
Picture (string, picture)
Basic and Crystal syntax.

Arguments
String is a text string to be formatted according to the picture format. 
Picture is a text string representing the way you want the characters in the string to be printed. 
Return
string

Action
Picture (string, picture) prints a string or values in a text string in a predetermined format.

Typical Uses
Picture can be used to print a string "2065555555" in a telephone number format "(206) 555-5555", or to print other strings in fixed formats. If you are using a database field as the string, it will only work if the field is of a fixed and known length.

Note:    You cannot use an asterisk as a wildcard in the picture argument. If you put an asterisk in the argument, it will show up as an asterisk in the resulting string.
```

[home](/jason-notes)<br>