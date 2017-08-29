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
  br label %.lr.ph

.lr.ph:                                           ; preds = %2, %._crit_edge..preheader14_crit_edge
  %indvars.iv63 = phi i64 [ 0, %2 ], [ %indvars.iv.next64, %._crit_edge..preheader14_crit_edge ]
  %indvars.iv61 = phi i64 [ 1, %2 ], [ %indvars.iv.next62, %._crit_edge..preheader14_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv63, 2001
  %4 = sub i64 1998, %indvars.iv63
  br label %._crit_edge66

.preheader13:                                     ; preds = %._crit_edge66
  %5 = add nuw nsw i64 %3, 1
  %6 = shl i64 %4, 3
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %7 = icmp slt i64 %indvars.iv.next64, 2000
  br i1 %7, label %._crit_edge.thread, label %._crit_edge

._crit_edge66:                                    ; preds = %._crit_edge66, %.lr.ph
  %indvars.iv46 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next47, %._crit_edge66 ]
  %8 = sub nsw i64 0, %indvars.iv46
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv46
  store double %13, double* %14, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next47, %indvars.iv61
  br i1 %exitcond54, label %.preheader13, label %._crit_edge66

._crit_edge.thread:                               ; preds = %.preheader13
  %15 = and i64 %6, 34359738360
  %16 = add nuw nsw i64 %15, 8
  %scevgep = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %5
  %scevgep60 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep60, i8 0, i64 %16, i32 8, i1 false)
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv63
  store double 1.000000e+00, double* %17, align 8
  br label %._crit_edge..preheader14_crit_edge

._crit_edge:                                      ; preds = %.preheader13
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv63
  store double 1.000000e+00, double* %18, align 8
  %exitcond65 = icmp eq i64 %indvars.iv.next64, 2000
  br i1 %exitcond65, label %.preheader10.preheader, label %._crit_edge..preheader14_crit_edge

._crit_edge..preheader14_crit_edge:               ; preds = %._crit_edge.thread, %._crit_edge
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  br label %.lr.ph

.preheader10.preheader:                           ; preds = %._crit_edge
  %19 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  call void @llvm.memset.p0i8.i64(i8* %19, i8 0, i64 32000000, i32 8, i1 false)
  %20 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.preheader10

.preheader10:                                     ; preds = %70, %.preheader10.preheader
  %indvars.iv37 = phi i64 [ 0, %.preheader10.preheader ], [ %indvars.iv.next38, %70 ]
  %scevgep72 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv37
  %scevgep7273 = bitcast double* %scevgep72 to i8*
  %21 = add nuw nsw i64 %indvars.iv37, 1
  %scevgep74 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %21
  %scevgep7475 = bitcast double* %scevgep74 to i8*
  br label %.preheader9

.preheader9:                                      ; preds = %middle.block, %.preheader10
  %indvars.iv34 = phi i64 [ 0, %.preheader10 ], [ %indvars.iv.next35, %middle.block ]
  %22 = mul nuw nsw i64 %indvars.iv34, 16000
  %scevgep70 = getelementptr i8, i8* %19, i64 %22
  %23 = add nuw nsw i64 %22, 16000
  %scevgep71 = getelementptr i8, i8* %19, i64 %23
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv37
  %bound0 = icmp ult i8* %scevgep70, %scevgep7475
  %bound1 = icmp ult i8* %scevgep7273, %scevgep71
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %24 to i8*
  %bc76 = bitcast double* %24 to i8*
  %bound077 = icmp ult i8* %scevgep70, %bc76
  %bound178 = icmp ult i8* %bc, %scevgep71
  %found.conflict79 = and i1 %bound077, %bound178
  %conflict.rdx = or i1 %found.conflict, %found.conflict79
  br i1 %conflict.rdx, label %._crit_edge67.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader9
  %25 = load double, double* %24, align 8, !alias.scope !1
  %26 = insertelement <2 x double> undef, double %25, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = insertelement <2 x double> undef, double %25, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

