; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br label %.preheader14

.preheader14:                                     ; preds = %._crit_edge, %2
  %indvars.iv4652 = phi i64 [ 1, %2 ], [ %indvars.iv.next47, %._crit_edge ]
  %indvars.iv4851 = phi i64 [ 0, %2 ], [ %indvars.iv.next49, %._crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv4851, 2001
  %4 = add nuw nsw i64 %3, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %4
  %5 = mul nsw i64 %indvars.iv4851, -8
  br label %._crit_edge55

.preheader13:                                     ; preds = %._crit_edge55
  %scevgep54 = bitcast double* %scevgep to i8*
  %6 = add nsw i64 %5, 15992
  %exitcond4244 = icmp eq i64 %indvars.iv4851, 1999
  br i1 %exitcond4244, label %._crit_edge.thread, label %._crit_edge

._crit_edge.thread:                               ; preds = %.preheader13
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 1999, i64 1999
  store double 1.000000e+00, double* %7, align 8
  br label %.preheader10.preheader

._crit_edge55:                                    ; preds = %._crit_edge55, %.preheader14
  %indvars.iv38 = phi i64 [ 0, %.preheader14 ], [ %indvars.iv.next34, %._crit_edge55 ]
  %8 = sub nsw i64 0, %indvars.iv38
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4851, i64 %indvars.iv38
  store double %13, double* %14, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next34, %indvars.iv4652
  br i1 %exitcond37, label %.preheader13, label %._crit_edge55

._crit_edge:                                      ; preds = %.preheader13
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep54, i8 0, i64 %6, i32 8, i1 false)
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4851, i64 %indvars.iv4851
  store double 1.000000e+00, double* %15, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv4851, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next49, 2000
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv4652, 1
  br i1 %exitcond50, label %.preheader10.preheader.loopexit, label %.preheader14

.preheader10.preheader.loopexit:                  ; preds = %._crit_edge
  br label %.preheader10.preheader

.preheader10.preheader:                           ; preds = %.preheader10.preheader.loopexit, %._crit_edge.thread
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  call void @llvm.memset.p0i8.i64(i8* %16, i8 0, i64 32000000, i32 8, i1 false)
  %17 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader10

.preheader10:                                     ; preds = %67, %.preheader10.preheader
  %indvars.iv27 = phi i64 [ 0, %.preheader10.preheader ], [ %indvars.iv.next25, %67 ]
  %scevgep65 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv27
  %scevgep6566 = bitcast double* %scevgep65 to i8*
  %18 = add nuw nsw i64 %indvars.iv27, 1
  %scevgep67 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %18
  %scevgep6768 = bitcast double* %scevgep67 to i8*
  br label %.preheader9

.preheader9:                                      ; preds = %middle.block, %.preheader10
  %indvars.iv24 = phi i64 [ 0, %.preheader10 ], [ %indvars.iv.next22, %middle.block ]
  %19 = mul nuw nsw i64 %indvars.iv24, 16000
  %scevgep63 = getelementptr i8, i8* %16, i64 %19
  %20 = add nuw nsw i64 %19, 16000
  %scevgep64 = getelementptr i8, i8* %16, i64 %20
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv24, i64 %indvars.iv27
  %bound0 = icmp ult i8* %scevgep63, %scevgep6768
  %bound1 = icmp ult i8* %scevgep6566, %scevgep64
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %21 to i8*
  %bc69 = bitcast double* %21 to i8*
  %bound070 = icmp ult i8* %scevgep63, %bc69
  %bound171 = icmp ult i8* %bc, %scevgep64
  %found.conflict72 = and i1 %bound070, %bound171
  %conflict.rdx = or i1 %found.conflict, %found.conflict72
  br i1 %conflict.rdx, label %._crit_edge56.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader9
  br label %vector.body

._crit_edge56.preheader:                          ; preds = %.preheader9
  br label %._crit_edge56

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %22 = or i64 %index, 1
  %23 = or i64 %index, 2
  %24 = or i64 %index, 3
  %25 = load double, double* %21, align 8, !alias.scope !1
  %26 = insertelement <2 x double> undef, double %25, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = insertelement <2 x double> undef, double %25, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv27
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %22, i64 %indvars.iv27
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %23, i64 %indvars.iv27
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %24, i64 %indvars.iv27
  %34 = load double, double* %30, align 8, !alias.scope !4
  %35 = load double, double* %31, align 8, !alias.scope !4
  %36 = load double, double* %32, align 8, !alias.scope !4
  %37 = load double, double* %33, align 8, !alias.scope !4
  %38 = insertelement <2 x double> undef, double %34, i32 0
  %39 = insertelement <2 x double> %38, double %35, i32 1
  %40 = insertelement <2 x double> undef, double %36, i32 0
  %41 = insertelement <2 x double> %40, double %37, i32 1
  %42 = fmul <2 x double> %27, %39
  %43 = fmul <2 x double> %29, %41
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv24, i64 %index
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !6, !noalias !8
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !6, !noalias !8
  %48 = fadd <2 x double> %wide.load, %42
  %49 = fadd <2 x double> %wide.load74, %43
  %50 = bitcast double* %44 to <2 x double>*
  store <2 x double> %48, <2 x double>* %50, align 8, !alias.scope !6, !noalias !8
  %51 = bitcast double* %46 to <2 x double>*
  store <2 x double> %49, <2 x double>* %51, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %52 = icmp eq i64 %index.next, 2000
  br i1 %52, label %middle.block.loopexit104, label %vector.body, !llvm.loop !9

