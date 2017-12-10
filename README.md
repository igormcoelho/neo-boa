<p align="center">
  <img
    src="http://res.cloudinary.com/vidsy/image/upload/v1503160820/CoZ_Icon_DARKBLUE_200x178px_oq0gxm.png"
    width="125px;">
</p>

<h1 align="center">neo-boa (for standalone javascript)</h1>

<p align="center">
  Python compiler for the Neo Virtual Machine (Fork intended to provide standalone javascript)
</p>


The `neo-boa` compiler is a tool for compiling Python files to the `.avm` format for usage in the [Neo Virtual Machine](https://github.com/neo-project/neo-vm/) which is used to execute contracts on the [Neo Blockchain](https://github.com/neo-project/neo/).

The compiler supports a subset of the Python language ( in the same way that a _boa constrictor_ is a subset of the Python snake species)


#### What I was trying to do (in this fork)

My idea was to port neo-boa as a standalone javascript application, in order to provide an online compiler for Neo (with all computations made in client side).
During the last two weeks I fought three different battles and lost all three... So I didn't manage to port it, but I'll tell you what I tried, if you wanna try something else :)

## Idea 1 - Use pypyjs (v2) available

Pypyjs is freely available for Python 2.6.0 and I intended to use it for neo-boa. So I tried to port neo-boa to Python 2.
I expected some troubles to move to Python 2 (that started with library byteplay3) but the idea died when I met function compile(), that didn't accept much of the notation expected for the smart contracts (such as parameter typed functions, only available in Python 3)

## Idea 2 - Use pypyjs (v3)

I tried to compile the script with Cython and convert with emscripten (however python3.5 was missing for javascript).
After, the idea was to build pypyjs v3 from scratch based on instructions on the official website. After having many problems with PyPy3-5.9.0, I decided to port PyPy2-5.9.0 before. This time, I managed to go far, and ported many of the changed made to rpython 2.6.0... however, it seems that some major changes happened after PyPy2-5.3+ that affected emscripten compilation with problems I couldn't solve. The script is still there if someone wants to figure it out, just remember to download emscripten suite from pypyjs docker (around 20GB).

## Idea 3 - Use Brython

When I discovered Brython, I thought all problems were solved... One issue was related to `import array` (not available in Brython), but it seems it's somehow not used in byteplay3. Other issues I managed to solve and put all files together in a single neo-boa script. Everything was perfect, until the last minute a conflict arised between byteplay3 and Brython. Current Brython is 3.3.4, and byteplay3 requires 3.4+.


## Next steps

I will keep an eye on emerging javascript translators such as Transcrypton (that didn't work either because of importlib _imp and opcode _opcode dependencies), or hope for a pypyjs3.4+ or Brython 3.4+ in the next months.
Ideas? :) 