._crit_edge67.preheader:                          ; preds = %.preheader9
  br label %._crit_edge67

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %30 = or i64 %index, 1
  %31 = or i64 %index, 2
  %32 = or i64 %index, 3
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv37
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %30, i64 %indvars.iv37
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %31, i64 %indvars.iv37
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %32, i64 %indvars.iv37
  %37 = load double, double* %33, align 8, !alias.scope !4
  %38 = load double, double* %34, align 8, !alias.scope !4
  %39 = load double, double* %35, align 8, !alias.scope !4
  %40 = load double, double* %36, align 8, !alias.scope !4
  %41 = insertelement <2 x double> undef, double %37, i32 0
  %42 = insertelement <2 x double> %41, double %38, i32 1
  %43 = insertelement <2 x double> undef, double %39, i32 0
  %44 = insertelement <2 x double> %43, double %40, i32 1
  %45 = fmul <2 x double> %27, %42
  %46 = fmul <2 x double> %29, %44
  %47 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv34, i64 %index
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !6, !noalias !8
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !6, !noalias !8
  %51 = fadd <2 x double> %wide.load, %45
  %52 = fadd <2 x double> %wide.load81, %46
  %53 = bitcast double* %47 to <2 x double>*
  store <2 x double> %51, <2 x double>* %53, align 8, !alias.scope !6, !noalias !8
  %54 = bitcast double* %49 to <2 x double>*
  store <2 x double> %52, <2 x double>* %54, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %55 = icmp eq i64 %index.next, 2000
  br i1 %55, label %middle.block.loopexit111, label %vector.body, !llvm.loop !9

._crit_edge67:                                    ; preds = %._crit_edge67, %._crit_edge67.preheader
  %indvars.iv31 = phi i64 [ 0, %._crit_edge67.preheader ], [ %indvars.iv.next32.1, %._crit_edge67 ]
  %56 = load double, double* %24, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv31, i64 %indvars.iv37
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv34, i64 %indvars.iv31
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %59
  store double %62, double* %60, align 8
  %indvars.iv.next32 = or i64 %indvars.iv31, 1
  %63 = load double, double* %24, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next32, i64 %indvars.iv37
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv34, i64 %indvars.iv.next32
  %68 = load double, double* %67, align 8
  %69 = fadd double %68, %66
  store double %69, double* %67, align 8
  %indvars.iv.next32.1 = add nuw nsw i64 %indvars.iv31, 2
  %exitcond33.1 = icmp eq i64 %indvars.iv.next32.1, 2000
  br i1 %exitcond33.1, label %middle.block.loopexit, label %._crit_edge67, !llvm.loop !12

middle.block.loopexit:                            ; preds = %._crit_edge67
  br label %middle.block

middle.block.loopexit111:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit111, %middle.block.loopexit
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next35, 2000
  br i1 %exitcond36, label %70, label %.preheader9

; <label>:70:                                     ; preds = %middle.block
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next38, 2000
  br i1 %exitcond39, label %.preheader.preheader, label %.preheader10

.preheader.preheader:                             ; preds = %70
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %middle.block83
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %middle.block83 ], [ 0, %.preheader.preheader ]
  %scevgep87 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 0
  %scevgep8788 = bitcast double* %scevgep87 to i8*
  %71 = add nuw nsw i64 %indvars.iv28, 1
  %scevgep89 = getelementptr [2000 x double], [2000 x double]* %1, i64 %71, i64 0
  %scevgep8990 = bitcast double* %scevgep89 to i8*
  %72 = mul nuw nsw i64 %indvars.iv28, 16000
  %scevgep91 = getelementptr i8, i8* %19, i64 %72
  %73 = add nuw nsw i64 %72, 16000
  %scevgep92 = getelementptr i8, i8* %19, i64 %73
  %bound093 = icmp ult i8* %scevgep8788, %scevgep92
  %bound194 = icmp ult i8* %scevgep91, %scevgep8990
  %memcheck.conflict96 = and i1 %bound093, %bound194
  br i1 %memcheck.conflict96, label %._crit_edge68.preheader, label %vector.body82.preheader

vector.body82.preheader:                          ; preds = %.preheader
  br label %vector.body82

._crit_edge68.preheader:                          ; preds = %.preheader
  br label %._crit_edge68

vector.body82:                                    ; preds = %vector.body82, %vector.body82.preheader
  %index99 = phi i64 [ 0, %vector.body82.preheader ], [ %index.next100.1, %vector.body82 ]
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv28, i64 %index99
  %75 = bitcast double* %74 to <2 x i64>*
  %wide.load107 = load <2 x i64>, <2 x i64>* %75, align 8, !alias.scope !13
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x i64>*
  %wide.load108 = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !13
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %index99
  %79 = bitcast double* %78 to <2 x i64>*
  store <2 x i64> %wide.load107, <2 x i64>* %79, align 8, !alias.scope !16, !noalias !13
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x i64>*
  store <2 x i64> %wide.load108, <2 x i64>* %81, align 8, !alias.scope !16, !noalias !13
  %index.next100 = or i64 %index99, 4
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv28, i64 %index.next100
  %83 = bitcast double* %82 to <2 x i64>*
  %wide.load107.1 = load <2 x i64>, <2 x i64>* %83, align 8, !alias.scope !13
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x i64>*
  %wide.load108.1 = load <2 x i64>, <2 x i64>* %85, align 8, !alias.scope !13
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %index.next100
  %87 = bitcast double* %86 to <2 x i64>*
  store <2 x i64> %wide.load107.1, <2 x i64>* %87, align 8, !alias.scope !16, !noalias !13
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x i64>*
  store <2 x i64> %wide.load108.1, <2 x i64>* %89, align 8, !alias.scope !16, !noalias !13
  %index.next100.1 = add nuw nsw i64 %index99, 8
  %90 = icmp eq i64 %index.next100.1, 2000
  br i1 %90, label %middle.block83.loopexit110, label %vector.body82, !llvm.loop !18

