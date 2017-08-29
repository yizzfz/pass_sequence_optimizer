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
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @print_array([2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %2, %9
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.lr.ph109:
  br label %.lr.ph101

.lr.ph101:                                        ; preds = %._crit_edge106.thread, %.lr.ph109
  %indvars.iv144 = phi i64 [ 0, %.lr.ph109 ], [ %indvars.iv.next145, %._crit_edge106.thread ]
  %1 = shl i64 %indvars.iv144, 32
  %sext = add i64 %1, 4294967296
  %2 = ashr exact i64 %sext, 32
  %3 = sub i64 1998, %indvars.iv144
  %4 = shl i64 %3, 3
  %5 = and i64 %4, 34359738360
  br label %6

; <label>:6:                                      ; preds = %6, %.lr.ph101
  %indvars.iv131 = phi i64 [ 0, %.lr.ph101 ], [ %indvars.iv.next132, %6 ]
  %7 = sub nsw i64 0, %indvars.iv131
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+03
  %12 = fadd double %11, 1.000000e+00
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv144, i64 %indvars.iv131
  store double %12, double* %13, align 8
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond135 = icmp eq i64 %indvars.iv131, %indvars.iv144
  br i1 %exitcond135, label %._crit_edge102, label %6

._crit_edge102:                                   ; preds = %6
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %14 = icmp slt i64 %indvars.iv.next145, 2000
  br i1 %14, label %._crit_edge106.thread, label %.lr.ph97

._crit_edge106.thread:                            ; preds = %._crit_edge102
  %15 = add nuw nsw i64 %5, 8
  %scevgep142 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv144, i64 %2
  %16 = bitcast double* %scevgep142 to i8*
  call void @llvm.memset.p0i8.i64(i8* %16, i8 0, i64 %15, i32 8, i1 false)
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv144, i64 %indvars.iv144
  store double 1.000000e+00, double* %17, align 8
  br label %.lr.ph101

.lr.ph97:                                         ; preds = %._crit_edge102
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv144, i64 %indvars.iv144
  store double 1.000000e+00, double* %18, align 8
  %19 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge94.us

._crit_edge94.us:                                 ; preds = %._crit_edge94.us, %.lr.ph97
  %indvars.iv129 = phi i64 [ 0, %.lr.ph97 ], [ %indvars.iv.next130.7, %._crit_edge94.us ]
  %20 = mul nuw nsw i64 %indvars.iv129, 16000
  %scevgep = getelementptr i8, i8* %19, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next130 = or i64 %indvars.iv129, 1
  %21 = mul nuw nsw i64 %indvars.iv.next130, 16000
  %scevgep.1 = getelementptr i8, i8* %19, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next130.1 = or i64 %indvars.iv129, 2
  %22 = mul nuw nsw i64 %indvars.iv.next130.1, 16000
  %scevgep.2 = getelementptr i8, i8* %19, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next130.2 = or i64 %indvars.iv129, 3
  %23 = mul nuw nsw i64 %indvars.iv.next130.2, 16000
  %scevgep.3 = getelementptr i8, i8* %19, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next130.3 = or i64 %indvars.iv129, 4
  %24 = mul nuw nsw i64 %indvars.iv.next130.3, 16000
  %scevgep.4 = getelementptr i8, i8* %19, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next130.4 = or i64 %indvars.iv129, 5
  %25 = mul nuw nsw i64 %indvars.iv.next130.4, 16000
  %scevgep.5 = getelementptr i8, i8* %19, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next130.5 = or i64 %indvars.iv129, 6
  %26 = mul nuw nsw i64 %indvars.iv.next130.5, 16000
  %scevgep.6 = getelementptr i8, i8* %19, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next130.6 = or i64 %indvars.iv129, 7
  %27 = mul nuw nsw i64 %indvars.iv.next130.6, 16000
  %scevgep.7 = getelementptr i8, i8* %19, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next130.7 = add nsw i64 %indvars.iv129, 8
  %exitcond45.7 = icmp eq i64 %indvars.iv.next130.7, 2000
  br i1 %exitcond45.7, label %.lr.ph75.us.us.preheader.preheader, label %._crit_edge94.us

.lr.ph75.us.us.preheader.preheader:               ; preds = %._crit_edge94.us
  %28 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %29 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %30 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.lr.ph75.us.us.preheader

.lr.ph75.us.us.preheader:                         ; preds = %._crit_edge80.us, %.lr.ph75.us.us.preheader.preheader
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %._crit_edge80.us ], [ 0, %.lr.ph75.us.us.preheader.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv124
  %31 = add nuw nsw i64 %indvars.iv124, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %31
  %32 = bitcast double* %scevgep5 to i8*
  %33 = bitcast double* %scevgep3 to i8*
  br label %.lr.ph75.us.us

._crit_edge80.us:                                 ; preds = %._crit_edge76.us.us
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next125, 2000
  br i1 %exitcond44, label %.lr.ph.us.preheader, label %.lr.ph75.us.us.preheader

.lr.ph.us.preheader:                              ; preds = %._crit_edge80.us
  %34 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %35 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %36 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %37 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %38 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %39 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %40 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.lr.ph.us

.lr.ph75.us.us:                                   ; preds = %._crit_edge76.us.us, %.lr.ph75.us.us.preheader
  %indvars.iv122 = phi i64 [ 0, %.lr.ph75.us.us.preheader ], [ %indvars.iv.next123, %._crit_edge76.us.us ]
  %41 = mul nuw nsw i64 %indvars.iv122, 16000
  %scevgep1 = getelementptr i8, i8* %19, i64 %41
  %42 = add nuw nsw i64 %41, 16000
  %scevgep2 = getelementptr i8, i8* %19, i64 %42
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv122, i64 %indvars.iv124
  %bound0 = icmp ult i8* %scevgep1, %32
  %bound1 = icmp ult i8* %33, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %43 to i8*
  %bc7 = bitcast double* %43 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc7
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph75.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.lr.ph75.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %44 = or i64 %index, 1
  %45 = or i64 %index, 2
  %46 = or i64 %index, 3
  %47 = load double, double* %43, align 8, !alias.scope !1
  %48 = insertelement <2 x double> undef, double %47, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = insertelement <2 x double> undef, double %47, i32 0
  %51 = shufflevector <2 x double> %50, <2 x double> undef, <2 x i32> zeroinitializer
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv124
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %44, i64 %indvars.iv124
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %45, i64 %indvars.iv124
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %46, i64 %indvars.iv124
  %56 = load double, double* %52, align 8, !alias.scope !4
  %57 = load double, double* %53, align 8, !alias.scope !4
  %58 = load double, double* %54, align 8, !alias.scope !4
  %59 = load double, double* %55, align 8, !alias.scope !4
  %60 = insertelement <2 x double> undef, double %56, i32 0
  %61 = insertelement <2 x double> %60, double %57, i32 1
  %62 = insertelement <2 x double> undef, double %58, i32 0
  %63 = insertelement <2 x double> %62, double %59, i32 1
  %64 = fmul <2 x double> %49, %61
  %65 = fmul <2 x double> %51, %63
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv122, i64 %index
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !6, !noalias !8
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !6, !noalias !8
  %70 = fadd <2 x double> %wide.load, %64
  %71 = fadd <2 x double> %wide.load12, %65
  %72 = bitcast double* %66 to <2 x double>*
  store <2 x double> %70, <2 x double>* %72, align 8, !alias.scope !6, !noalias !8
  %73 = bitcast double* %68 to <2 x double>*
  store <2 x double> %71, <2 x double>* %73, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %74 = icmp eq i64 %index.next, 2000
  br i1 %74, label %._crit_edge76.us.us.loopexit47, label %vector.body, !llvm.loop !9

._crit_edge76.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge76.us.us

._crit_edge76.us.us.loopexit47:                   ; preds = %vector.body
  br label %._crit_edge76.us.us

._crit_edge76.us.us:                              ; preds = %._crit_edge76.us.us.loopexit47, %._crit_edge76.us.us.loopexit
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next123, 2000
  br i1 %exitcond43, label %._crit_edge80.us, label %.lr.ph75.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv119 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next120.1, %scalar.ph ]
  %75 = load double, double* %43, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv119, i64 %indvars.iv124
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv122, i64 %indvars.iv119
  %80 = load double, double* %79, align 8
  %81 = fadd double %80, %78
  store double %81, double* %79, align 8
  %indvars.iv.next120 = or i64 %indvars.iv119, 1
  %82 = load double, double* %43, align 8
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next120, i64 %indvars.iv124
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 %indvars.iv122, i64 %indvars.iv.next120
  %87 = load double, double* %86, align 8
  %88 = fadd double %87, %85
  store double %88, double* %86, align 8
  %indvars.iv.next120.1 = add nsw i64 %indvars.iv119, 2
  %exitcond121.1 = icmp eq i64 %indvars.iv.next120, 1999
  br i1 %exitcond121.1, label %._crit_edge76.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.lr.ph.us:                                        ; preds = %._crit_edge.us, %.lr.ph.us.preheader
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %._crit_edge.us ], [ 0, %.lr.ph.us.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv117, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %89 = add nuw nsw i64 %indvars.iv117, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %89, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %90 = mul nuw nsw i64 %indvars.iv117, 16000
  %scevgep22 = getelementptr i8, i8* %19, i64 %90
  %91 = add nuw nsw i64 %90, 16000
  %scevgep23 = getelementptr i8, i8* %19, i64 %91
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %scalar.ph15.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %.lr.ph.us
  br label %vector.body13

scalar.ph15.preheader:                            ; preds = %.lr.ph.us
  br label %scalar.ph15

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv117, i64 %index30
  %93 = bitcast double* %92 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %93, align 8, !alias.scope !13
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !13
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv117, i64 %index30
  %97 = bitcast double* %96 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %97, align 8, !alias.scope !16, !noalias !13
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %99, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %100 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv117, i64 %index.next31
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !13
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !13
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv117, i64 %index.next31
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %105, align 8, !alias.scope !16, !noalias !13
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %107, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %108 = icmp eq i64 %index.next31.1, 2000
  br i1 %108, label %._crit_edge.us.loopexit46, label %vector.body13, !llvm.loop !18

scalar.ph15:                                      ; preds = %scalar.ph15, %scalar.ph15.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph15.preheader ], [ %indvars.iv.next.4, %scalar.ph15 ]
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv117, i64 %indvars.iv
  %110 = bitcast double* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv117, i64 %indvars.iv
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv117, i64 %indvars.iv.next
  %115 = bitcast double* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv117, i64 %indvars.iv.next
  %118 = bitcast double* %117 to i64*
  store i64 %116, i64* %118, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv117, i64 %indvars.iv.next.1
  %120 = bitcast double* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv117, i64 %indvars.iv.next.1
  %123 = bitcast double* %122 to i64*
  store i64 %121, i64* %123, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv117, i64 %indvars.iv.next.2
  %125 = bitcast double* %124 to i64*
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv117, i64 %indvars.iv.next.2
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %129 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv117, i64 %indvars.iv.next.3
  %130 = bitcast double* %129 to i64*
  %131 = load i64, i64* %130, align 8
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv117, i64 %indvars.iv.next.3
  %133 = bitcast double* %132 to i64*
  store i64 %131, i64* %133, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge.us.loopexit, label %scalar.ph15, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph15
  br label %._crit_edge.us

