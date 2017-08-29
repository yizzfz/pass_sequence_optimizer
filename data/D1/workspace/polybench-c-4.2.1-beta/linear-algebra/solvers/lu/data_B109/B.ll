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
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge12.thread, %1
  %indvars.iv47 = phi i64 [ 0, %1 ], [ %indvars.iv.next48, %._crit_edge12.thread ]
  %2 = sub i64 1998, %indvars.iv47
  %3 = shl i64 %2, 3
  %4 = and i64 %3, 34359738360
  br label %5

; <label>:5:                                      ; preds = %5, %.lr.ph
  %indvars.iv35 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next36, %5 ]
  %6 = sub nsw i64 0, %indvars.iv35
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 2000
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 2.000000e+03
  %11 = fadd double %10, 1.000000e+00
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 %indvars.iv35
  store double %11, double* %12, align 8
  %exitcond39 = icmp eq i64 %indvars.iv35, %indvars.iv47
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  br i1 %exitcond39, label %._crit_edge, label %5

._crit_edge:                                      ; preds = %5
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %13 = icmp slt i64 %indvars.iv.next48, 2000
  br i1 %13, label %._crit_edge12.thread, label %16

._crit_edge12.thread:                             ; preds = %._crit_edge
  %14 = add nuw nsw i64 %4, 8
  %scevgep45 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 %indvars.iv.next48
  %scevgep4546 = bitcast double* %scevgep45 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep4546, i8 0, i64 %14, i32 8, i1 false)
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 %indvars.iv47
  store double 1.000000e+00, double* %15, align 8
  br label %.lr.ph

; <label>:16:                                     ; preds = %._crit_edge
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 %indvars.iv47
  store double 1.000000e+00, double* %17, align 8
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %19

; <label>:19:                                     ; preds = %19, %16
  %indvars.iv33 = phi i64 [ 0, %16 ], [ %indvars.iv.next34.7, %19 ]
  %20 = mul nuw nsw i64 %indvars.iv33, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next34 = or i64 %indvars.iv33, 1
  %21 = mul nuw nsw i64 %indvars.iv.next34, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next34.1 = or i64 %indvars.iv33, 2
  %22 = mul nuw nsw i64 %indvars.iv.next34.1, 16000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next34.2 = or i64 %indvars.iv33, 3
  %23 = mul nuw nsw i64 %indvars.iv.next34.2, 16000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next34.3 = or i64 %indvars.iv33, 4
  %24 = mul nuw nsw i64 %indvars.iv.next34.3, 16000
  %scevgep.4 = getelementptr i8, i8* %18, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next34.4 = or i64 %indvars.iv33, 5
  %25 = mul nuw nsw i64 %indvars.iv.next34.4, 16000
  %scevgep.5 = getelementptr i8, i8* %18, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next34.5 = or i64 %indvars.iv33, 6
  %26 = mul nuw nsw i64 %indvars.iv.next34.5, 16000
  %scevgep.6 = getelementptr i8, i8* %18, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next34.6 = or i64 %indvars.iv33, 7
  %27 = mul nuw nsw i64 %indvars.iv.next34.6, 16000
  %scevgep.7 = getelementptr i8, i8* %18, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next34.7 = add nsw i64 %indvars.iv33, 8
  %exitcond99.7 = icmp eq i64 %indvars.iv.next34.7, 2000
  br i1 %exitcond99.7, label %.preheader66.preheader, label %19

.preheader66.preheader:                           ; preds = %19
  %28 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %29 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %30 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader66

.preheader66:                                     ; preds = %82, %.preheader66.preheader
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %82 ], [ 0, %.preheader66.preheader ]
  %scevgep56 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv28
  %31 = add nuw nsw i64 %indvars.iv28, 1
  %scevgep58 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %31
  %32 = bitcast double* %scevgep58 to i8*
  %33 = bitcast double* %scevgep56 to i8*
  br label %min.iters.checked

