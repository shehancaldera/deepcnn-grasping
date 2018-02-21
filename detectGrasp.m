

dataDir='D:\Cornell Grasps Dataset';
processedDataDir='D:\Cornell Grasps Dataset\processedImages';
labels = randi([100 949],1,850);
detectedLabel = labels(1,5);

instanceImg = imread(sprintf('%s/pcd%04dr.png',dataDir,detectedLabel));
ycbcrImg = imread(sprintf('%s/pcd%04dr.png',processedDataDir,detectedLabel));
grayImg = rgb2gray(instanceImg);
depthImg = ycbcrImg;
depthImg(:,:,2) = 0;
depthImg(:,:,3) = 0;

predictedGrasp = findGrasp(detectedLabel,dataDir);

subplot(2,2,1)
imshow(instanceImg);
hold on
line(predictedGrasp(:,1),predictedGrasp(:,2));
hold off
subplot(2,2,2)
imshow(ycbcrImg);
hold on
line(predictedGrasp(:,1),predictedGrasp(:,2));
hold off
subplot(2,2,3)
imshow(grayImg);
hold on
line(predictedGrasp(:,1),predictedGrasp(:,2));
hold off
subplot(2,2,4)
imshow(depthImg);
hold on
line(predictedGrasp(:,1),predictedGrasp(:,2));
hold off