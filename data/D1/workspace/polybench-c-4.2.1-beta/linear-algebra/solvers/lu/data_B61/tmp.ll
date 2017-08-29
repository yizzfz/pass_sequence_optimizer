; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu([2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array([2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge.thread, %1
  %indvars.iv44 = phi i64 [ 0, %1 ], [ %indvars.iv.next45, %._crit_edge.thread ]
  %2 = sub i64 1998, %indvars.iv44
  %3 = shl i64 %2, 3
  br label %8

.preheader61:                                     ; preds = %8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %4 = icmp slt i64 %indvars.iv.next45, 2000
  br i1 %4, label %._crit_edge.thread, label %16

._crit_edge.thread:                               ; preds = %.preheader61
  %5 = and i64 %3, 34359738360
  %6 = add nuw nsw i64 %5, 8
  %scevgep42 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv44, i64 %indvars.iv.next45
  %scevgep4243 = bitcast double* %scevgep42 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep4243, i8 0, i64 %6, i32 8, i1 false)
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv44, i64 %indvars.iv44
  store double 1.000000e+00, double* %7, align 8
  br label %.lr.ph

; <label>:8:                                      ; preds = %8, %.lr.ph
  %indvars.iv32 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next33, %8 ]
  %9 = sub nsw i64 0, %indvars.iv32
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 2000
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.000000e+03
  %14 = fadd double %13, 1.000000e+00
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv44, i64 %indvars.iv32
  store double %14, double* %15, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond36 = icmp eq i64 %indvars.iv32, %indvars.iv44
  br i1 %exitcond36, label %.preheader61, label %8

; <label>:16:                                     ; preds = %.preheader61
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv44, i64 %indvars.iv44
  store double 1.000000e+00, double* %17, align 8
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %19

; <label>:19:                                     ; preds = %19, %16
  %indvars.iv30 = phi i64 [ 0, %16 ], [ %indvars.iv.next31.7, %19 ]
  %20 = mul nuw nsw i64 %indvars.iv30, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %21 = mul nuw nsw i64 %indvars.iv.next31, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next31.1 = or i64 %indvars.iv30, 2
  %22 = mul nuw nsw i64 %indvars.iv.next31.1, 16000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next31.2 = or i64 %indvars.iv30, 3
  %23 = mul nuw nsw i64 %indvars.iv.next31.2, 16000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next31.3 = or i64 %indvars.iv30, 4
  %24 = mul nuw nsw i64 %indvars.iv.next31.3, 16000
  %scevgep.4 = getelementptr i8, i8* %18, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next31.4 = or i64 %indvars.iv30, 5
  %25 = mul nuw nsw i64 %indvars.iv.next31.4, 16000
  %scevgep.5 = getelementptr i8, i8* %18, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next31.5 = or i64 %indvars.iv30, 6
  %26 = mul nuw nsw i64 %indvars.iv.next31.5, 16000
  %scevgep.6 = getelementptr i8, i8* %18, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next31.6 = or i64 %indvars.iv30, 7
  %27 = mul nuw nsw i64 %indvars.iv.next31.6, 16000
  %scevgep.7 = getelementptr i8, i8* %18, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next31.7 = add nsw i64 %indvars.iv30, 8
  %exitcond49.7 = icmp eq i64 %indvars.iv.next31.7, 2000
  br i1 %exitcond49.7, label %.preheader58.preheader, label %19

.preheader58.preheader:                           ; preds = %19
  %28 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader58

.preheader58:                                     ; preds = %.preheader58.preheader, %76
  %indvars.iv25 = phi i64 [ %29, %76 ], [ 0, %.preheader58.preheader ]
  %scevgep52 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv25
  %29 = add nuw nsw i64 %indvars.iv25, 1
  %scevgep54 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %29
  %30 = bitcast double* %scevgep54 to i8*
  %31 = bitcast double* %scevgep52 to i8*
  br label %.preheader57

.preheader57:                                     ; preds = %middle.block, %.preheader58
  %indvars.iv23 = phi i64 [ 0, %.preheader58 ], [ %indvars.iv.next24, %middle.block ]
  %32 = mul nuw nsw i64 %indvars.iv23, 16000
  %scevgep50 = getelementptr i8, i8* %18, i64 %32
  %33 = add nuw nsw i64 %32, 16000
  %scevgep51 = getelementptr i8, i8* %18, i64 %33
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv23, i64 %indvars.iv25
  %bound0 = icmp ult i8* %scevgep50, %30
  %bound1 = icmp ult i8* %31, %scevgep51
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %34 to i8*
  %bound057 = icmp ult i8* %scevgep50, %bc
  %bound158 = icmp ult i8* %bc, %scevgep51
  %found.conflict59 = and i1 %bound057, %bound158
  %conflict.rdx = or i1 %found.conflict, %found.conflict59
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader57
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader57
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %35 = or i64 %index, 1
  %36 = or i64 %index, 2
  %37 = or i64 %index, 3
  %38 = load double, double* %34, align 8, !alias.scope !1
  %39 = insertelement <2 x double> undef, double %38, i32 0
  %40 = shufflevector <2 x double> %39, <2 x double> undef, <2 x i32> zeroinitializer
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv25
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %35, i64 %indvars.iv25
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %36, i64 %indvars.iv25
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %37, i64 %indvars.iv25
  %45 = load double, double* %41, align 8, !alias.scope !4
  %46 = load double, double* %42, align 8, !alias.scope !4
  %47 = load double, double* %43, align 8, !alias.scope !4
  %48 = load double, double* %44, align 8, !alias.scope !4
  %49 = insertelement <2 x double> undef, double %45, i32 0
  %50 = insertelement <2 x double> %49, double %46, i32 1
  %51 = insertelement <2 x double> undef, double %47, i32 0
  %52 = insertelement <2 x double> %51, double %48, i32 1
  %53 = fmul <2 x double> %40, %50
  %54 = fmul <2 x double> %40, %52
  %55 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv23, i64 %index
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !6, !noalias !8
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load61 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !6, !noalias !8
  %59 = fadd <2 x double> %wide.load, %53
  %60 = fadd <2 x double> %wide.load61, %54
  store <2 x double> %59, <2 x double>* %56, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %60, <2 x double>* %58, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %61 = icmp eq i64 %index.next, 2000
  br i1 %61, label %middle.block.loopexit93, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv20 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next21.1, %scalar.ph ]
  %62 = load double, double* %34, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv20, i64 %indvars.iv25
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv23, i64 %indvars.iv20
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %66, align 8
  %indvars.iv.next21 = or i64 %indvars.iv20, 1
  %69 = load double, double* %34, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next21, i64 %indvars.iv25
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next21
  %74 = load double, double* %73, align 8
  %75 = fadd double %74, %72
  store double %75, double* %73, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next21, 1999
  br i1 %exitcond22.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit93:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit93, %middle.block.loopexit
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next24, 2000
  br i1 %exitcond47, label %76, label %.preheader57

; <label>:76:                                     ; preds = %middle.block
  %exitcond48 = icmp eq i64 %29, 2000
  br i1 %exitcond48, label %.preheader.preheader, label %.preheader58

.preheader.preheader:                             ; preds = %76
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %middle.block63
  %indvars.iv18 = phi i64 [ %77, %middle.block63 ], [ 0, %.preheader.preheader ]
  %scevgep67 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 0
  %scevgep6768 = bitcast double* %scevgep67 to i8*
  %77 = add nuw nsw i64 %indvars.iv18, 1
  %scevgep69 = getelementptr [2000 x double], [2000 x double]* %0, i64 %77, i64 0
  %scevgep6970 = bitcast double* %scevgep69 to i8*
  %78 = mul nuw nsw i64 %indvars.iv18, 16000
  %scevgep71 = getelementptr i8, i8* %18, i64 %78
  %79 = add nuw nsw i64 %78, 16000
  %scevgep72 = getelementptr i8, i8* %18, i64 %79
  %bound073 = icmp ult i8* %scevgep6768, %scevgep72
  %bound174 = icmp ult i8* %scevgep71, %scevgep6970
  %memcheck.conflict76 = and i1 %bound073, %bound174
  br i1 %memcheck.conflict76, label %scalar.ph64.preheader, label %vector.body62.preheader

vector.body62.preheader:                          ; preds = %.preheader
  br label %vector.body62

scalar.ph64.preheader:                            ; preds = %.preheader
  br label %scalar.ph64

vector.body62:                                    ; preds = %vector.body62, %vector.body62.preheader
  %index79 = phi i64 [ 0, %vector.body62.preheader ], [ %index.next80.1, %vector.body62 ]
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv18, i64 %index79
  %81 = bitcast double* %80 to <2 x i64>*
  %wide.load87 = load <2 x i64>, <2 x i64>* %81, align 8, !alias.scope !13
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  %wide.load88 = load <2 x i64>, <2 x i64>* %83, align 8, !alias.scope !13
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %index79
  %85 = bitcast double* %84 to <2 x i64>*
  store <2 x i64> %wide.load87, <2 x i64>* %85, align 8, !alias.scope !16, !noalias !13
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  store <2 x i64> %wide.load88, <2 x i64>* %87, align 8, !alias.scope !16, !noalias !13
  %index.next80 = or i64 %index79, 4
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv18, i64 %index.next80
  %89 = bitcast double* %88 to <2 x i64>*
  %wide.load87.1 = load <2 x i64>, <2 x i64>* %89, align 8, !alias.scope !13
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x i64>*
  %wide.load88.1 = load <2 x i64>, <2 x i64>* %91, align 8, !alias.scope !13
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %index.next80
  %93 = bitcast double* %92 to <2 x i64>*
  store <2 x i64> %wide.load87.1, <2 x i64>* %93, align 8, !alias.scope !16, !noalias !13
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x i64>*
  store <2 x i64> %wide.load88.1, <2 x i64>* %95, align 8, !alias.scope !16, !noalias !13
  %index.next80.1 = add nsw i64 %index79, 8
  %96 = icmp eq i64 %index.next80.1, 2000
  br i1 %96, label %middle.block63.loopexit92, label %vector.body62, !llvm.loop !18

scalar.ph64:                                      ; preds = %scalar.ph64, %scalar.ph64.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph64.preheader ], [ %indvars.iv.next.4, %scalar.ph64 ]
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv18, i64 %indvars.iv
  %98 = bitcast double* %97 to i64*
  %99 = load i64, i64* %98, align 8
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv
  %101 = bitcast double* %100 to i64*
  store i64 %99, i64* %101, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %102 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv18, i64 %indvars.iv.next
  %103 = bitcast double* %102 to i64*
  %104 = load i64, i64* %103, align 8
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv.next
  %106 = bitcast double* %105 to i64*
  store i64 %104, i64* %106, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv18, i64 %indvars.iv.next.1
  %108 = bitcast double* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv.next.1
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv18, i64 %indvars.iv.next.2
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv.next.2
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv18, i64 %indvars.iv.next.3
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv.next.3
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %middle.block63.loopexit, label %scalar.ph64, !llvm.loop !19