min.iters.checked:                                ; preds = %middle.block, %.preheader66
  %indvars.iv26 = phi i64 [ 0, %.preheader66 ], [ %indvars.iv.next27, %middle.block ]
  %34 = mul nuw nsw i64 %indvars.iv26, 16000
  %scevgep54 = getelementptr i8, i8* %18, i64 %34
  %35 = add nuw nsw i64 %34, 16000
  %scevgep55 = getelementptr i8, i8* %18, i64 %35
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv28
  %bound0 = icmp ult i8* %scevgep54, %32
  %bound1 = icmp ult i8* %33, %scevgep55
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %36 to i8*
  %bc60 = bitcast double* %36 to i8*
  %bound061 = icmp ult i8* %scevgep54, %bc60
  %bound162 = icmp ult i8* %bc, %scevgep55
  %found.conflict63 = and i1 %bound061, %bound162
  %conflict.rdx = or i1 %found.conflict, %found.conflict63
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

scalar.ph.preheader:                              ; preds = %min.iters.checked
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %37 = or i64 %index, 1
  %38 = or i64 %index, 2
  %39 = or i64 %index, 3
  %40 = load double, double* %36, align 8, !alias.scope !1
  %41 = insertelement <2 x double> undef, double %40, i32 0
  %42 = shufflevector <2 x double> %41, <2 x double> undef, <2 x i32> zeroinitializer
  %43 = insertelement <2 x double> undef, double %40, i32 0
  %44 = shufflevector <2 x double> %43, <2 x double> undef, <2 x i32> zeroinitializer
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv28
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %37, i64 %indvars.iv28
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %38, i64 %indvars.iv28
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %39, i64 %indvars.iv28
  %49 = load double, double* %45, align 8, !alias.scope !4
  %50 = load double, double* %46, align 8, !alias.scope !4
  %51 = load double, double* %47, align 8, !alias.scope !4
  %52 = load double, double* %48, align 8, !alias.scope !4
  %53 = insertelement <2 x double> undef, double %49, i32 0
  %54 = insertelement <2 x double> %53, double %50, i32 1
  %55 = insertelement <2 x double> undef, double %51, i32 0
  %56 = insertelement <2 x double> %55, double %52, i32 1
  %57 = fmul <2 x double> %42, %54
  %58 = fmul <2 x double> %44, %56
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv26, i64 %index
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !6, !noalias !8
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !6, !noalias !8
  %63 = fadd <2 x double> %wide.load, %57
  %64 = fadd <2 x double> %wide.load65, %58
  %65 = bitcast double* %59 to <2 x double>*
  store <2 x double> %63, <2 x double>* %65, align 8, !alias.scope !6, !noalias !8
  %66 = bitcast double* %61 to <2 x double>*
  store <2 x double> %64, <2 x double>* %66, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %67 = icmp eq i64 %index.next, 2000
  br i1 %67, label %middle.block.loopexit101, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv23 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next24.1, %scalar.ph ]
  %68 = load double, double* %36, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv23, i64 %indvars.iv28
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv26, i64 %indvars.iv23
  %73 = load double, double* %72, align 8
  %74 = fadd double %73, %71
  store double %74, double* %72, align 8
  %indvars.iv.next24 = or i64 %indvars.iv23, 1
  %75 = load double, double* %36, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next24, i64 %indvars.iv28
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 %indvars.iv26, i64 %indvars.iv.next24
  %80 = load double, double* %79, align 8
  %81 = fadd double %80, %78
  store double %81, double* %79, align 8
  %exitcond25.1 = icmp eq i64 %indvars.iv.next24, 1999
  %indvars.iv.next24.1 = add nsw i64 %indvars.iv23, 2
  br i1 %exitcond25.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit101:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit101, %middle.block.loopexit
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond97 = icmp eq i64 %indvars.iv.next27, 2000
  br i1 %exitcond97, label %82, label %min.iters.checked

