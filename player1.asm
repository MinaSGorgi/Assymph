checkThenDraw MACRO Msg
    LOCAL skip
    CMP CX, 0
    JB skip
    CMP CX, 640
    JAE skip
    INT 10H
    skip:
ENDM checkThenDraw

.MODEL SMALL
        .STACK 64
        .DATA
        noteMap             db  9,11,0,4,5,8
        note                db  3,0,5,0,1,1,2,1,0,0,1,0,5,5,0,5,4,0,5,4,3,3
        noteSiz             EQU $-note
        color               db  0AH,0AH,0CH,0AH,0AH,0AH,0AH,0AH,0AH,0AH,0AH,0AH,0CH,0CH,0AH,0CH,0CH,0AH,0CH,0CH,0AH,0AH
        octave              db  0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        position            dw  4 dup (?)
        index               dw  ?
        gameSpeed           dw  6
        GAP                 EQU 0160
        SQUARE_POSITION     EQU 41
        playernum           EQU 0AH
        scanCode            db  72 , 77 , 80 , 75 , 05
        flag                db  0
        col                 db  ?
        MarGameOverN        dw  2280,3043,3619,2711,2415,2711,2873,2559,2873,3043,3416,3043,3416,3043
        MarGameOverL        EQU  $-MarGameOverN
        MarGameOverD        dw  3,3,3,2,2,2,2,2,2,3,3,1,1
        WinN                dw  2280,2280,2415,2415,2711,2711,3043,3043,2711,2711
        WinL                EQU  $-WinN
        WinD                dw  3,3,3,3,3,3,3,3,3,3
		DrawN       	    dw  3834,3619,3224,3043,3834,3619,3224,3043,2280,2415
		DrawL               EQU ($-DrawN)
		DrawD               dw  2,3,1,3,1,2,1,2,1,3
        PositionX           db  ?
        PositionX1          db  ?
        PositionY           db  ?
        CurPositionX        db  ?
        CurPositionX1       db  ?
        CurPositionY        db  ?
        CurPositionY1       db  ?
        msgMainMenu         db  9,9,9,'-To start chatting press 1'
                            db  0AH,9,9,9,'-To start Assymphony game press 2'
                            db  0AH,9,9,9,'-To end the program press ESC'
                            db  0AH,9,9,9,"Note: You can't have more than 10 notifications$"

        msgNameEntry        db  9,9,9,'************************',0AH
                            db  9,9,9,'*Welcome to Assymphony!*',0AH
                            db  9,9,9,'************************',0AH,0AH,0AH,0AH,0AH,0AH
                            db  0AH,0AH,9,9,9,'Please enter your name: ',0AH
                            db  9,9,'(Max 15 letters And Start with a letter)',0AH,9,9,9
       playerName           db  30 dup('$')
       otherPlayerName      db  30 dup('$')
	   endNameEntry         db  10 , 13 , 9,9,9  ,'Press Enter Key to Continue$'
	   isSent               db 1
	   string2Counter       dw 0
	   string1Counter       dw 0
       msgWelcome           db  9,9,9,'Welcome, $'
       msgLoadingHat        db  '  ___$',0AH
       msgLoadingStm        db  '_/ _/$'
       msgGameManual        db  9,9,9,'************************************',0AH
                            db  9,9,9,'*Welcome to Assymphony game manual!*',0AH
                            db  9,9,9,'************************************'
                            db  0AH,0AH
                            db  'A pattern of arrows will enter the screen from the right.',0AH
                            db  'You should press the corresponding arrow on your keyboard '
                            db  'when it is within the square to the left.',0AH
                            db  'Press the arrow only when it is your color.',0AH
                            db  "Don't press the X.",0AH
                            db  'You lose when you: ',0AH,'-Press a wrong arrow',0AH
                            db  '-Miss an arrow',0AH
                            db  "-Press an arrow which doesn't have your color",0AH
                            db  "-Press an arrow when it is not in the sqaure",0AH
                            db  '-Press when it is X.',0AH
                            db  "As you keep on pressing the arrows in the right sequence, "
                            db  "muscial notes",0AH,"corresponding to the arrows are produced "
                            db  "producing a beautiful symphony!",0AH
                            db  'Have fun with a friend playing "Assymphony"!'
                            db  0AH,0AH,0AH,0AH
                            db  'Press Enter to Continue$'
       player1Msg           db  9,9,9,'Your Color is Cyan$'
	   player2Msg           db  9,9,9,'Your Color is Red$'
       msgTabSpace          db  9,9,9,'$'
       chatSendNotif        db  'You send your friend chat request wait until he accept it' , '$'
       gameSendNotif        db  'You send your friend game request wait until he accept it', '$'
       chatReceiveNotif     db  ' sent you chat request press 1 to accept it'  , '$'
       gameReceiveNotif     db  ' sent you game request press 2 to accept it'  , '$'
       gamenotifications    db  'Press F4 to Pause the game' ,10 , 13
                            db  'Press Ctrl+E to END the Game and back to Main Menu$'
       chatNotification     db  'Press ESC to Back to Main Menu' , 10 , 13 , '$'
       pauseNotification    db  'Press F4 to Resume Game$'
       sendNotifications    db  10 dup(?)
	   receiveNotifications db  10 dup(?)
       sendIDX              dw  0
	   receiveIDX           dw  0
       chooseLevelMsg       db  9,9,9,'Press 1 for Easy'
                            db  0AH,9,9,9,'Press 2 for Medium'
                            db  0AH,9,9,9,'Press 3 for Hard$'
       myScore              dW  0
	   otherPlayerScore     dW  0
	   scoreMsg             db  "'s Score : $"
	   scoreStr             db  10 dup('$')
	   wonMsg               db  9,9,9,'YOU WON ^_^',10,13,'$'
	   loseMsg              db  9,9,9,'YOU LOST -_-',10,13,'$'
       drawMsg              db  9,9,9,"IT'S DRAW!!!",10,13,'$'
	   newLines             db  10,13,'$'
	   tabs                 db  9,9,9,'$'
	   waitingMsg           db  9,9,9,'Waiting For Other Player to Join....'
	                        db  10 , 13 , 9,9,9,'To Exit Press Esc$'
        .CODE
