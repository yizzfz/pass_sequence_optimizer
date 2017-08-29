; ModuleID = 'interface.1.ll'
source_filename = "interface.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.mpstr = type { %struct.buf*, %struct.buf*, i32, i32, i32, %struct.frame, [2 x [2304 x i8]], [2 x [2 x [576 x double]]], [2 x i32], i64, i32, [2 x [2 x [272 x double]]], i32 }
%struct.buf = type { i8*, i64, i64, %struct.buf*, %struct.buf* }
%struct.frame = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@gmp = common local_unnamed_addr global %struct.mpstr* null, align 8
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [19 x i8] c"To less out space\0A\00", align 1
@wordpointer = external local_unnamed_addr global i8*, align 8
@bitindex = external local_unnamed_addr global i32, align 4
@.str.1 = private unnamed_addr constant [22 x i8] c"Can't step back %ld!\0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Out of memory!\0A\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"Fatal error!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @InitMP3(%struct.mpstr* nocapture) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 4
  %3 = bitcast %struct.mpstr* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 31880, i32 8, i1 false)
  store i32 -1, i32* %2, align 8
  %4 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 5, i32 2
  %5 = bitcast %struct.mpstr* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 20, i32 8, i1 false)
  store i32 -1, i32* %4, align 4
  %6 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 10
  store i32 0, i32* %6, align 8
  %7 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 12
  store i32 1, i32* %7, align 8
  tail call void @make_decode_tables(i64 32767) #5
  tail call void @init_layer3(i32 32) #5
  ret i32 1
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

declare void @make_decode_tables(i64) local_unnamed_addr #2

declare void @init_layer3(i32) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define void @ExitMP3(%struct.mpstr* nocapture readonly) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 1
  %3 = load %struct.buf*, %struct.buf** %2, align 8
  %4 = icmp eq %struct.buf* %3, null
  br i1 %4, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %1
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %.in12 = phi %struct.buf* [ %9, %.lr.ph ], [ %3, %.lr.ph.preheader ]
  %5 = bitcast %struct.buf* %.in12 to i8*
  %6 = getelementptr inbounds %struct.buf, %struct.buf* %.in12, i64 0, i32 0
  %7 = load i8*, i8** %6, align 8
  tail call void @free(i8* %7) #5
  %8 = getelementptr inbounds %struct.buf, %struct.buf* %.in12, i64 0, i32 3
  %9 = load %struct.buf*, %struct.buf** %8, align 8
  tail call void @free(i8* %5) #5
  %10 = icmp eq %struct.buf* %9, null
  br i1 %10, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define i32 @decodeMP3(%struct.mpstr*, i8* readonly, i32, i8*, i32, i32*) local_unnamed_addr #0 {
  store %struct.mpstr* %0, %struct.mpstr** @gmp, align 8
  %7 = icmp slt i32 %4, 4608
  br i1 %7, label %8, label %11

; <label>:8:                                      ; preds = %6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i64 18, i64 1, %struct._IO_FILE* %9) #6
  br label %94

; <label>:11:                                     ; preds = %6
  %12 = icmp eq i8* %1, null
  br i1 %12, label %16, label %13

; <label>:13:                                     ; preds = %11
  %14 = tail call fastcc %struct.buf* @addbuf(%struct.mpstr* %0, i8* nonnull %1, i32 %2)
  %15 = icmp eq %struct.buf* %14, null
  br i1 %15, label %94, label %16

; <label>:16:                                     ; preds = %13, %11
  %17 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 3
  %18 = load i32, i32* %17, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %31

; <label>:20:                                     ; preds = %16
  %21 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 2
  %22 = load i32, i32* %21, align 8
  %23 = icmp slt i32 %22, 4
  br i1 %23, label %94, label %24

; <label>:24:                                     ; preds = %20
  tail call fastcc void @read_head(%struct.mpstr* nonnull %0)
  %25 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 5
  %26 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 9
  %27 = load i64, i64* %26, align 8
  %28 = tail call i32 @decode_header(%struct.frame* %25, i64 %27) #5
  %29 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 5, i32 17
  %30 = load i32, i32* %29, align 4
  store i32 %30, i32* %17, align 4
  br label %31

; <label>:31:                                     ; preds = %24, %16
  %32 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 5, i32 17
  %33 = load i32, i32* %32, align 4
  %34 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 2
  %35 = load i32, i32* %34, align 8
  %36 = icmp sgt i32 %33, %35
  br i1 %36, label %94, label %37

