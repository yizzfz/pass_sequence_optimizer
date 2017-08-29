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
.preheader74.lr.ph:
  br label %.lr.ph96

.lr.ph96:                                         ; preds = %._crit_edge100.thread, %.preheader74.lr.ph
  %indvars.iv131 = phi i64 [ 0, %.preheader74.lr.ph ], [ %indvars.iv.next132, %._crit_edge100.thread ]
  %1 = shl i64 %indvars.iv131, 32
  %sext = add i64 %1, 4294967296
  %2 = ashr exact i64 %sext, 32
  %3 = ashr exact i64 %sext, 29
  br label %8

.preheader73:                                     ; preds = %8
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %4 = icmp slt i64 %indvars.iv.next132, 2000
  br i1 %4, label %._crit_edge100.thread, label %.preheader72.us.preheader

._crit_edge100.thread:                            ; preds = %.preheader73
  %5 = sub nsw i64 16000, %3
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv131, i64 %2
  %6 = bitcast double* %scevgep3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 %5, i32 8, i1 false)
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv131, i64 %indvars.iv131
  store double 1.000000e+00, double* %7, align 8
  br label %.lr.ph96

; <label>:8:                                      ; preds = %8, %.lr.ph96
  %indvars.iv121 = phi i64 [ 0, %.lr.ph96 ], [ %indvars.iv.next122, %8 ]
  %9 = sub nsw i64 0, %indvars.iv121
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 2000
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.000000e+03
  %14 = fadd double %13, 1.000000e+00
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv131, i64 %indvars.iv121
  store double %14, double* %15, align 8
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %exitcond125 = icmp eq i64 %indvars.iv121, %indvars.iv131
  br i1 %exitcond125, label %.preheader73, label %8

.preheader72.us.preheader:                        ; preds = %.preheader73
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv131, i64 %indvars.iv131
  store double 1.000000e+00, double* %16, align 8
  %17 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge93.us

._crit_edge93.us:                                 ; preds = %._crit_edge93.us, %.preheader72.us.preheader
  %indvars.iv119 = phi i64 [ 0, %.preheader72.us.preheader ], [ %indvars.iv.next120.7, %._crit_edge93.us ]
  %18 = mul nuw nsw i64 %indvars.iv119, 16000
  %scevgep = getelementptr i8, i8* %17, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120 = or i64 %indvars.iv119, 1
  %19 = mul nuw nsw i64 %indvars.iv.next120, 16000
  %scevgep.1 = getelementptr i8, i8* %17, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.1 = or i64 %indvars.iv119, 2
  %20 = mul nuw nsw i64 %indvars.iv.next120.1, 16000
  %scevgep.2 = getelementptr i8, i8* %17, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.2 = or i64 %indvars.iv119, 3
  %21 = mul nuw nsw i64 %indvars.iv.next120.2, 16000
  %scevgep.3 = getelementptr i8, i8* %17, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.3 = or i64 %indvars.iv119, 4
  %22 = mul nuw nsw i64 %indvars.iv.next120.3, 16000
  %scevgep.4 = getelementptr i8, i8* %17, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.4 = or i64 %indvars.iv119, 5
  %23 = mul nuw nsw i64 %indvars.iv.next120.4, 16000
  %scevgep.5 = getelementptr i8, i8* %17, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.5 = or i64 %indvars.iv119, 6
  %24 = mul nuw nsw i64 %indvars.iv.next120.5, 16000
  %scevgep.6 = getelementptr i8, i8* %17, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.6 = or i64 %indvars.iv119, 7
  %25 = mul nuw nsw i64 %indvars.iv.next120.6, 16000
  %scevgep.7 = getelementptr i8, i8* %17, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.7 = add nsw i64 %indvars.iv119, 8
  %exitcond49.7 = icmp eq i64 %indvars.iv.next120.7, 2000
  br i1 %exitcond49.7, label %.preheader69.us.us.preheader.preheader, label %._crit_edge93.us

.preheader69.us.us.preheader.preheader:           ; preds = %._crit_edge93.us
  %26 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %27 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %28 = bitcast i8* %17 to [2000 x [2000 x double]]*
  br label %.preheader69.us.us.preheader

.preheader69.us.us.preheader:                     ; preds = %._crit_edge82.us, %.preheader69.us.us.preheader.preheader
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge82.us ], [ 0, %.preheader69.us.us.preheader.preheader ]
  %scevgep7 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv114
  %29 = add nuw nsw i64 %indvars.iv114, 1
  %scevgep9 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %29
  %30 = bitcast double* %scevgep9 to i8*
  %31 = bitcast double* %scevgep7 to i8*
  br label %.preheader69.us.us