; <label>:82:                                     ; preds = %middle.block
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next29, 2000
  br i1 %exitcond98, label %.preheader.preheader, label %.preheader66

.preheader.preheader:                             ; preds = %82
  %83 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %84 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %85 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %86 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %87 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %88 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %89 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader

.preheader:                                       ; preds = %middle.block67, %.preheader.preheader
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %middle.block67 ], [ 0, %.preheader.preheader ]
  %scevgep71 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv21, i64 0
  %scevgep7172 = bitcast double* %scevgep71 to i8*
  %90 = add nuw nsw i64 %indvars.iv21, 1
  %scevgep73 = getelementptr [2000 x double], [2000 x double]* %0, i64 %90, i64 0
  %scevgep7374 = bitcast double* %scevgep73 to i8*
  %91 = mul nuw nsw i64 %indvars.iv21, 16000
  %scevgep75 = getelementptr i8, i8* %18, i64 %91
  %92 = add nuw nsw i64 %91, 16000
  %scevgep76 = getelementptr i8, i8* %18, i64 %92
  %bound077 = icmp ult i8* %scevgep7172, %scevgep76
  %bound178 = icmp ult i8* %scevgep75, %scevgep7374
  %memcheck.conflict80 = and i1 %bound077, %bound178
  br i1 %memcheck.conflict80, label %scalar.ph68.preheader, label %vector.body66.preheader

vector.body66.preheader:                          ; preds = %.preheader
  br label %vector.body66

scalar.ph68.preheader:                            ; preds = %.preheader
  br label %scalar.ph68

vector.body66:                                    ; preds = %vector.body66, %vector.body66.preheader
  %index83 = phi i64 [ 0, %vector.body66.preheader ], [ %index.next84.1, %vector.body66 ]
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %88, i64 0, i64 %indvars.iv21, i64 %index83
  %94 = bitcast double* %93 to <2 x i64>*
  %wide.load91 = load <2 x i64>, <2 x i64>* %94, align 8, !alias.scope !13
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x i64>*
  %wide.load92 = load <2 x i64>, <2 x i64>* %96, align 8, !alias.scope !13
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv21, i64 %index83
  %98 = bitcast double* %97 to <2 x i64>*
  store <2 x i64> %wide.load91, <2 x i64>* %98, align 8, !alias.scope !16, !noalias !13
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x i64>*
  store <2 x i64> %wide.load92, <2 x i64>* %100, align 8, !alias.scope !16, !noalias !13
  %index.next84 = or i64 %index83, 4
  %101 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv21, i64 %index.next84
  %102 = bitcast double* %101 to <2 x i64>*
  %wide.load91.1 = load <2 x i64>, <2 x i64>* %102, align 8, !alias.scope !13
  %103 = getelementptr double, double* %101, i64 2
  %104 = bitcast double* %103 to <2 x i64>*
  %wide.load92.1 = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !13
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv21, i64 %index.next84
  %106 = bitcast double* %105 to <2 x i64>*
  store <2 x i64> %wide.load91.1, <2 x i64>* %106, align 8, !alias.scope !16, !noalias !13
  %107 = getelementptr double, double* %105, i64 2
  %108 = bitcast double* %107 to <2 x i64>*
  store <2 x i64> %wide.load92.1, <2 x i64>* %108, align 8, !alias.scope !16, !noalias !13
  %index.next84.1 = add nsw i64 %index83, 8
  %109 = icmp eq i64 %index.next84.1, 2000
  br i1 %109, label %middle.block67.loopexit100, label %vector.body66, !llvm.loop !18

