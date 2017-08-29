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
  %indvars.iv128 = phi i64 [ 0, %.preheader64.lr.ph ], [ %indvars.iv.next129, %._crit_edge90 ]
  br label %2

.preheader63:                                     ; preds = %2
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %1 = icmp slt i64 %indvars.iv.next129, 2000
  br i1 %1, label %.lr.ph89.._crit_edge90_crit_edge, label %._crit_edge90

; <label>:2:                                      ; preds = %2, %.lr.ph86
  %indvars.iv113 = phi i64 [ %indvars.iv.next114, %2 ], [ 0, %.lr.ph86 ]
  %3 = sub nsw i64 0, %indvars.iv113
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 2000
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 2.000000e+03
  %8 = fadd double %7, 1.000000e+00
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv128, i64 %indvars.iv113
  store double %8, double* %9, align 8
  %exitcond118 = icmp eq i64 %indvars.iv113, %indvars.iv128
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  br i1 %exitcond118, label %.preheader63, label %2

.lr.ph89.._crit_edge90_crit_edge:                 ; preds = %.preheader63
  %10 = sub nsw i64 1998, %indvars.iv128
  %11 = shl i64 %indvars.iv128, 32
  %12 = shl i64 %10, 3
  %sext = add nuw nsw i64 %11, 4294967296
  %13 = and i64 %12, 34359738360
  %14 = add nuw nsw i64 %13, 8
  %15 = ashr exact i64 %sext, 32
  %scevgep126 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv128, i64 %15
  %16 = bitcast double* %scevgep126 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %16, i8 0, i64 %14, i32 8, i1 false)
  br label %._crit_edge90

._crit_edge90:                                    ; preds = %.preheader63, %.lr.ph89.._crit_edge90_crit_edge
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv128, i64 %indvars.iv128
  store double 1.000000e+00, double* %17, align 8
  %exitcond138 = icmp eq i64 %indvars.iv.next129, 2000
  br i1 %exitcond138, label %._crit_edge92, label %.lr.ph86

._crit_edge92:                                    ; preds = %._crit_edge90
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge83.us

._crit_edge83.us:                                 ; preds = %._crit_edge83.us, %._crit_edge92
  %indvars.iv111 = phi i64 [ 0, %._crit_edge92 ], [ %indvars.iv.next112.7, %._crit_edge83.us ]
  %19 = mul nuw nsw i64 %indvars.iv111, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next112 = or i64 %indvars.iv111, 1
  %20 = mul nuw nsw i64 %indvars.iv.next112, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next112.1 = or i64 %indvars.iv111, 2
  %21 = mul nuw nsw i64 %indvars.iv.next112.1, 16000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next112.2 = or i64 %indvars.iv111, 3
  %22 = mul nuw nsw i64 %indvars.iv.next112.2, 16000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next112.3 = or i64 %indvars.iv111, 4
  %23 = mul nuw nsw i64 %indvars.iv.next112.3, 16000
  %scevgep.4 = getelementptr i8, i8* %18, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next112.4 = or i64 %indvars.iv111, 5
  %24 = mul nuw nsw i64 %indvars.iv.next112.4, 16000
  %scevgep.5 = getelementptr i8, i8* %18, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next112.5 = or i64 %indvars.iv111, 6
  %25 = mul nuw nsw i64 %indvars.iv.next112.5, 16000
  %scevgep.6 = getelementptr i8, i8* %18, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next112.6 = or i64 %indvars.iv111, 7
  %26 = mul nuw nsw i64 %indvars.iv.next112.6, 16000
  %scevgep.7 = getelementptr i8, i8* %18, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next112.7 = add nuw nsw i64 %indvars.iv111, 8
  %exitcond137.7 = icmp eq i64 %indvars.iv.next112.7, 2000
  br i1 %exitcond137.7, label %.preheader60.lr.ph, label %._crit_edge83.us

.preheader60.lr.ph:                               ; preds = %._crit_edge83.us
  %27 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader60.us..preheader59.us.us_crit_edge