MAIN    PROC FAR
        MOV AX,@DATA
        MOV DS,AX
		CALL nameEntryMenu
        CALL gameManual
        CALL INITICHAT
		CALL RECEIVEEVENT
  WAITOTHERPLAYER:              ; WAIT OTHER PLAYER TO ENTER
        CALL WAITPLAYER
		CMP AL , 27
		JNZ MAINMENUSTART
		JMP FINISHMAIN
  MAINMENUSTART:
        CMP otherPlayerName[0] , '$'
		JNZ RESUMEMENU
		CALL GETNAME
		CALL checkOtherName   ; CHECK IF I RECEIVED THE OTHER PALYER NAME CORRECTLY
   RESUMEMENU:
        CALL MAINMENU

        CMP AL , 27
        JE  MIDDLE
        CMP AL , 0FFH
		JZ WAITOTHERPLAYER

        CMP AL , 1
        JZ  CHATMODE
		JMP JUSTGAME
  CHATMODE:
        CALL JUSTCHAT
        JMP MIDDLE2
  JUSTGAME:
        MOV AL,00
		MOV AH,0CH
		INT 21H     ; Clear Keyboard Buffer
		MOV AH, 0
        MOV AL, 12H
        INT 10H     ; Switch to Graphics Mode

        CALL INTIALIZATION
        CALL GAMENOTIF   ; GAME notifications
        CALL SHOWNAME
    RESUMEGAME:
		CALL STARTGAME
 GAMELOOP:
        CALL RECEIVE     ; CHECK IF THE OTHER PLAYER SENT A MASSAGE
        CMP AL , 3EH     ; CHECK FOR PAUSE
        JNZ NOTPAUSE
        CALL PAUSE
    NOTPAUSE:
        CMP AL ,  0FFH   ; CHECK IF I WON THIS TURN
		JZ MIDDLE4
		CMP AL , 5      ; CHECK IF OTHER PLAYER END THE GAME
		JZ MIDDLE5
	    CALL SHOWME	     ; DRAW THE ARROWS
        CMP Position[0] , -39  ; CHECK IF FIRS ARROW HAVE BEEN OUTSIDE THE SCREEN
        JG  PROCEED
        CALL ADJUST

        CMP flag , 0    ; IF FLAG = 0 THIS MEANS THAT THE USER DOESN'T PRESS ANY ARROW AND HE LOST THE GAME
        JZ  MIDDLE3     ; LOST BECAUSE HE DIDN'T PRESS HIS ARROW
        MOV flag , 0
    PROCEED:
        MOV BX , index
        CMP note[BX] , 4
        JAE NOTME
        CMP color[BX] , playernum
        JZ CONTINUE
    NOTME:
        MOV flag , 1  ; IT'S X SHAPE OR OTHER PLAYER TURN
    CONTINUE:
        JMP AFTERMIDDLE
		MIDDLE :                       ;MIDDLE JUMP1 FROM START TO FINISH
		  JMP FINISHMAIN
		MIDDLE1:                       ; MIDDLE JUMP2 FROM GAME TO MAIN MENU
		  JMP MAINMENUSTART
		MIDDLE2:                       ; MIDDLE JUMP3 FROM CHAT TO MAINMENU
		  JMP STARTAGAIN
		MIDDLE3:                       ; MIDDL  JUMP4 TO LOSE GAME
		  JMP LOSEGAME
        MIDDLE4: 					   ; MIDDL  JUMP5 TO WIN GAME
          JMP WINGAME
        MIDDLE5:	 					   ; MIDDL  JUMP6 TO STOP GAME
          JMP STOPGAME
		AFTERMIDDLE:

        MOV AH, 01
        INT 16H
        JZ GAMELOOP  ; NO KEY PRESSED
        MOV AH, 00
        INT 16H
        ;CHECK IF THE KEY PRESSED IS ARROW OR JUST A CHARACTER
        MOV CX , 4
        MOV BX , 0
        CHECKLOOP:
           CMP AH , scanCode[BX]
           JZ INGAME   ; IT'S AN ARROW
           INC BX
           LOOP CHECKLOOP
        CMP AL ,  5
        JZ STOPGAME      ;EXIT GAME
        CMP AH , 3EH
        JNZ CHAR
        MOV AL ,3EH
        CALL SENDEVENT
        CALL PAUSE
        JMP GAMELOOP
     CHAR:
        CALL SEND        ; CALL SEND TO SEND THE CHAR TO OTHER PLAYER
        JMP GAMELOOP
    INGAME:
        ; CHECK IF IT'S THE PLAYES'S TURN
		MOV DH,AH
        MOV SI , index
        CMP color[SI] , playernum
        JNE LOSEGAME           ; LOST BECAUSE HE PRESSED NOT IN HIS TURN
        ; CHECK IF HE PRESSED THE RIGHT ARROW
        MOV BL ,note [SI]
        MOV BH,00
        MOV CL , scanCode[BX]
        CMP DH,CL
        JNE LOSEGAME           ; LOST BECAUSE HE PREESED THE WRONG ARROW
        MOV flag , 1
        JMP GAMELOOP
    LOSEGAME:
	    MOV AL , 0FFH
		CALL SENDEVENT
		INC otherPlayerScore
		CALL clearGameArea
		JMP RESUMEGAME
    WINGAME:
	    INC myScore
		CALL clearGameArea
		JMP RESUMEGAME
	STOPGAME:
	    CALL SENDEVENT
		CALL STOP
	STARTAGAIN:
	    JMP MIDDLE1
	FINISHMAIN:
	    MOV AH,4CH
		INT 21H
        HLT
        RET
MAIN    ENDP

INITICHAT PROC
        MOV DX , 3FBH
		MOV AL , 10000000B
		OUT DX , AL
		MOV DX , 3F8H
		MOV AL , 0CH
		OUT DX , AL
		MOV DX , 3F9H
		MOV AL , 00H
		OUT DX , AL
		MOV DX , 3FBH
		MOV AL , 00011011B
		OUT DX , AL
		RET
INITICHAT ENDP

STARTGAME PROC
	   CALL STARTPOS
	   CALL SHOWSCORE
	   CALL SHOWME
	   MOV AX , 0FH
	   CALL slowDown
	   MOV SI , INDEX
	   CALL mapIndexToMusic
       RET
STARTGAME ENDP
       
SETPLAYER PROC
         MOV myScore , 0
		 MOV otherPlayerScore , 0
		 MOV CX , 10
		 MOV BX , 0
		 RESETSCORE:
		 MOV scoreStr[BX] , '$'
		 INC BX
		 LOOP RESETSCORE
         MOV AH , 9H

         MOV PositionX , 0        ; SET POSITIONS FOR CHAT AREA
         MOV PositionX1 , 41
         MOV CurPositionX , 0
         MOV CurPositionX1 , 41
      RESUME:
        MOV PositionY , 17
        MOV CurPositionY , 17
        MOV CurPositionY1 , 17
        RET
SETPLAYER ENDP

STARTPOS  PROC          ; PUT THE ARROW AT THEAR FIRST PLACE
        MOV CX , 4
        MOV BX , 0
        MOV DX , 350  ; THE CENTER OF THE FIRST ARROW IS 680
        MOV index , 0
        MOV flag , 0
      MOVEPOSITIONS:
        MOV position[BX] , DX   ; PUT 680 IN POSITION[0]
        ADD DX ,GAP             ; GAP IS THE DIFFERENCE BETWEEN TWO CENTERS
        ADD BX , 2
        LOOP MOVEPOSITIONS
		CALL stopPlayingCurrNote
        RET
STARTPOS  ENDP

INTIALIZATION PROC
        CALL  SETPLAYER
       ;CHAT AND SCORE AREA
       ;DRAW HORIZONTAL LINES FOR THE CHAT AREA
        MOV DL , 0
		MOV BH , 0
     Hline:
        MOV AL , '-'
        MOV CX , 1
        MOV BL , 0FH

        MOV DH , 8  ;FIRST LINE STARTS AT Y = 8
        MOV AH , 2
        INT 10H
        MOV AH , 9
        INT 10H

        MOV DH , 12  ;SECOND LINE STARTS AT Y = 12
        MOV AH , 2
        INT 10H
        MOV AH , 9
        INT 10H

        MOV DH , 16 ; THIRD LINE STARTS AT Y = 16
        MOV AH , 2
        INT 10H
        MOV AH , 9
        INT 10H

        MOV DH , 25 ; LAST LINE STARTS AT Y = 25
        MOV AH , 2
        INT 10H
        MOV AH , 9
        INT 10H

        INC DL
        CMP DL , 80
        JNZ Hline

        ;DRAW VERTICAL LINES FOR THE CHAT AREA

        MOV DL , 40
        MOV DH , 8
     Vline:
        MOV AL , '|'
        MOV CX , 1
        MOV BL , 0FH

        MOV AH , 2
        INT 10H
        MOV ah , 9
        INT 10H

        INC DH
        CMP DH , 25
        JNZ Vline

		RET

