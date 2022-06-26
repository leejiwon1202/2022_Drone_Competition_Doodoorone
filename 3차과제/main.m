% 1단계: 이미지를 읽어들임
img = imread('문제1.png');

% 2단계: rgb를 hsv로 변환
img_hsv = rgb2hsv(img); 
h = img_hsv(:,:,1) * 360;
s = img_hsv(:,:,2) * 360;
v = img_hsv(:,:,3) * 360;

% 3단계: 초록색 사각형 부분 추출
detect_h = (100 <h) & (h < 130);
detect_s = (180 < s) & (s < 280);
detect_v = (120 < v) & (v < 240);
detect_img = detect_h & detect_s & detect_v;

% 4단계: 큰 사각형의 꼭짓점 좌표 추출
big_canny = edge(detect_img, 'Canny', 0.2, 3);
big_corners = pgonCorners(big_canny, 4);

% 5단계: 작은 사각형만 남도록 큰 사각형 바깥의 픽셀값 변경
num = fix(numel(big_corners)/2);
float_x = sort(big_corners(1:num));
float_y = sort(big_corners(num+1:end));
x = cast(float_x, 'uint32');
y = cast(float_y, 'uint32');

detect_img(1:x(2),:) = 1;
detect_img(x(3):end,:) = 1;
detect_img(:,1:y(2)) = 1;
detect_img(:,y(3):end) = 1;

% 6단계: 작은 사각형의 꼭짓점 좌표 추출
small_canny = edge(detect_img, 'Canny', 0.2, 3);
small_corners = pgonCorners(small_canny, 4);

% 7단계: 영상 위에 중심 좌표 찍기
figure = imshow(img);
hold on;
meanXY = mean(small_corners);

plot(meanXY(2), meanXY(1), 'r.', 'MarkerSize', 15);
fprintf("x: %d, y: %d\n", fix(meanXY(2)), fix(meanXY(1)));