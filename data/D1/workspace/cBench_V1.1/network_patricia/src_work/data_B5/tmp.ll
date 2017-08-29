; ModuleID = 'patricia_test.1.ll'
source_filename = "patricia_test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.in_addr = type { i32 }
%struct.ptree = type { i64, %struct.ptree_mask*, i8, i8, %struct.ptree*, %struct.ptree* }
%struct.ptree_mask = type { i64, i8* }

@.str = private unnamed_addr constant [24 x i8] c"Usage: %s <TCP stream>\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"File %s doesn't seem to exist\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"Allocating p-trie node\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"Allocating p-trie mask data\00", align 1
@.str.5 = private unnamed_addr constant [35 x i8] c"Allocating p-trie mask's node data\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%f %d\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"%f %08x: \00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"Found.\0A\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.9 = private unnamed_addr constant [22 x i8] c"Failed on pat_insert\0A\00", align 1
@str = private unnamed_addr constant [7 x i8] c"Found.\00"

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8** nocapture readonly, i32) local_unnamed_addr #0 {
  %4 = alloca [128 x i8], align 16
  %5 = alloca %struct.in_addr, align 4
  %6 = alloca float, align 4
  %7 = icmp slt i32 %0, 2
  br i1 %7, label %8, label %11

; <label>:8:                                      ; preds = %3
  %9 = load i8*, i8** %1, align 8
  %10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i64 0, i64 0), i8* %9)
  tail call void @exit(i32 1) #6
  unreachable

; <label>:11:                                     ; preds = %3
  %12 = getelementptr inbounds i8*, i8** %1, i64 1
  %13 = load i8*, i8** %12, align 8
  %14 = tail call %struct._IO_FILE* @fopen(i8* %13, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  %15 = icmp eq %struct._IO_FILE* %14, null
  br i1 %15, label %16, label %19

; <label>:16:                                     ; preds = %11
  %17 = load i8*, i8** %12, align 8
  %18 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0), i8* %17)
  tail call void @exit(i32 1) #6
  unreachable

; <label>:19:                                     ; preds = %11
  %20 = tail call noalias i8* @malloc(i64 40) #5
  %21 = bitcast i8* %20 to %struct.ptree*
  %22 = icmp eq i8* %20, null
  br i1 %22, label %23, label %24

; <label>:23:                                     ; preds = %19
  tail call void @perror(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i64 0, i64 0)) #7
  tail call void @exit(i32 1) #6
  unreachable

; <label>:24:                                     ; preds = %19
  tail call void @llvm.memset.p0i8.i64(i8* nonnull %20, i8 0, i64 40, i32 8, i1 false)
  %25 = tail call noalias i8* @malloc(i64 16) #5
  %26 = getelementptr inbounds i8, i8* %20, i64 8
  %27 = bitcast i8* %26 to i8**
  store i8* %25, i8** %27, align 8
  %28 = icmp eq i8* %25, null
  br i1 %28, label %29, label %30

; <label>:29:                                     ; preds = %24
  tail call void @perror(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i64 0, i64 0)) #7
  tail call void @exit(i32 1) #6
  unreachable

; <label>:30:                                     ; preds = %24
  tail call void @llvm.memset.p0i8.i64(i8* nonnull %25, i8 0, i64 16, i32 8, i1 false)
  %31 = bitcast i8* %26 to %struct.ptree_mask**
  %32 = load %struct.ptree_mask*, %struct.ptree_mask** %31, align 8
  %33 = tail call noalias i8* @malloc(i64 16) #5
  %34 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %32, i64 0, i32 1
  store i8* %33, i8** %34, align 8
  %35 = icmp eq i8* %33, null
  br i1 %35, label %36, label %37

; <label>:36:                                     ; preds = %30
  tail call void @perror(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5, i64 0, i64 0)) #7
  tail call void @exit(i32 1) #6
  unreachable

; <label>:37:                                     ; preds = %30
  store i8 0, i8* %33, align 1
  %38 = getelementptr inbounds i8, i8* %20, i64 16
  store i8 1, i8* %38, align 8
  %39 = getelementptr inbounds i8, i8* %20, i64 32
  %40 = bitcast i8* %39 to i8**
  store i8* %20, i8** %40, align 8
  %41 = getelementptr inbounds i8, i8* %20, i64 24
  %42 = bitcast i8* %41 to i8**
  store i8* %20, i8** %42, align 8
  %43 = getelementptr inbounds [128 x i8], [128 x i8]* %4, i64 0, i64 0
  %44 = call i8* @fgets(i8* nonnull %43, i32 128, %struct._IO_FILE* nonnull %14)
  %45 = icmp eq i8* %44, null
  br i1 %45, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %37
  %46 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %5, i64 0, i32 0
  %47 = icmp eq i32 %2, 0
  br i1 %47, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.backedge.us, %.lr.ph.split.us.preheader
  %48 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* nonnull %43, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), float* nonnull %6, i32* nonnull %46) #5
  %49 = call noalias i8* @malloc(i64 40) #5
  %50 = bitcast i8* %49 to %struct.ptree*
  %51 = icmp eq i8* %49, null
  br i1 %51, label %.us-lcssa.us.loopexit, label %52

