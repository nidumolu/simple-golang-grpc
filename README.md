# simple-golang-grpc

## Prequisite set up your PATH's correctly
    # Example on my machine
	export GO111MODULE=on
	#export GOROOT=/usr/local/go
	#GOPATH MUST BE OUTSIDE OF GOROOT directory!!!
	#export GOPATH= ~/go
	#export PATH=${GOPATH}/bin:/usr/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:

## Install

Protobufs

```bash
make install
```

## Useful commands

Generate Go stubs

```bash
make gen
```

Clean stubs

```bash
make clean
```

## Invoking RPCs

```bash
# Note: since we are not using TLS all the calls are with -plaintext flag
grpcurl -plaintext localhost:8080 list # introspect the service
grpcurl -plaintext localhost:8080 Inventory.GetBookList # to get a list of books
```

## output when successfully running
# grpcurl -plaintext localhost:8080 Inventory/GetBookList
{
  "books": [
    {
      "title": "The Hitchhiker's Guide to the Galaxy",
      "author": "Douglas Adams",
      "pageCount": 42
    },
    {
      "title": "The Lord of the Rings",
      "author": "J.R.R. Tolkien",
      "pageCount": 1234
    }
  ]
}

# grpcurl -plaintext localhost:8080 list
Inventory
grpc.reflection.v1alpha.ServerReflection
