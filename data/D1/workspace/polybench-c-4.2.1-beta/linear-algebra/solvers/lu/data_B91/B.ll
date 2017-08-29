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
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @init_array([2000 x double]* %4)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_lu([2000 x double]* %4)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.lr.ph105:
  br label %.lr.ph97

.lr.ph97:                                         ; preds = %._crit_edge102.thread, %.lr.ph105
  %indvars.iv138 = phi i64 [ 0, %.lr.ph105 ], [ %indvars.iv.next139, %._crit_edge102.thread ]
  %1 = sub i64 1998, %indvars.iv138
  %2 = shl i64 %1, 3
  br label %3

; <label>:3:                                      ; preds = %3, %.lr.ph97
  %indvars.iv126 = phi i64 [ 0, %.lr.ph97 ], [ %indvars.iv.next127, %3 ]
  %4 = sub nsw i64 0, %indvars.iv126
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 2000
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 2.000000e+03
  %9 = fadd double %8, 1.000000e+00
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv126
  store double %9, double* %10, align 8
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond130 = icmp eq i64 %indvars.iv126, %indvars.iv138
  br i1 %exitcond130, label %._crit_edge98, label %3

._crit_edge98:                                    ; preds = %3
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %11 = icmp slt i64 %indvars.iv.next139, 2000
  br i1 %11, label %._crit_edge102.thread, label %.lr.ph93.split.us.preheader

._crit_edge102.thread:                            ; preds = %._crit_edge98
  %12 = and i64 %2, 34359738360
  %13 = add nuw nsw i64 %12, 8
  %scevgep136 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv.next139
  %scevgep136137 = bitcast double* %scevgep136 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep136137, i8 0, i64 %13, i32 8, i1 false)
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv138
  store double 1.000000e+00, double* %14, align 8
  br label %.lr.ph97

.lr.ph93.split.us.preheader:                      ; preds = %._crit_edge98
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %indvars.iv138
  store double 1.000000e+00, double* %15, align 8
  %16 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge90.us

._crit_edge90.us:                                 ; preds = %._crit_edge90.us, %.lr.ph93.split.us.preheader
  %indvars.iv124 = phi i64 [ 0, %.lr.ph93.split.us.preheader ], [ %indvars.iv.next125.7, %._crit_edge90.us ]
  %17 = mul nuw nsw i64 %indvars.iv124, 16000
  %scevgep = getelementptr i8, i8* %16, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next125 = or i64 %indvars.iv124, 1
  %18 = mul nuw nsw i64 %indvars.iv.next125, 16000
  %scevgep.1 = getelementptr i8, i8* %16, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next125.1 = or i64 %indvars.iv124, 2
  %19 = mul nuw nsw i64 %indvars.iv.next125.1, 16000
  %scevgep.2 = getelementptr i8, i8* %16, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next125.2 = or i64 %indvars.iv124, 3
  %20 = mul nuw nsw i64 %indvars.iv.next125.2, 16000
  %scevgep.3 = getelementptr i8, i8* %16, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next125.3 = or i64 %indvars.iv124, 4
  %21 = mul nuw nsw i64 %indvars.iv.next125.3, 16000
  %scevgep.4 = getelementptr i8, i8* %16, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next125.4 = or i64 %indvars.iv124, 5
  %22 = mul nuw nsw i64 %indvars.iv.next125.4, 16000
  %scevgep.5 = getelementptr i8, i8* %16, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next125.5 = or i64 %indvars.iv124, 6
  %23 = mul nuw nsw i64 %indvars.iv.next125.5, 16000
  %scevgep.6 = getelementptr i8, i8* %16, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next125.6 = or i64 %indvars.iv124, 7
  %24 = mul nuw nsw i64 %indvars.iv.next125.6, 16000
  %scevgep.7 = getelementptr i8, i8* %16, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next125.7 = add nsw i64 %indvars.iv124, 8
  %exitcond47.7 = icmp eq i64 %indvars.iv.next125.7, 2000
  br i1 %exitcond47.7, label %.lr.ph75.us.us.preheader.preheader, label %._crit_edge90.us

