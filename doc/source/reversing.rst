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


bh_replacestring
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


bh_zerostring
----------

Replace with zero bytes in block or common file.

.. note::

    Usage
    
        ``bh_zerostring`` [ file ] [ string to replace ]

.. code-block:: bash 

    # hexdump -C MB_DEV
    .....
    00005860  41 4d 00 42 00 2d 00 66  00 69 00 0f 00 a1 6c 00  |AM.B.-.f.i....l.|
    00005870  65 00 2e 00 74 00 78 00  74 00 00 00 00 00 ff ff  |e...t.x.t.......|
    00005880  4d 42 2d 46 49 4c 45 20  54 58 54 20 00 41 26 be  |MB-FILE TXT .A&.|
    00005890  69 54 69 54 00 00 26 be  69 54 05 00 1b 00 00 00  |iTiT..&.iT......|
    .....
    # bh_zerostring MB_DEV MB-FILE
    7+0 records in
    7+0 records out
    7 bytes copied, 7.3484e-05 s, 95.3 kB/s
    # hexdump -C MB_DEV 
    .....
    00005860  41 4d 00 42 00 2d 00 66  00 69 00 0f 00 a1 6c 00  |AM.B.-.f.i....l.|
    00005870  65 00 2e 00 74 00 78 00  74 00 00 00 00 00 ff ff  |e...t.x.t.......|
    00005880  00 00 00 00 00 00 00 20  54 58 54 20 00 41 26 be  |....... TXT .A&.|
    00005890  69 54 69 54 00 00 26 be  69 54 05 00 1b 00 00 00  |iTiT..&.iT......|
    .....
    # mount -o loop -t vfat MB_DEV /mnt/
    # ls -la /mnt/
    total 16
    drwxr-xr-x 2 root root 16384 Dec 31  1969 .
    drwxr-xr-x 1 root root   152 Feb 17 15:21 ..

