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
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky([2000 x double]* %4)
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
  tail call fastcc void @print_array([2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.preheader64.lr.ph:
  br label %.lr.ph86

.lr.ph86:                                         ; preds = %._crit_edge90, %.preheader64.lr.ph
  %indvars.iv139 = phi i64 [ 0, %.preheader64.lr.ph ], [ %indvars.iv.next140, %._crit_edge90 ]
  %indvars.iv137 = phi i64 [ 1, %.preheader64.lr.ph ], [ %indvars.iv.next138, %._crit_edge90 ]
  %1 = mul nuw nsw i64 %indvars.iv139, 2001
  %2 = sub nsw i64 1998, %indvars.iv139
  %3 = shl i64 %2, 3
  br label %9

.preheader63:                                     ; preds = %9
  %4 = add nuw nsw i64 %1, 1
  %5 = and i64 %3, 34359738360
  %scevgep133 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %4
  %6 = add nuw nsw i64 %5, 8
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %7 = icmp slt i64 %indvars.iv.next140, 2000
  br i1 %7, label %.lr.ph89.preheader, label %._crit_edge90

.lr.ph89.preheader:                               ; preds = %.preheader63
  %8 = bitcast double* %scevgep133 to i8*
  call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 %6, i32 8, i1 false)
  br label %._crit_edge90

; <label>:9:                                      ; preds = %9, %.lr.ph86
  %indvars.iv121 = phi i64 [ 0, %.lr.ph86 ], [ %indvars.iv.next122, %9 ]
  %10 = sub nsw i64 0, %indvars.iv121
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv139, i64 %indvars.iv121
  store double %15, double* %16, align 8
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next122, %indvars.iv137
  br i1 %exitcond128, label %.preheader63, label %9

._crit_edge90:                                    ; preds = %.preheader63, %.lr.ph89.preheader
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv139, i64 %indvars.iv139
  store double 1.000000e+00, double* %17, align 8
  %exitcond142 = icmp eq i64 %indvars.iv.next140, 2000
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  br i1 %exitcond142, label %._crit_edge92, label %.lr.ph86

._crit_edge92:                                    ; preds = %._crit_edge90
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge83.us

._crit_edge83.us:                                 ; preds = %._crit_edge83.us, %._crit_edge92
  %indvars.iv117 = phi i64 [ 0, %._crit_edge92 ], [ %indvars.iv.next118.7, %._crit_edge83.us ]
  %19 = mul nuw nsw i64 %indvars.iv117, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118 = or i64 %indvars.iv117, 1
  %20 = mul nuw nsw i64 %indvars.iv.next118, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118.1 = or i64 %indvars.iv117, 2
  %21 = mul nuw nsw i64 %indvars.iv.next118.1, 16000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118.2 = or i64 %indvars.iv117, 3
  %22 = mul nuw nsw i64 %indvars.iv.next118.2, 16000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118.3 = or i64 %indvars.iv117, 4
  %23 = mul nuw nsw i64 %indvars.iv.next118.3, 16000
  %scevgep.4 = getelementptr i8, i8* %18, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118.4 = or i64 %indvars.iv117, 5
  %24 = mul nuw nsw i64 %indvars.iv.next118.4, 16000
  %scevgep.5 = getelementptr i8, i8* %18, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118.5 = or i64 %indvars.iv117, 6
  %25 = mul nuw nsw i64 %indvars.iv.next118.5, 16000
  %scevgep.6 = getelementptr i8, i8* %18, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118.6 = or i64 %indvars.iv117, 7
  %26 = mul nuw nsw i64 %indvars.iv.next118.6, 16000
  %scevgep.7 = getelementptr i8, i8* %18, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118.7 = add nuw nsw i64 %indvars.iv117, 8
  %exitcond120.7 = icmp eq i64 %indvars.iv.next118.7, 2000
  br i1 %exitcond120.7, label %.preheader59.us.us.preheader.preheader, label %._crit_edge83.us

.preheader59.us.us.preheader.preheader:           ; preds = %._crit_edge83.us
  %27 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader59.us.us.preheader

.preheader59.us.us.preheader:                     ; preds = %._crit_edge72.us, %.preheader59.us.us.preheader.preheader
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %._crit_edge72.us ], [ 0, %.preheader59.us.us.preheader.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv109
  %scevgep34 = bitcast double* %scevgep3 to i8*
  %28 = add nuw nsw i64 %indvars.iv109, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %28
  %scevgep56 = bitcast double* %scevgep5 to i8*
  br label %.preheader59.us.us

._crit_edge72.us:                                 ; preds = %._crit_edge70.us.us
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next110, 2000
  br i1 %exitcond112, label %.preheader.us.preheader, label %.preheader59.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge72.us
  br label %.preheader.us

.preheader59.us.us:                               ; preds = %._crit_edge70.us.us, %.preheader59.us.us.preheader
  %indvars.iv105 = phi i64 [ 0, %.preheader59.us.us.preheader ], [ %indvars.iv.next106, %._crit_edge70.us.us ]
  %29 = mul nuw nsw i64 %indvars.iv105, 16000
  %scevgep1 = getelementptr i8, i8* %18, i64 %29
  %30 = add nuw nsw i64 %29, 16000
  %scevgep2 = getelementptr i8, i8* %18, i64 %30
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv105, i64 %indvars.iv109
  %bound0 = icmp ult i8* %scevgep1, %scevgep56
  %bound1 = icmp ult i8* %scevgep34, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %31 to i8*
  %bc7 = bitcast double* %31 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc7
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader59.us.us
  %32 = load double, double* %31, align 8, !alias.scope !1
  %33 = insertelement <2 x double> undef, double %32, i32 0
  %34 = shufflevector <2 x double> %33, <2 x double> undef, <2 x i32> zeroinitializer
  %35 = insertelement <2 x double> undef, double %32, i32 0
  %36 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader59.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %37 = or i64 %index, 1
  %38 = or i64 %index, 2
  %39 = or i64 %index, 3
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv109
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %37, i64 %indvars.iv109
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %38, i64 %indvars.iv109
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %39, i64 %indvars.iv109
  %44 = load double, double* %40, align 8, !alias.scope !4
  %45 = load double, double* %41, align 8, !alias.scope !4
  %46 = load double, double* %42, align 8, !alias.scope !4
  %47 = load double, double* %43, align 8, !alias.scope !4
  %48 = insertelement <2 x double> undef, double %44, i32 0
  %49 = insertelement <2 x double> %48, double %45, i32 1
  %50 = insertelement <2 x double> undef, double %46, i32 0
  %51 = insertelement <2 x double> %50, double %47, i32 1
  %52 = fmul <2 x double> %34, %49
  %53 = fmul <2 x double> %36, %51
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv105, i64 %index
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !6, !noalias !8
  %56 = getelementptr double, double* %54, i64 2
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !6, !noalias !8
  %58 = fadd <2 x double> %wide.load, %52
  %59 = fadd <2 x double> %wide.load12, %53
  %60 = bitcast double* %54 to <2 x double>*
  store <2 x double> %58, <2 x double>* %60, align 8, !alias.scope !6, !noalias !8
  %61 = bitcast double* %56 to <2 x double>*
  store <2 x double> %59, <2 x double>* %61, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %62 = icmp eq i64 %index.next, 2000
  br i1 %62, label %._crit_edge70.us.us.loopexit41, label %vector.body, !llvm.loop !9

._crit_edge70.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge70.us.us

._crit_edge70.us.us.loopexit41:                   ; preds = %vector.body
  br label %._crit_edge70.us.us

._crit_edge70.us.us:                              ; preds = %._crit_edge70.us.us.loopexit41, %._crit_edge70.us.us.loopexit
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next106, 2000
  br i1 %exitcond108, label %._crit_edge72.us, label %.preheader59.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv101 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next102.1, %scalar.ph ]
  %63 = load double, double* %31, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv101, i64 %indvars.iv109
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv105, i64 %indvars.iv101
  %68 = load double, double* %67, align 8
  %69 = fadd double %68, %66
  store double %69, double* %67, align 8
  %indvars.iv.next102 = or i64 %indvars.iv101, 1
  %70 = load double, double* %31, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next102, i64 %indvars.iv109
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next102
  %75 = load double, double* %74, align 8
  %76 = fadd double %75, %73
  store double %76, double* %74, align 8
  %indvars.iv.next102.1 = add nuw nsw i64 %indvars.iv101, 2
  %exitcond104.1 = icmp eq i64 %indvars.iv.next102.1, 2000
  br i1 %exitcond104.1, label %._crit_edge70.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %77 = add nuw nsw i64 %indvars.iv97, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %77, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %78 = mul nuw nsw i64 %indvars.iv97, 16000
  %scevgep22 = getelementptr i8, i8* %18, i64 %78
  %79 = add nuw nsw i64 %78, 16000
  %scevgep23 = getelementptr i8, i8* %18, i64 %79
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %scalar.ph15.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %.preheader.us
  br label %vector.body13

