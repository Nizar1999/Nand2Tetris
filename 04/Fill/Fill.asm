// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(START)
//Initialize address counter to 16384
	@SCREEN 
	D = A
	@count
	M = D
// Check keyboard input
	@KBD
	D = M
	@BLACKEN
	D;JNE
	@WHITEN
	0;JMP
(BLACKEN)
	@val
	M = -1
	@LOOP
	0;JMP
(WHITEN)
	@val
	M = 0
	@LOOP
	0;JMP
//Loop across all the pixels of the screen
(LOOP)
	@count
	D = M // Store current word address in D
	@KBD
	D = D - A //Check if current word address is address of KBD
	@START
	D;JEQ //If the current address is that of KBD exit the loop
	@val
	D = M //Else set D to color chosen
	@count
	A = M	//Store current word address in A
	M = D	//Set the value of that address to black/white
	@count
	M = M + 1 //Increment word address
	@LOOP //loop again
	0;JMP