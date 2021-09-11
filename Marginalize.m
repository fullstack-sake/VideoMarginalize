path='D:\MatLab project\ybb.mp4';     %原视频存放路径
obji=VideoReader(path);
num=obji.NumFrames;     %图片数
for i=1:num 
  frame=read(obji,i);
  ct=strcat('D:\MatLab project\ybb\ybb1\',num2str(i));   %拆分的彩图输出路径
  ct=strcat(ct,'.jpg');
  imwrite(frame,ct)
end             %完成视频拆分
close all;
clc;

for i=1:num  %图片遍历
  path='D:\MatLab project\ybb\ybb1\'; %彩图路径
  path=strcat(path,num2str(i));
  p=strcat(path,'.jpg');
  f=imread(p);
  f=rgb2gray(f);
  roberts=edge(f,'LOG');  %算子边缘检测
    %也可修改为'Sobel'、'Prewitt'、'LOG'或'Canny'，尝试不同的算子
  [m,n]=find(roberts==1);
  mh=scatter(n,-m,'.'); 
  zt=strcat('D:\MatLab project\ybb\ybb2\',num2str(i)); %边缘检测后的图片输出路径
  zt=strcat(zt,'.jpg'); %输出格式为jpg
  saveas(mh,zt); %保存
  pause(0.05);
end     %完成彩图向边缘图转换

Wobj=VideoWriter('LOG.mp4', 'MPEG-4'); %输出的格式及文件名
open(Wobj);
for i=1:num
  pic='D:\MatLab project\ybb\ybb2\';  %检测后的图片路径
  pic=strcat(pic,num2str(i));
  ppic=strcat(pic,'.jpg');
  frame=imread(ppic);  
  writeVideo(Wobj,frame);  
end         %完成视频合成
close(Wobj);