._crit_edge56:                                    ; preds = %._crit_edge56, %._crit_edge56.preheader
  %indvars.iv21 = phi i64 [ 0, %._crit_edge56.preheader ], [ %indvars.iv.next19.1, %._crit_edge56 ]
  %53 = load double, double* %21, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv21, i64 %indvars.iv27
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv24, i64 %indvars.iv21
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %57, align 8
  %indvars.iv.next19 = or i64 %indvars.iv21, 1
  %60 = load double, double* %21, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next19, i64 %indvars.iv27
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv24, i64 %indvars.iv.next19
  %65 = load double, double* %64, align 8
  %66 = fadd double %65, %63
  store double %66, double* %64, align 8
  %indvars.iv.next19.1 = add nuw nsw i64 %indvars.iv21, 2
  %exitcond20.1 = icmp eq i64 %indvars.iv.next19.1, 2000
  br i1 %exitcond20.1, label %middle.block.loopexit, label %._crit_edge56, !llvm.loop !12

middle.block.loopexit:                            ; preds = %._crit_edge56
  br label %middle.block

middle.block.loopexit104:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit104, %middle.block.loopexit
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 2000
  br i1 %exitcond23, label %67, label %.preheader9

; <label>:67:                                     ; preds = %middle.block
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 2000
  br i1 %exitcond26, label %.preheader.preheader, label %.preheader10

.preheader.preheader:                             ; preds = %67
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %middle.block76
  %indvars.iv18 = phi i64 [ %indvars.iv.next16, %middle.block76 ], [ 0, %.preheader.preheader ]
  %scevgep80 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 0
  %scevgep8081 = bitcast double* %scevgep80 to i8*
  %68 = add nuw nsw i64 %indvars.iv18, 1
  %scevgep82 = getelementptr [2000 x double], [2000 x double]* %1, i64 %68, i64 0
  %scevgep8283 = bitcast double* %scevgep82 to i8*
  %69 = mul nuw nsw i64 %indvars.iv18, 16000
  %scevgep84 = getelementptr i8, i8* %16, i64 %69
  %70 = add nuw nsw i64 %69, 16000
  %scevgep85 = getelementptr i8, i8* %16, i64 %70
  %bound086 = icmp ult i8* %scevgep8081, %scevgep85
  %bound187 = icmp ult i8* %scevgep84, %scevgep8283
  %memcheck.conflict89 = and i1 %bound086, %bound187
  br i1 %memcheck.conflict89, label %._crit_edge57.preheader, label %vector.body75.preheader

vector.body75.preheader:                          ; preds = %.preheader
  br label %vector.body75

._crit_edge57.preheader:                          ; preds = %.preheader
  br label %._crit_edge57

vector.body75:                                    ; preds = %vector.body75, %vector.body75.preheader
  %index92 = phi i64 [ 0, %vector.body75.preheader ], [ %index.next93.1, %vector.body75 ]
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv18, i64 %index92
  %72 = bitcast double* %71 to <2 x i64>*
  %wide.load100 = load <2 x i64>, <2 x i64>* %72, align 8, !alias.scope !13
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x i64>*
  %wide.load101 = load <2 x i64>, <2 x i64>* %74, align 8, !alias.scope !13
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %index92
  %76 = bitcast double* %75 to <2 x i64>*
  store <2 x i64> %wide.load100, <2 x i64>* %76, align 8, !alias.scope !16, !noalias !13
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x i64>*
  store <2 x i64> %wide.load101, <2 x i64>* %78, align 8, !alias.scope !16, !noalias !13
  %index.next93 = or i64 %index92, 4
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv18, i64 %index.next93
  %80 = bitcast double* %79 to <2 x i64>*
  %wide.load100.1 = load <2 x i64>, <2 x i64>* %80, align 8, !alias.scope !13
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x i64>*
  %wide.load101.1 = load <2 x i64>, <2 x i64>* %82, align 8, !alias.scope !13
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %index.next93
  %84 = bitcast double* %83 to <2 x i64>*
  store <2 x i64> %wide.load100.1, <2 x i64>* %84, align 8, !alias.scope !16, !noalias !13
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x i64>*
  store <2 x i64> %wide.load101.1, <2 x i64>* %86, align 8, !alias.scope !16, !noalias !13
  %index.next93.1 = add nuw nsw i64 %index92, 8
  %87 = icmp eq i64 %index.next93.1, 2000
  br i1 %87, label %middle.block76.loopexit103, label %vector.body75, !llvm.loop !18

