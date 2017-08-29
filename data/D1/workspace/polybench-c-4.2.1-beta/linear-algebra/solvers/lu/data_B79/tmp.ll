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
  %indvars.iv134 = phi i64 [ 0, %.preheader74.lr.ph ], [ %indvars.iv.next135, %._crit_edge100.thread ]
  %1 = sub i64 1998, %indvars.iv134
  br label %7

.preheader73:                                     ; preds = %7
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %2 = icmp slt i64 %indvars.iv.next135, 2000
  br i1 %2, label %._crit_edge100.thread, label %.preheader72.us.preheader

._crit_edge100.thread:                            ; preds = %.preheader73
  %3 = shl i64 %1, 3
  %4 = and i64 %3, 34359738360
  %5 = add nuw nsw i64 %4, 8
  %scevgep132 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv134, i64 %indvars.iv.next135
  %scevgep132133 = bitcast double* %scevgep132 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep132133, i8 0, i64 %5, i32 8, i1 false)
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv134, i64 %indvars.iv134
  store double 1.000000e+00, double* %6, align 8
  br label %.lr.ph96

; <label>:7:                                      ; preds = %7, %.lr.ph96
  %indvars.iv122 = phi i64 [ 0, %.lr.ph96 ], [ %indvars.iv.next123, %7 ]
  %8 = sub nsw i64 0, %indvars.iv122
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv134, i64 %indvars.iv122
  store double %13, double* %14, align 8
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %exitcond126 = icmp eq i64 %indvars.iv122, %indvars.iv134
  br i1 %exitcond126, label %.preheader73, label %7

.preheader72.us.preheader:                        ; preds = %.preheader73
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv134, i64 %indvars.iv134
  store double 1.000000e+00, double* %15, align 8
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge93.us

._crit_edge93.us:                                 ; preds = %._crit_edge93.us, %.preheader72.us.preheader
  %indvars.iv120 = phi i64 [ 0, %.preheader72.us.preheader ], [ %indvars.iv.next121.7, %._crit_edge93.us ]
  %17 = mul nuw nsw i64 %indvars.iv120, 16000
  %scevgep = getelementptr i8, i8* %16, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121 = or i64 %indvars.iv120, 1
  %18 = mul nuw nsw i64 %indvars.iv.next121, 16000
  %scevgep.1 = getelementptr i8, i8* %16, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.1 = or i64 %indvars.iv120, 2
  %19 = mul nuw nsw i64 %indvars.iv.next121.1, 16000
  %scevgep.2 = getelementptr i8, i8* %16, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.2 = or i64 %indvars.iv120, 3
  %20 = mul nuw nsw i64 %indvars.iv.next121.2, 16000
  %scevgep.3 = getelementptr i8, i8* %16, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.3 = or i64 %indvars.iv120, 4
  %21 = mul nuw nsw i64 %indvars.iv.next121.3, 16000
  %scevgep.4 = getelementptr i8, i8* %16, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.4 = or i64 %indvars.iv120, 5
  %22 = mul nuw nsw i64 %indvars.iv.next121.4, 16000
  %scevgep.5 = getelementptr i8, i8* %16, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.5 = or i64 %indvars.iv120, 6
  %23 = mul nuw nsw i64 %indvars.iv.next121.5, 16000
  %scevgep.6 = getelementptr i8, i8* %16, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.6 = or i64 %indvars.iv120, 7
  %24 = mul nuw nsw i64 %indvars.iv.next121.6, 16000
  %scevgep.7 = getelementptr i8, i8* %16, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.7 = add nsw i64 %indvars.iv120, 8
  %exitcond4.7 = icmp eq i64 %indvars.iv.next121.7, 2000
  br i1 %exitcond4.7, label %.preheader69.us.us.preheader.preheader, label %._crit_edge93.us

.preheader69.us.us.preheader.preheader:           ; preds = %._crit_edge93.us
  %25 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %26 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %27 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader69.us.us.preheader

