ARG BASE_IMAGE_NAME
ARG BASE_IMAGE_DIGEST

FROM $BASE_IMAGE_NAME@$BASE_IMAGE_DIGEST AS base

RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb

RUN apt-get update
RUN apt-get install -y apt-transport-https 
RUN apt-get update
RUN apt-get install -y dotnet-sdk-3.1

RUN wget https://raw.githubusercontent.com/Microsoft/artifacts-credprovider/master/helpers/installcredprovider.sh
RUN bash installcredprovider.sh

RUN npm install -g @lhci/cli