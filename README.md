## Download data
[Download](https://github.com/aeiwz/example_data/blob/4d4b92cfca1ed511fe30543f74e8ab76ee800412/dataset/Example_NMR_data.csv)

## MATLAB clound
https://matlab.mathworks.com

# MATLAB Data Processing Tutorial

## 1. Introduction
This tutorial will guide you through the basic steps of data processing using MATLAB. We'll cover how to load, clean, and analyze data from a CSV file.

## 2. Loading Data

First, let's load the data from a CSV file into MATLAB.

```matlab
% Load the data from a CSV file
filename = 'Example_NMR_data.csv';
data = readtable(filename);

% Display the first few rows of the data
head(data)
```

## 3. Exploring Data

After loading the data, it's important to understand its structure and contents.

```matlab
% Check the size of the dataset
[m, n] = size(data);

% Display the names of the columns (variables)
disp('Column names:')
disp(data.Properties.VariableNames)

% Summary statistics of the data
summary(data)
```

## 4. Data Cleaning

Data cleaning is a crucial step before analysis. We may need to handle missing values, outliers, or incorrect data types.

### 4.1 Handling Missing Values

```matlab
% Check for missing values
missingValues = sum(ismissing(data));

% Remove rows with missing values
dataClean = rmmissing(data);

% Alternatively, fill missing values with the mean (for numerical data)
dataFilled = fillmissing(data, 'linear');
```

### 4.2 Converting Data Types

```matlab
% Convert a column to a different data type, if necessary
data.ColumnName = str2double(data.ColumnName);
```

## 5. Data Transformation

Sometimes, you need to transform the data for better analysis.

### 5.1 Normalization

```matlab
% Normalize the data to a range [0, 1]
dataNorm = normalize(data{:, 2:end}, 'range');
dataNorm = array2table(dataNorm, 'VariableNames', data.Properties.VariableNames(2:end));

% Combine normalized data with original identifiers
dataNorm = [data(:, 1), dataNorm];
```

### 5.2 Log Transformation

```matlab
% Apply a log transformation to reduce skewness
dataLog = log(data{:, 2:end});
dataLog = array2table(dataLog, 'VariableNames', data.Properties.VariableNames(2:end));

% Combine log-transformed data with original identifiers
dataLog = [data(:, 1), dataLog];
```

## 6. Data Analysis

Now that the data is clean, we can proceed with analysis.

### 6.1 Basic Statistical Analysis

```matlab
% Calculate mean and standard deviation for each variable
means = mean(data{:, 2:end});
stdDevs = std(data{:, 2:end});

% Display results
disp('Means:')
disp(means)
disp('Standard Deviations:')
disp(stdDevs)
```

### 6.2 Visualization

Visualizing data can help uncover patterns or insights.

```matlab
% Scatter plot of two variables
figure;
scatter(data{:, 'Variable1'}, data{:, 'Variable2'});
xlabel('Variable1');
ylabel('Variable2');
title('Scatter plot of Variable1 vs Variable2');

% Histogram of a single variable
figure;
histogram(data{:, 'VariableName'});
xlabel('VariableName');
ylabel('Frequency');
title('Histogram of VariableName');
```

## 7. Conclusion

This tutorial covered the basic steps of data processing in MATLAB, from loading data to cleaning, transforming, and analyzing it. You can build on these concepts for more advanced data analysis tasks.

```

This markdown template provides a structured way to teach MATLAB's data processing capabilities, with sections that students can follow to understand each step of the process. You can adjust the code snippets according to your specific dataset or teaching objectives.