; <label>:52:                                     ; preds = %.lr.ph.split.us
  call void @llvm.memset.p0i8.i64(i8* nonnull %49, i8 0, i64 40, i32 8, i1 false)
  %53 = call noalias i8* @malloc(i64 16) #5
  %54 = getelementptr inbounds i8, i8* %49, i64 8
  %55 = bitcast i8* %54 to i8**
  store i8* %53, i8** %55, align 8
  %56 = icmp eq i8* %53, null
  br i1 %56, label %.us-lcssa1.us.loopexit, label %57

; <label>:57:                                     ; preds = %52
  call void @llvm.memset.p0i8.i64(i8* nonnull %53, i8 0, i64 16, i32 8, i1 false)
  %58 = bitcast i8* %54 to %struct.ptree_mask**
  %59 = load %struct.ptree_mask*, %struct.ptree_mask** %58, align 8
  %60 = call noalias i8* @malloc(i64 16) #5
  %61 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %59, i64 0, i32 1
  store i8* %60, i8** %61, align 8
  %62 = icmp eq i8* %60, null
  br i1 %62, label %.us-lcssa2.us.loopexit, label %63

; <label>:63:                                     ; preds = %57
  store i8 0, i8* %60, align 1
  %64 = load i32, i32* %46, align 4
  %65 = zext i32 %64 to i64
  %66 = bitcast i8* %49 to i64*
  store i64 %65, i64* %66, align 8
  %67 = load %struct.ptree_mask*, %struct.ptree_mask** %58, align 8
  %68 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %67, i64 0, i32 0
  store i64 4294967295, i64* %68, align 8
  %69 = load i32, i32* %46, align 4
  %70 = zext i32 %69 to i64
  %71 = call %struct.ptree* @pat_search(i64 %70, %struct.ptree* %21) #5
  %72 = call %struct.ptree* @pat_insert(%struct.ptree* nonnull %50, %struct.ptree* %21) #5
  %73 = icmp eq %struct.ptree* %72, null
  br i1 %73, label %.us-lcssa3.us.loopexit, label %.backedge.us

.backedge.us:                                     ; preds = %63
  %74 = call i8* @fgets(i8* nonnull %43, i32 128, %struct._IO_FILE* nonnull %14)
  %75 = icmp eq i8* %74, null
  br i1 %75, label %._crit_edge.loopexit, label %.lr.ph.split.us

.lr.ph.split:                                     ; preds = %.backedge, %.lr.ph.split.preheader
  %76 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* nonnull %43, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), float* nonnull %6, i32* nonnull %46) #5
  %77 = call noalias i8* @malloc(i64 40) #5
  %78 = bitcast i8* %77 to %struct.ptree*
  %79 = icmp eq i8* %77, null
  br i1 %79, label %.us-lcssa.us.loopexit19, label %80

.us-lcssa.us.loopexit:                            ; preds = %.lr.ph.split.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit19:                          ; preds = %.lr.ph.split
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit19, %.us-lcssa.us.loopexit
  call void @perror(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i64 0, i64 0)) #7
  call void @exit(i32 1) #6
  unreachable

; <label>:80:                                     ; preds = %.lr.ph.split
  call void @llvm.memset.p0i8.i64(i8* nonnull %77, i8 0, i64 40, i32 8, i1 false)
  %81 = call noalias i8* @malloc(i64 16) #5
  %82 = getelementptr inbounds i8, i8* %77, i64 8
  %83 = bitcast i8* %82 to i8**
  store i8* %81, i8** %83, align 8
  %84 = icmp eq i8* %81, null
  br i1 %84, label %.us-lcssa1.us.loopexit20, label %85

.us-lcssa1.us.loopexit:                           ; preds = %52
  br label %.us-lcssa1.us

.us-lcssa1.us.loopexit20:                         ; preds = %80
  br label %.us-lcssa1.us

