FROM alpine:3.10

COPY hugo /usr/bin/hugo

# libc6-compat & libstdc++ are required for extended SASS libraries
# ca-certificates are required to fetch outside resources (like Twitter oEmbeds)
RUN apk update && \
    apk add --no-cache ca-certificates libc6-compat libstdc++

VOLUME /site
WORKDIR /site

# Expose port for live server
EXPOSE 1313

ENTRYPOINT ["hugo"]
CMD ["--help"]