middle.block63.loopexit:                          ; preds = %scalar.ph64
  br label %middle.block63

middle.block63.loopexit92:                        ; preds = %vector.body62
  br label %middle.block63

middle.block63:                                   ; preds = %middle.block63.loopexit92, %middle.block63.loopexit
  %exitcond46 = icmp eq i64 %77, 2000
  br i1 %exitcond46, label %122, label %.preheader

; <label>:122:                                    ; preds = %middle.block63
  tail call void @free(i8* nonnull %18) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader35

.preheader35:                                     ; preds = %._crit_edge7, %1
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge7 ], [ 0, %1 ]
  %indvars.iv24 = phi i32 [ %indvars.iv.next25, %._crit_edge7 ], [ -1, %1 ]
  %2 = add i64 %indvars.iv34, 4294967295
  %3 = and i64 %2, 4294967295
  %4 = icmp sgt i64 %indvars.iv34, 0
  br i1 %4, label %.preheader33.preheader, label %._crit_edge7

.preheader33.preheader:                           ; preds = %.preheader35
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 0
  br label %.preheader33

.preheader.us.preheader:                          ; preds = %._crit_edge
  %wide.trip.count26 = zext i32 %indvars.iv24 to i64
  %6 = and i64 %2, 1
  %lcmp.mod42 = icmp eq i64 %6, 0
  %7 = icmp eq i64 %3, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge5.us, %.preheader.us.preheader
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge5.us ], [ %indvars.iv34, %.preheader.us.preheader ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv30
  %.pre16 = load double, double* %8, align 8
  br i1 %lcmp.mod42, label %.prol.preheader39, label %.prol.loopexit40.unr-lcssa

.prol.preheader39:                                ; preds = %.preheader.us
  %9 = load double, double* %5, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv30
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = fsub double %.pre16, %12
  store double %13, double* %8, align 8
  br label %.prol.loopexit40.unr-lcssa

.prol.loopexit40.unr-lcssa:                       ; preds = %.preheader.us, %.prol.preheader39
  %indvars.iv22.unr.ph = phi i64 [ 1, %.prol.preheader39 ], [ 0, %.preheader.us ]
  %.unr43.ph = phi double [ %13, %.prol.preheader39 ], [ %.pre16, %.preheader.us ]
  br i1 %7, label %._crit_edge5.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit40.unr-lcssa
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader.us.new
  %indvars.iv22 = phi i64 [ %indvars.iv22.unr.ph, %.preheader.us.new ], [ %indvars.iv.next23.1, %14 ]
  %15 = phi double [ %.unr43.ph, %.preheader.us.new ], [ %27, %14 ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv22
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv30
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %15, %20
  store double %21, double* %8, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv.next23
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next23, i64 %indvars.iv30
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %8, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %exitcond27.1 = icmp eq i64 %indvars.iv.next23, %wide.trip.count26
  br i1 %exitcond27.1, label %._crit_edge5.us.unr-lcssa, label %14

._crit_edge5.us.unr-lcssa:                        ; preds = %14
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %.prol.loopexit40.unr-lcssa, %._crit_edge5.us.unr-lcssa
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next31, 2000
  br i1 %exitcond37, label %._crit_edge7.loopexit, label %.preheader.us

.preheader33:                                     ; preds = %.preheader33.preheader, %._crit_edge
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge ], [ 0, %.preheader33.preheader ]
  %indvars.iv17 = phi i32 [ %indvars.iv.next18, %._crit_edge ], [ -1, %.preheader33.preheader ]
  %28 = add i64 %indvars.iv19, 4294967295
  %29 = and i64 %28, 4294967295
  %30 = icmp sgt i64 %indvars.iv19, 0
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv19
  %.pre = load double, double* %31, align 8
  br i1 %30, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader33
  %wide.trip.count = zext i32 %indvars.iv17 to i64
  %32 = and i64 %28, 1
  %lcmp.mod = icmp eq i64 %32, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  %33 = load double, double* %5, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv19
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fsub double %.pre, %36
  store double %37, double* %31, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %.prol.preheader
  %.lcssa.unr.ph = phi double [ %37, %.prol.preheader ], [ undef, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %37, %.prol.preheader ], [ %.pre, %.lr.ph ]
  %38 = icmp eq i64 %29, 0
  br i1 %38, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit.unr-lcssa
  br label %39

; <label>:39:                                     ; preds = %39, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %39 ]
  %40 = phi double [ %.unr.ph, %.lr.ph.new ], [ %52, %39 ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv19
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fsub double %40, %45
  store double %46, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv19
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fsub double %46, %51
  store double %52, double* %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %39

._crit_edge.loopexit.unr-lcssa:                   ; preds = %39
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit.unr-lcssa, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit.unr-lcssa ], [ %52, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader33
  %53 = phi double [ %.pre, %.preheader33 ], [ %.lcssa, %._crit_edge.loopexit ]
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv19, i64 %indvars.iv19
  %55 = load double, double* %54, align 8
  %56 = fdiv double %53, %55
  store double %56, double* %31, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %indvars.iv.next18 = add nsw i32 %indvars.iv17, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next20, %indvars.iv34
  br i1 %exitcond36, label %.preheader.us.preheader, label %.preheader33

._crit_edge7.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %.preheader35
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %indvars.iv.next25 = add nsw i32 %indvars.iv24, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next35, 2000
  br i1 %exitcond38, label %57, label %.preheader35

; <label>:57:                                     ; preds = %._crit_edge7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %18, %1
  %indvars.iv3 = phi i64 [ 0, %1 ], [ %indvars.iv.next4, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv3, 2000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %18, label %7

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 2000
  br i1 %exitcond5, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
