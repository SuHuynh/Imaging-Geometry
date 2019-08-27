%%%%%%%%%%%%%%2D%%%
fileID = fopen('data2D.txt','r');
formatSpec = '%f %f';
sizeA = [2 298];
A = fscanf(fileID,formatSpec,sizeA);
fclose(fileID);
data_2D=A';
save data_2D;

%%%%3D%%%%%%%%%%

fileID_ = fopen('data3D.txt','r');
formatSpec_ = '%f %f %f';
sizeB = [3 298];
B = fscanf(fileID_,formatSpec_,sizeB);

data_3D=B';
save data_3D;
fclose(fileID_);