INTIALIZATION ENDP

SHOWSCORE PROC     ; SHOW SCORES OF BOTH USERS

		 MOV DL , PositionX           ; FIRST SHOW MY SCORE
         ADD DL , 10
         MOV DH , PositionY
         SUB DH , 7
         MOV AH , 2
         INT 10H

		 MOV DX , OFFSET playerName
         MOV AH , 9
         INT 21H
		 MOV DX , OFFSET scoreMsg
		 INT 21H
		 MOV BX , myScore
		 CALL convertScore
		 MOV DX , OFFSET scoreStr
		 MOV AH , 9
		 INT 21H

		 MOV DL , PositionX1           ; THEN SHOW OTHER PLAYER  SCORE
         ADD DL , 10
         MOV DH , PositionY
         SUB DH , 7
         MOV AH , 2
         INT 10H

		 MOV DX , OFFSET otherPlayerName
         MOV AH , 9
         INT 21H
		 MOV DX , OFFSET scoreMsg
		 INT 21H
		 MOV BX , otherPlayerScore
		 CALL convertScore
		 MOV DX , OFFSET scoreStr
		 MOV AH , 9
		 INT 21H

		RET
SHOWSCORE ENDP

SHOWNAME  PROC       ; SHOW NAME OF THE USER IN HIS POSITION IN CHAT AREA

		 MOV BH , 0
         MOV DL , PositionX
         ADD DL , 15
         MOV DH , PositionY
         SUB DH , 3
         MOV AH , 2
         INT 10H

         MOV DX , OFFSET playerName
         MOV AH , 9
         INT 21H

         MOV DL , PositionX1
         ADD DL , 15
         MOV DH , PositionY
         SUB DH , 3
         MOV AH , 2
         INT 10H

         MOV DX , OFFSET otherPlayerName
         MOV AH , 9
         INT 21H

         RET
SHOWNAME ENDP

ADJUST  PROC
        MOV BX , 0
        MOV DI , 2
        MOV CX , 3
     ADJUSTLOOP:          ; LOOP TO INCREMENT INDEX AND ADJUST THE POSITIONS
        MOV DX ,WORD PTR position[DI]
        MOV position[BX] ,DX
        ADD BX , 02
        ADD DI , 02
        LOOP ADJUSTLOOP
        MOV BX , WORD PTR position[4]
        ADD BX , GAP
        MOV position[6] , BX

        ADD index , 1          ; INC THE INDEX
        CMP index , noteSiz    ;CHECK IF THE NEW INDEX BIGGER THAN THE SIZE OF THE ARRAY MAKE IT START FROM BEGINNING
        JNZ FINISH
        MOV index , 0
     FINISH:
	    MOV SI,index
        CALL mapIndexToMusic
        RET

ADJUST ENDP

SHOWME 	PROC

        MOV DI , SQUARE_POSITION
        CALL drawSquare   ; DRAW SQUARE

        MOV BX , 0
        MOV CX , 4
        Mov Si , index
    DRAWINGLOOP:
		PUSH CX
		PUSH BX
        MOV DI , WORD PTR position[BX]
        ADD DI , gameSpeed
        MOV col , 0
        Call drawarrow  ; CLEAR THE ARROW
        SUB DI , gameSpeed
        MOV Cl , color[SI]
        MOV col , Cl
        Call drawarrow  ; DRAW THE ARROW ON ITS NEW POSITION
		POP BX
		POP CX

        MOV DI ,  position[BX]
        SUB DI , gameSpeed
        MOV position[BX]  , DI
        ADD BX , 2
        INC SI

        CMP SI , noteSiz   ; MAKE IT WRAP AROUND IF INDEX STEP OUT THE ARRAY
        JNZ CONT
        MOV SI , 0
        CONT:
        LOOP DRAWINGLOOP
        RET
SHOWME 	ENDP

PAUSE   PROC
        PUSH AX
        CALL CLEARNOTIF
        CALL PAUSENOTIF
    PAUSELOOP:
        CALL RECEIVE
        CMP AL , 3EH
        JZ  FINISHPAUSE
        MOV AH, 01
        INT 16H
        JZ PAUSELOOP  ; NO KEY PRESSED
        MOV AH, 00
        INT 16H
        CMP AH , 3EH
        JZ BREAKPAUES
        CALL SEND
        JMP  PAUSELOOP
    BREAKPAUES:
        MOV AL , 3EH
        CALL SENDEVENT
    FINISHPAUSE:
        CALL CLEARNOTIF
        CALL GAMENOTIF
		POP AX
        RET
PAUSE   ENDP

STOP   PROC                         ; Stop game and show the scores
       CALL clearScreenGRAPHICSMode ; CLEAR WINDOW
	   CALL stopPlayingCurrNote
	   MOV BX , 0
       MOV DL , 0
	   MOV DH , 10
	   MOV AH , 2
	   INT 10H          			; MOVE CURSOR
	   CALL SCOREWINDOW 			; DISPLAY SCORE
	   MOV AH , 9
	   MOV DX , OFFSET newLines
	   INT 21H
	   INT 21H
	   INT 21H
	   MOV DX , WORD PTR otherPlayerScore
	   CMP myScore , DX
	   JB  LOST
	   JZ  DRAW
	 WON:
       MOV DX,  OFFSET wonMsg
	   MOV AH , 9
	   INT 21H
	   ; CALL MUSIC WON
	   CALL playWinGame
	   JMP CONTINUESTOP
	 LOST:
	   MOV DX,  OFFSET loseMsg
	   MOV AH , 9
	   INT 21H
	   ; CALL MUSIC WON
	   CALL playMarioEndGame
	   JMP CONTINUESTOP
	 DRAW:
	   MOV DX,  OFFSET drawMsg
	   MOV AH , 9
	   INT 21H
	   CALL playDrawGame
	 CONTINUESTOP:	  	  
       CALL clearScreenGRAPHICSMode
       RET
STOP ENDP

SCOREWINDOW  PROC
       MOV DX , OFFSET tabs
	   MOV AH , 9
       INT 21H
       MOV DX , OFFSET playerName     ; FIRST SHOW MY SCORE
       INT 21H
	   MOV DX , OFFSET scoreMsg
	   INT 21H
	   MOV BX , myScore
	   CALL convertScore
	   MOV DX , OFFSET scoreStr
	   MOV AH , 9
	   INT 21H

	   MOV DX , OFFSET newLines
	   INT 21H
	   INT 21H
	   INT 21H
	   MOV DX , OFFSET tabs
	   INT 21H
	   MOV DX , OFFSET otherPlayerName  ; THEN SHOW OTHER PLAYER  SCORE
       INT 21H
	   MOV DX , OFFSET scoreMsg
	   INT 21H
	   MOV BX , otherPlayerScore
	   CALL convertScore
	   MOV DX , OFFSET scoreStr
	   MOV AH , 9
	   INT 21H
       RET
SCOREWINDOW  ENDP

;Brief "drawArrow"
;Parameters: col the color to draw with
;            notes   the array of notes (or shapes from the graphics interpretation)
;            SI      the index of the shape in the array
;            DI      the X coordinate
;Effect:     draws the desired shape by calling the proper function
;Guarantees: does not change DI or SI
drawArrow   PROC
        MOV AH, 0CH
        MOV AL, col
        MOV BH, 0H

        MOV CX, DI
        ADD DI, 40
        SUB CX, 40
        MOV DX, 90

        CMP note[SI], 4
        JB arrow
        CALL drawX
        RET
arrow:
        CMP note[SI], 0
        JZ upOrDown
        CMP note[SI], 2
        JZ upOrDown
        CALL drawRightOrLeftArrow
        RET