.preheader60.us..preheader59.us.us_crit_edge:     ; preds = %._crit_edge72.us, %.preheader60.lr.ph
  %indvars.iv105 = phi i64 [ 0, %.preheader60.lr.ph ], [ %indvars.iv.next106, %._crit_edge72.us ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv105
  %scevgep34 = bitcast double* %scevgep3 to i8*
  %28 = add nuw nsw i64 %indvars.iv105, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %28
  %scevgep56 = bitcast double* %scevgep5 to i8*
  br label %.preheader59.us.us

._crit_edge72.us:                                 ; preds = %._crit_edge70.us.us
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next106, 2000
  br i1 %exitcond136, label %.preheader.us.preheader, label %.preheader60.us..preheader59.us.us_crit_edge

.preheader.us.preheader:                          ; preds = %._crit_edge72.us
  br label %.preheader.us

.preheader59.us.us:                               ; preds = %._crit_edge70.us.us, %.preheader60.us..preheader59.us.us_crit_edge
  %indvars.iv103 = phi i64 [ 0, %.preheader60.us..preheader59.us.us_crit_edge ], [ %indvars.iv.next104, %._crit_edge70.us.us ]
  %29 = mul nuw nsw i64 %indvars.iv103, 16000
  %scevgep1 = getelementptr i8, i8* %18, i64 %29
  %30 = add nuw nsw i64 %29, 16000
  %scevgep2 = getelementptr i8, i8* %18, i64 %30
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv105
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
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader59.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %32 = or i64 %index, 1
  %33 = or i64 %index, 2
  %34 = or i64 %index, 3
  %35 = load double, double* %31, align 8, !alias.scope !1
  %36 = insertelement <2 x double> undef, double %35, i32 0
  %37 = shufflevector <2 x double> %36, <2 x double> undef, <2 x i32> zeroinitializer
  %38 = insertelement <2 x double> undef, double %35, i32 0
  %39 = shufflevector <2 x double> %38, <2 x double> undef, <2 x i32> zeroinitializer
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv105
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %32, i64 %indvars.iv105
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %33, i64 %indvars.iv105
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %34, i64 %indvars.iv105
  %44 = load double, double* %40, align 8, !alias.scope !4
  %45 = load double, double* %41, align 8, !alias.scope !4
  %46 = load double, double* %42, align 8, !alias.scope !4
  %47 = load double, double* %43, align 8, !alias.scope !4
  %48 = insertelement <2 x double> undef, double %44, i32 0
  %49 = insertelement <2 x double> %48, double %45, i32 1
  %50 = insertelement <2 x double> undef, double %46, i32 0
  %51 = insertelement <2 x double> %50, double %47, i32 1
  %52 = fmul <2 x double> %37, %49
  %53 = fmul <2 x double> %39, %51
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv103, i64 %index
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
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next104, 2000
  br i1 %exitcond135, label %._crit_edge72.us, label %.preheader59.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv99 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next100.1, %scalar.ph ]
  %63 = load double, double* %31, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv99, i64 %indvars.iv105
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv103, i64 %indvars.iv99
  %68 = load double, double* %67, align 8
  %69 = fadd double %68, %66
  store double %69, double* %67, align 8
  %indvars.iv.next100 = or i64 %indvars.iv99, 1
  %70 = load double, double* %31, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next100, i64 %indvars.iv105
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next100
  %75 = load double, double* %74, align 8
  %76 = fadd double %75, %73
  store double %76, double* %74, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next100, 1999
  %indvars.iv.next100.1 = add nuw nsw i64 %indvars.iv99, 2
  br i1 %exitcond.1, label %._crit_edge70.us.us.loopexit, label %scalar.ph, !llvm.loop !12

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
  %exitcond130.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond130.4, label %._crit_edge.us.loopexit, label %scalar.ph15, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph15
  br label %._crit_edge.us

._crit_edge.us.loopexit40:                        ; preds = %vector.body13
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit40, %._crit_edge.us.loopexit
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next98, 2000
  br i1 %exitcond134, label %._crit_edge67, label %.preheader.us

._crit_edge67:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* %18) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture) unnamed_addr #0 {
..preheader36_crit_edge:
  br label %.preheader36

.preheader36:                                     ; preds = %._crit_edge42, %..preheader36_crit_edge
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %._crit_edge42 ], [ 0, %..preheader36_crit_edge ]
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge42 ], [ 4294967295, %..preheader36_crit_edge ]
  %1 = and i64 %indvars.iv63, 4294967295
  %2 = icmp sgt i64 %indvars.iv3, 0
  br i1 %2, label %.preheader.preheader, label %._crit_edge42

.preheader.preheader:                             ; preds = %.preheader36
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 0
  br label %.preheader

.lr.ph41:                                         ; preds = %._crit_edge
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv3
  %.pre2 = load double, double* %4, align 8
  %5 = add nsw i64 %indvars.iv63, 1
  %xtraiter7 = and i64 %5, 3
  %lcmp.mod8 = icmp eq i64 %xtraiter7, 0
  br i1 %lcmp.mod8, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph41
  br label %6

