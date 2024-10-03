# Use the official .NET SDK as a base image
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

# Set the working directory
WORKDIR /app

# Copy the project files into the container
COPY *.sln ./
COPY *.csproj ./

# Restore dependencies
RUN dotnet restore

# Copy the rest of the application files
COPY . ./

# Build the application
RUN dotnet build -c Release -o out

# Use the .NET runtime image for running the app
FROM mcr.microsoft.com/dotnet/aspnet:7.0

# Set the working directory
WORKDIR /app

# Copy the built application from the build stage
COPY --from=build /app/out .

# Install Chrome and ChromeDriver (or any other browser/driver)
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt-get install -y ./google-chrome-stable_current_amd64.deb \
    && rm google-chrome-stable_current_amd64.deb \
    && apt-get clean

# Install ChromeDriver (replace version with the desired version)
RUN CHROMEDRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    wget https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip -d /usr/local/bin/ && \
    rm chromedriver_linux64.zip

# Set the entry point for the application
ENTRYPOINT ["dotnet", "YourTestProject.dll"]
