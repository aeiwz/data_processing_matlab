
%% Basic syntax

disp('Hello, MATLAB!');

result = (3 + 5) * 2 / (4 - 1);
disp(result);


vector = 1:10;
disp(vector);


A = [1, 2, 3];
B = [4, 5, 6];
sum_vector = A + B;
disp(sum_vector);


C = [1, 2; 3, 4];
D = [5, 6; 7, 8];
product_matrix = C * D;
disp(product_matrix);


even_numbers = 2:2:20;
disp(even_numbers);

odd_numbers = 1:2:20;
disp(odd_numbers);

% Function

function fact = factorial_calc(n)
    fact = 1;
    for i = 1:n
        fact = fact * i;
    end
end

n = 30; % Change this to test different values
result = factorial_calc(n);
disp(result);



function is_prime = is_prime_number(num)
    if num <= 1
        is_prime = false;
        return;
    end
    
    is_prime = true;
    for i = 2:sqrt(num)
        if mod(num, i) == 0
            is_prime = false;
            break;
        end
    end
end


num = 3; % Change this to test different values
result = is_prime_number(num);
disp(result);


x = 0:0.1:2*pi;
y1 = sin(x);
y2 = cos(x);

plot(x, y1, 'b', x, y2, 'r');
legend('sin(x)', 'cos(x)');
xlabel('x');
ylabel('y');
title('Sine and Cosine Functions');
grid on;



number = 56;
primeFactors(number);


odd_numbers = [];
for num = 1:50
    if mod(num, 2) == 1 && mod(num, 3) ~= 0
        odd_numbers = [odd_numbers, num];
    end
end
disp(odd_numbers);


x = linspace(0, 2*pi, 100);
y = sin(x);

plot(x, y)

title('sin function')
xlabel('X')
ylabel('Y')


x = linspace(0, 2*pi, 100);
y1 = sin(x);
y2 = cos(x);
x_scatter = rand(1, 50);
y_scatter = rand(1, 50);
z_scatter = rand(1, 50);
categories = {'A', 'B', 'C'};
data_bar = [3, 5, 7];
data_pie = [30, 40, 30];

%Line plot
subplot(1, 1, 1);
plot(x, y1, 'r-', x, y2, 'b--');
title('Line plot');
legend('sin(x)', 'cos(x)');
xlabel('X');
ylabel('Y');

%Scatter plot
subplot(3, 3, 2);
scatter(x_scatter, y_scatter, 'g.');
title('scatter plot');
xlabel('X');
ylabel('Y');

%Bar plot
subplot(3, 3, 3);
bar(data_bar, data_bar);
title('Bar plot')
xlabel('Categories');
ylabel('Data');

%Histrogram
subplot(3,3,4);
histogram(x_scatter, 10);
title('Histrogram')

%Pie chart
subplot(3, 3, 5);
pie(data_pie, categories)
title('Pie chart')

%3D plot
subplot(1, 1, 1);
scatter3(x_scatter, y_scatter, z_scatter);
title('3D plot')

%Box plot
subplot(1, 1, 1);
boxplot(randn(100, 3), "Labels", {1, 2, 3});
title('Box plot');


%Heatmap
load patients
tbl = table(LastName,Age,Gender,SelfAssessedHealthStatus,...
    Smoker,Weight,Location);
subplot(1, 1, 1);
heatmap(tbl,'Smoker','SelfAssessedHealthStatus');
title('Heatmap')


[X, Y] = meshgrid(-2:0.2:2);
Z = X .* exp(-X.^2 - Y.^2);
%Contour plot
subplot(1, 1, 1);
contour(X, Y, Z);
title('Contour plot')


%% Load NMR data and manipulate data
data = readtable('Example_NMR_data.csv');

ppm = table2array(data(1, 2:end));

X = table2array(data(2:end, 2:end));

label = data(2:end,1);


%% Plot NMR spectra
figure;
plot(ppm, X);
set(gca, 'Xdir', 'Reverse');
xlabel('\delta^1H');
ylabel('Intensity');
title('NMR spectra')
