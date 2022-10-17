0 SW = 63
1 SH = 31
2 SW2 = 31
3 SH2 = 14
4 DIM WX(4) : DIM WY(4) : DIM WZ(4)
10 REM PLAYER INFO
11 PX = 0 : PY = 0 : PZ = 0
12 PA = 0 : PL = 0
20 GOSUB 10001
30 CLS(0)
40 GOSUB 10155
50 GOSUB 10060
60 GOTO 30
10000 END
10001 REM INIT
10010 PX = 70 : PY = -110 : PZ = 20 : PA = 0 : PL = 0
10050 RETURN
10060 REM MOVE PLAYER
10070 KEY$ = INKEY$
10080 IF KEY$ = CHR$(8) THEN PA = PA - 1 : IF PA < 0 THEN PA = PA + 360
10085 IF KEY$ = CHR$(9) THEN PA = PA + 1 : IF PA > 359 THEN PA = PA - 360
10090 DX = SIN(PA) * 10
10091 DY = COS(PA) * 10
10095 IF KEY$ = "W" THEN PX = PX + DX : PY = PY + DY
10100 IF KEY$ = "S" THEN PX = PX - DX : PY = PY - DY
10105 IF KEY$ = "D" THEN PX = PX + DX : PY = PY - DY
10110 IF KEY$ = "A" THEN PX = PX - DX : PY = PY + DY
10115 IF KEY$ = CHR$(94) THEN PL = PL - 1
10120 IF KEY$ = CHR$(10) THEN PL = PL + 1
10125 IF KEY$ = "Z" THEN PZ = PZ - 4
10130 IF KEY$ = "Q" THEN PZ = PZ + 4
10150 RETURN
10155 REM DRAW 3D
10160 CS = COS(PA) : SN = SIN(PA)
10165 X1 = 40 - PX : Y1 = 10 - PY
10170 X2 = 40 - PX : Y2 = 290 - PY
10175 WX(0) = X1 * CS-Y1 * SN
10180 WX(1) = X2 * CS-Y2 * SN
10185 WY(0) = Y1 * CS+X1 * SN
10190 WY(1) = Y2 * CS+X2 * SN
10195 WZ(0) = 0 - PZ
10200 WZ(1) = 0 - PZ
10205 WX(0) = WX(0)*200/WY(0)+SW2 : WY(0) = WX(0)*200/WY(0)+SH2
10210 WX(1) = WX(1)*200/WY(1)+SW2 : WY(1) = WX(1)*200/WY(1)+SH2
10215 IF WX(0) > 0 AND WX(0) < SW AND WY(0) > 0 AND WY(0) < SH THEN SET(WX(0),WY(0),2)
10220 IF WX(1) > 0 AND WX(1) < SW AND WY(1) > 0 AND WY(1) < SH THEN SET(WX(1),WY(1),2)
10300 RETURN