upOrDown:
        CALL drawUpOrDownArrow
        RET
drawArrow ENDP

;Brief "drawRightOrLeftArrow"
;This procedure is a helper procedure which draws an arrow pointing left or right
;should be only called by "drawArrow" with the proper parameters
drawRightOrLeftArrow PROC

        CMP note[SI], 3
        JZ leftArrow
        MOV DX, 10
        JMP drawUpperHalf

leftArrow:
        MOV DX, 51

;Brief "drawUpOrDownArrow"
;This procedure is a helper procedure which draws an arrow pointing up or down
;should be only called by "drawArrow" with the proper parameters
drawUpperHalf:
        ;Thickness
        DEC CX
        checkThenDraw
        INC CX

        checkThenDraw

        INC CX
        checkThenDraw

        INC CX
        checkThenDraw

        ;Thickness
        INC CX
        checkThenDraw
        DEC CX

        INC DX
        CMP CX, DI
        JNZ drawUpperHalf

        MOV CX, DI
        SUB CX, 80

        CMP note[SI], 1
        JZ continueRightArrow
        JMP continueLeftArrow

continueRightArrow:
        MOV DX, 90
        JMP drawLowerHalf

continueLeftArrow:
        MOV DX, 49

drawLowerHalf:
        ;Thickness
        DEC CX
        checkThenDraw
        INC CX

        checkThenDraw

        INC CX
        checkThenDraw

        INC CX
        checkThenDraw

        ;Thickness
        INC CX
        checkThenDraw
        DEC CX

        DEC DX
        CMP CX, DI
        JNZ drawLowerHalf

        SUB DI, 40
        RET
drawRightOrLeftArrow ENDP

drawUpOrDownArrow PROC
        CMP note[SI], 0
        JZ upArrow
        ADD CX, 41
upArrow:

drawLeftHalf:
        ;Thickness
        INC DX
        checkThenDraw
        DEC DX

        checkThenDraw

        DEC DX
        checkThenDraw

        DEC DX
        checkThenDraw

        ;Thickness
        DEC DX
        checkThenDraw
        INC DX

        INC CX
        CMP DX, 10
        JNZ drawLeftHalf

        CMP note[SI], 0
        JZ continueUpArrow
        JMP continueDownArrow

continueUpArrow:
        INC CX
        JMP drawRightHalf

continueDownArrow:
        SUB CX, 81

drawRightHalf:
        ;Thickness
        DEC DX
        checkThenDraw
        INC DX

        checkThenDraw

        INC DX
        checkThenDraw

        INC DX
        checkThenDraw

        ;Thickness
        INC DX
        checkThenDraw
        DEC DX

        INC CX
        CMP DX, 90
        JNZ drawRightHalf

        SUB DI, 40
        RET

drawUpOrDownArrow ENDP

;Brief "drawX"
;This procedure is a helper procedure which draws an X shape
;should be only called by "drawArrow" with the proper parameters
drawX PROC
drawHalfX:
        ;Thickness
        INC DX
        checkThenDraw
        DEC DX

        checkThenDraw

        ;Thickness
        DEC DX
        checkThenDraw
        INC DX

        DEC DX
        INC CX
        CMP DX, 9
        JNZ drawHalfX

        MOV CX, DI
        SUB CX, 80
        MOV DX, 10

drawTheOtherHalfX:
        ;Thickness
        DEC DX
        checkThenDraw
        INC DX

        checkThenDraw

        ;Thickness
        INC DX
        checkThenDraw
        DEC DX

        INC DX
        INC CX
        CMP DX, 91
        JNZ drawTheOtherHalfX

    SUB DI, 40
    RET
drawX ENDP

;Brief "drawSquare"
;Parameters: DI      the X coordinate
;Effect:     draws the desired square
;Guarantees: does not change DI or SI
drawSquare PROC
    MOV AH , 6
	MOV AL , 0
	MOV BX , 0
	MOV CX , 0
	MOV DX , 0604H
	INT 10H
    MOV AH, 0CH
    MOV AL, 0FH
    MOV BH, 0H
    MOV CX, DI
    SUB CX, 41
    MOV DX, 9
    lrBorders:  checkThenDraw
                ADD CX, 82
                checkThenDraw
                SUB CX, 82
                INC DX
                CMP DX, 92
                JNZ lrBorders
    MOV DX, 9
    ADD DI, 41
    udBorders:  checkThenDraw
                ADD DX, 82
                checkThenDraw
                SUB DX, 82
                INC CX
                CMP CX, DI
                JNZ udBorders
    SUB DI, 41
    RET
drawSquare ENDP


;brief "playNote"
;This subroutine starts playing a certain given note
;till for a certain given time
;uses ax
;takes freq. in bx
playNote proc
      PUSH BX
      CALL stopPlayingCurrNote
	  POP BX
      mov  al,  182          ;prepare the speaker
      out  43h, al           ;for the note
      mov  ax,  bx           ;frequency (in decimal)
      out  42h, al           ;Output low byte
      mov  al,  ah           ;Output high byte
      out  42h, al
      in   al,  61h          ;Turn on note (get value from port 61h)
      or   al,  00000011b    ;Set bits 1 and 0
      out  61h, al
      ret
playNote endp
;/////////////////////////////////////////////////////////////

;brief "stopPlayingCurrNote"
;This subroutine stops a current note
;uses al
;Takes nothing
stopPlayingCurrNote proc
      in   al,61h         ; Turn off note (get value from port 61h)
      and  al,11111100b   ; Reset bits 1 and 0
      out  61h,al 	      ; Send new value      
      ret
stopPlayingCurrNote endp
;/////////////////////////////////////////////////////////////

;brief "calcNoteFreq"
;This subroutine calculates the the func f(n)=fo*(1.0594)^n
;to get the freq of the note to be played
;uses ax,bx,cx,dx,di
;takes number of half tones in cx
;returns calculated freq in bx
calcNoteFreq proc
      mov bx, 130         ;fo=C3
      mov di, 81          ;fraction part of fo
      cmp cx, 0
      je  endc
strt:
      cmp di, 1700        ;compare if fraction will cause increase
      jb  skip
      mov ax, bx          ;send integer part
      inc bx              ;increase caused by fraction
      jmp pro
skip:
      mov ax, bx          ;when no increase caused by fraction
pro:  mov di, 594         ;implementing mult by 0.0594
      mul di              ;by mult by 595
      mov di, 10000       ;then div by 10000
      div di
      add bx, ax
      mov di, dx
      loop strt
endc: call setNote
      ret
calcNoteFreq endp
;//////////////////////////////////////////////////////////////

;brief "setNote"
;This subroutine set the freq calculated by calcNoteFreq
;to the right freq that can be played by the port
;uses ax,dx
;takes calculated freq in bx
setNote proc
      mov  ax, 3388h
      mov  dx, 0012h
      div  bx
      mov  bx,ax
      ret
setNote endp
;//////////////////////////////////////////////////////////////

;breif "mapIndexToMusic"
;This subroutine prepares parameters for startPlayingNewNote
;and calls startPlayingNewNote
;uses cx
;takes si
mapIndexToMusic proc
      push bx
      mov bl,note[si]     ;get relative note
      mov bh, 0
      mov cl, noteMap[bx] ;get actual note
      mov ch,octave[si]   ;get octave
      cmp ch,1
      jne ToCalc
      add cl,12
ToCalc:
      mov ch,0
      call calcNoteFreq   ;calc freq
      call playNote       ;start playing
      pop bx
      ret