.preheader69.us.us.preheader:                     ; preds = %.preheader69.us.us.preheader.preheader, %._crit_edge82.us
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %._crit_edge82.us ], [ 0, %.preheader69.us.us.preheader.preheader ]
  %scevgep7 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv115
  %28 = add nuw nsw i64 %indvars.iv115, 1
  %scevgep9 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %28
  %29 = bitcast double* %scevgep9 to i8*
  %30 = bitcast double* %scevgep7 to i8*
  br label %.preheader69.us.us

._crit_edge82.us:                                 ; preds = %._crit_edge80.us.us
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next116, 2000
  br i1 %exitcond3, label %.preheader.us.preheader, label %.preheader69.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge82.us
  %31 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %32 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %33 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %34 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %35 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %36 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %37 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader69.us.us:                               ; preds = %._crit_edge80.us.us, %.preheader69.us.us.preheader
  %indvars.iv113 = phi i64 [ 0, %.preheader69.us.us.preheader ], [ %indvars.iv.next114, %._crit_edge80.us.us ]
  %38 = mul nuw nsw i64 %indvars.iv113, 16000
  %scevgep5 = getelementptr i8, i8* %16, i64 %38
  %39 = add nuw nsw i64 %38, 16000
  %scevgep6 = getelementptr i8, i8* %16, i64 %39
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv113, i64 %indvars.iv115
  %bound0 = icmp ult i8* %scevgep5, %29
  %bound1 = icmp ult i8* %30, %scevgep6
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %40 to i8*
  %bc11 = bitcast double* %40 to i8*
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
  %41 = or i64 %index, 1
  %42 = or i64 %index, 2
  %43 = or i64 %index, 3
  %44 = load double, double* %40, align 8, !alias.scope !1
  %45 = insertelement <2 x double> undef, double %44, i32 0
  %46 = shufflevector <2 x double> %45, <2 x double> undef, <2 x i32> zeroinitializer
  %47 = insertelement <2 x double> undef, double %44, i32 0
  %48 = shufflevector <2 x double> %47, <2 x double> undef, <2 x i32> zeroinitializer
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv115
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %41, i64 %indvars.iv115
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %42, i64 %indvars.iv115
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %43, i64 %indvars.iv115
  %53 = load double, double* %49, align 8, !alias.scope !4
  %54 = load double, double* %50, align 8, !alias.scope !4
  %55 = load double, double* %51, align 8, !alias.scope !4
  %56 = load double, double* %52, align 8, !alias.scope !4
  %57 = insertelement <2 x double> undef, double %53, i32 0
  %58 = insertelement <2 x double> %57, double %54, i32 1
  %59 = insertelement <2 x double> undef, double %55, i32 0
  %60 = insertelement <2 x double> %59, double %56, i32 1
  %61 = fmul <2 x double> %46, %58
  %62 = fmul <2 x double> %48, %60
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv113, i64 %index
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !6, !noalias !8
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !6, !noalias !8
  %67 = fadd <2 x double> %wide.load, %61
  %68 = fadd <2 x double> %wide.load16, %62
  %69 = bitcast double* %63 to <2 x double>*
  store <2 x double> %67, <2 x double>* %69, align 8, !alias.scope !6, !noalias !8
  %70 = bitcast double* %65 to <2 x double>*
  store <2 x double> %68, <2 x double>* %70, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %71 = icmp eq i64 %index.next, 2000
  br i1 %71, label %._crit_edge80.us.us.loopexit47, label %vector.body, !llvm.loop !9

._crit_edge80.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge80.us.us

._crit_edge80.us.us.loopexit47:                   ; preds = %vector.body
  br label %._crit_edge80.us.us

