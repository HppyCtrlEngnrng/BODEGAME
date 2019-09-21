# BODEGAME
BODEGAME is a cardgame-like something for two players on MATLAB.
* Instrument Control Toolbox is needed to create online server.

# INSTALATION
Just download all the files to your PC.

# LAUNCH BODEGAME
Type 'bodegame' on your MATLAB command window.

# RULES
The figure below shows the main screen of BODEGAME.
![](https://github.com/HppyCtrlEngnrng/BODEGAME/blob/master/rdm_pic/game_screen.png)
Two players put a card down from own hands to the field in turn. After 10th turn, players get a score according to the "PERFORMANCE" of their control.

## Cards
These 3 kinds of cards are used in BODEGAME.
![](https://github.com/HppyCtrlEngnrng/BODEGAME/blob/master/rdm_pic/cards.png)

## Fields
At each turn, players put a card down to one of these fields:
- Feedback controller: Players can put all the 3 kinds of cards to own feedback controller field. Only in the case of cancellation of a pole-zero pair, players can put a pole/zero card down to a zero/pole card of the opponent's controller.
![](https://github.com/HppyCtrlEngnrng/BODEGAME/blob/master/rdm_pic/pzcancel.png)
- Disturbance gain: Player can put only constant gain cards down here. This field is related to the scoring.
- Noise gain: Player can put only constant gain cards down here. This field is related to the scoring.
- Discard pile: Players can put all the 3 kinds of cards here. This field does not affect to the control performance nor scoring.
- Plant: A stable FDLTI transfer function common to both players. Minimum-phaseness is not assured.

## Bode plot
Bode plot of the loop transfer function is shown for reference of control design.

## Scoring
After 10th turn, the score of each player is calculated as an inverse of H2 norm of generalized plant below.
![](https://github.com/HppyCtrlEngnrng/BODEGAME/blob/master/rdm_pic/genp.png)

You get nothing in the case of the H2 norm is indefinit;
- The closed loop system is unstable.
- The generalized plant has feedthrough from the inputs to the output.

Also, the feedback controller must be proper.