.lr.ph75.us.us.preheader.preheader:               ; preds = %._crit_edge90.us
  %25 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %26 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %27 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.lr.ph75.us.us.preheader

.lr.ph75.us.us.preheader:                         ; preds = %._crit_edge79.us, %.lr.ph75.us.us.preheader.preheader
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %._crit_edge79.us ], [ 0, %.lr.ph75.us.us.preheader.preheader ]
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv119
  %28 = add nuw nsw i64 %indvars.iv119, 1
  %scevgep7 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %28
  %29 = bitcast double* %scevgep7 to i8*
  %30 = bitcast double* %scevgep5 to i8*
  br label %.lr.ph75.us.us

._crit_edge79.us:                                 ; preds = %._crit_edge76.us.us
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next120, 2000
  br i1 %exitcond46, label %.lr.ph71.split.us.preheader, label %.lr.ph75.us.us.preheader

.lr.ph71.split.us.preheader:                      ; preds = %._crit_edge79.us
  %31 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %32 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %33 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %34 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %35 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %36 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %37 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.lr.ph71.split.us

.lr.ph75.us.us:                                   ; preds = %._crit_edge76.us.us, %.lr.ph75.us.us.preheader
  %indvars.iv117 = phi i64 [ 0, %.lr.ph75.us.us.preheader ], [ %indvars.iv.next118, %._crit_edge76.us.us ]
  %38 = mul nuw nsw i64 %indvars.iv117, 16000
  %scevgep3 = getelementptr i8, i8* %16, i64 %38
  %39 = add nuw nsw i64 %38, 16000
  %scevgep4 = getelementptr i8, i8* %16, i64 %39
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv117, i64 %indvars.iv119
  %bound0 = icmp ult i8* %scevgep3, %29
  %bound1 = icmp ult i8* %30, %scevgep4
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %40 to i8*
  %bc9 = bitcast double* %40 to i8*
  %bound010 = icmp ult i8* %scevgep3, %bc9
  %bound111 = icmp ult i8* %bc, %scevgep4
  %found.conflict12 = and i1 %bound010, %bound111
  %conflict.rdx = or i1 %found.conflict, %found.conflict12
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph75.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.lr.ph75.us.us
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
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv119
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %41, i64 %indvars.iv119
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %42, i64 %indvars.iv119
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %43, i64 %indvars.iv119
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
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv117, i64 %index
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !6, !noalias !8
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !6, !noalias !8
  %67 = fadd <2 x double> %wide.load, %61
  %68 = fadd <2 x double> %wide.load14, %62
  %69 = bitcast double* %63 to <2 x double>*
  store <2 x double> %67, <2 x double>* %69, align 8, !alias.scope !6, !noalias !8
  %70 = bitcast double* %65 to <2 x double>*
  store <2 x double> %68, <2 x double>* %70, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %71 = icmp eq i64 %index.next, 2000
  br i1 %71, label %._crit_edge76.us.us.loopexit49, label %vector.body, !llvm.loop !9

._crit_edge76.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge76.us.us

._crit_edge76.us.us.loopexit49:                   ; preds = %vector.body
  br label %._crit_edge76.us.us