scalar.ph68:                                      ; preds = %scalar.ph68, %scalar.ph68.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph68.preheader ], [ %indvars.iv.next.4, %scalar.ph68 ]
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %83, i64 0, i64 %indvars.iv21, i64 %indvars.iv
  %111 = bitcast double* %110 to i64*
  %112 = load i64, i64* %111, align 8
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv21, i64 %indvars.iv
  %114 = bitcast double* %113 to i64*
  store i64 %112, i64* %114, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %115 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %84, i64 0, i64 %indvars.iv21, i64 %indvars.iv.next
  %116 = bitcast double* %115 to i64*
  %117 = load i64, i64* %116, align 8
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv21, i64 %indvars.iv.next
  %119 = bitcast double* %118 to i64*
  store i64 %117, i64* %119, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %120 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %85, i64 0, i64 %indvars.iv21, i64 %indvars.iv.next.1
  %121 = bitcast double* %120 to i64*
  %122 = load i64, i64* %121, align 8
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv21, i64 %indvars.iv.next.1
  %124 = bitcast double* %123 to i64*
  store i64 %122, i64* %124, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %86, i64 0, i64 %indvars.iv21, i64 %indvars.iv.next.2
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv21, i64 %indvars.iv.next.2
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %130 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %87, i64 0, i64 %indvars.iv21, i64 %indvars.iv.next.3
  %131 = bitcast double* %130 to i64*
  %132 = load i64, i64* %131, align 8
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv21, i64 %indvars.iv.next.3
  %134 = bitcast double* %133 to i64*
  store i64 %132, i64* %134, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block67.loopexit, label %scalar.ph68, !llvm.loop !19

middle.block67.loopexit:                          ; preds = %scalar.ph68
  br label %middle.block67

middle.block67.loopexit100:                       ; preds = %vector.body66
  br label %middle.block67

middle.block67:                                   ; preds = %middle.block67.loopexit100, %middle.block67.loopexit
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next22, 2000
  br i1 %exitcond96, label %135, label %.preheader

; <label>:135:                                    ; preds = %middle.block67
  tail call void @free(i8* nonnull %18) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
  br label %2

; <label>:2:                                      ; preds = %._crit_edge13, %1
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge13 ], [ 0, %1 ]
  %indvars.iv30 = phi i32 [ %indvars.iv.next31, %._crit_edge13 ], [ -1, %1 ]
  %3 = add i64 %indvars.iv43, 4294967295
  %4 = and i64 %3, 4294967295
  %5 = icmp sgt i64 %indvars.iv43, 0
  br i1 %5, label %.lr.ph4.preheader, label %._crit_edge13

.lr.ph4.preheader:                                ; preds = %2
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv43, i64 0
  br label %.lr.ph4

.lr.ph4:                                          ; preds = %._crit_edge, %.lr.ph4.preheader
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge ], [ 0, %.lr.ph4.preheader ]
  %indvars.iv23 = phi i32 [ %indvars.iv.next24, %._crit_edge ], [ -1, %.lr.ph4.preheader ]
  %7 = add i64 %indvars.iv25, 4294967295
  %8 = and i64 %7, 4294967295
  %9 = icmp sgt i64 %indvars.iv25, 0
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv43, i64 %indvars.iv25
  %.pre = load double, double* %10, align 8
  br i1 %9, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph4
  %wide.trip.count = zext i32 %indvars.iv23 to i64
  %11 = and i64 %7, 1
  %lcmp.mod = icmp eq i64 %11, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %12