mapIndexToMusic endp
;///////////////////////////////////////////////////////////

;Breif "playMarioEndGame"
;This subroutine playes Mario endgame theme song
;takes nothing
;uses ax,bx,cx,dx,si
playMarioEndGame proc
      mov si, 0
gameOverLoop:
      call stopPlayingCurrNote
      cmp si, MarGameOverL
      je  endGameOverLoop
      mov bx, MarGameOverN[si]
      call playNote
      cmp MarGameOverD[si], 3
      je blanche
      cmp MarGameOverD[si], 2
      je noirejmp
      mov ax, 7
      jmp toSlowDown
blanche:
      mov ax, 20
      jmp toSlowDown
noirejmp:
      mov ax, 15
toSlowDown:
      call slowDown
      inc si
      inc si
      jmp gameOverLoop
endGameOverLoop:
      ret
playMarioEndGame endp
;/////////////////////////////////////////////////////////

;Breif "playWinGame"
;This subroutine plays part of we will rock you
;takes nothing
;uses ax,bx,cx,dx,si
playWinGame proc
      mov si, 0
gameWinLoop:
      call stopPlayingCurrNote
      cmp si, WinL
      je  endGameWinLoop1
      mov bx, WinN[si]
      call playNote
      cmp WinD[si], 3
      je blanche1
      cmp WinD[si], 2
      je noirejmp1
      mov ax, 7
      jmp toSlowDown1
blanche1:
      mov ax, 20
      jmp toSlowDown1
noirejmp1:
      mov ax, 15
toSlowDown1:
      call slowDown
      inc si
      inc si
      jmp gameWinLoop
endGameWinLoop1:
      ret
playWinGame endp
;/////////////////////////////////////////////////////////

;Breif "playDrawGame"
;This subroutine plays part of pink panther
;takes nothing
;uses ax,bx,cx,dx,si
playDrawGame proc
      mov si, 0
gameDrawLoop:
      call stopPlayingCurrNote
      cmp si, DrawL
      je  endGameDrawLoop2
      mov bx, DrawN[si]
      call playNote
      cmp DrawD[si], 3
      je blanche2
      cmp DrawD[si], 2
      je noirejmp2
      mov ax, 7
      jmp toSlowDown2
blanche2:
      mov ax, 35
      jmp toSlowDown2
noirejmp2:
      mov ax, 15
toSlowDown2:
      call slowDown
      inc si
      inc si
      jmp gameDrawLoop
endGameDrawLoop2:
      ret
playDrawGame endp
;/////////////////////////////////////////////////////////

;Brief "slowDown"
;This subroutine is just a dummy loop
;takes outer loop counter in ax
;uses cx
slowDown proc
outerDummyLoop:
      cmp ax, 0
      jne continueDummyLoop
      ret
continueDummyLoop:
      mov cx, 0ffffh
innerDummyLoop:
      loop innerDummyLoop
      dec  ax
      jmp outerDummyLoop
slowDown endp
;/////////////////////////////////////////////////////////


SEND PROC              ; SEND CHAR AND PRINT IT
     CMP AL , 3EH
     JZ NOPRINTSEND
	 CMP AL , 0FFH
	 JZ NOPRINTSEND
	 CMP AL , 27
	 JZ NOPRINTSEND
	 PUSH AX
	 CALL PRINTCHAR1
	 POP AX
  NOPRINTSEND:
     PUSH AX
	 MOV DX , 3FDH
	 IN AL , DX
	 AND AL , 00100000B
	 POP AX
	 JZ RETURN
	 MOV DX , 3F8H
	 OUT DX , AL

   RETURN:
     RET

SEND ENDP

RECEIVE  PROC 	       ; REVEIVE CHAR AND PRINT IT
     MOV DX ,3FDH
	 IN AL ,DX
	 AND AL ,1
	 JZ RETURN1
	 MOV DX ,03F8H
	 IN  AL , DX
	 CMP AL , 0FFH    ; LOSE CHAR
	 JZ  RETURN1
     CMP AL , 3EH     ; F4 CHAR
     JZ  RETURN1
     CMP AL , 27      ; ESC CHAR
	 JZ  RETURN1
	 PUSH AX
     CALL PRINTCHAR2
     POP AX
  RETURN1:
     RET

RECEIVE ENDP

PRINTCHAR1 PROC        ; PRINT CHAR IN MY AREA
     PUSH AX
     MOV AH , 2
     MOV DL , CurPositionX
     MOV DH , CurPositionY
     INT 10h    ; MOVE THE CURSOR
     POP AX

     CMP AL , 13  ; ENTER CHAR
     JE CHECKPOSITIONY1
     CMP AL , 8   ; CHECK BACKSPACE
     JE BACKSPACE1
   NORMALCHAR1:
     MOV AH , 9
     MOV BX , 0
     MOV CX , 1
     MOV BL , 0FH
     INT 10H
 
     INC CurPositionX               ; CHECK IF I REACHED THE END OF THE LINE 
     CMP CurPositionX , 39
     JE CHECKPOSITIONY1
     JMP FINISHPRINT1
  BACKSPACE1:
     CMP CurPositionX , 0
	 JE  FINISHPRINT1
	 DEC CurPositionX
	 MOV DL , CurPositionX
	 INT 10H
	 MOV AH , 9
	 MOV AL , ' '
     MOV BX , 0
     MOV CX , 1
     MOV BL , 0FH
     INT 10H
	 JMP  FINISHPRINT1
  CHECKPOSITIONY1:
     MOV CL , PositionX
     MOV CurPositionX  , CL
     INC CurPositionY
     CMP CurPositionY , 25   ; CHECK IF I REACHED THE END OF SCREEN
     JNE FINISHPRINT1
     MOV AH , 6
     MOV AL , 1
     MOV BH , 0
     MOV CL , PositionX
     MOV CH , PositionY
     CMP PositionX , 0
     JNE NOTZERO1
     MOV DL , 39
     JMP CONT1
  NOTZERO1:
     MOV DL , 79
  CONT1:
     MOV DH , CurPositionY
     DEC DH
     INT 10H                ; SCROLL DOWN
     DEC CurPositionY

  FINISHPRINT1:
     RET
PRINTCHAR1 ENDP


PRINTCHAR2 PROC      ; PRINT CHAR IN OTHER PLAYER AREA
     PUSH AX
     MOV AH , 2
     MOV DL , CurPositionX1
     MOV DH , CurPositionY1
     INT 10h    ; MOVE THE CURSOR
     POP AX

     CMP AL , 13  ; ENTER CHAR
     JE CHECKPOSITIONY2
     CMP AL , 8   ; CHECK BACKSPACE
     JE BACKSPACE2
   NORMALCHAR2:
     MOV AH , 9
     MOV BX , 0
     MOV CX , 1
     MOV BL , 0FH
     INT 10H
      
	 INC CurPositionX1         ; CHECK IF I REACHED THE END OF THE LINE 
     CMP CurPositionX1 , 80
     JE CHECKPOSITIONY2
     JMP FINISHPRINT1
   BACKSPACE2:
     CMP CurPositionX1 , 41
	 JE  FINISHPRINT2
	 DEC CurPositionX1
	 PUSH AX
     MOV AH , 2
     MOV DL , CurPositionX1
     MOV DH , CurPositionY1
     INT 10h    ; MOVE THE CURSOR
     POP AX
	 MOV AH , 9
	 MOV AL , ' '
     MOV BX , 0
     MOV CX , 1
     MOV BL , 0FH
     INT 10H
	 JMP  FINISHPRINT2
  CHECKPOSITIONY2:
     MOV CL , PositionX1
     MOV CurPositionX1  , CL
     INC CurPositionY1
     CMP CurPositionY1 , 25   ; CHECK IF I REACHED THE END OF SCREEN
     JNE FINISHPRINT2
     MOV AH , 6
     MOV AL , 1
     MOV BH , 0
     MOV CL , PositionX1
     MOV CH , PositionY
     CMP PositionX1 , 0
     JNE NOTZERO2
     MOV DL , 39
     JMP CONT2
  NOTZERO2:
     MOV DL , 79
  CONT2:
     MOV DH , CurPositionY1
     DEC DH
     INT 10H                ; SCROLL DOWN
     DEC CurPositionY1

  FINISHPRINT2:
     RET
