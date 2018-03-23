function [] = create_results(t1,t2,t3,t4,voc_size,method)
%CREATE_RESULTS Summary of this function goes here
%   Detailed explanation goes here
% empty=imread('empty.jpg');
result_string = string.empty(0,1);

truepos1=0;
truepos2=0;
truepos3=0;
truepos4=0;
ap1=0;
ap2=0;
ap3=0;
ap4=0;
for i =1:size(t1,2)
   if length(strfind(t1(1,i),'airplane')) >0
        truepos1=truepos1+1;
        ap1=ap1+(truepos1/i);
   end
end

for i =1:size(t2,2)
   if length(strfind(t2(1,i),'car')) >0
        truepos2=truepos2+1;
         ap2=ap2+(truepos2/i);
   end
end

for i =1:size(t3,2)
   if length(strfind(t3(1,i),'face')) >0
        truepos3=truepos3+1;
    ap3=ap3+(truepos3/i);
   end
end

for i =1:size(t4,2)
   if length(strfind(t4(1,i),'motor')) >0
        truepos4=truepos4+1;
    ap4=ap4+(truepos4/i);
   end
end

neg1=num2str(size(t1,2)-truepos1);
truepos1=num2str(truepos1);
ap1=ap1/size(t1,2);
ap2=ap2/size(t2,2);
ap3=ap3/size(t3,2);
ap4=ap4/size(t4,2);
neg2=num2str(size(t2,2)-truepos2);
truepos2=num2str(truepos2);

neg3=num2str(size(t3,2)-truepos3);
truepos3=num2str(truepos3);

neg4=num2str(size(t4,2)-truepos4);
truepos4=num2str(truepos4);
result_string =cat(1,result_string,["<!DOCTYPE html>"]);
result_string =cat(1,result_string,["<html lang='en'>"]);
  result_string =cat(1,result_string,["<head>"]);
    result_string =cat(1,result_string,["<meta charset='utf-8'>"]);
    result_string =cat(1,result_string,["<title>Image list prediction</title>"]);
  result_string =cat(1,result_string,["<style type='text/css'>"]);
   result_string =cat(1,result_string,["img {"]);
     result_string =cat(1,result_string,["width:200px;"]);
   result_string =cat(1,result_string,["}"]);
  result_string =cat(1,result_string,["</style>"]);
  result_string =cat(1,result_string,["</head>"]);
  result_string =cat(1,result_string,["<body>"]);
result_string =cat(1,result_string,[""]);
result_string =cat(1,result_string,["<h2>Andreas Hadjipieris, Michael van der Werve</h2>"]);
result_string =cat(1,result_string,["<h1>Settings</h1>"]);
result_string =cat(1,result_string,["<table>"]);
result_string =cat(1,result_string,["<tr><th>SIFT step size</th><td>0 px</td></tr>"]);
result_string =cat(1,result_string,["<tr><th>SIFT block sizes</th><td>0 pixels</td></tr>"]);
result_string =cat(1,result_string,[strcat("<tr><th>SIFT method</th><td>",method,"-SIFT</td></tr>")]);
result_string =cat(1,result_string,[strcat("<tr><th>Vocabulary size</th><td>",num2str(voc_size)," words</td></tr>")]);
result_string =cat(1,result_string,["<tr><th>Vocabulary fraction</th><td>0.5 </td></tr>"]);
result_string =cat(1,result_string,[strcat("<tr><th>SVM training data</th><td>",truepos1," positive airplanes, ",neg1," negative airplanes,",truepos2," positive cars, ",neg2," negative cars,",truepos3," ,positive faces, ",neg3," ,negative faces,",truepos4," positive motorbikes, ",neg4," negative motorbikes"," </td></tr>")]);
result_string =cat(1,result_string,["<tr><th>SVM kernel type</th><td>XXX</td></tr>"]);
result_string =cat(1,result_string,["</table>"]);
result_string =cat(1,result_string,["<h1>Prediction lists (MAP: 0.XXX)</h1>"]);
result_string =cat(1,result_string,["<table>"]);
result_string =cat(1,result_string,["<thead>"]);
result_string =cat(1,result_string,["<tr>"]);
result_string =cat(1,result_string,[strcat("<th>Airplanes (AP: ",num2str(ap1),")</th><th>Cars (AP: ",num2str(ap2),")</th><th>Faces (AP: ",num2str(ap3),")</th><th>Motorbikes (AP: ",num2str(ap4),")</th>")]);
result_string =cat(1,result_string,["</tr>"]);
result_string =cat(1,result_string,["</thead>"]);
result_string =cat(1,result_string,["<tbody>"]);
sizes=[size(t1,2),size(t2,2),size(t3,2),size(t4,2)];
for i=1:max(sizes)
    result_string =cat(1,result_string,["<tr>"]);
        if size(t1,2)>=i
            result_string =cat(1,result_string,[strcat("<td><img src='D:/Users/Andy/Downloads/Desktop/CV/labs-master/FinalProject/Caltech4/ImageData/",t1(1,i))]);
%             result_string = cat(1,result_string,[t1(1,i) ]);
%                 result_string =cat(1,result_string,["</td>"]);
        else
            result_string =cat(1,result_string,["'/></td><td><img src='D:/Users/Andy/Downloads/Desktop/CV/labs-master/FinalProject/empty.jpg"]);
%             result_string = cat(1,result_string,[t1(1,1) ]);
            
        end
          if size(t2,2)>=i
            result_string =cat(1,result_string,[strcat("'/></td><td><img src='D:/Users/Andy/Downloads/Desktop/CV/labs-master/FinalProject/Caltech4/ImageData/",t2(1,i))]);
%             result_string = cat(1,result_string,[t2(1,i) ]);
        else
            result_string =cat(1,result_string,["'/></td><td><img src='D:/Users/Andy/Downloads/Desktop/CV/labs-master/FinalProject/empty.jpg"]);
%             result_string = cat(1,result_string,[t2(1,1) ]);
            
          end
          if size(t3,2)>=i
            result_string =cat(1,result_string,[strcat("'/></td><td><img src='D:/Users/Andy/Downloads/Desktop/CV/labs-master/FinalProject/Caltech4/ImageData/",t3(1,i))]);
%             result_string = cat(1,result_string,[t3(1,i) ]);
        else
            result_string =cat(1,result_string,["'/></td><td><img src='D:/Users/Andy/Downloads/Desktop/CV/labs-master/FinalProject/empty.jpg"]);
%             result_string = cat(1,result_string,[t3(1,1) ]);
            
          end
          if size(t4,2)>=i
            result_string =cat(1,result_string,[strcat("'/></td><td><img src='D:/Users/Andy/Downloads/Desktop/CV/labs-master/FinalProject/Caltech4/ImageData/",t4(1,i))]);
%             result_string = cat(1,result_string,[t4(1,i) ]);
        else
            result_string =cat(1,result_string,["'/></td><td><img src='D:/Users/Andy/Downloads/Desktop/CV/labs-master/FinalProject/empty.jpg"]);
%             result_string = cat(1,result_string,[t4(1,1) ]);
            
          end
              result_string   =  cat(1,result_string,[" '/></td></tr>"]);
    
end
result_string =cat(1,result_string,["</tbody>"]);
result_string =cat(1,result_string,["</table>"]);
result_string =cat(1,result_string,["  </body>"]);
result_string =cat(1,result_string,["</html>"]);

filePh = fopen('results.html','w');
fprintf(filePh,'%s\n',result_string{:});
fclose(filePh);



end