._crit_edge82.us:                                 ; preds = %._crit_edge80.us.us
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next115, 2000
  br i1 %exitcond48, label %.preheader.us.preheader, label %.preheader69.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge82.us
  %32 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %33 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %34 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %35 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %36 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %37 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %38 = bitcast i8* %17 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader69.us.us:                               ; preds = %._crit_edge80.us.us, %.preheader69.us.us.preheader
  %indvars.iv112 = phi i64 [ 0, %.preheader69.us.us.preheader ], [ %indvars.iv.next113, %._crit_edge80.us.us ]
  %39 = mul nuw nsw i64 %indvars.iv112, 16000
  %scevgep5 = getelementptr i8, i8* %17, i64 %39
  %40 = add nuw nsw i64 %39, 16000
  %scevgep6 = getelementptr i8, i8* %17, i64 %40
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv112, i64 %indvars.iv114
  %bound0 = icmp ult i8* %scevgep5, %30
  %bound1 = icmp ult i8* %31, %scevgep6
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %41 to i8*
  %bc11 = bitcast double* %41 to i8*
  %bound012 = icmp ult i8* %scevgep5, %bc11
  %bound113 = icmp ult i8* %bc, %scevgep6
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader69.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader69.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %42 = or i64 %index, 1
  %43 = or i64 %index, 2
  %44 = or i64 %index, 3
  %45 = load double, double* %41, align 8, !alias.scope !1
  %46 = insertelement <2 x double> undef, double %45, i32 0
  %47 = shufflevector <2 x double> %46, <2 x double> undef, <2 x i32> zeroinitializer
  %48 = insertelement <2 x double> undef, double %45, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv114
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %42, i64 %indvars.iv114
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %43, i64 %indvars.iv114
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %44, i64 %indvars.iv114
  %54 = load double, double* %50, align 8, !alias.scope !4
  %55 = load double, double* %51, align 8, !alias.scope !4
  %56 = load double, double* %52, align 8, !alias.scope !4
  %57 = load double, double* %53, align 8, !alias.scope !4
  %58 = insertelement <2 x double> undef, double %54, i32 0
  %59 = insertelement <2 x double> %58, double %55, i32 1
  %60 = insertelement <2 x double> undef, double %56, i32 0
  %61 = insertelement <2 x double> %60, double %57, i32 1
  %62 = fmul <2 x double> %47, %59
  %63 = fmul <2 x double> %49, %61
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv112, i64 %index
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !6, !noalias !8
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !6, !noalias !8
  %68 = fadd <2 x double> %wide.load, %62
  %69 = fadd <2 x double> %wide.load16, %63
  %70 = bitcast double* %64 to <2 x double>*
  store <2 x double> %68, <2 x double>* %70, align 8, !alias.scope !6, !noalias !8
  %71 = bitcast double* %66 to <2 x double>*
  store <2 x double> %69, <2 x double>* %71, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %72 = icmp eq i64 %index.next, 2000
  br i1 %72, label %._crit_edge80.us.us.loopexit51, label %vector.body, !llvm.loop !9

._crit_edge80.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge80.us.us

._crit_edge80.us.us.loopexit51:                   ; preds = %vector.body
  br label %._crit_edge80.us.us

._crit_edge80.us.us:                              ; preds = %._crit_edge80.us.us.loopexit51, %._crit_edge80.us.us.loopexit
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next113, 2000
  br i1 %exitcond47, label %._crit_edge82.us, label %.preheader69.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv109 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next110.1, %scalar.ph ]
  %73 = load double, double* %41, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 %indvars.iv114
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv112, i64 %indvars.iv109
  %78 = load double, double* %77, align 8
  %79 = fadd double %78, %76
  store double %79, double* %77, align 8
  %indvars.iv.next110 = or i64 %indvars.iv109, 1
  %80 = load double, double* %41, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next110, i64 %indvars.iv114
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv112, i64 %indvars.iv.next110
  %85 = load double, double* %84, align 8
  %86 = fadd double %85, %83
  store double %86, double* %84, align 8
  %indvars.iv.next110.1 = add nsw i64 %indvars.iv109, 2
  %exitcond111.1 = icmp eq i64 %indvars.iv.next110, 1999
  br i1 %exitcond111.1, label %._crit_edge80.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep22 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv107, i64 0
  %scevgep2223 = bitcast double* %scevgep22 to i8*
  %87 = add nuw nsw i64 %indvars.iv107, 1
  %scevgep24 = getelementptr [2000 x double], [2000 x double]* %0, i64 %87, i64 0
  %scevgep2425 = bitcast double* %scevgep24 to i8*
  %88 = mul nuw nsw i64 %indvars.iv107, 16000
  %scevgep26 = getelementptr i8, i8* %17, i64 %88
  %89 = add nuw nsw i64 %88, 16000
  %scevgep27 = getelementptr i8, i8* %17, i64 %89
  %bound028 = icmp ult i8* %scevgep2223, %scevgep27
  %bound129 = icmp ult i8* %scevgep26, %scevgep2425
  %memcheck.conflict31 = and i1 %bound028, %bound129
  br i1 %memcheck.conflict31, label %scalar.ph19.preheader, label %vector.body17.preheader

