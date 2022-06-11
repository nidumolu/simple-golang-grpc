setenv:
	export GO111MODULE=on
	export GOROOT=/usr/local/go
	#GOPATH MUST BE OUTSIDE OF GOROOT directory!!! #<<change >>
	export GOPATH=/Users/srinivasni/go 
	export PATH=${GOPATH}/bin:/usr/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:
	mkdir	server
	mkdir	client

clean:
	rm -rf server/pb/
	rm -rf client/pb/


install:
	brew install protobuf
	go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.26
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1
	brew install protobuf
	brew install clang-format
	brew install grpcurl

gen:
	# You just need to add a Go option which will tell to add file relative to proto file
	# This will make the your_file.pb.go in same directory as your_file.proto
	#protoc --proto_path=proto proto/*.proto --go_out=server --go-grpc_out=server --go_opt=paths=source_relative
	#protoc --proto_path=proto proto/*.proto --go_out=client --go-grpc_out=client --go_opt=paths=source_relative
	protoc --proto_path=proto proto/*.proto --go_out=server --go-grpc_out=server
	protoc --proto_path=proto proto/*.proto --go_out=client --go-grpc_out=client	

server:
	go run server/main.go	
	# if this dosent work make runme

runme:
	cd server
	go mod init
		
test:
	rm -rf tmp && mkdir tmp
	go test -cover -race serializer/*.go
