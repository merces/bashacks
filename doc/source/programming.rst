Programming
===========

Session for the creation of facilitators for development in cli


bh_skel_c
---------
Generates on the standard  output ``C`` skeleton.

.. note::

    Usage

        ``bh_skel_c``

.. code-block:: bash 
    
    $ bh_skel_c  
    #include <stdio.h>

    int main(int argc, char ***argv[]**) {

        return 0;
    }


bh_skel_go
---------
Generates on the standard  output ``go`` skeleton.

.. note::

    Usage

        ``bh_skel_go``

.. code-block:: bash 
    
    $ bh_skel_go  
    package main

    import (
        "fmt"
    )

    func main() {

        fmt.Println("test")
    }


bh_skel_latex
---------
Generates on the standard  output ``latex`` skeleton.

.. note::

    Usage

        ``bh_skel_latex``

.. code-block:: bash 
    
    $ bh_skel_latex
    \documentclass{article}

    \usepackage[english]{babel}
    \usepackage[utf8]{inputenc}
    \usepackage[margin=1in]{geometry}

    \author{}
    \title{}

    \begin{document}
    \maketitle

    \end{document}

    
bh_skel_python
--------------

Generates on the standard  output ``python`` skeleton.

.. note::

    Usage

        ``bh_skel_python``

.. code-block:: bash 
    
    $ bh_skel_python
    #!/usr/bin/env python
    # *-* coding: utf-8 *-*

    if __name__ == '__main__':


bh_skel_yara
--------------

Generates on the standard  output ``yara`` skeleton.

.. note::

    Usage

        ``bh_skel_yara``

.. code-block:: bash 
    
    $ bh_skel_yara
    rule test {
    meta:
        author = "mb"
        description = ""
        date = "2022-03-03"
        ref = ""
        hash = ""

    strings:
        $a = "test" ascii wide

    condition:
        all of them
    }