scalar.ph15.preheader:                            ; preds = %.preheader.us
  br label %scalar.ph15

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv97, i64 %index30
  %81 = bitcast double* %80 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %81, align 8, !alias.scope !13
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %83, align 8, !alias.scope !13
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %index30
  %85 = bitcast double* %84 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %85, align 8, !alias.scope !16, !noalias !13
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %87, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv97, i64 %index.next31
  %89 = bitcast double* %88 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %89, align 8, !alias.scope !13
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %91, align 8, !alias.scope !13
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %index.next31
  %93 = bitcast double* %92 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %93, align 8, !alias.scope !16, !noalias !13
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %95, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nuw nsw i64 %index30, 8
  %96 = icmp eq i64 %index.next31.1, 2000
  br i1 %96, label %._crit_edge.us.loopexit40, label %vector.body13, !llvm.loop !18

scalar.ph15:                                      ; preds = %scalar.ph15, %scalar.ph15.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph15.preheader ], [ %indvars.iv.next.4, %scalar.ph15 ]
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv97, i64 %indvars.iv
  %98 = bitcast double* %97 to i64*
  %99 = load i64, i64* %98, align 8
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv
  %101 = bitcast double* %100 to i64*
  store i64 %99, i64* %101, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %102 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next
  %103 = bitcast double* %102 to i64*
  %104 = load i64, i64* %103, align 8
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv.next
  %106 = bitcast double* %105 to i64*
  store i64 %104, i64* %106, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next.1
  %108 = bitcast double* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv.next.1
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next.2
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv.next.2
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next.3
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv.next.3
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond96.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond96.4, label %._crit_edge.us.loopexit, label %scalar.ph15, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph15
  br label %._crit_edge.us

