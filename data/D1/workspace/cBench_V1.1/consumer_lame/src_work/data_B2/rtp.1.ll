; ModuleID = 'rtp.ll'
source_filename = "rtp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.rtpheader = type { %struct.rtpbits, i32, i32, i32 }
%struct.rtpbits = type { i32 }
%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [18 x i8] c"socket() failed.\0A\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"setsockopt SO_REUSEADDR failed\0A\00", align 1
@.str.2 = private unnamed_addr constant [59 x i8] c"setsockopt IP_MULTICAST_TTL failed.  multicast in kernel?\0A\00", align 1
@.str.3 = private unnamed_addr constant [60 x i8] c"setsockopt IP_MULTICAST_LOOP failed.  multicast in kernel?\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @initrtp(%struct.rtpheader* nocapture) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.rtpheader, %struct.rtpheader* %0, i64 0, i32 0, i32 0
  %3 = load i32, i32* %2, align 4
  %4 = and i32 %3, 65535
  %5 = or i32 %4, -2146566144
  store i32 %5, i32* %2, align 4
  %6 = tail call i32 @rand() #5
  %7 = load i32, i32* %2, align 4
  %8 = and i32 %6, 65535
  %9 = and i32 %7, -65536
  %10 = or i32 %9, %8
  store i32 %10, i32* %2, align 4
  %11 = tail call i32 @rand() #5
  %12 = getelementptr inbounds %struct.rtpheader, %struct.rtpheader* %0, i64 0, i32 1
  store i32 %11, i32* %12, align 4
  %13 = tail call i32 @rand() #5
  %14 = getelementptr inbounds %struct.rtpheader, %struct.rtpheader* %0, i64 0, i32 2
  store i32 %13, i32* %14, align 4
  %15 = getelementptr inbounds %struct.rtpheader, %struct.rtpheader* %0, i64 0, i32 3
  store i32 0, i32* %15, align 4
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define i32 @sendrtp(i32, %struct.sockaddr_in*, %struct.rtpheader* nocapture readonly, i8* nocapture readonly, i32) local_unnamed_addr #0 {
  %6 = sext i32 %4 to i64
  %7 = add nsw i64 %6, 16
  %8 = alloca i8, i64 %7, align 16
  %9 = getelementptr inbounds %struct.rtpheader, %struct.rtpheader* %2, i64 0, i32 0, i32 0
  %10 = bitcast i8* %8 to i32*
  %11 = load i32, i32* %9, align 4
  %12 = tail call i32 @htonl(i32 %11) #7
  store i32 %12, i32* %10, align 16
  %13 = getelementptr inbounds i32, i32* %9, i64 1
  %14 = load i32, i32* %13, align 4
  %15 = tail call i32 @htonl(i32 %14) #7
  %16 = getelementptr inbounds i8, i8* %8, i64 4
  %17 = bitcast i8* %16 to i32*
  store i32 %15, i32* %17, align 4
  %18 = getelementptr inbounds i32, i32* %9, i64 2
  %19 = load i32, i32* %18, align 4
  %20 = tail call i32 @htonl(i32 %19) #7
  %21 = getelementptr inbounds i8, i8* %8, i64 8
  %22 = bitcast i8* %21 to i32*
  store i32 %20, i32* %22, align 8
  %23 = getelementptr inbounds i32, i32* %9, i64 3
  %24 = load i32, i32* %23, align 4
  %25 = tail call i32 @htonl(i32 %24) #7
  %26 = getelementptr inbounds i8, i8* %8, i64 12
  %27 = bitcast i8* %26 to i32*
  store i32 %25, i32* %27, align 4
  %28 = getelementptr inbounds i8, i8* %8, i64 16
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %28, i8* %3, i64 %6, i32 1, i1 false)
  %29 = bitcast %struct.sockaddr_in* %1 to %struct.sockaddr*
  %30 = call i64 @sendto(i32 %0, i8* nonnull %8, i64 %7, i32 0, %struct.sockaddr* %29, i32 16) #5
  %31 = trunc i64 %30 to i32
  ret i32 %31
}

; Function Attrs: nounwind readnone
declare i32 @htonl(i32) local_unnamed_addr #2

declare i64 @sendto(i32, i8*, i64, i32, %struct.sockaddr*, i32) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define i32 @makesocket(i8*, i16 zeroext, i32, %struct.sockaddr_in* nocapture) local_unnamed_addr #0 {
  %5 = alloca i32, align 4
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  store i32 1, i32* %5, align 4
  %8 = trunc i32 %2 to i8
  store i8 %8, i8* %6, align 1
  store i8 0, i8* %7, align 1
  %9 = tail call i32 @socket(i32 2, i32 2, i32 0) #5
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %11, label %14

; <label>:11:                                     ; preds = %4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0), i64 17, i64 1, %struct._IO_FILE* %12) #8
  tail call void @exit(i32 1) #9
  unreachable

; <label>:14:                                     ; preds = %4
  %15 = tail call i32 @inet_addr(i8* %0) #5
  %16 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %3, i64 0, i32 0
  store i16 2, i16* %16, align 4
  %17 = tail call zeroext i16 @htons(i16 zeroext %1) #7
  %18 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %3, i64 0, i32 1
  store i16 %17, i16* %18, align 2
  %19 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %3, i64 0, i32 2, i32 0
  store i32 %15, i32* %19, align 4
  %20 = bitcast i32* %5 to i8*
  %21 = call i32 @setsockopt(i32 %9, i32 1, i32 2, i8* nonnull %20, i32 4) #5
  %22 = icmp slt i32 %21, 0
  br i1 %22, label %23, label %26

; <label>:23:                                     ; preds = %14
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i64 @fwrite(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0), i64 31, i64 1, %struct._IO_FILE* %24) #8
  call void @exit(i32 1) #9
  unreachable

; <label>:26:                                     ; preds = %14
  %27 = call i32 @ntohl(i32 %15) #7
  %.mask = and i32 %27, -268435456
  %28 = icmp eq i32 %.mask, -536870912
  br i1 %28, label %29, label %41

; <label>:29:                                     ; preds = %26
  %30 = call i32 @setsockopt(i32 %9, i32 0, i32 33, i8* nonnull %6, i32 1) #5
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %32, label %35

; <label>:32:                                     ; preds = %29
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = call i64 @fwrite(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.2, i64 0, i64 0), i64 58, i64 1, %struct._IO_FILE* %33) #8
  call void @exit(i32 1) #9
  unreachable

; <label>:35:                                     ; preds = %29
  store i8 1, i8* %7, align 1
  %36 = call i32 @setsockopt(i32 %9, i32 0, i32 34, i8* nonnull %7, i32 1) #5
  %37 = icmp slt i32 %36, 0
  br i1 %37, label %38, label %41

; <label>:38:                                     ; preds = %35
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = call i64 @fwrite(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.3, i64 0, i64 0), i64 59, i64 1, %struct._IO_FILE* %39) #8
  call void @exit(i32 1) #9
  unreachable

; <label>:41:                                     ; preds = %35, %26
  ret i32 %9
}

; Function Attrs: nounwind
declare i32 @socket(i32, i32, i32) local_unnamed_addr #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @inet_addr(i8*) local_unnamed_addr #1

; Function Attrs: nounwind readnone
declare zeroext i16 @htons(i16 zeroext) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @setsockopt(i32, i32, i32, i8*, i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone
declare i32 @ntohl(i32) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #6

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { argmemonly nounwind }
attributes #7 = { nounwind readnone }
attributes #8 = { cold }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
