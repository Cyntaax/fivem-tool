FROM golang:1.16.0-alpine3.12

RUN apk update && apk upgrade && apk add \
    make musl-dev nodejs npm git

RUN go get github.com/akavel/rsrc

RUN go get github.com/gobuffalo/packr/v2/packr2

RUN mkdir -p /usr/app/src/frontend

WORKDIR /usr/app/src/frontend

COPY ./frontend .

RUN npm i && npm run build

RUN mkdir -p /usr/app/src/backend

WORKDIR /usr/app/src/backend

COPY ./backend .

RUN go mod download

RUN /go/bin/packr2

RUN /go/bin/rsrc -ico ./icon.ico

ENTRYPOINT go build -o dist/fivem-tool.exe