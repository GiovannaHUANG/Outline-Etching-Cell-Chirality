function [ output_args ] = DrawRegion( Regions , ifLabelOn)
%DRAWREGION Summary of this function goes here
%   Detailed explanation goes here



phi = linspace(0,2*pi,50);
cosphi = cos(phi);
sinphi = sin(phi);
for k = 1:length(Regions)
%     k = 10;
    xbar = Regions(k).Centroid(1);
    ybar = Regions(k).Centroid(2);
      a = Regions(k).MajorAxisLength/2;
      b = Regions(k).MinorAxisLength/2;
      theta = pi*Regions(k).Orientation/180;
      R = [ cos(theta)   sin(theta)
           -sin(theta)   cos(theta)];
      xy = [a*cosphi; b*sinphi];
      xy = R*xy;
      x = xy(1,:) + xbar;
      y = xy(2,:) + ybar;
      plot(x,y,'g','LineWidth',1);
      hold on
      % Major Axis Values
      xMajor1 = xbar + (((Regions(k).MajorAxisLength)./2) * cosd(Regions(k).Orientation));
      yMajor1 = ybar - (((Regions(k).MajorAxisLength)./2) * sind(Regions(k).Orientation));
      xMajor2 = xbar - (((Regions(k).MajorAxisLength)./2) * cosd(Regions(k).Orientation));
      yMajor2 = ybar + (((Regions(k).MajorAxisLength)./2) * sind(Regions(k).Orientation));
      line([xMajor1 xMajor2],[yMajor1 yMajor2],'color','r','LineWidth',2)
      % Minor Axis Values
      xMinor1 = xbar + (((Regions(k).MinorAxisLength)./2) * sind((180-Regions(k).Orientation)));
      yMinor1 = ybar - (((Regions(k).MinorAxisLength)./2) * cosd((180-Regions(k).Orientation)));
      xMinor2 = xbar - (((Regions(k).MinorAxisLength)./2) * sind((180-Regions(k).Orientation)));
      yMinor2 = ybar + (((Regions(k).MinorAxisLength)./2) * cosd((180-Regions(k).Orientation)));
%       line([xMinor1 xMinor2],[yMinor1 yMinor2],'color','c')
if(ifLabelOn)
      text([Regions(k).Centroid(1)-15],[Regions(k).Centroid(2)-15],{k},'color','c','fontsize',8);
end
end
hold on;

end

