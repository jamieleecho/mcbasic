0 CLS:INPUT"DELAY";Z1
1 CLS:GOSUB100:GOTO90
2 RETURN
3 M=C(T):GOTO7
4 C(T)=W(RND(2)):M=C(T):GOTO7
5 ONK(N(1))GOTO2,2,2,2,8:RETURN
6 P=PEEK(P(A(T),B(T)+Y(M))):ONK(P)GOTO9,3,15,9,9,42,3,9,9,61
7 P=PEEK(P(A(T)+X(M),B(T))):ONK(P)GOTO9,12,15,9,9,42,12,9,9,61
8 P=PEEK(P(A(T)+X(M),B(T)+Y(M))):ONK(P)GOTO9,2,15,9,9,42,2,9,9,61
9 A=P(A(T),B(T)):B=N(T):POKEA,B:N(T)=P:A(T)=A(T)+X(M):B(T)=B(T)+Y(M):A=P(A(T),B(T)):B=D(M,T):POKEA,B
10 F(T)=PEEK(P(A(T),B(T)+1)):ONK(N(T))GOTO11,2,2,2,11:RETURN
11 F(T)=2:RETURN
12 C(T)=W2(M):M=C(T):P=PEEK(P(A(T)+X(M),B(T))):ONK(P)GOTO9,2,15,9,9,42,2,9,9,61
13 M=5:GOSUB8:GOTO22
14 M=5:GOSUB6:NEXT:NEXT:GOSUB43:NEXT:GOTO50
15 P=G:G(T)=G(T)+1:SOUND100,1:IFG(T)<>WTHEN9
16 A=P(E(1),E(2)):POKEA,240:GOSUB9:SOUND50,1:SOUND20,2:SOUND100,3:RETURN
17 ONK(N(T))GOSUB3,3,3,3,6,42,3:NEXT:NEXT:GOSUB43:NEXT:GOTO50
18 GOSUB6:NEXT:NEXT:GOSUB43:NEXT:GOTO50
19 GOSUB7:ONRND(4)GOTO22:NEXT:NEXT:GOSUB43:NEXT:GOTO50
20 FORZ=1TO64000:FORS=1TOV:FORC=2TOF:T=1:ONK(F(T))GOTO13,21,13,13,21,21,21,38,39
21 FORZZ=1TOZ1:NEXT:M=K(PEEK(K)ANDPEEK(2)):ONMGOSUB25,8,5,8,8,27,80
22 T=C:ONK(F(T))GOTO14,23,23,14,23,14,23,30,31
23 M=U(L+(B(T)-B(1))):ONMGOTO24,24,17,24,18:M=V(N+(A(T)-A(1))):ONMGOTO24,19,24,19
24 NEXT:NEXT:GOSUB43:NEXT:GOTO50
25 A=P(A(T),B(T)):POKEA,141:P=PEEK(P(A(T)-1,B(T))):IFP=GORP=QTHENIFPEEK(P(A(T)-1,B(T)+1))=ITHENS=1:O=O+1:H(O)=A(T)-1:GOTO49
26 RETURN
27 A=P(A(T),B(T)):POKEA,G1:P=PEEK(P(A(T)+1,B(T))):IFP=GORP=QTHENIFPEEK(P(A(T)+1,B(T)+1))=ITHENS=1:O=O+1:H(O)=A(T)+1:GOTO49
28 RETURN
29 I(J)=1:J=15:NEXT:B(T)=B(T)-1:RETURN
30 ON-(G(T)>.)GOTO37:A=P(A(T),B(T)):POKEA,G:B(T)=B(T)+1:A=P(A(T),B(T)):POKEA,G2:F(T)=144:NEXT:NEXT:GOSUB43:NEXT:GOTO50
31 A=P(A(T),B(T)):POKEA,RND(2)+D:T(T)=T(T)+1:IFT(T)<ETHENNEXT:NEXT:GOSUB43:NEXT:GOTO50
32 P=PEEK(P(A(T),B(T)-1)):ONK(P)GOSUB2,2,35,34,2,41,2,2,2:NEXT:NEXT:GOSUB43:NEXT:GOTO50
33 FORJ=1TO15:ON-(H(J)=A(T)ANDI(J)=B(T))GOTO29:NEXT:RETURN
34 A=P(A(T),B(T)):POKEA,I:POKEP(A(T),B(T)-1),G2:F(T)=I:T(T)=.:SOUND1,1:GOTO33
35 A=P(A(T),B(T)):POKEA,I:POKEP(A(T),B(T)-1),G2:F(T)=I:T(T)=.:SOUND200,1:G(T)=G(T)+1:GOTO33
37 A=P(A(T),B(T)):POKEA,146:G(T)=G(T)-1:B(T)=B(T)+1:A=P(A(T),B(T)):POKEA,G2:F(T)=144:NEXT:NEXT:GOSUB43:NEXT:GOTO50
38 A=P(A(T),B(T)):POKEA,N(T):B(T)=B(T)+1:ON-(B(T)>14)GOTO54:A=P(A(T),B(T)):POKEA,D(M,T):F(T)=PEEK(P(A(T),B(T)+1)):N(T)=Q:GOTO22
39 A=P(A(T),B(T)):POKEA,D(M,T):F(T)=144:GOTO22
40 PRINT@0,"YOU GOT CAUGHT!";:Z=65000:C=F:S=999:RETURN
41 GOSUB35:GOSUB40:RETURN
42 GOSUB9:GOSUB40:RETURN
43 IFU=OTHENRETURN
44 U=U+1:ONUGOTO45,45,45,45,45,45,45,45,45,45,45,45,45,45,45:U=1
45 ONI(U)GOTO2:ONK(PEEK(P(H(U),I(U))))GOTO82,82,82,82,82,47,47,46,82,82
46 A=P(H(U),I(U)):POKEA,I:I(U)=1:RETURN
47 FORJ=2TOF:ON-(H(U)=A(J)ANDI(U)=B(J))GOTO48:NEXT:GOSUB40:PRINT@0,"BURIED ALIVE!!!";:RETURN
48 N(J)=PEEK(P(NX,NY)):A(J)=NX:B(J)=NY:POKEP(A(J),B(J)),G2:SOUND1,5:F(J)=PEEK(P(A(J),B(J)+1)):T(J)=.:J=F:NEXT:GOTO46
49 I(O)=B(T)+1:A=P(H(O),I(O)):POKEA,Q:ONOGOTO2,2,2,2,2,2,2,2,2,2,2,2,2,2:O=.:RETURN
50 IFS>=999THENMN=MN-1
51 PRINT@480,"LIVES=";MN;:PRINT@502,"HIT c KEY";
52 I$=INKEY$:IFI$<>"C"THEN52
53 GOTO900
54 PRINT@0,"OOPS!";:Z=65000:C=F:S=999:GOTO22
55 PRINT@480,"PLAY AGAIN (y/n)?��������������";
56 I$=INKEY$:IFI$=""THEN56
57 IFI$="Y"THEN:LC=.:MN=3:S=0:LV=0:GOTO900
58 IFI$="N"THENCLS:GOTO70
59 GOTO56
61 GOSUB9:SOUND193,3:SOUND204,3:SOUND204,3:LC=LC+1:Z=65000:C=F:S=V:RETURN
70 PRINT"YOU COMPLETED";STR$(LC*10);"% OF THE":PRINT"LEVELS OF MC-LODE RUNNER":END
80 MN=1:GOTO40
82 I(U)=1:RETURN
90 DIMP(31,15),A(5),B(5),M,P,S,V,C,F,T,A,B,K(255),V(63),F(5),G(8),M(88),X(5),Y(5),D(5,5),N(5),C(5),U(31),T(5),W(2),W2(4)
91 DIMH(15),I(15),K,G,Q,I,O,D,E,H,J,L,N,U,W,X,Y,Z,LV,LC,NX,NY,NT,G1,G2,MC,I$,A$,MN:POKE16925,0:POKE16926,1:GOSUB800:GOTO50
100 CLS:PRINT@2,"mc-lode runner by jim gerrie"
110 PRINT
120 PRINT"TO MOVE USE:"
130 PRINT"    W           T"
140 PRINT"  A   S  OR   F G H"
155 PRINT"    Z"
156 PRINT"                  TO DIG USE:"
160 PRINT"                     < >":PRINT
180 PRINT"AFTER LEVEL IS DISPLAYED PRESS"
190 PRINT"n TO SKIP TO NEXT LEVEL. GUARDS"
195 PRINT"ONLY GIVE UP ONE GOLD WHEN THEY"
196 PRINT"FALL IN PITS. THERE ARE 10"
197 PRINT"LEVELS. HIT enter TO QUIT."
200 RETURN
800 ZZ=RND(-(PEEK(9)*256+PEEK(10))):W2(4)=2:W2(2)=4:D=188:Q=160
805 K(44)=1:K(65)=2:K(87)=3:K(83)=4:K(90)=5:K(46)=6:MC=16384:K=17023:G=128:H=220:I=175:L=16:N=32:W(1)=4:W(2)=2
806 K(70)=2:K(84)=3:K(72)=4:K(71)=5:K(13)=7:G1=142:G2=190
810 M(32)=128:M(88)=175:M(72)=220:M(45)=204:M(42)=146:M(79)=239:FORT=1TO5:C(T)=W(RND(2)):NEXT:K(176)=2
815 K(204)=1:K(175)=2:K(239)=2:K(146)=3:K(128)=4:K(220)=5:K(142)=6:K(141)=6:K(189)=7:K(190)=7:K(160)=8:K(144)=9:K(240)=10
820 FORX=0TO31:FORY=0TO15:P(X,Y)=(32*Y)+X+MC:NEXT:NEXT
830 X(2)=-1:Y(2)=0:D(2,1)=141:FORT=2TO5:D(2,T)=189:NEXT
831 X(3)=0:Y(3)=-1:D(3,1)=141:FORT=2TO5:D(3,T)=189:NEXT
832 X(4)=1:Y(4)=0:D(4,1)=142:FORT=2TO5:D(4,T)=190:NEXT
833 X(5)=0:Y(5)=1:D(5,1)=142:FORT=2TO5:D(5,T)=190:NEXT
840 FORT=0TO15:U(T)=5:NEXT:FORT=17TO31:U(T)=3:NEXT
845 FORT=0TO31:V(T)=4:NEXT:FORT=33TO63:V(T)=2:NEXT
860 A$="���":MN=3:RETURN
870 SOUND38,4:SOUND58,4:SOUND78,4:SOUND89,4:SOUND108,4:SOUND125,4:SOUND133,4:SOUND147,4
880 SOUND159,4:SOUND170,4:SOUND176,4:SOUND185,4:RETURN
900 IFS>=999THEN904
901 LV=LV+1:IFLV=10ANDLC=10THENGOSUB870
902 IFLV=11THENPRINT"GAME OVER.":GOTO70
904 ONMNGOTO905,905,905:GOTO55
905 CLS0:FORT=16384TO16415:POKET,175:NEXT:PRINT@32,"";:ONLVGOSUB1000,1100,1200,1300,1400,1500,1600,1700,1800,1900:E=V
910 FORC=16864TO16895:POKEC,175:NEXT
930 N(1)=128:POKEP(A(1),B(1)),141:F(1)=PEEK(P(A(1),B(1)+1)):G(1)=0
940 F=F+1:FORT=2TOF:N(T)=128:A=P(A(T),B(T)):POKEA,G2:F(T)=PEEK(P(A(T),B(T)+1)):G(T)=0:T(T)=0:NEXT
950 U=0:O=0:FORJ=0TO15:H(J)=0:I(J)=1:NEXT
960 I$=INKEY$:IFI$=""THEN960
970 IFI$="N"THENS=0:GOTO900
990 GOTO20
1000 V=8:PRINTA$"�����������������܀�������"A$;
1002 PRINTA$"������ܯ���������܀�������"A$;
1003 PRINTA$"�����������������܀�������"A$;
1004 PRINTA$"������܀�����܀��������ܯ�"A$;
1005 PRINTA$"������܀�����܀��������܀�"A$;
1006 PRINTA$"������܀�����܀��������܀�"A$;
1007 PRINTA$"��ܯ���������������ܯ�����"A$;
1008 PRINTA$"��܀���������������܀�����"A$;
1009 PRINTA$"��܀���������������܀�����"A$;
1010 PRINTA$"��������ܯ���������܀�����"A$;
1011 PRINTA$"��������܀���������܀�����"A$;
1012 PRINTA$"�������������������܀�����"A$;
1013 PRINTA$"����ܯ��������������������"A$;
1014 PRINTA$"����܀��������������������"A$;
1015 W=6:E(1)=20:E(2)=0:A(1)=16:B(1)=14:F=3:A(2)=8:B(2)=6:A(3)=25:B(3)=6:A(4)=16:B(4)=9:NX=16:NY=1:RETURN
1100 V=8:PRINTA$"��������������������������"A$;
1102 PRINTA$"ܯ�ﯯ܀������������������"A$;
1103 PRINTA$"܀����܀���ܯ�������܀����"A$;
1104 PRINTA$"܀����܀���܀�������ܯ����"A$;
1105 PRINTA$"����܀���܀�������܀����"A$;
1106 PRINTA$"܀��������������̀��܀����"A$;
1107 PRINTA$"܀����܀���܀���ܯ��������"A$;
1108 PRINTA$"܀����܀���܀���܀��������"A$;
1109 PRINTA$"܀����܀���ܯ���܀��������"A$;
1110 PRINTA$"ﯯ�ﯯﯯ�܀�������ܯ�ܯ�"A$;
1111 PRINTA$"ﯯ�����܀�������܀�܀�"A$;
1112 PRINTA$"�����܀�������܀�܀�"A$;
1113 PRINTA$"ﯯ�ﯯ�ܯ�������܀����"A$;
1114 PRINTA$"��������܀����������܀����"A$;
1115 W=8:E(1)=28:E(2)=0:A(1)=15:B(1)=14:F=3:A(2)=7:B(2)=4:A(3)=22:B(3)=6:A(4)=7:B(4)=9:NX=16:NY=1:RETURN
1200 V=8:PRINTA$"��������̀����������������"A$;
1202 PRINTA$"ܒ������ܯ��������܀������"A$;
1203 PRINTA$"����܀��܀����������������"A$;
1204 PRINTA$"����܀��܀��������܀������"A$;
1205 PRINTA$"����ܯ����ܯ����ܯ��������"A$;
1206 PRINTA$"����܀����܀����܀��̀����"A$;
1207 PRINTA$"���ܯ�����܀����܀����̀��"A$;
1208 PRINTA$"���܀���ܯ����ܯ��������̒"A$;
1209 PRINTA$"��������܀����܀����������"A$;
1210 PRINTA$"���܀�����ܯ��������܀����"A$;
1211 PRINTA$"���܀�����ܯ��������܀����"A$;
1212 PRINTA$"��ܯ��������������������ܯ"A$;
1213 PRINTA$"��ܯ���������ܯ��܀�����ܯ"A$;
1214 PRINTA$"��܀���������ܯ��܀�����܀"A$;
1215 W=6:E(1)=28:E(2)=0:A(1)=12:B(1)=14:F=3:A(2)=9:B(2)=4:A(3)=16:B(3)=7:A(4)=20:B(4)=9:NX=16:NY=1:RETURN
1300 V=8:PRINTA$"����������̀��������������"A$;
1302 PRINTA$"܀���܀��������������܀���"A$;
1303 PRINTA$"ܒ����܀��������������܀��"A$;
1304 PRINTA$"��܀�܀��܀�������܀�܀���"A$;
1305 PRINTA$"�܀����܀܀������܀����܀�"A$;
1306 PRINTA$"�܀������܀��܀��܀�������"A$;
1307 PRINTA$"܀ܯ����܀����܀��ܯ����܀"A$;
1308 PRINTA$"܀�����܀�܀�܀��܀����܀�"A$;
1309 PRINTA$"܀�������܀����܀܀�������"A$;
1310 PRINTA$"܀�������܀������܀�������"A$;
1311 PRINTA$"ܯ����܀��ܯ����܀�ܯ�����"A$;
1312 PRINTA$"܀����܀�������܀��܀�����"A$;
1313 PRINTA$"܀����܀�����������܀�����"A$;
1314 PRINTA$"܀����܀�����������܀�����"A$;
1315 W=14:E(1)=3:E(2)=0:A(1)=20:B(1)=14:F=3:A(2)=8:B(2)=6:A(3)=24:B(3)=6:A(4)=16:B(4)=10:NX=16:NY=1:RETURN
1400 V=10:PRINTA$"�����������̀�����������܀"A$;
1402 PRINTA$"��������܀��������������܀"A$;
1403 PRINTA$"����������܀������������܀"A$;
1404 PRINTA$"����������ܯ�����ܯ���ܯ��"A$;
1405 PRINTA$"����������܀�����܀���܀��"A$;
1406 PRINTA$"����������܀�����܀���܀��"A$;
1407 PRINTA$"����������ܯ�������ܯ��"A$;
1408 PRINTA$"����������܀����������܀��"A$;
1409 PRINTA$"����������܀����������܀��"A$;
1410 PRINTA$"����������܀����������܀��"A$;
1411 PRINTA$"����������܀����������܀��"A$;
1412 PRINTA$"�����������ܯ�����܀��܀��"A$;
1413 PRINTA$"�����������܀�������������"A$;
1414 PRINTA$"�����������܀�������������"A$;
1415 W=9:E(1)=27:E(2)=0:A(1)=12:B(1)=14:F=2:A(2)=3:B(2)=5:A(3)=21:B(3)=6:NX=16:NY=1:RETURN
1500 V=6:PRINTA$"���������܀���������������"A$;
1502 PRINTA$"���������܀��������ܯ�����"A$;
1503 PRINTA$"���������܀��������܀�����"A$;
1504 PRINTA$"���������܀��������܀�����"A$;
1505 PRINTA$"���������܀��������܀�����"A$;
1506 PRINTA$"��ܯ�����܀�����ܯ�ܯ�����"A$;
1507 PRINTA$"��܀�����܀�����܀��������"A$;
1508 PRINTA$"��ܒ�����ܯ�����܀��������"A$;
1509 PRINTA$"ܯ��܀���܀�����ܯܯ������"A$;
1510 PRINTA$"܀��܀������������܀������"A$;
1511 PRINTA$"܀��܀������������܀������"A$;
1512 PRINTA$"܀��ܯ������ܯ����ܯ���ܯ�"A$;
1513 PRINTA$"܀����������܀���������܀�"A$;
1514 PRINTA$"܀����������܀���������܀�"A$;
1515 W=7:E(1)=12:E(2)=0:A(1)=18:B(1)=14:F=4:A(2)=26:B(2)=1:A(3)=4:B(3)=5:A(4)=7:B(4)=8:A(5)=18:B(5)=11:NX=16:NY=1:RETURN
1600 V=6:PRINTA$"�܀�����������������������"A$;
1602 PRINTA$"�܀���������������܀������"A$;
1603 PRINTA$"����ܯ����ܯ������܀������"A$;
1604 PRINTA$"����܀����܀������ܯ������"A$;
1605 PRINTA$"����܀����܀������܀������"A$;
1606 PRINTA$"����ܯ����܀������܀������"A$;
1607 PRINTA$"����܀����܀������܀������"A$;
1608 PRINTA$"����܀����܀������܀������"A$;
1609 PRINTA$"�ܯ����������܀���܀������"A$;
1610 PRINTA$"�܀����������܀���܀������"A$;
1611 PRINTA$"�܀���������������܀������"A$;
1612 PRINTA$"������܀����������܀������"A$;
1613 PRINTA$"������܀����������܀������"A$;
1614 PRINTA$"������܀����������܀������"A$;
1615 W=8:E(1)=4:E(2)=0:A(1)=11:B(1)=14:F=4:A(2)=14:B(2)=2:A(3)=20:B(3)=3:A(4)=4:B(4)=5:A(5)=24:B(5)=14:NX=16:NY=1:RETURN
1700 V=8:PRINTA$"����������������������܀��"A$;
1702 PRINTA$"ܯ��������������܀����܀��"A$;
1703 PRINTA$"܀��������������������܀��"A$;
1704 PRINTA$"���������ܯ�����������ܯ��"A$;
1705 PRINTA$"���������܀�����������܀��"A$;
1706 PRINTA$"���������������܀�����܀��"A$;
1707 PRINTA$"�������܀������܀�����܀��"A$;
1708 PRINTA$"������܀���ܯ����ﯯ��ܯ��"A$;
1709 PRINTA$"�����܀����܀���������܀��"A$;
1710 PRINTA$"�����܀���������������܀��"A$;
1711 PRINTA$"ܯ���������܀���������ܯ��"A$;
1712 PRINTA$"܀���������܀���������܀��"A$;
1713 PRINTA$"܀���������܀���������܀��"A$;
1714 PRINTA$"܀���������܀���������܀��"A$;
1715 W=14:E(1)=25:E(2)=0:A(1)=19:B(1)=14:F=3:A(2)=16:B(2)=7:A(3)=23:B(3)=7:A(4)=7:B(4)=10:NX=16:NY=1:RETURN
1800 V=8:PRINTA$"������������������������܀"A$;
1802 PRINTA$"ܯ���������܀�����������܀"A$;
1803 PRINTA$"܀���������ܯ����܀���ܯ��"A$;
1804 PRINTA$"܀���������܀����܀���܀��"A$;
1805 PRINTA$"܀���������܀����܀���܀��"A$;
1806 PRINTA$"܀���������܀��ﯯ�������"A$;
1807 PRINTA$"܀���������܀���������"A$;
1808 PRINTA$"܀���������܀������̀�����"A$;
1809 PRINTA$"܀���������܀����������"A$;
1810 PRINTA$"܀���������܀�������܀�"A$;
1811 PRINTA$"܀���������܀�������ܯ�"A$;
1812 PRINTA$"܀���������܀�������܀�"A$;
1813 PRINTA$"�������������������܀�"A$;
1814 PRINTA$"܀���������������������܀�"A$;
1815 W=11:E(1)=27:E(2)=0:A(1)=17:B(1)=14:F=3:A(2)=8:B(2)=1:A(3)=17:B(3)=2:A(4)=23:B(4)=5:NX=16:NY=1:RETURN
1900 V=8:PRINT"����������������܀��������������";
1902 PRINT"��������̀�����ܯ܀���������̀��";
1903 PRINT"������������ܯ�ܯܒ�����܀������";
1904 PRINT"����ܯ��܀��ܯ������܀��ܯ��܀��";
1905 PRINT"����ܯ��������ܯ����܀������܀��";
1906 PRINT"�����ܯ�������ܯ��܀��������܀��";
1907 PRINT"�����ܯ�������ܯ��܀�������܀���";
1908 PRINT"�����ܯ�������ܯ��܀�������܀���";
1909 PRINT"�����ܯ�������ܯ��܀�������܀���";
1910 PRINT"�����ܯ�������ܯ��܀�������܀���";
1911 PRINT"�����ܯ�������ܯ��܀�������܀���";
1912 PRINT"�����ܯ�������ܯ��ܯ�������܀���";
1913 PRINT"�����ܯ�������܀��ܯ�������ܒ���";
1914 PRINT"�������������������������������";
1915 W=9:E(1)=16:E(2)=0:A(1)=20:B(1)=11:F=3:A(2)=12:B(2)=2:A(3)=20:B(3)=2:A(4)=24:B(4)=11:NX=16:NY=1:RETURN