; <label>:12:                                     ; preds = %.prol.preheader
  %13 = load double, double* %6, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv25
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fsub double %.pre, %16
  store double %17, double* %10, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %12
  %.lcssa.unr.ph = phi double [ %17, %12 ], [ undef, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %12 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %17, %12 ], [ %.pre, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %18 = icmp eq i64 %8, 0
  br i1 %18, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %19

; <label>:19:                                     ; preds = %19, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %19 ]
  %20 = phi double [ %.unr.ph, %.lr.ph.new ], [ %32, %19 ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv43, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv25
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv43, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv25
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %26, %31
  store double %32, double* %10, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %19

._crit_edge.loopexit.unr-lcssa:                   ; preds = %19
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %32, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph4
  %33 = phi double [ %.pre, %.lr.ph4 ], [ %.lcssa, %._crit_edge.loopexit ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv25
  %35 = load double, double* %34, align 8
  %36 = fdiv double %33, %35
  store double %36, double* %10, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %indvars.iv.next24 = add nsw i32 %indvars.iv23, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next26, %indvars.iv43
  br i1 %exitcond45, label %.lr.ph12.split.us.preheader, label %.lr.ph4

.lr.ph12.split.us.preheader:                      ; preds = %._crit_edge
  %wide.trip.count32 = zext i32 %indvars.iv30 to i64
  %37 = and i64 %3, 1
  %lcmp.mod51 = icmp eq i64 %37, 0
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv43, i64 0
  %39 = icmp eq i64 %4, 0
  br label %.lr.ph12.split.us

.lr.ph12.split.us:                                ; preds = %._crit_edge9.us, %.lr.ph12.split.us.preheader
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge9.us ], [ %indvars.iv43, %.lr.ph12.split.us.preheader ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv43, i64 %indvars.iv36
  %.pre22 = load double, double* %40, align 8
  br i1 %lcmp.mod51, label %.prol.preheader48, label %.prol.loopexit49.unr-lcssa

.prol.preheader48:                                ; preds = %.lr.ph12.split.us
  br label %41

; <label>:41:                                     ; preds = %.prol.preheader48
  %42 = load double, double* %38, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv36
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fsub double %.pre22, %45
  store double %46, double* %40, align 8
  br label %.prol.loopexit49.unr-lcssa

.prol.loopexit49.unr-lcssa:                       ; preds = %.lr.ph12.split.us, %41
  %indvars.iv28.unr.ph = phi i64 [ 1, %41 ], [ 0, %.lr.ph12.split.us ]
  %.unr52.ph = phi double [ %46, %41 ], [ %.pre22, %.lr.ph12.split.us ]
  br label %.prol.loopexit49

.prol.loopexit49:                                 ; preds = %.prol.loopexit49.unr-lcssa
  br i1 %39, label %._crit_edge9.us, label %.lr.ph12.split.us.new

.lr.ph12.split.us.new:                            ; preds = %.prol.loopexit49
  br label %47

; <label>:47:                                     ; preds = %47, %.lr.ph12.split.us.new
  %indvars.iv28 = phi i64 [ %indvars.iv28.unr.ph, %.lr.ph12.split.us.new ], [ %indvars.iv.next29.1, %47 ]
  %48 = phi double [ %.unr52.ph, %.lr.ph12.split.us.new ], [ %60, %47 ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv43, i64 %indvars.iv28
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv36
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fsub double %48, %53
  store double %54, double* %40, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv43, i64 %indvars.iv.next29
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next29, i64 %indvars.iv36
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fsub double %54, %59
  store double %60, double* %40, align 8
  %exitcond33.1 = icmp eq i64 %indvars.iv.next29, %wide.trip.count32
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  br i1 %exitcond33.1, label %._crit_edge9.us.unr-lcssa, label %47

._crit_edge9.us.unr-lcssa:                        ; preds = %47
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %.prol.loopexit49, %._crit_edge9.us.unr-lcssa
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next37, 2000
  br i1 %exitcond46, label %._crit_edge13.loopexit, label %.lr.ph12.split.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %indvars.iv.next31 = add nsw i32 %indvars.iv30, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next44, 2000
  br i1 %exitcond47, label %61, label %2

; <label>:61:                                     ; preds = %._crit_edge13
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %6

; <label>:6:                                      ; preds = %19, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %19 ]
  %7 = mul nuw nsw i64 %indvars.iv4, 2000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge, %6
  %indvars.iv = phi i64 [ 0, %6 ], [ %indvars.iv.next, %._crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %19, label %8

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next5, 2000
  br i1 %exitcond7, label %20, label %6

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

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
