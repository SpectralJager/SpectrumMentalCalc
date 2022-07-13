// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.0
// 	protoc        v3.20.1
// source: pkg/grpc/proto/authentication_service.proto

package authentication

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type RegReq struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields
}

func (x *RegReq) Reset() {
	*x = RegReq{}
	if protoimpl.UnsafeEnabled {
		mi := &file_pkg_grpc_proto_authentication_service_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *RegReq) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*RegReq) ProtoMessage() {}

func (x *RegReq) ProtoReflect() protoreflect.Message {
	mi := &file_pkg_grpc_proto_authentication_service_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use RegReq.ProtoReflect.Descriptor instead.
func (*RegReq) Descriptor() ([]byte, []int) {
	return file_pkg_grpc_proto_authentication_service_proto_rawDescGZIP(), []int{0}
}

type RegResp struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields
}

func (x *RegResp) Reset() {
	*x = RegResp{}
	if protoimpl.UnsafeEnabled {
		mi := &file_pkg_grpc_proto_authentication_service_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *RegResp) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*RegResp) ProtoMessage() {}

func (x *RegResp) ProtoReflect() protoreflect.Message {
	mi := &file_pkg_grpc_proto_authentication_service_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use RegResp.ProtoReflect.Descriptor instead.
func (*RegResp) Descriptor() ([]byte, []int) {
	return file_pkg_grpc_proto_authentication_service_proto_rawDescGZIP(), []int{1}
}

type RemoveReq struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields
}

func (x *RemoveReq) Reset() {
	*x = RemoveReq{}
	if protoimpl.UnsafeEnabled {
		mi := &file_pkg_grpc_proto_authentication_service_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *RemoveReq) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*RemoveReq) ProtoMessage() {}

func (x *RemoveReq) ProtoReflect() protoreflect.Message {
	mi := &file_pkg_grpc_proto_authentication_service_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use RemoveReq.ProtoReflect.Descriptor instead.
func (*RemoveReq) Descriptor() ([]byte, []int) {
	return file_pkg_grpc_proto_authentication_service_proto_rawDescGZIP(), []int{2}
}

type RemoveResp struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields
}

func (x *RemoveResp) Reset() {
	*x = RemoveResp{}
	if protoimpl.UnsafeEnabled {
		mi := &file_pkg_grpc_proto_authentication_service_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *RemoveResp) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*RemoveResp) ProtoMessage() {}

func (x *RemoveResp) ProtoReflect() protoreflect.Message {
	mi := &file_pkg_grpc_proto_authentication_service_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use RemoveResp.ProtoReflect.Descriptor instead.
func (*RemoveResp) Descriptor() ([]byte, []int) {
	return file_pkg_grpc_proto_authentication_service_proto_rawDescGZIP(), []int{3}
}

type CheckReq struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Token string `protobuf:"bytes,1,opt,name=token,proto3" json:"token,omitempty"`
}

func (x *CheckReq) Reset() {
	*x = CheckReq{}
	if protoimpl.UnsafeEnabled {
		mi := &file_pkg_grpc_proto_authentication_service_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CheckReq) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CheckReq) ProtoMessage() {}

func (x *CheckReq) ProtoReflect() protoreflect.Message {
	mi := &file_pkg_grpc_proto_authentication_service_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CheckReq.ProtoReflect.Descriptor instead.
func (*CheckReq) Descriptor() ([]byte, []int) {
	return file_pkg_grpc_proto_authentication_service_proto_rawDescGZIP(), []int{4}
}

func (x *CheckReq) GetToken() string {
	if x != nil {
		return x.Token
	}
	return ""
}

type CheckResp struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Result bool `protobuf:"varint,1,opt,name=result,proto3" json:"result,omitempty"`
}

func (x *CheckResp) Reset() {
	*x = CheckResp{}
	if protoimpl.UnsafeEnabled {
		mi := &file_pkg_grpc_proto_authentication_service_proto_msgTypes[5]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CheckResp) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CheckResp) ProtoMessage() {}