vector.body17.preheader:                          ; preds = %.preheader.us
  br label %vector.body17

scalar.ph19.preheader:                            ; preds = %.preheader.us
  br label %scalar.ph19

vector.body17:                                    ; preds = %vector.body17, %vector.body17.preheader
  %index34 = phi i64 [ 0, %vector.body17.preheader ], [ %index.next35.1, %vector.body17 ]
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv107, i64 %index34
  %91 = bitcast double* %90 to <2 x i64>*
  %wide.load42 = load <2 x i64>, <2 x i64>* %91, align 8, !alias.scope !13
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x i64>*
  %wide.load43 = load <2 x i64>, <2 x i64>* %93, align 8, !alias.scope !13
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv107, i64 %index34
  %95 = bitcast double* %94 to <2 x i64>*
  store <2 x i64> %wide.load42, <2 x i64>* %95, align 8, !alias.scope !16, !noalias !13
  %96 = getelementptr double, double* %94, i64 2
  %97 = bitcast double* %96 to <2 x i64>*
  store <2 x i64> %wide.load43, <2 x i64>* %97, align 8, !alias.scope !16, !noalias !13
  %index.next35 = or i64 %index34, 4
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv107, i64 %index.next35
  %99 = bitcast double* %98 to <2 x i64>*
  %wide.load42.1 = load <2 x i64>, <2 x i64>* %99, align 8, !alias.scope !13
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load43.1 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !13
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv107, i64 %index.next35
  %103 = bitcast double* %102 to <2 x i64>*
  store <2 x i64> %wide.load42.1, <2 x i64>* %103, align 8, !alias.scope !16, !noalias !13
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load43.1, <2 x i64>* %105, align 8, !alias.scope !16, !noalias !13
  %index.next35.1 = add nsw i64 %index34, 8
  %106 = icmp eq i64 %index.next35.1, 2000
  br i1 %106, label %._crit_edge.us.loopexit50, label %vector.body17, !llvm.loop !18

scalar.ph19:                                      ; preds = %scalar.ph19, %scalar.ph19.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph19.preheader ], [ %indvars.iv.next.4, %scalar.ph19 ]
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv107, i64 %indvars.iv
  %108 = bitcast double* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv107, i64 %indvars.iv
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv107, i64 %indvars.iv.next
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next.1
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv107, i64 %indvars.iv.next.1
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next.2
  %123 = bitcast double* %122 to i64*
  %124 = load i64, i64* %123, align 8
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv107, i64 %indvars.iv.next.2
  %126 = bitcast double* %125 to i64*
  store i64 %124, i64* %126, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next.3
  %128 = bitcast double* %127 to i64*
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv107, i64 %indvars.iv.next.3
  %131 = bitcast double* %130 to i64*
  store i64 %129, i64* %131, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge.us.loopexit, label %scalar.ph19, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph19
  br label %._crit_edge.us

._crit_edge.us.loopexit50:                        ; preds = %vector.body17
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit50, %._crit_edge.us.loopexit
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next108, 2000
  br i1 %exitcond46, label %._crit_edge77, label %.preheader.us

._crit_edge77:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %17) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.preheader44.preheader:
  br label %.preheader44

.preheader44:                                     ; preds = %._crit_edge51, %.preheader44.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge51 ], [ 0, %.preheader44.preheader ]
  %indvars.iv69 = phi i32 [ %indvars.iv.next70, %._crit_edge51 ], [ -1, %.preheader44.preheader ]
  %1 = add i64 %indvars.iv1, 4294967295
  %2 = and i64 %1, 4294967295
  %3 = icmp sgt i64 %indvars.iv1, 0
  br i1 %3, label %.preheader42.preheader, label %._crit_edge51

.preheader42.preheader:                           ; preds = %.preheader44
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  br label %.preheader42

