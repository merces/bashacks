# Bashacks Code Style 

See this document as a source of recommendations and try permform this.

*Have fun in your code!!!*  ;)

## General considerations
 * Limit your code in **78 col**
 * Avoid using more than one command per line.
 * All interaction with its function must be by **parameters** or **file** reading.
 * Keep your code indented use **TAB**.
 * The tab must have **4 spaces**
 * All development must be the develop branch.

After cloning the repository.

```bash
$ git branchs
  develop
* master
$ git checkout develop
Switched to branch 'develop'
$ git branch 
* develop
  master
```


## Functions
 * The name of all functions must be prefixed with **bh_**.
 * Should be alphanumeric ([a-z0-9]){1,20}, *no limit your mind*.
 * Do not use accent, hyphen, punctuation.
 * The name of all functions must be **english**.
 * All functions should return True 0 (zero) or False 1 (one), except cases like *bh_asciitable* e *bh_str2hex*.
 * To document their function use the man page, do not create help.
 * Always validate the arguments sent to a function, validate that the information is expected mode.

###### Corret:
```bash
bh_isreversedns() {
        return 0
}
```

###### Incorrect
```bash
function bh_isreversedns {
        return 0
}
```

###### Incorrect
```bash
bh_isreversedns()
{
        return 0
}
```

## Variables

 * Only use local variables. Always use the command **'local'** always use at the beginning of the function.
 * Local variables with attributes, only use one per line.
 * Only lowercase letters should compose the name of the variable [a-z0-9]+
 * All variables must be declared and initiated.
 * To work with variable use **"$"** dollar sign **"$nome"** except array.
 * Whenever possible use **"double quotes"** or **'single quotes'** to protect the contents of the variable


```bash
 local stname=""
 local arrayobject=()
 local number=0
```
###### Corret:
```bash
bh_isreversedns() {
    local ipaddress="$1"
    local fqdn="$2"
    local status=1

    return 0
}
```

## code block 

 * When using commands with many parameters use **backslash** to keep readable code.
 * We Don't want to be boring in the use of **'if/the/else/fi'**, there are several ways of doing only want common sense.
 * Avoid using unnecessary blank spacing, use only one of each line.
 * To comment of your code use the character **'#'** 'be clear to do'.
 * Don''t use apostrophe, use **"$(...)"**
 * Make sure that the outpu isn't committed to its validations, use the **/dev/null** always that necessary.
 * Always that use pipe uses **backslash** and send the pip for next line, with this we can identify which part of code is on the next line.
 * Use one row for each keyword **'if/then/else/fi'** **'for/do/done'** **'while/do/done'**
 * Avoid using **Eval** **(Avoid)**

###### Example
```bash
 for i in {1..5}
 do
     echo $i
 done
```
```bash
 while read foo
 do
     echo "$foo"
 done < file.txt
```

###### Correta:
```bash
bh_isreversedns() {
    local ipaddress="$1"
    local fqdn="$2"
    local status=1

    # para que a função cumpra seu objetivo são esperados dois argumentos
    # se não forem informados saia retornando Falso.
    [ $# -ne 2 ] && return $status
    
    # observer que antes do pipe foi escapado, e ao olhar sei que parte do código
    # pertence a estrutura acima
    if host -t ptr "$ipaddress" \
               | cut -d ' ' -f5 \
               | grep "^$fqdn\.$" > /dev/null 
    then
            status=0
    fi
           
    return $status
}
```

## How much the manual page

* Each function will have its man page.
* The official language is English





###### Reference

https://github.com/funcoeszz/funcoeszz/wiki/Coding-Style