._crit_edge80.us.us:                              ; preds = %._crit_edge80.us.us.loopexit47, %._crit_edge80.us.us.loopexit
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next114, 2000
  br i1 %exitcond2, label %._crit_edge82.us, label %.preheader69.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv110 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next111.1, %scalar.ph ]
  %72 = load double, double* %40, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv110, i64 %indvars.iv115
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv113, i64 %indvars.iv110
  %77 = load double, double* %76, align 8
  %78 = fadd double %77, %75
  store double %78, double* %76, align 8
  %indvars.iv.next111 = or i64 %indvars.iv110, 1
  %79 = load double, double* %40, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next111, i64 %indvars.iv115
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv113, i64 %indvars.iv.next111
  %84 = load double, double* %83, align 8
  %85 = fadd double %84, %82
  store double %85, double* %83, align 8
  %indvars.iv.next111.1 = add nsw i64 %indvars.iv110, 2
  %exitcond112.1 = icmp eq i64 %indvars.iv.next111, 1999
  br i1 %exitcond112.1, label %._crit_edge80.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep22 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 0
  %scevgep2223 = bitcast double* %scevgep22 to i8*
  %86 = add nuw nsw i64 %indvars.iv108, 1
  %scevgep24 = getelementptr [2000 x double], [2000 x double]* %0, i64 %86, i64 0
  %scevgep2425 = bitcast double* %scevgep24 to i8*
  %87 = mul nuw nsw i64 %indvars.iv108, 16000
  %scevgep26 = getelementptr i8, i8* %16, i64 %87
  %88 = add nuw nsw i64 %87, 16000
  %scevgep27 = getelementptr i8, i8* %16, i64 %88
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
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv108, i64 %index34
  %90 = bitcast double* %89 to <2 x i64>*
  %wide.load42 = load <2 x i64>, <2 x i64>* %90, align 8, !alias.scope !13
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x i64>*
  %wide.load43 = load <2 x i64>, <2 x i64>* %92, align 8, !alias.scope !13
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %index34
  %94 = bitcast double* %93 to <2 x i64>*
  store <2 x i64> %wide.load42, <2 x i64>* %94, align 8, !alias.scope !16, !noalias !13
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x i64>*
  store <2 x i64> %wide.load43, <2 x i64>* %96, align 8, !alias.scope !16, !noalias !13
  %index.next35 = or i64 %index34, 4
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv108, i64 %index.next35
  %98 = bitcast double* %97 to <2 x i64>*
  %wide.load42.1 = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !13
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x i64>*
  %wide.load43.1 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !13
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %index.next35
  %102 = bitcast double* %101 to <2 x i64>*
  store <2 x i64> %wide.load42.1, <2 x i64>* %102, align 8, !alias.scope !16, !noalias !13
  %103 = getelementptr double, double* %101, i64 2
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %wide.load43.1, <2 x i64>* %104, align 8, !alias.scope !16, !noalias !13
  %index.next35.1 = add nsw i64 %index34, 8
  %105 = icmp eq i64 %index.next35.1, 2000
  br i1 %105, label %._crit_edge.us.loopexit46, label %vector.body17, !llvm.loop !18

scalar.ph19:                                      ; preds = %scalar.ph19, %scalar.ph19.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph19.preheader ], [ %indvars.iv.next.4, %scalar.ph19 ]
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv108, i64 %indvars.iv
  %107 = bitcast double* %106 to i64*
  %108 = load i64, i64* %107, align 8
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next
  %112 = bitcast double* %111 to i64*
  %113 = load i64, i64* %112, align 8
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv.next
  %115 = bitcast double* %114 to i64*
  store i64 %113, i64* %115, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.1
  %117 = bitcast double* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv.next.1
  %120 = bitcast double* %119 to i64*
  store i64 %118, i64* %120, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %121 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.2
  %122 = bitcast double* %121 to i64*
  %123 = load i64, i64* %122, align 8
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv.next.2
  %125 = bitcast double* %124 to i64*
  store i64 %123, i64* %125, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.3
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv.next.3
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge.us.loopexit, label %scalar.ph19, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph19
  br label %._crit_edge.us

._crit_edge.us.loopexit46:                        ; preds = %vector.body17
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit46, %._crit_edge.us.loopexit
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next109, 2000
  br i1 %exitcond1, label %._crit_edge77, label %.preheader.us

._crit_edge77:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %16) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.preheader44.preheader:
  br label %.preheader44

.preheader44:                                     ; preds = %._crit_edge51, %.preheader44.preheader
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge51 ], [ 0, %.preheader44.preheader ]
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %._crit_edge51 ], [ 4294967295, %.preheader44.preheader ]
  %1 = and i64 %indvars.iv4, 4294967295
  %2 = icmp sgt i64 %indvars.iv7, 0
  br i1 %2, label %.preheader42.preheader, label %._crit_edge51

