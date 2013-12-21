%function przebieg = zmiennestanu(z1, z2, z3)

l_s = [1 8 7];
m_s = [1 11 -62 -720];
G_s = tf(l_s, m_s);
[l_z m_z] = c2dm(l_s, m_s, T_s, 'zoh');
[A1, B1, C1, D1] = tf2ss(l_z, m_z);
A = A1';
B = C1';
C = B1';
D = D1';
T_s = 0.25;
kk = 100 * T_s;

K = acker(A, B,[0.32, 0.32, 0.32])
sim model2;
display('x1 x2 x3 u');
przebieg = [x1 x2 x3 u]


K = acker(A, B,[0.43, 0.0001, 0.0001])
sim model2;
display('x1 x2 x3 u');
przebieg = [x1 x2 x3 u]


K = acker(A, B,[0.004600000000000 - 0.000400000000000i, conj(0.004600000000000 - 0.000400000000000i), 0.0001])
sim model2;
display('x1 x2 x3 u');
przebieg = [x1 x2 x3 u]