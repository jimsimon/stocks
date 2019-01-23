FROM cirrusci/flutter

ADD --chown=cirrus tastyworks_api_client ./code/tastyworks_api_client
ADD --chown=cirrus mobile ./code/mobile