._crit_edge76.us.us:                              ; preds = %._crit_edge76.us.us.loopexit49, %._crit_edge76.us.us.loopexit
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next118, 2000
  br i1 %exitcond45, label %._crit_edge79.us, label %.lr.ph75.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv114 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next115.1, %scalar.ph ]
  %72 = load double, double* %40, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv114, i64 %indvars.iv119
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv117, i64 %indvars.iv114
  %77 = load double, double* %76, align 8
  %78 = fadd double %77, %75
  store double %78, double* %76, align 8
  %indvars.iv.next115 = or i64 %indvars.iv114, 1
  %79 = load double, double* %40, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next115, i64 %indvars.iv119
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv117, i64 %indvars.iv.next115
  %84 = load double, double* %83, align 8
  %85 = fadd double %84, %82
  store double %85, double* %83, align 8
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv114, 2
  %exitcond116.1 = icmp eq i64 %indvars.iv.next115, 1999
  br i1 %exitcond116.1, label %._crit_edge76.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.lr.ph71.split.us:                                ; preds = %._crit_edge69.us, %.lr.ph71.split.us.preheader
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge69.us ], [ 0, %.lr.ph71.split.us.preheader ]
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv112, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %86 = add nuw nsw i64 %indvars.iv112, 1
  %scevgep22 = getelementptr [2000 x double], [2000 x double]* %0, i64 %86, i64 0
  %scevgep2223 = bitcast double* %scevgep22 to i8*
  %87 = mul nuw nsw i64 %indvars.iv112, 16000
  %scevgep24 = getelementptr i8, i8* %16, i64 %87
  %88 = add nuw nsw i64 %87, 16000
  %scevgep25 = getelementptr i8, i8* %16, i64 %88
  %bound026 = icmp ult i8* %scevgep2021, %scevgep25
  %bound127 = icmp ult i8* %scevgep24, %scevgep2223
  %memcheck.conflict29 = and i1 %bound026, %bound127
  br i1 %memcheck.conflict29, label %scalar.ph17.preheader, label %vector.body15.preheader

vector.body15.preheader:                          ; preds = %.lr.ph71.split.us
  br label %vector.body15

scalar.ph17.preheader:                            ; preds = %.lr.ph71.split.us
  br label %scalar.ph17

vector.body15:                                    ; preds = %vector.body15, %vector.body15.preheader
  %index32 = phi i64 [ 0, %vector.body15.preheader ], [ %index.next33.1, %vector.body15 ]
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv112, i64 %index32
  %90 = bitcast double* %89 to <2 x i64>*
  %wide.load40 = load <2 x i64>, <2 x i64>* %90, align 8, !alias.scope !13
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x i64>*
  %wide.load41 = load <2 x i64>, <2 x i64>* %92, align 8, !alias.scope !13
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv112, i64 %index32
  %94 = bitcast double* %93 to <2 x i64>*
  store <2 x i64> %wide.load40, <2 x i64>* %94, align 8, !alias.scope !16, !noalias !13
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x i64>*
  store <2 x i64> %wide.load41, <2 x i64>* %96, align 8, !alias.scope !16, !noalias !13
  %index.next33 = or i64 %index32, 4
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv112, i64 %index.next33
  %98 = bitcast double* %97 to <2 x i64>*
  %wide.load40.1 = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !13
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x i64>*
  %wide.load41.1 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !13
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv112, i64 %index.next33
  %102 = bitcast double* %101 to <2 x i64>*
  store <2 x i64> %wide.load40.1, <2 x i64>* %102, align 8, !alias.scope !16, !noalias !13
  %103 = getelementptr double, double* %101, i64 2
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %wide.load41.1, <2 x i64>* %104, align 8, !alias.scope !16, !noalias !13
  %index.next33.1 = add nsw i64 %index32, 8
  %105 = icmp eq i64 %index.next33.1, 2000
  br i1 %105, label %._crit_edge69.us.loopexit48, label %vector.body15, !llvm.loop !18