._crit_edge57:                                    ; preds = %._crit_edge57, %._crit_edge57.preheader
  %indvars.iv15 = phi i64 [ 0, %._crit_edge57.preheader ], [ %indvars.iv.next.4, %._crit_edge57 ]
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv18, i64 %indvars.iv15
  %89 = bitcast double* %88 to i64*
  %90 = load i64, i64* %89, align 8
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv15
  %92 = bitcast double* %91 to i64*
  store i64 %90, i64* %92, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv15, 1
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv18, i64 %indvars.iv.next
  %94 = bitcast double* %93 to i64*
  %95 = load i64, i64* %94, align 8
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv.next
  %97 = bitcast double* %96 to i64*
  store i64 %95, i64* %97, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv15, 2
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv18, i64 %indvars.iv.next.1
  %99 = bitcast double* %98 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv.next.1
  %102 = bitcast double* %101 to i64*
  store i64 %100, i64* %102, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv15, 3
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv18, i64 %indvars.iv.next.2
  %104 = bitcast double* %103 to i64*
  %105 = load i64, i64* %104, align 8
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv.next.2
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv15, 4
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv18, i64 %indvars.iv.next.3
  %109 = bitcast double* %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv.next.3
  %112 = bitcast double* %111 to i64*
  store i64 %110, i64* %112, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv15, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %middle.block76.loopexit, label %._crit_edge57, !llvm.loop !19

middle.block76.loopexit:                          ; preds = %._crit_edge57
  br label %middle.block76

middle.block76.loopexit103:                       ; preds = %vector.body75
  br label %middle.block76

middle.block76:                                   ; preds = %middle.block76.loopexit103, %middle.block76.loopexit
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond17, label %113, label %.preheader

; <label>:113:                                    ; preds = %middle.block76
  tail call void @free(i8* nonnull %16) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge23, %2
  %indvars.iv = phi i2 [ %indvars.iv.next38, %._crit_edge23 ], [ 0, %2 ]
  %indvars.iv26 = phi i64 [ 0, %2 ], [ %indvars.iv.next24, %._crit_edge23 ]
  %3 = zext i2 %indvars.iv to i64
  %4 = add nsw i64 %indvars.iv26, -1
  %exitcond1314 = icmp eq i64 %indvars.iv26, 0
  br i1 %exitcond1314, label %._crit_edge23, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader4
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 0
  %.pre32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 0
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 0
  br label %.preheader

.lr.ph22:                                         ; preds = %._crit_edge
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv26
  %.pre31 = load double, double* %6, align 8
  %xtraiter33 = and i64 %indvars.iv26, 3
  %lcmp.mod34 = icmp eq i64 %xtraiter33, 0
  br i1 %lcmp.mod34, label %._crit_edge28.prol.loopexit, label %._crit_edge28.prol.preheader

._crit_edge28.prol.preheader:                     ; preds = %.lr.ph22
  br label %._crit_edge28.prol