; <label>:37:                                     ; preds = %31
  %38 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 10
  %39 = load i32, i32* %38, align 8
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 6, i64 %40, i64 512
  store i8* %41, i8** @wordpointer, align 8
  %42 = and i32 %39, 1
  %43 = xor i32 %42, 1
  store i32 %43, i32* %38, align 8
  store i32 0, i32* @bitindex, align 4
  %44 = load i32, i32* %17, align 4
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %37
  %46 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 1
  br label %47

; <label>:47:                                     ; preds = %.backedge, %.lr.ph
  %48 = phi i32 [ %44, %.lr.ph ], [ %82, %.backedge ]
  %.023 = phi i32 [ 0, %.lr.ph ], [ %68, %.backedge ]
  %49 = load %struct.buf*, %struct.buf** %46, align 8
  %50 = getelementptr inbounds %struct.buf, %struct.buf* %49, i64 0, i32 1
  %51 = load i64, i64* %50, align 8
  %52 = getelementptr inbounds %struct.buf, %struct.buf* %49, i64 0, i32 2
  %53 = load i64, i64* %52, align 8
  %54 = sub nsw i64 %51, %53
  %55 = trunc i64 %54 to i32
  %56 = sub nsw i32 %48, %.023
  %57 = icmp sgt i32 %56, %55
  %. = select i1 %57, i32 %55, i32 %56
  %58 = load i8*, i8** @wordpointer, align 8
  %59 = sext i32 %.023 to i64
  %60 = getelementptr inbounds i8, i8* %58, i64 %59
  %61 = load %struct.buf*, %struct.buf** %46, align 8
  %62 = getelementptr inbounds %struct.buf, %struct.buf* %61, i64 0, i32 0
  %63 = load i8*, i8** %62, align 8
  %64 = getelementptr inbounds %struct.buf, %struct.buf* %61, i64 0, i32 2
  %65 = load i64, i64* %64, align 8
  %66 = getelementptr inbounds i8, i8* %63, i64 %65
  %67 = sext i32 %. to i64
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %60, i8* %66, i64 %67, i32 1, i1 false)
  %68 = add nsw i32 %., %.023
  %69 = load %struct.buf*, %struct.buf** %46, align 8
  %70 = getelementptr inbounds %struct.buf, %struct.buf* %69, i64 0, i32 2
  %71 = load i64, i64* %70, align 8
  %72 = add nsw i64 %71, %67
  store i64 %72, i64* %70, align 8
  %73 = load i32, i32* %34, align 8
  %74 = sub nsw i32 %73, %.
  store i32 %74, i32* %34, align 8
  %75 = load %struct.buf*, %struct.buf** %46, align 8
  %76 = getelementptr inbounds %struct.buf, %struct.buf* %75, i64 0, i32 2
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds %struct.buf, %struct.buf* %75, i64 0, i32 1
  %79 = load i64, i64* %78, align 8
  %80 = icmp eq i64 %77, %79
  br i1 %80, label %81, label %.backedge

; <label>:81:                                     ; preds = %47
  tail call fastcc void @remove_buf(%struct.mpstr* nonnull %0)
  br label %.backedge

.backedge:                                        ; preds = %81, %47
  %82 = load i32, i32* %17, align 4
  %83 = icmp sgt i32 %82, %68
  br i1 %83, label %47, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.backedge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %37
  store i32 0, i32* %5, align 4
  %84 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 5, i32 7
  %85 = load i32, i32* %84, align 4
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %89, label %87

; <label>:87:                                     ; preds = %._crit_edge
  %88 = tail call i32 @getbits(i32 16) #5
  br label %89

; <label>:89:                                     ; preds = %87, %._crit_edge
  %90 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 5
  %91 = tail call i32 @do_layer3(%struct.frame* %90, i8* %3, i32* nonnull %5) #5
  %92 = load i32, i32* %17, align 4
  %93 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 4
  store i32 %92, i32* %93, align 8
  store i32 0, i32* %17, align 4
  br label %94

; <label>:94:                                     ; preds = %89, %31, %20, %13, %8
  %.0 = phi i32 [ -1, %8 ], [ 0, %89 ], [ -1, %13 ], [ 1, %20 ], [ 1, %31 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc %struct.buf* @addbuf(%struct.mpstr* nocapture, i8* nocapture readonly, i32) unnamed_addr #0 {
  %4 = tail call noalias i8* @malloc(i64 40) #5
  %5 = bitcast i8* %4 to %struct.buf*
  %6 = icmp eq i8* %4, null
  br i1 %6, label %7, label %10

; <label>:7:                                      ; preds = %3
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0), i64 15, i64 1, %struct._IO_FILE* %8) #6
  br label %41