.preheader42.preheader:                           ; preds = %.preheader44
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 0
  br label %.preheader42

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge49.us
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %._crit_edge49.us ], [ %indvars.iv7, %.preheader.us.preheader ]
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv75
  %.pre61 = load double, double* %4, align 8
  br i1 %lcmp.mod12, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.preheader.us
  br label %5

; <label>:5:                                      ; preds = %.prol.preheader
  %6 = load double, double* %53, align 8
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv75
  %8 = load double, double* %7, align 8
  %9 = fmul double %6, %8
  %10 = fsub double %.pre61, %9
  store double %10, double* %4, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.preheader.us, %5
  %indvars.iv67.unr.ph = phi i64 [ 1, %5 ], [ 0, %.preheader.us ]
  %.unr13.ph = phi double [ %10, %5 ], [ %.pre61, %.preheader.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %54, label %._crit_edge49.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit
  br label %11

; <label>:11:                                     ; preds = %11, %.preheader.us.new
  %indvars.iv67 = phi i64 [ %indvars.iv67.unr.ph, %.preheader.us.new ], [ %indvars.iv.next68.1, %11 ]
  %12 = phi double [ %.unr13.ph, %.preheader.us.new ], [ %24, %11 ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv67
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv67, i64 %indvars.iv75
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %12, %17
  store double %18, double* %4, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv.next68
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next68, i64 %indvars.iv75
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fsub double %18, %23
  store double %24, double* %4, align 8
  %indvars.iv.next68.1 = add nsw i64 %indvars.iv67, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next68, %1
  br i1 %exitcond.1, label %._crit_edge49.us.unr-lcssa, label %11

._crit_edge49.us.unr-lcssa:                       ; preds = %11
  br label %._crit_edge49.us

._crit_edge49.us:                                 ; preds = %.prol.loopexit, %._crit_edge49.us.unr-lcssa
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next76, 2000
  br i1 %exitcond6, label %._crit_edge51.loopexit, label %.preheader.us

.preheader42:                                     ; preds = %._crit_edge, %.preheader42.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge ], [ 4294967295, %.preheader42.preheader ]
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge ], [ 0, %.preheader42.preheader ]
  %25 = and i64 %indvars.iv1, 4294967295
  %26 = icmp sgt i64 %indvars.iv64, 0
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv64
  %.pre = load double, double* %27, align 8
  br i1 %26, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader42
  %28 = and i64 %indvars.iv1, 1
  %lcmp.mod = icmp eq i64 %28, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.preheader, label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %29 = load double, double* %3, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv64
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %.pre, %32
  store double %33, double* %27, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.lcssa.unr.ph = phi double [ %33, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %.unr.ph = phi double [ %33, %.lr.ph.prol ], [ %.pre, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %34 = icmp eq i64 %25, 0
  br i1 %34, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %35 = phi double [ %.unr.ph, %.lr.ph.preheader.new ], [ %47, %.lr.ph ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv64
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %35, %40
  store double %41, double* %27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv.next
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv64
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fsub double %41, %46
  store double %47, double* %27, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond3.1 = icmp eq i64 %indvars.iv.next, %25
  br i1 %exitcond3.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %47, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader42
  %48 = phi double [ %.pre, %.preheader42 ], [ %.lcssa, %._crit_edge.loopexit ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv64
  %50 = load double, double* %49, align 8
  %51 = fdiv double %48, %50
  store double %51, double* %27, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %indvars.iv.next2 = add nuw nsw i64 %25, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next65, %indvars.iv7
  br i1 %exitcond9, label %.preheader.us.preheader, label %.preheader42

.preheader.us.preheader:                          ; preds = %._crit_edge
  %52 = and i64 %indvars.iv4, 1
  %lcmp.mod12 = icmp eq i64 %52, 0
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 0
  %54 = icmp eq i64 %1, 0
  br label %.preheader.us

._crit_edge51.loopexit:                           ; preds = %._crit_edge49.us
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %.preheader44
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %indvars.iv.next5 = add nuw nsw i64 %1, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond10, label %._crit_edge55, label %.preheader44

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
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge13.us, label %6

._crit_edge13.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond1, label %._crit_edge15, label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge13.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
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