._crit_edge.us.loopexit40:                        ; preds = %vector.body13
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit40, %._crit_edge.us.loopexit
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next98, 2000
  br i1 %exitcond100, label %._crit_edge67, label %.preheader.us

._crit_edge67:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* %18) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture) unnamed_addr #0 {
.preheader36.preheader:
  br label %.preheader36

.preheader36:                                     ; preds = %._crit_edge42, %.preheader36.preheader
  %indvars.iv8 = phi i2 [ %indvars.iv.next9, %._crit_edge42 ], [ 0, %.preheader36.preheader ]
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge42 ], [ 0, %.preheader36.preheader ]
  %1 = zext i2 %indvars.iv8 to i64
  %2 = add nsw i64 %indvars.iv68, -1
  %3 = icmp sgt i64 %indvars.iv68, 0
  br i1 %3, label %.preheader.preheader, label %._crit_edge42

.preheader.preheader:                             ; preds = %.preheader36
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 0
  br label %.preheader

.lr.ph41:                                         ; preds = %._crit_edge
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv68
  %.pre2 = load double, double* %5, align 8
  %xtraiter3 = and i64 %indvars.iv68, 3
  %lcmp.mod4 = icmp eq i64 %xtraiter3, 0
  br i1 %lcmp.mod4, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph41
  br label %6