; <label>:10:                                     ; preds = %3
  %11 = sext i32 %2 to i64
  %12 = tail call noalias i8* @malloc(i64 %11) #5
  %13 = bitcast i8* %4 to i8**
  store i8* %12, i8** %13, align 8
  %14 = icmp eq i8* %12, null
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %10
  tail call void @free(i8* nonnull %4) #5
  br label %41

; <label>:16:                                     ; preds = %10
  %17 = getelementptr inbounds i8, i8* %4, i64 8
  %18 = bitcast i8* %17 to i64*
  store i64 %11, i64* %18, align 8
  %19 = load i8*, i8** %13, align 8
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* %1, i64 %11, i32 1, i1 false)
  %20 = getelementptr inbounds i8, i8* %4, i64 24
  %21 = bitcast i8* %20 to %struct.buf**
  store %struct.buf* null, %struct.buf** %21, align 8
  %22 = bitcast %struct.mpstr* %0 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds i8, i8* %4, i64 32
  %25 = bitcast i8* %24 to i64*
  store i64 %23, i64* %25, align 8
  %26 = getelementptr inbounds i8, i8* %4, i64 16
  %27 = bitcast i8* %26 to i64*
  store i64 0, i64* %27, align 8
  %28 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 1
  %29 = load %struct.buf*, %struct.buf** %28, align 8
  %30 = icmp eq %struct.buf* %29, null
  br i1 %30, label %35, label %31

; <label>:31:                                     ; preds = %16
  %32 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 0
  %33 = load %struct.buf*, %struct.buf** %32, align 8
  %34 = getelementptr inbounds %struct.buf, %struct.buf* %33, i64 0, i32 3
  br label %35

; <label>:35:                                     ; preds = %31, %16
  %.sink1 = phi %struct.buf** [ %34, %31 ], [ %28, %16 ]
  %36 = bitcast %struct.buf** %.sink1 to i8**
  store i8* %4, i8** %36, align 8
  %37 = bitcast %struct.mpstr* %0 to i8**
  store i8* %4, i8** %37, align 8
  %38 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 2
  %39 = load i32, i32* %38, align 8
  %40 = add nsw i32 %39, %2
  store i32 %40, i32* %38, align 8
  br label %41

; <label>:41:                                     ; preds = %35, %15, %7
  %.0 = phi %struct.buf* [ %5, %35 ], [ null, %15 ], [ null, %7 ]
  ret %struct.buf* %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @read_head(%struct.mpstr* nocapture) unnamed_addr #0 {
  %2 = tail call fastcc i32 @read_buf_byte(%struct.mpstr* %0)
  %3 = sext i32 %2 to i64
  %4 = shl nsw i64 %3, 8
  %5 = tail call fastcc i32 @read_buf_byte(%struct.mpstr* %0)
  %6 = sext i32 %5 to i64
  %7 = or i64 %4, %6
  %8 = shl nsw i64 %7, 8
  %9 = tail call fastcc i32 @read_buf_byte(%struct.mpstr* %0)
  %10 = sext i32 %9 to i64
  %11 = or i64 %8, %10
  %12 = shl nsw i64 %11, 8
  %13 = tail call fastcc i32 @read_buf_byte(%struct.mpstr* %0)
  %14 = sext i32 %13 to i64
  %15 = or i64 %12, %14
  %16 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 9
  store i64 %15, i64* %16, align 8
  ret void
}

declare i32 @decode_header(%struct.frame*, i64) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @remove_buf(%struct.mpstr* nocapture) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 1
  %3 = load %struct.buf*, %struct.buf** %2, align 8
  %4 = getelementptr inbounds %struct.buf, %struct.buf* %3, i64 0, i32 3
  %5 = bitcast %struct.buf** %4 to i64*
  %6 = load i64, i64* %5, align 8
  %7 = bitcast %struct.buf** %2 to i64*
  store i64 %6, i64* %7, align 8
  %8 = icmp eq i64 %6, 0
  br i1 %8, label %12, label %9

; <label>:9:                                      ; preds = %1
  %10 = load %struct.buf*, %struct.buf** %2, align 8
  %11 = getelementptr inbounds %struct.buf, %struct.buf* %10, i64 0, i32 4
  br label %14

; <label>:12:                                     ; preds = %1
  %13 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 0
  store %struct.buf* null, %struct.buf** %13, align 8
  br label %14