PRINTCHAR2 ENDP

MAINMENU PROC
      MOV AH, 0                          ;set video mode
      MOV AL, 3                          ;80x25, 16 colors, 8 pages
      INT 10H

      CALL clearScreenTextMode

      MOV AH, 2                          ;set cursor
      MOV BH, 0                          ;page=0
      MOV DH, 12                         ;set point row
      MOV DL, 0                          ;set point col
      INT 10H

      MOV AH, 9                          ;display main menu
      MOV DX, OFFSET msgMainMenu
      INT 21H

      MOV DL , 0                        ; DRAW NOTIFICATION BAR
      MOV DH , 22
      MOV AH , 2
      INT 10H
      MOV AH , 9
      MOV AL , '-'
      MOV BH , 0
      MOV BL , 0FH
      MOV CX , 80
      INT 10H
      MOV BL , 0FFH
	  MOV BH , 0
	  CALL RESTORE

mainMenuKeyPressLoop:
      CALL RECEIVEEVENT
      CMP AL , BL
	  JZ exitRec
	  CMP AL , 0         ; NO RECEIVE
      JZ  checkSend
	  CMP AL , 27        ; OTHER PLAYER LEFT
	  JZ  otherPlayerLeft
	  CMP AL , 1            
	  JL checkSend
	  CMP AL , 2
	  JG checkSend
	  MOV BH , AL          ; RECEIVED CHAT OR GAME INVITATION FROM THE OTHER PALYER
	  MOV SI , WORD PTR receiveIDX
	  MOV receiveNotifications[SI] , BH
	  INC receiveIDX
	  CALL RESTORE
	  CALL checkRecIdx
   checkSend:
       MOV AH , 1
	   INT 16H
	   JZ mainMenuKeyPressLoop    ; NO KEY PREESED
	   MOV AH , 0
	   INT 16H
	   CMP AL , 27                ; ESCAPE KEY PRESSED
	   JZ  leaveProgram
	   SUB AL , '0'
	   CMP AL , 1 				  
	   JB mainMenuKeyPressLoop 
	   CMP AL , 2
	   JA mainMenuKeyPressLoop
	   CALL SENDEVENT
	   MOV BL ,AL
	   CMP BL , BH 			     ; CHECK IF THE TWO PLAYERS PRESSED THE SAME 
	   JZ exitSend
	   MOV SI , WORD PTR sendIDX
	   MOV sendNotifications[SI] , BL
	   INC sendIDX
	   CALL RESTORE
	   CALL checkSendIdx
	   JMP mainMenuKeyPressLoop
   exitRec:						; OTHER USER ACCEPTED MY INVITATION
       DEC sendIDX
	   CMP AL , 1
	   JZ FINISHPROGRAM
	   PUSH AX
	   CALL CHOOSELEVEL			; I SEND THE INVITATION THEN I CHOOSE LEVEL
	   POP AX
	   JMP FINISHPROGRAM
   exitSend:					; I ACCEPTED OTHER USER INVITATION				
       DEC receiveIDX
	   CMP AL , 1
	   JZ FINISHPROGRAM
	   PUSH AX
	   CALL STATICWINDOW		; SHOW STATIC WINDOW UNTIL THE OTHER PLAYER CHOOSE THE GAME LEVEL
	   POP AX
	   RET
   leaveProgram:				; LEAVE THE GAME AND SEND TO OTHER USER TO INFORM HIM
       CALL SENDEVENT
       JMP 	FINISHPROGRAM
   otherPlayerLeft:				; OTHER PLAYER LEFT THE GAME 
       MOV AL , 0FFH
   FINISHPROGRAM:
      CALL clearScreenTextMode
      RET
MAINMENU ENDP

RESTORE PROC
      CALL clearNotifBar
      MOV BH , 0
      MOV DL , 0         ;MOVE CURSOR TO DISPLAY NOTIFICATION
      MOV DH , 23
      MOV AH , 2
      INT 10H
      MOV AH , 9
      CMP sendIDX , 0   ; RESTORE PREVIOUS NOTIFICATIONS
	  JZ recNotif
	  MOV SI ,WORD PTR sendIDX       
	  DEC SI
	  CMP sendNotifications[SI] , 2    ; CHAT INVITATION
	  JNZ chatSendReq
	  MOV DX , OFFSET gameSendNotif    ; GAME INVITATION
	  JMP printSend
	chatSendReq:
	  MOV DX , OFFSET chatSendNotif
	printSend:
	  MOV BL , sendNotifications[SI]
	  INT 21H
	  MOV DX , OFFSET newLines
	  INT 21H
   recNotif:
      CMP receiveIDX , 0   ; RESTORE PREVIOUS NOTIFICATIONS
	  JZ finishRestore
	  MOV DX , OFFSET otherPlayerName
	  INT 21H
	  MOV SI , WORD PTR receiveIDX
	  DEC SI
	  CMP receiveNotifications[SI] , 2   ; CHAT REQUEST
	  JNZ chatRecReq
	  MOV DX , OFFSET gameReceiveNotif 	 ; GAME REQUEST
	  JMP printRec
	chatRecReq:
	  MOV DX , OFFSET chatReceiveNotif
	printRec:
	  MOV BH , receiveNotifications[SI]
	  INT 21H
    finishRestore:
      RET
RESTORE ENDP

checkSendIdx PROC        ; CHECK IF THE PLAYER HAVE MORE THAN 10 SEND NOTIFICATIONS
      CMP sendIDX , 10   ; IF SO , CANCEL THE OLDEST ONE
      JZ  MODIFY
      RET
    MODIFY:
      MOV CX , 9
      MOV SI , 0
      MOV DI , 1
    MODIFYLOOP:
      MOV DL ,sendNotifications[DI]
      MOV sendNotifications[SI] , DL
      INC SI
      INC DI
      LOOP MODIFYLOOP
      DEC  sendIDX
      RET
checkSendIdx ENDP

checkRecIdx PROC            ; CHECK IF THE PLAYER HAVE MORE THAN 10 REACHED NOTIFICATIONS
      CMP receiveIDX , 10   ; IF SO , CANCEL THE OLDEST ONE
      JZ  MODIFY1
      RET
    MODIFY1:
      MOV CX , 9
      MOV SI , 0
      MOV DI , 1
    MODIFYLOOP1:
      MOV DL ,receiveNotifications[DI]
      MOV receiveNotifications[SI] , DL
      INC SI
      INC DI
      LOOP MODIFYLOOP1
      DEC  receiveIDX
      RET
checkRecIdx ENDP

GAMENOTIF   PROC         ; DISPLAY notifications ON GAME
      MOV BH , 0
      MOV DL , 0
      MOV DH , 26
      MOV AH , 2
      INT 10H
      MOV DX , OFFSET gamenotifications
      MOV AH , 9
      INT 21H
      RET
GAMENOTIF   ENDP