._crit_edge28.prol:                               ; preds = %._crit_edge28.prol, %._crit_edge28.prol.preheader
  %7 = phi double [ %.pre31, %._crit_edge28.prol.preheader ], [ %11, %._crit_edge28.prol ]
  %indvars.iv21.prol = phi i64 [ 0, %._crit_edge28.prol.preheader ], [ %indvars.iv.next16.prol, %._crit_edge28.prol ]
  %prol.iter = phi i64 [ %xtraiter33, %._crit_edge28.prol.preheader ], [ %prol.iter.sub, %._crit_edge28.prol ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv21.prol
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fsub double %7, %10
  store double %11, double* %6, align 8
  %indvars.iv.next16.prol = add nuw nsw i64 %indvars.iv21.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge28.prol.loopexit.unr-lcssa, label %._crit_edge28.prol, !llvm.loop !20

._crit_edge28.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge28.prol
  br label %._crit_edge28.prol.loopexit

._crit_edge28.prol.loopexit:                      ; preds = %.lr.ph22, %._crit_edge28.prol.loopexit.unr-lcssa
  %.unr35 = phi double [ %.pre31, %.lr.ph22 ], [ %11, %._crit_edge28.prol.loopexit.unr-lcssa ]
  %indvars.iv21.unr = phi i64 [ 0, %.lr.ph22 ], [ %3, %._crit_edge28.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %4, 3
  br i1 %12, label %._crit_edge23.loopexit, label %.lr.ph22.new

.lr.ph22.new:                                     ; preds = %._crit_edge28.prol.loopexit
  br label %._crit_edge28

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv15 = phi i64 [ %indvars.iv.next9, %._crit_edge ], [ 0, %.preheader.preheader ]
  %exitcond7 = icmp eq i64 %indvars.iv15, 0
  br i1 %exitcond7, label %.preheader.._crit_edge_crit_edge, label %.lr.ph

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  %.pre30 = load double, double* %.phi.trans.insert, align 8
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv15
  %.pre = load double, double* %13, align 8
  %xtraiter = and i64 %indvars.iv15, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge27.prol.loopexit.unr-lcssa, label %._crit_edge27.prol.preheader

._crit_edge27.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge27.prol

._crit_edge27.prol:                               ; preds = %._crit_edge27.prol.preheader
  %14 = load double, double* %5, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 0
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %.pre, %17
  store double %18, double* %13, align 8
  br label %._crit_edge27.prol.loopexit.unr-lcssa

._crit_edge27.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph, %._crit_edge27.prol
  %.lcssa.unr.ph = phi double [ %18, %._crit_edge27.prol ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %18, %._crit_edge27.prol ], [ %.pre, %.lr.ph ]
  %indvars.iv8.unr.ph = phi i64 [ 1, %._crit_edge27.prol ], [ 0, %.lr.ph ]
  br label %._crit_edge27.prol.loopexit

._crit_edge27.prol.loopexit:                      ; preds = %._crit_edge27.prol.loopexit.unr-lcssa
  %19 = icmp eq i64 %indvars.iv15, 1
  br i1 %19, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge27.prol.loopexit
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27, %.lr.ph.new
  %20 = phi double [ %.unr.ph, %.lr.ph.new ], [ %32, %._crit_edge27 ]
  %indvars.iv8 = phi i64 [ %indvars.iv8.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %._crit_edge27 ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv8
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv8
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %13, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %26, %31
  store double %32, double* %13, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv8, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv15
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge27

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge27
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge27.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge27.prol.loopexit ], [ %32, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader.._crit_edge_crit_edge
  %.pre-phi = phi double* [ %.pre32, %.preheader.._crit_edge_crit_edge ], [ %13, %._crit_edge.loopexit ]
  %33 = phi double [ %.pre30, %.preheader.._crit_edge_crit_edge ], [ %.lcssa, %._crit_edge.loopexit ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv15
  %35 = load double, double* %34, align 8
  %36 = fdiv double %33, %35
  store double %36, double* %.pre-phi, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next9, %indvars.iv26
  br i1 %exitcond13, label %.lr.ph22, label %.preheader

._crit_edge28:                                    ; preds = %._crit_edge28, %.lr.ph22.new
  %37 = phi double [ %.unr35, %.lr.ph22.new ], [ %53, %._crit_edge28 ]
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr, %.lr.ph22.new ], [ %indvars.iv.next16.3, %._crit_edge28 ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv21
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %39
  %41 = fsub double %37, %40
  store double %41, double* %6, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv21, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv.next16
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fsub double %41, %44
  store double %45, double* %6, align 8
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv21, 2
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv.next16.1
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %47
  %49 = fsub double %45, %48
  store double %49, double* %6, align 8
  %indvars.iv.next16.2 = add nsw i64 %indvars.iv21, 3
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv.next16.2
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fsub double %49, %52
  store double %53, double* %6, align 8
  %indvars.iv.next16.3 = add nsw i64 %indvars.iv21, 4
  %exitcond19.3 = icmp eq i64 %indvars.iv.next16.3, %indvars.iv26
  br i1 %exitcond19.3, label %._crit_edge23.loopexit.unr-lcssa, label %._crit_edge28

._crit_edge23.loopexit.unr-lcssa:                 ; preds = %._crit_edge28
  br label %._crit_edge23.loopexit

._crit_edge23.loopexit:                           ; preds = %._crit_edge28.prol.loopexit, %._crit_edge23.loopexit.unr-lcssa
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %.preheader4
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv26
  %55 = load double, double* %54, align 8
  %56 = tail call double @sqrt(double %55) #3
  store double %56, double* %54, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 2000
  %indvars.iv.next38 = add i2 %indvars.iv, 1
  br i1 %exitcond25, label %57, label %.preheader4

; <label>:57:                                     ; preds = %._crit_edge23
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %18, %2
  %indvars.iv10 = phi i64 [ 1, %2 ], [ %indvars.iv.next5, %18 ]
  %indvars.iv69 = phi i64 [ 0, %2 ], [ %indvars.iv.next7, %18 ]
  %7 = mul nuw nsw i64 %indvars.iv69, 2000
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge, %.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv4, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge11, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 %indvars.iv4
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv10
  br i1 %exitcond, label %18, label %._crit_edge11

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 2000
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv10, 1
  br i1 %exitcond8, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }

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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