; <label>:14:                                     ; preds = %12, %9
  %.sink = phi %struct.buf** [ %2, %12 ], [ %11, %9 ]
  store %struct.buf* null, %struct.buf** %.sink, align 8
  %15 = getelementptr inbounds %struct.buf, %struct.buf* %3, i64 0, i32 0
  %16 = load i8*, i8** %15, align 8
  tail call void @free(i8* %16) #5
  %17 = bitcast %struct.buf* %3 to i8*
  tail call void @free(i8* %17) #5
  ret void
}

declare i32 @getbits(i32) local_unnamed_addr #2

declare i32 @do_layer3(%struct.frame*, i8*, i32*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define i32 @set_pointer(i64) local_unnamed_addr #0 {
  %2 = load %struct.mpstr*, %struct.mpstr** @gmp, align 8
  %3 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %2, i64 0, i32 4
  %4 = load i32, i32* %3, align 8
  %5 = icmp slt i32 %4, 0
  %6 = icmp sgt i64 %0, 0
  %or.cond = and i1 %6, %5
  br i1 %or.cond, label %7, label %10

; <label>:7:                                      ; preds = %1
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i64 %0) #6
  br label %27

; <label>:10:                                     ; preds = %1
  %11 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %2, i64 0, i32 10
  %12 = load i32, i32* %11, align 8
  %13 = load i8*, i8** @wordpointer, align 8
  %14 = sub i64 0, %0
  %15 = getelementptr inbounds i8, i8* %13, i64 %14
  store i8* %15, i8** @wordpointer, align 8
  %16 = icmp eq i64 %0, 0
  br i1 %16, label %26, label %17

; <label>:17:                                     ; preds = %10
  %18 = sext i32 %12 to i64
  %19 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %2, i64 0, i32 6, i64 %18, i64 512
  %20 = load %struct.mpstr*, %struct.mpstr** @gmp, align 8
  %21 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %20, i64 0, i32 4
  %22 = load i32, i32* %21, align 8
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i8, i8* %19, i64 %23
  %25 = getelementptr inbounds i8, i8* %24, i64 %14
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %15, i8* %25, i64 %0, i32 1, i1 false)
  br label %26

; <label>:26:                                     ; preds = %17, %10
  store i32 0, i32* @bitindex, align 4
  br label %27

; <label>:27:                                     ; preds = %26, %7
  %.0 = phi i32 [ -1, %7 ], [ 0, %26 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @read_buf_byte(%struct.mpstr* nocapture) unnamed_addr #0 {
  %.pn.in = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 1
  br label %2

; <label>:2:                                      ; preds = %7, %1
  %.pn = load %struct.buf*, %struct.buf** %.pn.in, align 8
  %.0.in.in = getelementptr inbounds %struct.buf, %struct.buf* %.pn, i64 0, i32 2
  %.0.in = load i64, i64* %.0.in.in, align 8
  %sext = shl i64 %.0.in, 32
  %3 = ashr exact i64 %sext, 32
  %4 = getelementptr inbounds %struct.buf, %struct.buf* %.pn, i64 0, i32 1
  %5 = load i64, i64* %4, align 8
  %6 = icmp slt i64 %3, %5
  br i1 %6, label %13, label %7

; <label>:7:                                      ; preds = %2
  tail call fastcc void @remove_buf(%struct.mpstr* nonnull %0)
  %8 = load %struct.buf*, %struct.buf** %.pn.in, align 8
  %9 = icmp eq %struct.buf* %8, null
  br i1 %9, label %10, label %2

; <label>:10:                                     ; preds = %7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i64 13, i64 1, %struct._IO_FILE* %11) #6
  tail call void @exit(i32 1) #7
  unreachable

; <label>:13:                                     ; preds = %2
  %14 = getelementptr inbounds %struct.buf, %struct.buf* %.pn, i64 0, i32 0
  %15 = load i8*, i8** %14, align 8
  %16 = getelementptr inbounds i8, i8* %15, i64 %3
  %17 = load i8, i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %0, i64 0, i32 2
  %20 = load i32, i32* %19, align 8
  %21 = add nsw i32 %20, -1
  store i32 %21, i32* %19, align 8
  %22 = load %struct.buf*, %struct.buf** %.pn.in, align 8
  %23 = getelementptr inbounds %struct.buf, %struct.buf* %22, i64 0, i32 2
  %24 = load i64, i64* %23, align 8
  %25 = add nsw i64 %24, 1
  store i64 %25, i64* %23, align 8
  ret i32 %18
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