scalar.ph17:                                      ; preds = %scalar.ph17, %scalar.ph17.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph17.preheader ], [ %indvars.iv.next.4, %scalar.ph17 ]
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv112, i64 %indvars.iv
  %107 = bitcast double* %106 to i64*
  %108 = load i64, i64* %107, align 8
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv112, i64 %indvars.iv
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv112, i64 %indvars.iv.next
  %112 = bitcast double* %111 to i64*
  %113 = load i64, i64* %112, align 8
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv112, i64 %indvars.iv.next
  %115 = bitcast double* %114 to i64*
  store i64 %113, i64* %115, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv112, i64 %indvars.iv.next.1
  %117 = bitcast double* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv112, i64 %indvars.iv.next.1
  %120 = bitcast double* %119 to i64*
  store i64 %118, i64* %120, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %121 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv112, i64 %indvars.iv.next.2
  %122 = bitcast double* %121 to i64*
  %123 = load i64, i64* %122, align 8
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv112, i64 %indvars.iv.next.2
  %125 = bitcast double* %124 to i64*
  store i64 %123, i64* %125, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv112, i64 %indvars.iv.next.3
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv112, i64 %indvars.iv.next.3
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge69.us.loopexit, label %scalar.ph17, !llvm.loop !19

._crit_edge69.us.loopexit:                        ; preds = %scalar.ph17
  br label %._crit_edge69.us

._crit_edge69.us.loopexit48:                      ; preds = %vector.body15
  br label %._crit_edge69.us

._crit_edge69.us:                                 ; preds = %._crit_edge69.us.loopexit48, %._crit_edge69.us.loopexit
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next113, 2000
  br i1 %exitcond44, label %._crit_edge72, label %.lr.ph71.split.us

._crit_edge72:                                    ; preds = %._crit_edge69.us
  call void @free(i8* nonnull %16) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.lr.ph58.preheader:
  br label %.lr.ph58

.lr.ph58:                                         ; preds = %._crit_edge53, %.lr.ph58.preheader
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %._crit_edge53 ], [ 0, %.lr.ph58.preheader ]
  %indvars.iv73 = phi i32 [ %indvars.iv.next74, %._crit_edge53 ], [ -1, %.lr.ph58.preheader ]
  %1 = add i64 %indvars.iv3, 4294967295
  %2 = and i64 %1, 4294967295
  %3 = icmp sgt i64 %indvars.iv3, 0
  br i1 %3, label %.lr.ph44.preheader, label %._crit_edge53

.lr.ph44.preheader:                               ; preds = %.lr.ph58
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 0
  br label %.lr.ph44

.lr.ph44:                                         ; preds = %._crit_edge, %.lr.ph44.preheader
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge ], [ 0, %.lr.ph44.preheader ]
  %indvars.iv66 = phi i32 [ %indvars.iv.next67, %._crit_edge ], [ -1, %.lr.ph44.preheader ]
  %5 = add i64 %indvars.iv68, 4294967295
  %6 = and i64 %5, 4294967295
  %7 = icmp sgt i64 %indvars.iv68, 0
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv68
  %.pre = load double, double* %8, align 8
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph44
  %wide.trip.count = zext i32 %indvars.iv66 to i64
  %9 = and i64 %5, 1
  %lcmp.mod = icmp eq i64 %9, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %10