func (x *CheckResp) ProtoReflect() protoreflect.Message {
	mi := &file_pkg_grpc_proto_authentication_service_proto_msgTypes[5]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CheckResp.ProtoReflect.Descriptor instead.
func (*CheckResp) Descriptor() ([]byte, []int) {
	return file_pkg_grpc_proto_authentication_service_proto_rawDescGZIP(), []int{5}
}

func (x *CheckResp) GetResult() bool {
	if x != nil {
		return x.Result
	}
	return false
}

var File_pkg_grpc_proto_authentication_service_proto protoreflect.FileDescriptor

var file_pkg_grpc_proto_authentication_service_proto_rawDesc = []byte{
	0x0a, 0x2b, 0x70, 0x6b, 0x67, 0x2f, 0x67, 0x72, 0x70, 0x63, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f,
	0x2f, 0x61, 0x75, 0x74, 0x68, 0x65, 0x6e, 0x74, 0x69, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x5f,
	0x73, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x0e, 0x61,
	0x75, 0x74, 0x68, 0x65, 0x6e, 0x74, 0x69, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x22, 0x08, 0x0a,
	0x06, 0x52, 0x65, 0x67, 0x52, 0x65, 0x71, 0x22, 0x09, 0x0a, 0x07, 0x52, 0x65, 0x67, 0x52, 0x65,
	0x73, 0x70, 0x22, 0x0b, 0x0a, 0x09, 0x52, 0x65, 0x6d, 0x6f, 0x76, 0x65, 0x52, 0x65, 0x71, 0x22,
	0x0c, 0x0a, 0x0a, 0x52, 0x65, 0x6d, 0x6f, 0x76, 0x65, 0x52, 0x65, 0x73, 0x70, 0x22, 0x20, 0x0a,
	0x08, 0x43, 0x68, 0x65, 0x63, 0x6b, 0x52, 0x65, 0x71, 0x12, 0x14, 0x0a, 0x05, 0x74, 0x6f, 0x6b,
	0x65, 0x6e, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x22,
	0x23, 0x0a, 0x09, 0x43, 0x68, 0x65, 0x63, 0x6b, 0x52, 0x65, 0x73, 0x70, 0x12, 0x16, 0x0a, 0x06,
	0x72, 0x65, 0x73, 0x75, 0x6c, 0x74, 0x18, 0x01, 0x20, 0x01, 0x28, 0x08, 0x52, 0x06, 0x72, 0x65,
	0x73, 0x75, 0x6c, 0x74, 0x32, 0xe2, 0x01, 0x0a, 0x15, 0x41, 0x75, 0x74, 0x68, 0x65, 0x6e, 0x74,
	0x69, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x40,
	0x0a, 0x0d, 0x52, 0x65, 0x67, 0x69, 0x73, 0x74, 0x65, 0x72, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x12,
	0x16, 0x2e, 0x61, 0x75, 0x74, 0x68, 0x65, 0x6e, 0x74, 0x69, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e,
	0x2e, 0x52, 0x65, 0x67, 0x52, 0x65, 0x71, 0x1a, 0x17, 0x2e, 0x61, 0x75, 0x74, 0x68, 0x65, 0x6e,
	0x74, 0x69, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x2e, 0x52, 0x65, 0x67, 0x52, 0x65, 0x73, 0x70,
	0x12, 0x44, 0x0a, 0x0b, 0x52, 0x65, 0x6d, 0x6f, 0x76, 0x65, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x12,
	0x19, 0x2e, 0x61, 0x75, 0x74, 0x68, 0x65, 0x6e, 0x74, 0x69, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e,
	0x2e, 0x52, 0x65, 0x6d, 0x6f, 0x76, 0x65, 0x52, 0x65, 0x71, 0x1a, 0x1a, 0x2e, 0x61, 0x75, 0x74,
	0x68, 0x65, 0x6e, 0x74, 0x69, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x2e, 0x52, 0x65, 0x6d, 0x6f,
	0x76, 0x65, 0x52, 0x65, 0x73, 0x70, 0x12, 0x41, 0x0a, 0x0a, 0x43, 0x68, 0x65, 0x63, 0x6b, 0x54,
	0x6f, 0x6b, 0x65, 0x6e, 0x12, 0x18, 0x2e, 0x61, 0x75, 0x74, 0x68, 0x65, 0x6e, 0x74, 0x69, 0x63,
	0x61, 0x74, 0x69, 0x6f, 0x6e, 0x2e, 0x43, 0x68, 0x65, 0x63, 0x6b, 0x52, 0x65, 0x71, 0x1a, 0x19,
	0x2e, 0x61, 0x75, 0x74, 0x68, 0x65, 0x6e, 0x74, 0x69, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x2e,
	0x43, 0x68, 0x65, 0x63, 0x6b, 0x52, 0x65, 0x73, 0x70, 0x42, 0x12, 0x5a, 0x10, 0x2e, 0x3b, 0x61,
	0x75, 0x74, 0x68, 0x65, 0x6e, 0x74, 0x69, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x62, 0x06, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_pkg_grpc_proto_authentication_service_proto_rawDescOnce sync.Once
	file_pkg_grpc_proto_authentication_service_proto_rawDescData = file_pkg_grpc_proto_authentication_service_proto_rawDesc
)

func file_pkg_grpc_proto_authentication_service_proto_rawDescGZIP() []byte {
	file_pkg_grpc_proto_authentication_service_proto_rawDescOnce.Do(func() {
		file_pkg_grpc_proto_authentication_service_proto_rawDescData = protoimpl.X.CompressGZIP(file_pkg_grpc_proto_authentication_service_proto_rawDescData)
	})
	return file_pkg_grpc_proto_authentication_service_proto_rawDescData
}

var file_pkg_grpc_proto_authentication_service_proto_msgTypes = make([]protoimpl.MessageInfo, 6)
var file_pkg_grpc_proto_authentication_service_proto_goTypes = []interface{}{
	(*RegReq)(nil),     // 0: authentication.RegReq
	(*RegResp)(nil),    // 1: authentication.RegResp
	(*RemoveReq)(nil),  // 2: authentication.RemoveReq
	(*RemoveResp)(nil), // 3: authentication.RemoveResp
	(*CheckReq)(nil),   // 4: authentication.CheckReq
	(*CheckResp)(nil),  // 5: authentication.CheckResp
}
var file_pkg_grpc_proto_authentication_service_proto_depIdxs = []int32{
	0, // 0: authentication.AuthenticationService.RegisterToken:input_type -> authentication.RegReq
	2, // 1: authentication.AuthenticationService.RemoveToken:input_type -> authentication.RemoveReq
	4, // 2: authentication.AuthenticationService.CheckToken:input_type -> authentication.CheckReq
	1, // 3: authentication.AuthenticationService.RegisterToken:output_type -> authentication.RegResp
	3, // 4: authentication.AuthenticationService.RemoveToken:output_type -> authentication.RemoveResp
	5, // 5: authentication.AuthenticationService.CheckToken:output_type -> authentication.CheckResp
	3, // [3:6] is the sub-list for method output_type
	0, // [0:3] is the sub-list for method input_type
	0, // [0:0] is the sub-list for extension type_name
	0, // [0:0] is the sub-list for extension extendee
	0, // [0:0] is the sub-list for field type_name
}

func init() { file_pkg_grpc_proto_authentication_service_proto_init() }
func file_pkg_grpc_proto_authentication_service_proto_init() {
	if File_pkg_grpc_proto_authentication_service_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_pkg_grpc_proto_authentication_service_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*RegReq); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_pkg_grpc_proto_authentication_service_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*RegResp); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_pkg_grpc_proto_authentication_service_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*RemoveReq); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_pkg_grpc_proto_authentication_service_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*RemoveResp); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_pkg_grpc_proto_authentication_service_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CheckReq); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_pkg_grpc_proto_authentication_service_proto_msgTypes[5].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CheckResp); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_pkg_grpc_proto_authentication_service_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   6,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_pkg_grpc_proto_authentication_service_proto_goTypes,
		DependencyIndexes: file_pkg_grpc_proto_authentication_service_proto_depIdxs,
		MessageInfos:      file_pkg_grpc_proto_authentication_service_proto_msgTypes,
	}.Build()
	File_pkg_grpc_proto_authentication_service_proto = out.File
	file_pkg_grpc_proto_authentication_service_proto_rawDesc = nil
	file_pkg_grpc_proto_authentication_service_proto_goTypes = nil
	file_pkg_grpc_proto_authentication_service_proto_depIdxs = nil
}
