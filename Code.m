%% load data
clc
clear all
load('data_2D');
load('data_3D');
%% create matrix A
Row_1=[];
Row_2=[];
A=[];
for i=1:298
    % 
    Row_1(1)=data_3D(i,1);
    Row_1(2)=data_3D(i,2);
    Row_1(3)=data_3D(i,3);
    Row_1(4)=1;
    Row_1(5)=0;
    Row_1(6)=0;
    Row_1(7)=0;
    Row_1(8)=0;
    Row_1(9)=-data_2D(i,1) * data_3D(i,1);
    Row_1(10)=-data_2D(i,1) * data_3D(i,2);
    Row_1(11)=-data_2D(i,1) * data_3D(i,3);
    Row_1(12)=-data_2D(i,1) ;
    
    %
    Row_2(1)=0;
    Row_2(2)=0;
    Row_2(3)=0;
    Row_2(4)=0;
    Row_2(5)=data_3D(i,1);
    Row_2(6)=data_3D(i,2);
    Row_2(7)=data_3D(i,3);
    Row_2(8)=1;
    Row_2(9)= -data_2D(i,2) * data_3D(i,1);
    Row_2(10)=-data_2D(i,2) * data_3D(i,2);
    Row_2(11)=-data_2D(i,2) * data_3D(i,3);
    Row_2(12)=-data_2D(i,2);
    A=[A;Row_1;Row_2];
    
end

Sym_A=A'*A;
[V,D] = eig(Sym_A);
eig_value_vector=diag(D);
[lamda,index] = min(eig_value_vector(:));



P=V(:,index);

max(A*P)

P=vec2mat(P,4)
%%test
array_one=ones(298);
array_one=diag(array_one);
data_3D=[data_3D array_one];

MM=data_3D';
new_data_2D=P*MM;
% Sym_A*V(:,1)-eig_value_vector(12)*V(:,1)