._crit_edge.us.loopexit46:                        ; preds = %vector.body13
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit46, %._crit_edge.us.loopexit
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next118, 2000
  br i1 %exitcond42, label %._crit_edge72, label %.lr.ph.us

._crit_edge72:                                    ; preds = %._crit_edge.us
  call void @free(i8* nonnull %19) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.lr.ph59.preheader:
  br label %.lr.ph59

.lr.ph59:                                         ; preds = %._crit_edge54, %.lr.ph59.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge54 ], [ 0, %.lr.ph59.preheader ]
  %indvars.iv74 = phi i32 [ %indvars.iv.next75, %._crit_edge54 ], [ -1, %.lr.ph59.preheader ]
  %1 = add i64 %indvars.iv1, 4294967295
  %2 = and i64 %1, 4294967295
  %3 = icmp sgt i64 %indvars.iv1, 0
  br i1 %3, label %.lr.ph45.preheader, label %._crit_edge54

.lr.ph45.preheader:                               ; preds = %.lr.ph59
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  br label %.lr.ph45

.lr.ph45:                                         ; preds = %._crit_edge, %.lr.ph45.preheader
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge ], [ 0, %.lr.ph45.preheader ]
  %indvars.iv67 = phi i32 [ %indvars.iv.next68, %._crit_edge ], [ -1, %.lr.ph45.preheader ]
  %5 = add i64 %indvars.iv69, 4294967295
  %6 = and i64 %5, 4294967295
  %7 = icmp sgt i64 %indvars.iv69, 0
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv69
  %.pre = load double, double* %8, align 8
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph45
  %wide.trip.count = zext i32 %indvars.iv67 to i64
  %9 = and i64 %5, 1
  %lcmp.mod = icmp eq i64 %9, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %10