; <label>:6:                                      ; preds = %6, %.prol.preheader
  %7 = phi double [ %.pre2, %.prol.preheader ], [ %11, %6 ]
  %indvars.iv60.prol = phi i64 [ 0, %.prol.preheader ], [ %indvars.iv.next61.prol, %6 ]
  %prol.iter = phi i64 [ %xtraiter3, %.prol.preheader ], [ %prol.iter.sub, %6 ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv60.prol
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fsub double %7, %10
  store double %11, double* %5, align 8
  %indvars.iv.next61.prol = add nuw nsw i64 %indvars.iv60.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %6, !llvm.loop !20

.prol.loopexit.unr-lcssa:                         ; preds = %6
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph41, %.prol.loopexit.unr-lcssa
  %.unr5 = phi double [ %.pre2, %.lr.ph41 ], [ %11, %.prol.loopexit.unr-lcssa ]
  %indvars.iv60.unr = phi i64 [ 0, %.lr.ph41 ], [ %1, %.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %2, 3
  br i1 %12, label %._crit_edge42.loopexit, label %.lr.ph41.new

.lr.ph41.new:                                     ; preds = %.prol.loopexit
  br label %38

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge ], [ 0, %.preheader.preheader ]
  %13 = icmp sgt i64 %indvars.iv52, 0
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv52
  %.pre = load double, double* %14, align 8
  br i1 %13, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv52, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %15 = load double, double* %4, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv52, i64 0
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %.pre, %18
  store double %19, double* %14, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.lcssa.unr.ph = phi double [ %19, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %.unr.ph = phi double [ %19, %.lr.ph.prol ], [ %.pre, %.lr.ph.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %20 = icmp eq i64 %indvars.iv52, 1
  br i1 %20, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %21 = phi double [ %.unr.ph, %.lr.ph.preheader.new ], [ %33, %.lr.ph ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv52, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %14, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv52, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %27, %32
  store double %33, double* %14, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv52
  br i1 %exitcond51.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %33, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %34 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv52, i64 %indvars.iv52
  %36 = load double, double* %35, align 8
  %37 = fdiv double %34, %36
  store double %37, double* %14, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next53, %indvars.iv68
  br i1 %exitcond59, label %.lr.ph41, label %.preheader

; <label>:38:                                     ; preds = %38, %.lr.ph41.new
  %39 = phi double [ %.unr5, %.lr.ph41.new ], [ %55, %38 ]
  %indvars.iv60 = phi i64 [ %indvars.iv60.unr, %.lr.ph41.new ], [ %indvars.iv.next61.3, %38 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv60
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %5, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv.next61
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %5, align 8
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv.next61.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %5, align 8
  %indvars.iv.next61.2 = add nsw i64 %indvars.iv60, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv.next61.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %5, align 8
  %indvars.iv.next61.3 = add nuw nsw i64 %indvars.iv60, 4
  %exitcond67.3 = icmp eq i64 %indvars.iv.next61.3, %indvars.iv68
  br i1 %exitcond67.3, label %._crit_edge42.loopexit.unr-lcssa, label %38

._crit_edge42.loopexit.unr-lcssa:                 ; preds = %38
  br label %._crit_edge42.loopexit

._crit_edge42.loopexit:                           ; preds = %.prol.loopexit, %._crit_edge42.loopexit.unr-lcssa
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader36
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv68
  %57 = load double, double* %56, align 8
  %58 = tail call double @sqrt(double %57) #3
  store double %58, double* %56, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, 2000
  %indvars.iv.next9 = add i2 %indvars.iv8, 1
  br i1 %exitcond71, label %._crit_edge45, label %.preheader36

._crit_edge45:                                    ; preds = %._crit_edge42
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv22 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next23, %._crit_edge ]
  %indvars.iv20 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next21, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv22, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge28, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge28 ]
  %7 = add nuw nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge28

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, %indvars.iv20
  br i1 %exitcond19, label %._crit_edge, label %6

._crit_edge:                                      ; preds = %._crit_edge28
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 2000
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  br i1 %exitcond25, label %._crit_edge13, label %.lr.ph

._crit_edge13:                                    ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

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
