# paths
PROTO_SRC_DIR := ./protos
GO_OUT_DIR := ./gen/go

# tools
PROTOC := protoc
PROTOC_GEN_GO := protoc-gen-go
PROTOC_GEN_GO_GRPC := protoc-gen-go-grpc

# proto files
PROTO_FILES := $(shell find $(PROTO_SRC_DIR) -name '*.proto')

gen-go:
	@echo 'Generating go code'
	$(PROTOC) \
		--proto_path=$(PROTO_SRC_DIR) \
		--go_out=$(GO_OUT_DIR) \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(GO_OUT_DIR) \
		--go-grpc_opt=paths=source_relative \
		$(PROTO_FILES)

.PHONY: gen-go