CHATNOTIF   PROC        ; DISPLAY notifications ON CHAT
      MOV BH , 0
      MOV DL , 0
      MOV DH , 26
      MOV AH , 2
      INT 10H
      MOV DX , OFFSET chatNotification
      MOV AH , 9
      INT 21H
      RET
CHATNOTIF  ENDP

PAUSENOTIF  PROC
      MOV BH , 0
      MOV DL , 0
      MOV DH , 26
      MOV AH , 2
      INT 10H
      MOV DX , OFFSET pauseNotification
      MOV AH , 9
      INT 21H
      RET
PAUSENOTIF ENDP

CLEARNOTIF  PROC         ; CLEAR THE NOTIFICATION BAR
      MOV CL , 0
      MOV DL , 79
      MOV CH , 26
      MOV DH , 27
      MOV AL , 0
      MOV BH , 0
      MOV AH , 6
      INT 10H
      RET
CLEARNOTIF ENDP

clearScreenTextMode PROC
      PUSH AX
      MOV AX, 0600H                      ;clear screen
      MOV BH, 0FH                           ;back/fore color
      MOV CX, 0000H                      ;starting point row/col
      MOV DX, 184FH                      ;ending point row/col
      INT 10H
      POP AX
      RET
clearScreenTextMode ENDP

clearScreenGRAPHICSMode PROC
      PUSH AX
      MOV AX,0700H
	  MOV BL,0H
      MOV BH,00
      MOV CX,0
      MOV DX,1E4FH
      INT 10H
      POP AX
      RET
clearScreenGRAPHICSMode ENDP

clearGameArea PROC
      PUSH AX
      MOV AX,0700H
	  MOV BL,0
      MOV BH,0
      MOV CX,0
      MOV DX,074FH
      INT 10H
      POP AX
      RET
clearGameArea ENDP

clearNotifBar PROC
      MOV AH , 6
	  MOV AL , 0
	  MOV BH , 0FH
      MOV CX , 1700H
	  MOV DX , 1850H     ;CLEAR NOTIFICATION BAR
	  INT 10H
      RET
clearNotifBar ENDP

nameEntryMenu PROC

      MOV AH, 0                          ;set video mode
      mov AL, 3                          ;80x25, 16 colors, 8 pages
      INT 10H

      MOV DI, 0                          ;to alter name and validate

nameEntryMenuLoop:
      CALL clearScreenTextMode

      MOV AH, 2                          ;set cursor
      MOV BH, 0                          ;page=0
      MOV DH, 0                          ;set point row
      MOV DL, 0                          ;set point col
      INT 10H

      MOV AH, 9                          ;display name query
      MOV DX, OFFSET msgNameEntry
      INT 21H

	  CMP DI , 0
	  JZ GETINPUT
	  MOV AH, 9                          ;display name query
      MOV DX, offset endNameEntry
      INT  21h
    GETINPUT:
      CALL inputUsername

      CMP AL, 1                         ;the user entered his name
      JE  endNameEntryMenuLoop

      JMP nameEntryMenuLoop

endNameEntryMenuLoop:
      CALL clearScreenTextMode

      RET
nameEntryMenu ENDP

inputUsername PROC
      MOV AH,0                              ;wait key press
      INT 16H

      CMP AL, 0DH                          ;check enter press
      JNE isBckSpcPress
      CMP DI, 0                            ;check string empty
      JE  endInputUsernameLoop
      MOV al, 1
      RET

isBckSpcPress:
      CMP AL, 8                           ;check backspace press
      JNE isNewLetter
      CMP DI, 0                           ;check string empty
      JE endInputUsernameLoop
      DEC DI
      MOV playerName[DI], '$'
      JMP endInputUsernameLoop

isNewLetter:
      CMP DI, 15                          ;check string full
      JE endInputUsernameLoop
      CMP DI , 0
      JNZ putChar
	  CMP AL , 41H                          ;check for digits and special characters in the first character
	  JB endInputUsernameLoop
	  CMP AL , 5AH
	  JBE putChar
	  CMP AL , 61H
	  JB  endInputUsernameLoop
	  CMP AL , 7AH
	  JBE putChar
	  JMP endInputUsernameLoop
	 putChar:
      MOV playerName[di], al
      INC di

endInputUsernameLoop:
      MOV AL, 0
      RET
inputUsername ENDP

gameManual PROC

      MOV AH, 0                          ;set video mode
      MOV AL, 3                          ;80x25, 16 colors, 8 pages
      INT 10H

      CALL clearScreenTextMode

	  MOV CX , 0  						; DRAW COLORFUL  RECTANGLE
	  MOV DX , 1850H
	  MOV AL , 0
	  MOV AH , 7
	  MOV BH , playernum
	  INT 10H

      MOV AH, 2                          ;set cursor
      MOV BH, 0                          ;page=0
      MOV DH, 1                          ;set point row
      MOV DL, 0                          ;set point col
      INT 10H

      MOV AH, 9                          ;display game manual
      MOV DX, OFFSET msgGameManual
      INT 21H

	  MOV AH , 2
	  MOV BH , 0
	  MOV DH , 20
	  MOV DL , 0
      INT 10H
	  MOV BH , playernum
	  MOV AH , 9
	  CMP BH , 0BH
	  JZ Cyan
	  MOV DX , OFFSET player2Msg
	  JMP SHOWMSG
	Cyan:
	  MOV DX , OFFSET player1Msg
	SHOWMSG:
	  INT 21H
    gameManualLoop:
      MOV AH , 1
	  INT 16H
	  JZ gameManualLoop
	  MOV AH , 0
	  INT 16H
	  CMP AL , 13
	  JNZ gameManualLoop

      CALL clearScreenTextMode

      RET
gameManual ENDP

SENDEVENT PROC 		; SEND CHAR WITHOUT PRINTING IT
            PUSH AX
			MOV DX , 3FDH
			IN AL , DX
			AND AL , 00100000B
			POP AX
			JZ RETURNEVENT
			MOV DX , 3F8H
			OUT DX , AL

   RETURNEVENT: RET

SENDEVENT ENDP

RECEIVEEVENT  PROC  ; RECEIVE CHAR WITOUT PRINTING IT
    		MOV AL , 0
            MOV DX ,3FDH
		    IN AL ,DX
		    AND AL ,1
		    JZ RETURNEVENT1
		    MOV DX ,03F8H
		    IN AL , DX
 RETURNEVENT1: RET

RECEIVEEVENT ENDP

JUSTCHAT  PROC     
        MOV AH, 0
        MOV AL, 12H
        INT 10H     ; Switch to Graphics Mode

        CALL SETPLAYER
        MOV PositionY , 5
        MOV CurPositionY , 5
        MOV CurPositionY1 , 5
       ;CHAT AREA
       ;DRAW HORIZONTAL LINES FOR THE CHAT AREA
        MOV DL , 0
        MOV BH , 0
     Hline1:
        MOV AL , '-'
        MOV CX , 1
        MOV BL , 0FH

        MOV DH , 0  ;FIRST LINE STARTS AT Y = 0
        MOV AH , 2
        INT 10H
        MOV AH , 9
        INT 10H

        MOV DH , 4 ; SECOND LINE STARTS AT Y = 4
        MOV AH , 2
        INT 10H
        MOV AH , 9
        INT 10H

        MOV DH , 25 ; LAST LINE STARTS AT Y = 25
        MOV AH , 2
        INT 10H
        MOV AH , 9
        INT 10H

        INC DL
        CMP DL , 80
        JNZ Hline1

        ;DRAW VERTICAL LINES FOR THE CHAT AREA
        MOV DL , 40
        MOV DH , 0
     Vline1:
        MOV AL , '|'
        MOV CX , 1
        MOV BL , 0FH

        MOV AH , 2
        INT 10H
        MOV AH , 9
        INT 10H

        INC DH
        CMP DH , 25
        JNZ Vline1
     CALL SHOWNAME
     CALL CHATNOTIF
     CHATLOOP:
        CALL RECEIVE			
        CMP AL , 27            ; LEAVE CHAT
        JNZ CONTINUECHAT
        JMP FINISHCHAT
     CONTINUECHAT:           
        MOV AH , 1
        INT 16H
        JZ CHATLOOP				; NO KEY PREESED
        MOV AH , 0
        INT 16H
        CMP AL , 27
        JZ  ENDCHAT
        CALL SEND
        JMP  CHATLOOP

     ENDCHAT:
        CALL SENDEVENT
     FINISHCHAT:
        CALL clearScreenGRAPHICSMode
        RET