._crit_edge68:                                    ; preds = %._crit_edge68, %._crit_edge68.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge68.preheader ], [ %indvars.iv.next.4, %._crit_edge68 ]
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv28, i64 %indvars.iv
  %92 = bitcast double* %91 to i64*
  %93 = load i64, i64* %92, align 8
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv
  %95 = bitcast double* %94 to i64*
  store i64 %93, i64* %95, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %96 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next
  %97 = bitcast double* %96 to i64*
  %98 = load i64, i64* %97, align 8
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next
  %100 = bitcast double* %99 to i64*
  store i64 %98, i64* %100, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %101 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %102 = bitcast double* %101 to i64*
  %103 = load i64, i64* %102, align 8
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next.1
  %105 = bitcast double* %104 to i64*
  store i64 %103, i64* %105, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %107 = bitcast double* %106 to i64*
  %108 = load i64, i64* %107, align 8
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next.2
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv28, i64 %indvars.iv.next.3
  %112 = bitcast double* %111 to i64*
  %113 = load i64, i64* %112, align 8
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv.next.3
  %115 = bitcast double* %114 to i64*
  store i64 %113, i64* %115, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %middle.block83.loopexit, label %._crit_edge68, !llvm.loop !19

middle.block83.loopexit:                          ; preds = %._crit_edge68
  br label %middle.block83

middle.block83.loopexit110:                       ; preds = %vector.body82
  br label %middle.block83

middle.block83:                                   ; preds = %middle.block83.loopexit110, %middle.block83.loopexit
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 2000
  br i1 %exitcond30, label %116, label %.preheader

; <label>:116:                                    ; preds = %middle.block83
  tail call void @free(i8* nonnull %19) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge9, %2
  %indvars.iv44 = phi i2 [ %indvars.iv.next45, %._crit_edge9 ], [ 0, %2 ]
  %indvars.iv33 = phi i64 [ 0, %2 ], [ %indvars.iv.next34, %._crit_edge9 ]
  %3 = zext i2 %indvars.iv44 to i64
  %4 = add nsw i64 %indvars.iv33, -1
  %5 = icmp sgt i64 %indvars.iv33, 0
  br i1 %5, label %.preheader.preheader, label %._crit_edge9

.preheader.preheader:                             ; preds = %.preheader4
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 0
  br label %.preheader

.lr.ph8:                                          ; preds = %._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv33
  %.pre38 = load double, double* %7, align 8
  %xtraiter39 = and i64 %indvars.iv33, 3
  %lcmp.mod40 = icmp eq i64 %xtraiter39, 0
  br i1 %lcmp.mod40, label %._crit_edge36.prol.loopexit, label %._crit_edge36.prol.preheader

._crit_edge36.prol.preheader:                     ; preds = %.lr.ph8
  br label %._crit_edge36.prol