.us-lcssa1.us:                                    ; preds = %.us-lcssa1.us.loopexit20, %.us-lcssa1.us.loopexit
  call void @perror(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i64 0, i64 0)) #7
  call void @exit(i32 1) #6
  unreachable

; <label>:85:                                     ; preds = %80
  call void @llvm.memset.p0i8.i64(i8* nonnull %81, i8 0, i64 16, i32 8, i1 false)
  %86 = bitcast i8* %82 to %struct.ptree_mask**
  %87 = load %struct.ptree_mask*, %struct.ptree_mask** %86, align 8
  %88 = call noalias i8* @malloc(i64 16) #5
  %89 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %87, i64 0, i32 1
  store i8* %88, i8** %89, align 8
  %90 = icmp eq i8* %88, null
  br i1 %90, label %.us-lcssa2.us.loopexit21, label %91

.us-lcssa2.us.loopexit:                           ; preds = %57
  br label %.us-lcssa2.us

.us-lcssa2.us.loopexit21:                         ; preds = %85
  br label %.us-lcssa2.us

.us-lcssa2.us:                                    ; preds = %.us-lcssa2.us.loopexit21, %.us-lcssa2.us.loopexit
  call void @perror(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5, i64 0, i64 0)) #7
  call void @exit(i32 1) #6
  unreachable

; <label>:91:                                     ; preds = %85
  store i8 0, i8* %88, align 1
  %92 = load i32, i32* %46, align 4
  %93 = zext i32 %92 to i64
  %94 = bitcast i8* %77 to i64*
  store i64 %93, i64* %94, align 8
  %95 = load %struct.ptree_mask*, %struct.ptree_mask** %86, align 8
  %96 = getelementptr inbounds %struct.ptree_mask, %struct.ptree_mask* %95, i64 0, i32 0
  store i64 4294967295, i64* %96, align 8
  %97 = load i32, i32* %46, align 4
  %98 = zext i32 %97 to i64
  %99 = call %struct.ptree* @pat_search(i64 %98, %struct.ptree* %21) #5
  %100 = getelementptr inbounds %struct.ptree, %struct.ptree* %99, i64 0, i32 0
  %101 = load i64, i64* %100, align 8
  %102 = load i32, i32* %46, align 4
  %103 = zext i32 %102 to i64
  %104 = icmp eq i64 %101, %103
  br i1 %104, label %.thread, label %108

.thread:                                          ; preds = %91
  %105 = load float, float* %6, align 4
  %106 = fpext float %105 to double
  %107 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i64 0, i64 0), double %106, i32 %102)
  %puts = call i32 @puts(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str, i64 0, i64 0))
  br label %.backedge

; <label>:108:                                    ; preds = %91
  %109 = call %struct.ptree* @pat_insert(%struct.ptree* nonnull %78, %struct.ptree* %21) #5
  %110 = icmp eq %struct.ptree* %109, null
  br i1 %110, label %.us-lcssa3.us.loopexit22, label %.backedge

.backedge:                                        ; preds = %108, %.thread
  %111 = call i8* @fgets(i8* nonnull %43, i32 128, %struct._IO_FILE* nonnull %14)
  %112 = icmp eq i8* %111, null
  br i1 %112, label %._crit_edge.loopexit23, label %.lr.ph.split

.us-lcssa3.us.loopexit:                           ; preds = %63
  br label %.us-lcssa3.us

.us-lcssa3.us.loopexit22:                         ; preds = %108
  br label %.us-lcssa3.us

.us-lcssa3.us:                                    ; preds = %.us-lcssa3.us.loopexit22, %.us-lcssa3.us.loopexit
  %113 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %114 = call i64 @fwrite(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.9, i64 0, i64 0), i64 21, i64 1, %struct._IO_FILE* %113) #7
  call void @exit(i32 1) #6
  unreachable

._crit_edge.loopexit:                             ; preds = %.backedge.us
  br label %._crit_edge

._crit_edge.loopexit23:                           ; preds = %.backedge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit23, %._crit_edge.loopexit, %37
  %115 = call i32 @fclose(%struct._IO_FILE* nonnull %14)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #2

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #1

; Function Attrs: nounwind
declare void @perror(i8* nocapture readonly) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare i8* @fgets(i8*, i32, %struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8* nocapture readonly, i8* nocapture readonly, ...) local_unnamed_addr #1

declare %struct.ptree* @pat_search(i64, %struct.ptree*) local_unnamed_addr #4

declare %struct.ptree* @pat_insert(%struct.ptree*, %struct.ptree*) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
