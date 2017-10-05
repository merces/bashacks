Reversing
=========

bh_asmgrep
----------

With the binary attempts to find instruction asm and print 4 lines around.


.. note::

    Usage

        ``bh_asmgrep``` [ asm instruction ] [ binary path ] 

.. code-block:: bash 
    
    $ bh_asmgrep mov /bin/ls 
    ....
    ....
    ....
    --
    409f2e:66 90                : xchg   %ax,%ax
    409f30:80 7c 13 ff 2f       : cmpb   $0x2f,-0x1(%rbx,%rdx,1)
    409f35:48 8d 42 ff          : lea    -0x1(%rdx),%rax
    409f39:75 08                : jne    409f43 <__sprintf_chk@plt+0x7783>
    409f3b:48 89 c2             : mov    %rax,%rdx
    409f3e:48 39 d5             : cmp    %rdx,%rbp
    409f41:75 ed                : jne    409f30 <__sprintf_chk@plt+0x7770>
    409f43:48 83 c4 08          : add    $0x8,%rsp
    -- 
    .....
    .....
    .....


bh_asminfo
----------

Display information of instructions asm internet is required for help us.

.. note::

    Usage
    
        ``bh_asminfo`` [ asm instruction ]

.. code-block:: bash 

    $ bh_asminfo mov 
    mov
                                                                              
    |Code   |Mnemonic        |Description                                         |
    |88 / r |MOV r/m8, r8    |Move r8 to r/m8                                     |
    |89 / r |MOV r/m16, r16  |Move r16 to r/m16                                   |
    |89 / r |MOV r/m32, r32  |Move r32 to r/m32                                   |
    |8A / r |MOV r8, r/m8    |Move r/m8 to r8                                     |
    |8B / r |MOV r16, r/m16  |Move r/m16 to r16                                   |
    .......
    .......
    .......



bh_intel
--------

Sets the debugger disassembly style to displays the disassembly code in Intel style.

.. note::
    
    Usage
        
        ``bh_intel`` [on | off]

.. code-block:: bash 

    $ bh_intel on
    $ gdb ./input 
    ....
    (gdb) disassemble main
    Dump of assembler code for function main:
    0x0000000000400506 <+0>:push   rbp    
    0x0000000000400507 <+1>:mov    rbp,rsp: 
    0x000000000040050a <+4>:mov    DWORD PTR [rbp-0x4],edi
    0x000000000040050d <+7>:mov    QWORD PTR [rbp-0x10],rsi
    0x0000000000400511 <+11>:mov   eax,0x0
    0x0000000000400516 <+16>:pop   rbp
    0x0000000000400517 <+17>:ret
    End of assembler dump.
    (gdb)

    # or off

    $ bh_intel off
    $ gdb ./input 
    (gdb) disass main
    Dump of assembler code for function main:
    Dump of assembler code for function main:
    0x0000000000400506 <+0>:	push   %rbp
    0x0000000000400507 <+1>:	mov    %rsp,%rbp
    0x000000000040050a <+4>:	mov    %edi,-0x4(%rbp)
    0x000000000040050d <+7>:	mov    %rsi,-0x10(%rbp)
    0x0000000000400511 <+11>:	mov    $0x0,%eax
    0x0000000000400516 <+16>:	pop    %rbp
    0x0000000000400517 <+17>:	retq   
    End of assembler dump.
    (gdb)