._crit_edge36.prol:                               ; preds = %._crit_edge36.prol, %._crit_edge36.prol.preheader
  %8 = phi double [ %.pre38, %._crit_edge36.prol.preheader ], [ %12, %._crit_edge36.prol ]
  %indvars.iv25.prol = phi i64 [ 0, %._crit_edge36.prol.preheader ], [ %indvars.iv.next26.prol, %._crit_edge36.prol ]
  %prol.iter = phi i64 [ %xtraiter39, %._crit_edge36.prol.preheader ], [ %prol.iter.sub, %._crit_edge36.prol ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv25.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next26.prol = add nuw nsw i64 %indvars.iv25.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge36.prol.loopexit.unr-lcssa, label %._crit_edge36.prol, !llvm.loop !20

._crit_edge36.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge36.prol
  br label %._crit_edge36.prol.loopexit

._crit_edge36.prol.loopexit:                      ; preds = %.lr.ph8, %._crit_edge36.prol.loopexit.unr-lcssa
  %.unr41 = phi double [ %.pre38, %.lr.ph8 ], [ %12, %._crit_edge36.prol.loopexit.unr-lcssa ]
  %indvars.iv25.unr = phi i64 [ 0, %.lr.ph8 ], [ %3, %._crit_edge36.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %._crit_edge9.loopexit, label %.lr.ph8.new

.lr.ph8.new:                                      ; preds = %._crit_edge36.prol.loopexit
  br label %._crit_edge36

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge ], [ 0, %.preheader.preheader ]
  %14 = icmp sgt i64 %indvars.iv17, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv17
  %.pre = load double, double* %15, align 8
  br i1 %14, label %._crit_edge35.preheader, label %._crit_edge

._crit_edge35.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv17, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge35.prol.loopexit.unr-lcssa, label %._crit_edge35.prol.preheader

._crit_edge35.prol.preheader:                     ; preds = %._crit_edge35.preheader
  br label %._crit_edge35.prol

._crit_edge35.prol:                               ; preds = %._crit_edge35.prol.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %._crit_edge35.prol.loopexit.unr-lcssa

._crit_edge35.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge35.preheader, %._crit_edge35.prol
  %.lcssa.unr.ph = phi double [ %20, %._crit_edge35.prol ], [ undef, %._crit_edge35.preheader ]
  %.unr.ph = phi double [ %20, %._crit_edge35.prol ], [ %.pre, %._crit_edge35.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge35.prol ], [ 0, %._crit_edge35.preheader ]
  br label %._crit_edge35.prol.loopexit

._crit_edge35.prol.loopexit:                      ; preds = %._crit_edge35.prol.loopexit.unr-lcssa
  %21 = icmp eq i64 %indvars.iv17, 1
  br i1 %21, label %._crit_edge.loopexit, label %._crit_edge35.preheader.new

._crit_edge35.preheader.new:                      ; preds = %._crit_edge35.prol.loopexit
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35, %._crit_edge35.preheader.new
  %22 = phi double [ %.unr.ph, %._crit_edge35.preheader.new ], [ %34, %._crit_edge35 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge35.preheader.new ], [ %indvars.iv.next.1, %._crit_edge35 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %15, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond16.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv17
  br i1 %exitcond16.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge35

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge35
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge35.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge35.prol.loopexit ], [ %34, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %35 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv17
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %15, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next18, %indvars.iv33
  br i1 %exitcond24, label %.lr.ph8, label %.preheader

._crit_edge36:                                    ; preds = %._crit_edge36, %.lr.ph8.new
  %39 = phi double [ %.unr41, %.lr.ph8.new ], [ %55, %._crit_edge36 ]
  %indvars.iv25 = phi i64 [ %indvars.iv25.unr, %.lr.ph8.new ], [ %indvars.iv.next26.3, %._crit_edge36 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv25
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %7, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv.next26
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %7, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv.next26.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %7, align 8
  %indvars.iv.next26.2 = add nsw i64 %indvars.iv25, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv.next26.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %7, align 8
  %indvars.iv.next26.3 = add nuw nsw i64 %indvars.iv25, 4
  %exitcond32.3 = icmp eq i64 %indvars.iv.next26.3, %indvars.iv33
  br i1 %exitcond32.3, label %._crit_edge9.loopexit.unr-lcssa, label %._crit_edge36

._crit_edge9.loopexit.unr-lcssa:                  ; preds = %._crit_edge36
  br label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge36.prol.loopexit, %._crit_edge9.loopexit.unr-lcssa
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.preheader4
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv33
  %57 = load double, double* %56, align 8
  %58 = tail call double @sqrt(double %57) #3
  store double %58, double* %56, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond = icmp eq i64 %indvars.iv.next34, 2000
  %indvars.iv.next45 = add i2 %indvars.iv44, 1
  br i1 %exitcond, label %59, label %.preheader4

; <label>:59:                                     ; preds = %._crit_edge9
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
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %2
  %indvars.iv12 = phi i64 [ 0, %2 ], [ %indvars.iv.next13, %._crit_edge ]
  %indvars.iv10 = phi i64 [ 1, %2 ], [ %indvars.iv.next11, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv12, 2000
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge14, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge14 ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge14

; <label>:12:                                     ; preds = %._crit_edge15
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge15, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next, %indvars.iv10
  br i1 %exitcond9, label %._crit_edge, label %._crit_edge15

._crit_edge:                                      ; preds = %._crit_edge14
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, 2000
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  br i1 %exitcond, label %18, label %.lr.ph

; <label>:18:                                     ; preds = %._crit_edge
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
