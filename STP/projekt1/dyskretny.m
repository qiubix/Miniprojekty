function [A, B, C, D] = dyskretny()

T_s = 0.25;
l_s = [1 8 7];
m_s = [1 11 -62 -720];
G_s = tf(l_s, m_s);
[l_z m_z] = c2dm(l_s, m_s, T_s, 'zoh');
[A1, B1, C1, D1] = tf2ss(l_z, m_z);
A = A1';
B = C1';
C = B1';
D = D1';