JUSTCHAT ENDP

STATICWINDOW  PROC        ; THE STATIC WINDOW THAT APPEARS TO THE PLAYER
                          ; UNTIL NEXT PLAYER CHOOSES DIFFICULTY
        MOV AH, 0
        MOV AL, 12H
        INT 10H           ; Switch to Graphics Mode
        CALL INTIALIZATION
        MOV DI , SQUARE_POSITION
        CALL drawSquare   ; DRAW SQUARE
     STATICLOOP:
        CALL RECEIVEEVENT
        CMP AL ,'1'
        JZ SLOW
        CMP AL ,'2'
        JZ MIDIUM
        CMP AL ,'3'
        JZ HARD
        JMP  STATICLOOP
     SLOW:
        MOV gameSpeed , 8
        RET
     MIDIUM:
        MOV gameSpeed , 15
        RET
     HARD:
        MOV gameSpeed , 20
        RET
STATICWINDOW  ENDP

CHOOSELEVEL   PROC
        MOV AH, 0                          ;set video mode
        MOV AL, 3                          ;80x25, 16 colors, 8 pages
        INT 10H

        CALL clearScreenTextMode

        MOV AH, 2                          ;set cursor
        MOV BH, 0                          ;page=0
        MOV DH, 12                         ;set point row
        MOV DL, 0                          ;set point col
        INT 10H

        MOV AH, 9
        MOV DX, OFFSET chooseLevelMsg
        INT 21H
    CHOOSELOOP:
        MOV AH , 1
        INT 16H
        JZ  CHOOSELOOP
        MOV AH , 0
        INT 16H
        CMP AL ,'1'
        JZ SLOW1
        CMP AL ,'2'
        JZ MIDIUM1
        CMP AL , '3'
        JZ HARD1
        JMP  CHOOSELOOP
    SLOW1:
        MOV gameSpeed , 8
        CALL SENDEVENT
        RET
     MIDIUM1:
        MOV gameSpeed , 15
        CALL SENDEVENT
        RET
     HARD1:
        MOV gameSpeed , 20
        CALL SENDEVENT
        RET
CHOOSELEVEL   ENDP

SENDPROTOCOLED PROC
		CMP isSent , 0
		JE returnSendProtocoled
		PUSH AX
	sendLoop:
		MOV DX , 3FDH
		IN AL , DX
		AND AL , 00100000B
		JZ sendLoop
		POP AX
		MOV DX , 3F8H
		OUT DX , AL
		INC string1Counter
		MOV isSent , 0
	returnSendProtocoled:
		RET
SENDPROTOCOLED ENDP

RECIEVEPROTOCOLED PROC  ; RECEIVE NAME OF OTHER USER
	checkRecieveLoop:
		MOV AL  , 0
		MOV DX , 3FDH
		IN AL , DX
		AND AL , 1
		JZ checkRecieveLoop
		MOV DX , 03F8H
		IN AL , DX
		CMP AL , 0FEH
		JE recievedFlag
		MOV BX , string2Counter
		MOV otherPlayerName[BX] , AL
	sendLoop2:
		MOV DX , 3FDH
		IN AL , DX
		AND AL , 00100000B
		JZ sendLoop2
		MOV DX , 3F8H
		MOV AL , 0FEH
		OUT DX , AL
		INC string2Counter
		JMP returnRecieveProtocoled
	recievedFlag:
		MOV isSent , 1
	returnRecieveProtocoled:
		RET
RECIEVEPROTOCOLED ENDP

GETNAME PROC      ; SENT MY NAME TO OTHER USER
    MOV isSent , 1
	MOV string1Counter , 0
	MOV string2Counter , 0
	MOV CX , 01EH
	GETLOOP:
		MOV BX  , string1Counter
		MOV AL , playerName[BX]
		CALL SENDPROTOCOLED
		CALL RECIEVEPROTOCOLED
		LOOP GETLOOP
    RET
GETNAME ENDP

checkOtherName  PROC
    CMP otherPlayerName[0] , 0EEH
	JZ MODIFYNAME
	RET
    MODIFYNAME:
	   MOV CX , 20
	   MOV SI , 0
	   MOV DI , 1
	   otherNameLoop:
	      MOV AL , otherPlayerName[DI]
		  MOV otherPlayerName[SI] , AL
		  INC SI
		  INC DI
		  LOOP otherNameLoop
    RET
checkOtherName  ENDP
; WAIT OTHER PLAYER TO JOIN
; WHEN OTHER PLAYER JOIN HE WILL SEND A SPECIAL CHAR 
; AND WHEN I RECEIVE THIS CHAR I WILL LEAVE AND SEND HIM THE SAME CHAR SO HE CAN LEAVE TOO
WAITPLAYER  PROC   
    MOV CX , 30
	MOV BX , 0
	NAMELOOP:
	  MOV otherPlayerName[BX] , '$'
	  INC BX
	  LOOP NAMELOOP
    MOV AH , 0
	MOV AL , 3
	INT 10H
	MOV sendIDX , 0
	MOV receiveIDX , 0
	MOV AH , 2
	MOV DL , 0
	MOV DH , 12
	MOV BH , 0
	INT 10H
	MOV AH , 9
	MOV DX , OFFSET waitingMsg
	INT 21H
	MOV AL , 0EEH		
	CALL SENDEVENT
	WAITPLAYERLOOP:
	  CALL RECEIVEEVENT
      CMP AL , 0EEH
      JZ RESUMEWAIT
	  MOV AH , 1
	  INT 16H
	  JZ WAITPLAYERLOOP
	  MOV AH , 0
	  INT 16H
	  CMP AL , 27
	  JNZ WAITPLAYERLOOP
	  JMP FINISHWAITING
    RESUMEWAIT:
    MOV AL , 0EEH
	CALL SENDEVENT
    FINISHWAITING:
    CALL clearScreenTextMode
    RET
WAITPLAYER ENDP

convertScore  PROC     ; CONVERT SCORE IN BX FROM INTEGER TO STRING
    MOV CX , 10
	MOV DI , 0
    MEMSET:
      MOV scoreStr[DI] , '$'
	  INC DI
      LOOP MEMSET
	MOV AX , 1
	MOV DI , -1
	MOV DX , 10
	SIZELOOP:
	  INC DI
	  MUL DX
	  MOV DX , 10
	  CMP BX , AX
      JAE SIZELOOP

	MOV AX , BX
	MOV BX , 10
	MOV DX , 0
    SCORELOOP:
      DIV BX
      ADD DL , '0'
      MOV scoreStr[DI] , DL
      DEC DI
      MOV DX , 0
      CMP AX , 0
      JA SCORELOOP
      RET
convertScore ENDP

 END MAIN
 