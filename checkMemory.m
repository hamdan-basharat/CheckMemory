function y = checkMemory(n,mag,system,x)
    figure('Name',"CheckMemory",'NumberTitle','on');
    xone = n(1)* -1 + 2;
    x1 = zeros(1,length(n));
    x1(xone) = mag;
    x2(1,1:length(n))=mag;
    y1 = system(n,x1);
    y2 = system(n,x2);
    
    subplot(2,2,1),stem(n,x1),title("Input;Current Time");
    subplot(2,2,2),stem(n,y1),title("Output");
    subplot(2,2,3),stem(n,x2),title("Past and Future Inputs");
    subplot(2,2,4),stem(n,y2),title("Output");
    
    if round(y1(xone),4) ~= round(y2(xone),4)%If the output at t=1 somehow changed because of a future input
        %y is the ouput from an impulse at t=1
        %y1 is the ouput from a constant input at all times in the future
        disp("This system has memory")
    else
        disp("This system is memoryless")
    end
end