; <label>:10:                                     ; preds = %.prol.preheader
  %11 = load double, double* %4, align 8
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv69
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
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv69
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fsub double %18, %23
  store double %24, double* %8, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv69
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

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph45
  %31 = phi double [ %.pre, %.lr.ph45 ], [ %.lcssa, %._crit_edge.loopexit ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69, i64 %indvars.iv69
  %33 = load double, double* %32, align 8
  %34 = fdiv double %31, %33
  store double %34, double* %8, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %indvars.iv.next68 = add nsw i32 %indvars.iv67, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next70, %indvars.iv1
  br i1 %exitcond3, label %.lr.ph53.split.us.preheader, label %.lr.ph45

.lr.ph53.split.us.preheader:                      ; preds = %._crit_edge
  %wide.trip.count76 = zext i32 %indvars.iv74 to i64
  %35 = and i64 %1, 1
  %lcmp.mod9 = icmp eq i64 %35, 0
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  %37 = icmp eq i64 %2, 0
  br label %.lr.ph53.split.us

.lr.ph53.split.us:                                ; preds = %._crit_edge50.us, %.lr.ph53.split.us.preheader
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge50.us ], [ %indvars.iv1, %.lr.ph53.split.us.preheader ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv80
  %.pre66 = load double, double* %38, align 8
  br i1 %lcmp.mod9, label %.prol.preheader6, label %.prol.loopexit7.unr-lcssa

.prol.preheader6:                                 ; preds = %.lr.ph53.split.us
  br label %39

; <label>:39:                                     ; preds = %.prol.preheader6
  %40 = load double, double* %36, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv80
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %.pre66, %43
  store double %44, double* %38, align 8
  br label %.prol.loopexit7.unr-lcssa

.prol.loopexit7.unr-lcssa:                        ; preds = %.lr.ph53.split.us, %39
  %indvars.iv72.unr.ph = phi i64 [ 1, %39 ], [ 0, %.lr.ph53.split.us ]
  %.unr10.ph = phi double [ %44, %39 ], [ %.pre66, %.lr.ph53.split.us ]
  br label %.prol.loopexit7

.prol.loopexit7:                                  ; preds = %.prol.loopexit7.unr-lcssa
  br i1 %37, label %._crit_edge50.us, label %.lr.ph53.split.us.new

.lr.ph53.split.us.new:                            ; preds = %.prol.loopexit7
  br label %45

; <label>:45:                                     ; preds = %45, %.lr.ph53.split.us.new
  %indvars.iv72 = phi i64 [ %indvars.iv72.unr.ph, %.lr.ph53.split.us.new ], [ %indvars.iv.next73.1, %45 ]
  %46 = phi double [ %.unr10.ph, %.lr.ph53.split.us.new ], [ %58, %45 ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv72
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv72, i64 %indvars.iv80
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fsub double %46, %51
  store double %52, double* %38, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next73
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next73, i64 %indvars.iv80
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fsub double %52, %57
  store double %58, double* %38, align 8
  %indvars.iv.next73.1 = add nsw i64 %indvars.iv72, 2
  %exitcond77.1 = icmp eq i64 %indvars.iv.next73, %wide.trip.count76
  br i1 %exitcond77.1, label %._crit_edge50.us.unr-lcssa, label %45

._crit_edge50.us.unr-lcssa:                       ; preds = %45
  br label %._crit_edge50.us

._crit_edge50.us:                                 ; preds = %.prol.loopexit7, %._crit_edge50.us.unr-lcssa
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next81, 2000
  br i1 %exitcond4, label %._crit_edge54.loopexit, label %.lr.ph53.split.us

._crit_edge54.loopexit:                           ; preds = %._crit_edge50.us
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %.lr.ph59
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %indvars.iv.next75 = add nsw i32 %indvars.iv74, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond5, label %._crit_edge60, label %.lr.ph59

._crit_edge60:                                    ; preds = %._crit_edge54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph15.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph15.split.us

.lr.ph15.split.us:                                ; preds = %._crit_edge.us, %.lr.ph15.split.us.preheader
  %indvars.iv18 = phi i64 [ 0, %.lr.ph15.split.us.preheader ], [ %indvars.iv.next19, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv18, 2000
  br label %6

; <label>:6:                                      ; preds = %13, %.lr.ph15.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph15.split.us ], [ %indvars.iv.next, %13 ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %6, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond1, label %._crit_edge16, label %.lr.ph15.split.us

._crit_edge16:                                    ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