; <label>:10:                                     ; preds = %.prol.preheader
  %11 = load double, double* %4, align 8
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv68
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fsub double %.pre, %14
  store double %15, double* %8, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %10
  %.lcssa.unr.ph = phi double [ %15, %10 ], [ undef, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %10 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %15, %10 ], [ %.pre, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %16 = icmp eq i64 %6, 0
  br i1 %16, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %17

; <label>:17:                                     ; preds = %17, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %17 ]
  %18 = phi double [ %.unr.ph, %.lr.ph.new ], [ %30, %17 ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv68
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fsub double %18, %23
  store double %24, double* %8, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv.next
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv68
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %24, %29
  store double %30, double* %8, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %17

._crit_edge.loopexit.unr-lcssa:                   ; preds = %17
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %30, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph44
  %31 = phi double [ %.pre, %.lr.ph44 ], [ %.lcssa, %._crit_edge.loopexit ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv68
  %33 = load double, double* %32, align 8
  %34 = fdiv double %31, %33
  store double %34, double* %8, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %indvars.iv.next67 = add nsw i32 %indvars.iv66, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next69, %indvars.iv3
  br i1 %exitcond5, label %.lr.ph52.split.us.preheader, label %.lr.ph44

.lr.ph52.split.us.preheader:                      ; preds = %._crit_edge
  %wide.trip.count75 = zext i32 %indvars.iv73 to i64
  %35 = and i64 %1, 1
  %lcmp.mod11 = icmp eq i64 %35, 0
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 0
  %37 = icmp eq i64 %2, 0
  br label %.lr.ph52.split.us

.lr.ph52.split.us:                                ; preds = %._crit_edge49.us, %.lr.ph52.split.us.preheader
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %._crit_edge49.us ], [ %indvars.iv3, %.lr.ph52.split.us.preheader ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv79
  %.pre65 = load double, double* %38, align 8
  br i1 %lcmp.mod11, label %.prol.preheader8, label %.prol.loopexit9.unr-lcssa

.prol.preheader8:                                 ; preds = %.lr.ph52.split.us
  br label %39

; <label>:39:                                     ; preds = %.prol.preheader8
  %40 = load double, double* %36, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv79
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %.pre65, %43
  store double %44, double* %38, align 8
  br label %.prol.loopexit9.unr-lcssa

.prol.loopexit9.unr-lcssa:                        ; preds = %.lr.ph52.split.us, %39
  %indvars.iv71.unr.ph = phi i64 [ 1, %39 ], [ 0, %.lr.ph52.split.us ]
  %.unr12.ph = phi double [ %44, %39 ], [ %.pre65, %.lr.ph52.split.us ]
  br label %.prol.loopexit9

.prol.loopexit9:                                  ; preds = %.prol.loopexit9.unr-lcssa
  br i1 %37, label %._crit_edge49.us, label %.lr.ph52.split.us.new

.lr.ph52.split.us.new:                            ; preds = %.prol.loopexit9
  br label %45

; <label>:45:                                     ; preds = %45, %.lr.ph52.split.us.new
  %indvars.iv71 = phi i64 [ %indvars.iv71.unr.ph, %.lr.ph52.split.us.new ], [ %indvars.iv.next72.1, %45 ]
  %46 = phi double [ %.unr12.ph, %.lr.ph52.split.us.new ], [ %58, %45 ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv71
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv71, i64 %indvars.iv79
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fsub double %46, %51
  store double %52, double* %38, align 8
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv.next72
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next72, i64 %indvars.iv79
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fsub double %52, %57
  store double %58, double* %38, align 8
  %indvars.iv.next72.1 = add nsw i64 %indvars.iv71, 2
  %exitcond76.1 = icmp eq i64 %indvars.iv.next72, %wide.trip.count75
  br i1 %exitcond76.1, label %._crit_edge49.us.unr-lcssa, label %45

._crit_edge49.us.unr-lcssa:                       ; preds = %45
  br label %._crit_edge49.us

._crit_edge49.us:                                 ; preds = %.prol.loopexit9, %._crit_edge49.us.unr-lcssa
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next80, 2000
  br i1 %exitcond6, label %._crit_edge53.loopexit, label %.lr.ph52.split.us

._crit_edge53.loopexit:                           ; preds = %._crit_edge49.us
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge53.loopexit, %.lr.ph58
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %indvars.iv.next74 = add nsw i32 %indvars.iv73, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next4, 2000
  br i1 %exitcond7, label %._crit_edge59, label %.lr.ph58

._crit_edge59:                                    ; preds = %._crit_edge53
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph16.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph16.split.us

.lr.ph16.split.us:                                ; preds = %._crit_edge13.us, %.lr.ph16.split.us.preheader
  %indvars.iv18 = phi i64 [ 0, %.lr.ph16.split.us.preheader ], [ %indvars.iv.next19, %._crit_edge13.us ]
  %5 = mul nuw nsw i64 %indvars.iv18, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us, %.lr.ph16.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph16.split.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge13.us, label %6

._crit_edge13.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond1, label %._crit_edge17, label %.lr.ph16.split.us

._crit_edge17:                                    ; preds = %._crit_edge13.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
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