.preheader.us.preheader:                          ; preds = %._crit_edge
  %wide.trip.count71 = zext i32 %indvars.iv69 to i64
  %5 = and i64 %1, 1
  %lcmp.mod9 = icmp eq i64 %5, 0
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  %7 = icmp eq i64 %2, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge49.us, %.preheader.us.preheader
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %._crit_edge49.us ], [ %indvars.iv1, %.preheader.us.preheader ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv75
  %.pre61 = load double, double* %8, align 8
  br i1 %lcmp.mod9, label %.prol.preheader6, label %.prol.loopexit7.unr-lcssa

.prol.preheader6:                                 ; preds = %.preheader.us
  br label %9

; <label>:9:                                      ; preds = %.prol.preheader6
  %10 = load double, double* %6, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv75
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fsub double %.pre61, %13
  store double %14, double* %8, align 8
  br label %.prol.loopexit7.unr-lcssa

.prol.loopexit7.unr-lcssa:                        ; preds = %.preheader.us, %9
  %indvars.iv67.unr.ph = phi i64 [ 1, %9 ], [ 0, %.preheader.us ]
  %.unr10.ph = phi double [ %14, %9 ], [ %.pre61, %.preheader.us ]
  br label %.prol.loopexit7

.prol.loopexit7:                                  ; preds = %.prol.loopexit7.unr-lcssa
  br i1 %7, label %._crit_edge49.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit7
  br label %15

; <label>:15:                                     ; preds = %15, %.preheader.us.new
  %indvars.iv67 = phi i64 [ %indvars.iv67.unr.ph, %.preheader.us.new ], [ %indvars.iv.next68.1, %15 ]
  %16 = phi double [ %.unr10.ph, %.preheader.us.new ], [ %28, %15 ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv67
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv67, i64 %indvars.iv75
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  store double %22, double* %8, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next68
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next68, i64 %indvars.iv75
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %8, align 8
  %indvars.iv.next68.1 = add nsw i64 %indvars.iv67, 2
  %exitcond72.1 = icmp eq i64 %indvars.iv.next68, %wide.trip.count71
  br i1 %exitcond72.1, label %._crit_edge49.us.unr-lcssa, label %15

._crit_edge49.us.unr-lcssa:                       ; preds = %15
  br label %._crit_edge49.us

._crit_edge49.us:                                 ; preds = %.prol.loopexit7, %._crit_edge49.us.unr-lcssa
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next76, 2000
  br i1 %exitcond4, label %._crit_edge51.loopexit, label %.preheader.us

.preheader42:                                     ; preds = %._crit_edge, %.preheader42.preheader
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge ], [ 0, %.preheader42.preheader ]
  %indvars.iv62 = phi i32 [ %indvars.iv.next63, %._crit_edge ], [ -1, %.preheader42.preheader ]
  %29 = add i64 %indvars.iv64, 4294967295
  %30 = and i64 %29, 4294967295
  %31 = icmp sgt i64 %indvars.iv64, 0
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv64
  %.pre = load double, double* %32, align 8
  br i1 %31, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader42
  %wide.trip.count = zext i32 %indvars.iv62 to i64
  %33 = and i64 %29, 1
  %lcmp.mod = icmp eq i64 %33, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %34

; <label>:34:                                     ; preds = %.prol.preheader
  %35 = load double, double* %4, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv64
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fsub double %.pre, %38
  store double %39, double* %32, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %34
  %.lcssa.unr.ph = phi double [ %39, %34 ], [ undef, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %34 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %39, %34 ], [ %.pre, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %40 = icmp eq i64 %30, 0
  br i1 %40, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %41

; <label>:41:                                     ; preds = %41, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %41 ]
  %42 = phi double [ %.unr.ph, %.lr.ph.new ], [ %54, %41 ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv64
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fsub double %42, %47
  store double %48, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv64
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fsub double %48, %53
  store double %54, double* %32, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %41

._crit_edge.loopexit.unr-lcssa:                   ; preds = %41
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %54, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader42
  %55 = phi double [ %.pre, %.preheader42 ], [ %.lcssa, %._crit_edge.loopexit ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv64
  %57 = load double, double* %56, align 8
  %58 = fdiv double %55, %57
  store double %58, double* %32, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %indvars.iv.next63 = add nsw i32 %indvars.iv62, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next65, %indvars.iv1
  br i1 %exitcond3, label %.preheader.us.preheader, label %.preheader42

._crit_edge51.loopexit:                           ; preds = %._crit_edge49.us
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %.preheader44
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %indvars.iv.next70 = add nsw i32 %indvars.iv69, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond5, label %._crit_edge55, label %.preheader44

._crit_edge55:                                    ; preds = %._crit_edge51
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge13.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge13.us ]
  %5 = mul nuw nsw i64 %indvars.iv16, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = add nuw nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge13.us, label %6

._crit_edge13.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond1, label %._crit_edge15, label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge13.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
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