; <label>:6:                                      ; preds = %6, %.prol.preheader
  %7 = phi double [ %11, %6 ], [ %.pre2, %.prol.preheader ]
  %indvars.iv52.prol = phi i64 [ %indvars.iv.next53.prol, %6 ], [ 0, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %6 ], [ %xtraiter7, %.prol.preheader ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv52.prol
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fsub double %7, %10
  store double %11, double* %4, align 8
  %indvars.iv.next53.prol = add nuw nsw i64 %indvars.iv52.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %6, !llvm.loop !20

.prol.loopexit.unr-lcssa:                         ; preds = %6
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph41, %.prol.loopexit.unr-lcssa
  %.unr9 = phi double [ %.pre2, %.lr.ph41 ], [ %11, %.prol.loopexit.unr-lcssa ]
  %indvars.iv52.unr = phi i64 [ 0, %.lr.ph41 ], [ %xtraiter7, %.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %1, 3
  br i1 %12, label %._crit_edge42.loopexit, label %.lr.ph41.new

.lr.ph41.new:                                     ; preds = %.prol.loopexit
  br label %40

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge ], [ 4294967295, %.preheader.preheader ]
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge ], [ 0, %.preheader.preheader ]
  %13 = and i64 %indvars.iv60, 4294967295
  %14 = icmp sgt i64 %indvars.iv50, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv50
  %.pre = load double, double* %15, align 8
  br i1 %14, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %16 = and i64 %indvars.iv60, 1
  %lcmp.mod = icmp eq i64 %16, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.preheader, label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %17 = load double, double* %3, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv50, i64 0
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %.pre, %20
  store double %21, double* %15, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.lcssa.unr.ph = phi double [ %21, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %.unr.ph = phi double [ %21, %.lr.ph.prol ], [ %.pre, %.lr.ph.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %22 = icmp eq i64 %13, 0
  br i1 %22, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %23 = phi double [ %.unr.ph, %.lr.ph.preheader.new ], [ %35, %.lr.ph ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv50, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %23, %28
  store double %29, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv50, i64 %indvars.iv.next
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fsub double %29, %34
  store double %35, double* %15, align 8
  %exitcond62.1 = icmp eq i64 %indvars.iv.next, %13
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond62.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %35, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %36 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv50, i64 %indvars.iv50
  %38 = load double, double* %37, align 8
  %39 = fdiv double %36, %38
  store double %39, double* %15, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %indvars.iv.next61 = add nuw nsw i64 %13, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next51, %indvars.iv3
  br i1 %exitcond5, label %.lr.ph41, label %.preheader

; <label>:40:                                     ; preds = %40, %.lr.ph41.new
  %41 = phi double [ %.unr9, %.lr.ph41.new ], [ %57, %40 ]
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr, %.lr.ph41.new ], [ %indvars.iv.next53.3, %40 ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv52
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fsub double %41, %44
  store double %45, double* %4, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv.next53
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %47
  %49 = fsub double %45, %48
  store double %49, double* %4, align 8
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv.next53.1
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fsub double %49, %52
  store double %53, double* %4, align 8
  %indvars.iv.next53.2 = add nsw i64 %indvars.iv52, 3
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv.next53.2
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %55
  %57 = fsub double %53, %56
  store double %57, double* %4, align 8
  %exitcond.3 = icmp eq i64 %indvars.iv.next53.2, %1
  %indvars.iv.next53.3 = add nsw i64 %indvars.iv52, 4
  br i1 %exitcond.3, label %._crit_edge42.loopexit.unr-lcssa, label %40

._crit_edge42.loopexit.unr-lcssa:                 ; preds = %40
  br label %._crit_edge42.loopexit

._crit_edge42.loopexit:                           ; preds = %.prol.loopexit, %._crit_edge42.loopexit.unr-lcssa
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader36
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv3
  %59 = load double, double* %58, align 8
  %60 = tail call double @sqrt(double %59) #3
  store double %60, double* %58, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %indvars.iv.next64 = add nuw nsw i64 %1, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next4, 2000
  br i1 %exitcond6, label %._crit_edge45, label %.preheader36

._crit_edge45:                                    ; preds = %._crit_edge42
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
..preheader_crit_edge:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %..preheader_crit_edge
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge ], [ 1, %..preheader_crit_edge ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge ], [ 0, %..preheader_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv16, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge14, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge14 ], [ 0, %.lr.ph ]
  %7 = add nuw nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge14

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, %indvars.iv1
  br i1 %exitcond3, label %._crit_edge, label %6

._crit_edge:                                      ; preds = %._crit_edge14
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, 2000
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  br i1 %exitcond, label %._crit_edge13, label %.lr.ph

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
