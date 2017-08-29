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
.preheader72.lr.ph:
  br label %.lr.ph94

.lr.ph94:                                         ; preds = %._crit_edge96.thread, %.preheader72.lr.ph
  %indvars.iv127 = phi i64 [ 0, %.preheader72.lr.ph ], [ %indvars.iv.next128, %._crit_edge96.thread ]
  %1 = shl i64 %indvars.iv127, 32
  %sext = add i64 %1, 4294967296
  %2 = ashr exact i64 %sext, 32
  %3 = ashr exact i64 %sext, 29
  br label %8

.preheader71:                                     ; preds = %8
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %4 = icmp slt i64 %indvars.iv.next128, 2000
  br i1 %4, label %._crit_edge96.thread, label %.preheader70.us.preheader

._crit_edge96.thread:                             ; preds = %.preheader71
  %5 = sub nsw i64 16000, %3
  %scevgep131 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv127, i64 %2
  %6 = bitcast double* %scevgep131 to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 %5, i32 8, i1 false)
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv127, i64 %indvars.iv127
  store double 1.000000e+00, double* %7, align 8
  br label %.lr.ph94

; <label>:8:                                      ; preds = %8, %.lr.ph94
  %indvars.iv117 = phi i64 [ 0, %.lr.ph94 ], [ %indvars.iv.next118, %8 ]
  %9 = sub nsw i64 0, %indvars.iv117
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 2000
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.000000e+03
  %14 = fadd double %13, 1.000000e+00
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv127, i64 %indvars.iv117
  store double %14, double* %15, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond121 = icmp eq i64 %indvars.iv117, %indvars.iv127
  br i1 %exitcond121, label %.preheader71, label %8

.preheader70.us.preheader:                        ; preds = %.preheader71
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv127, i64 %indvars.iv127
  store double 1.000000e+00, double* %16, align 8
  %17 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge91.us

._crit_edge91.us:                                 ; preds = %._crit_edge91.us, %.preheader70.us.preheader
  %indvars.iv115 = phi i64 [ 0, %.preheader70.us.preheader ], [ %indvars.iv.next116.7, %._crit_edge91.us ]
  %18 = mul nuw nsw i64 %indvars.iv115, 16000
  %scevgep = getelementptr i8, i8* %17, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116 = or i64 %indvars.iv115, 1
  %19 = mul nuw nsw i64 %indvars.iv.next116, 16000
  %scevgep.1 = getelementptr i8, i8* %17, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116.1 = or i64 %indvars.iv115, 2
  %20 = mul nuw nsw i64 %indvars.iv.next116.1, 16000
  %scevgep.2 = getelementptr i8, i8* %17, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116.2 = or i64 %indvars.iv115, 3
  %21 = mul nuw nsw i64 %indvars.iv.next116.2, 16000
  %scevgep.3 = getelementptr i8, i8* %17, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116.3 = or i64 %indvars.iv115, 4
  %22 = mul nuw nsw i64 %indvars.iv.next116.3, 16000
  %scevgep.4 = getelementptr i8, i8* %17, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116.4 = or i64 %indvars.iv115, 5
  %23 = mul nuw nsw i64 %indvars.iv.next116.4, 16000
  %scevgep.5 = getelementptr i8, i8* %17, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116.5 = or i64 %indvars.iv115, 6
  %24 = mul nuw nsw i64 %indvars.iv.next116.5, 16000
  %scevgep.6 = getelementptr i8, i8* %17, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116.6 = or i64 %indvars.iv115, 7
  %25 = mul nuw nsw i64 %indvars.iv.next116.6, 16000
  %scevgep.7 = getelementptr i8, i8* %17, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next116.7 = add nsw i64 %indvars.iv115, 8
  %exitcond45.7 = icmp eq i64 %indvars.iv.next116.7, 2000
  br i1 %exitcond45.7, label %.preheader67.us.us.preheader.preheader, label %._crit_edge91.us

.preheader67.us.us.preheader.preheader:           ; preds = %._crit_edge91.us
  %26 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %27 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %28 = bitcast i8* %17 to [2000 x [2000 x double]]*
  br label %.preheader67.us.us.preheader

.preheader67.us.us.preheader:                     ; preds = %._crit_edge80.us, %.preheader67.us.us.preheader.preheader
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %._crit_edge80.us ], [ 0, %.preheader67.us.us.preheader.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv110
  %29 = add nuw nsw i64 %indvars.iv110, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %29
  %30 = bitcast double* %scevgep5 to i8*
  %31 = bitcast double* %scevgep3 to i8*
  br label %.preheader67.us.us

._crit_edge80.us:                                 ; preds = %._crit_edge78.us.us
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next111, 2000
  br i1 %exitcond44, label %.preheader.us.preheader, label %.preheader67.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge80.us
  %32 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %33 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %34 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %35 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %36 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %37 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %38 = bitcast i8* %17 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader67.us.us:                               ; preds = %._crit_edge78.us.us, %.preheader67.us.us.preheader
  %indvars.iv108 = phi i64 [ 0, %.preheader67.us.us.preheader ], [ %indvars.iv.next109, %._crit_edge78.us.us ]
  %39 = mul nuw nsw i64 %indvars.iv108, 16000
  %scevgep1 = getelementptr i8, i8* %17, i64 %39
  %40 = add nuw nsw i64 %39, 16000
  %scevgep2 = getelementptr i8, i8* %17, i64 %40
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv110
  %bound0 = icmp ult i8* %scevgep1, %30
  %bound1 = icmp ult i8* %31, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %41 to i8*
  %bc7 = bitcast double* %41 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc7
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader67.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader67.us.us
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
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv110
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %42, i64 %indvars.iv110
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %43, i64 %indvars.iv110
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %44, i64 %indvars.iv110
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
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv108, i64 %index
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !6, !noalias !8
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !6, !noalias !8
  %68 = fadd <2 x double> %wide.load, %62
  %69 = fadd <2 x double> %wide.load12, %63
  %70 = bitcast double* %64 to <2 x double>*
  store <2 x double> %68, <2 x double>* %70, align 8, !alias.scope !6, !noalias !8
  %71 = bitcast double* %66 to <2 x double>*
  store <2 x double> %69, <2 x double>* %71, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %72 = icmp eq i64 %index.next, 2000
  br i1 %72, label %._crit_edge78.us.us.loopexit47, label %vector.body, !llvm.loop !9

._crit_edge78.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge78.us.us

._crit_edge78.us.us.loopexit47:                   ; preds = %vector.body
  br label %._crit_edge78.us.us

._crit_edge78.us.us:                              ; preds = %._crit_edge78.us.us.loopexit47, %._crit_edge78.us.us.loopexit
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next109, 2000
  br i1 %exitcond43, label %._crit_edge80.us, label %.preheader67.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv105 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next106.1, %scalar.ph ]
  %73 = load double, double* %41, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv105, i64 %indvars.iv110
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv108, i64 %indvars.iv105
  %78 = load double, double* %77, align 8
  %79 = fadd double %78, %76
  store double %79, double* %77, align 8
  %indvars.iv.next106 = or i64 %indvars.iv105, 1
  %80 = load double, double* %41, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next106, i64 %indvars.iv110
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next106
  %85 = load double, double* %84, align 8
  %86 = fadd double %85, %83
  store double %86, double* %84, align 8
  %indvars.iv.next106.1 = add nsw i64 %indvars.iv105, 2
  %exitcond107.1 = icmp eq i64 %indvars.iv.next106, 1999
  br i1 %exitcond107.1, label %._crit_edge78.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %87 = add nuw nsw i64 %indvars.iv103, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %87, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %88 = mul nuw nsw i64 %indvars.iv103, 16000
  %scevgep22 = getelementptr i8, i8* %17, i64 %88
  %89 = add nuw nsw i64 %88, 16000
  %scevgep23 = getelementptr i8, i8* %17, i64 %89
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
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv103, i64 %index30
  %91 = bitcast double* %90 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %91, align 8, !alias.scope !13
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %93, align 8, !alias.scope !13
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %index30
  %95 = bitcast double* %94 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %95, align 8, !alias.scope !16, !noalias !13
  %96 = getelementptr double, double* %94, i64 2
  %97 = bitcast double* %96 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %97, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv103, i64 %index.next31
  %99 = bitcast double* %98 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %99, align 8, !alias.scope !13
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !13
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %index.next31
  %103 = bitcast double* %102 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %103, align 8, !alias.scope !16, !noalias !13
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %105, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %106 = icmp eq i64 %index.next31.1, 2000
  br i1 %106, label %._crit_edge.us.loopexit46, label %vector.body13, !llvm.loop !18

scalar.ph15:                                      ; preds = %scalar.ph15, %scalar.ph15.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph15.preheader ], [ %indvars.iv.next.4, %scalar.ph15 ]
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv103, i64 %indvars.iv
  %108 = bitcast double* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv.next
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next.1
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv.next.1
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next.2
  %123 = bitcast double* %122 to i64*
  %124 = load i64, i64* %123, align 8
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv.next.2
  %126 = bitcast double* %125 to i64*
  store i64 %124, i64* %126, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next.3
  %128 = bitcast double* %127 to i64*
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv.next.3
  %131 = bitcast double* %130 to i64*
  store i64 %129, i64* %131, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge.us.loopexit, label %scalar.ph15, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph15
  br label %._crit_edge.us

._crit_edge.us.loopexit46:                        ; preds = %vector.body13
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit46, %._crit_edge.us.loopexit
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next104, 2000
  br i1 %exitcond42, label %._crit_edge75, label %.preheader.us

._crit_edge75:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %17) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.preheader43.preheader:
  br label %.preheader43

.preheader43:                                     ; preds = %._crit_edge50, %.preheader43.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge50 ], [ 0, %.preheader43.preheader ]
  %indvars.iv68 = phi i32 [ %indvars.iv.next69, %._crit_edge50 ], [ -1, %.preheader43.preheader ]
  %1 = add i64 %indvars.iv1, 4294967295
  %2 = and i64 %1, 4294967295
  %3 = icmp sgt i64 %indvars.iv1, 0
  br i1 %3, label %.preheader41.preheader, label %._crit_edge50

.preheader41.preheader:                           ; preds = %.preheader43
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  br label %.preheader41

.preheader.us.preheader:                          ; preds = %._crit_edge
  %wide.trip.count70 = zext i32 %indvars.iv68 to i64
  %5 = and i64 %1, 1
  %lcmp.mod9 = icmp eq i64 %5, 0
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  %7 = icmp eq i64 %2, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge48.us, %.preheader.us.preheader
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge48.us ], [ %indvars.iv1, %.preheader.us.preheader ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv74
  %.pre60 = load double, double* %8, align 8
  br i1 %lcmp.mod9, label %.prol.preheader6, label %.prol.loopexit7.unr-lcssa

.prol.preheader6:                                 ; preds = %.preheader.us
  br label %9

; <label>:9:                                      ; preds = %.prol.preheader6
  %10 = load double, double* %6, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv74
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fsub double %.pre60, %13
  store double %14, double* %8, align 8
  br label %.prol.loopexit7.unr-lcssa

.prol.loopexit7.unr-lcssa:                        ; preds = %.preheader.us, %9
  %indvars.iv66.unr.ph = phi i64 [ 1, %9 ], [ 0, %.preheader.us ]
  %.unr10.ph = phi double [ %14, %9 ], [ %.pre60, %.preheader.us ]
  br label %.prol.loopexit7

.prol.loopexit7:                                  ; preds = %.prol.loopexit7.unr-lcssa
  br i1 %7, label %._crit_edge48.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit7
  br label %15

; <label>:15:                                     ; preds = %15, %.preheader.us.new
  %indvars.iv66 = phi i64 [ %indvars.iv66.unr.ph, %.preheader.us.new ], [ %indvars.iv.next67.1, %15 ]
  %16 = phi double [ %.unr10.ph, %.preheader.us.new ], [ %28, %15 ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv66
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv74
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  store double %22, double* %8, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next67
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next67, i64 %indvars.iv74
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %8, align 8
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66, 2
  %exitcond71.1 = icmp eq i64 %indvars.iv.next67, %wide.trip.count70
  br i1 %exitcond71.1, label %._crit_edge48.us.unr-lcssa, label %15

._crit_edge48.us.unr-lcssa:                       ; preds = %15
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %.prol.loopexit7, %._crit_edge48.us.unr-lcssa
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next75, 2000
  br i1 %exitcond4, label %._crit_edge50.loopexit, label %.preheader.us

.preheader41:                                     ; preds = %._crit_edge, %.preheader41.preheader
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge ], [ 0, %.preheader41.preheader ]
  %indvars.iv61 = phi i32 [ %indvars.iv.next62, %._crit_edge ], [ -1, %.preheader41.preheader ]
  %29 = add i64 %indvars.iv63, 4294967295
  %30 = and i64 %29, 4294967295
  %31 = icmp sgt i64 %indvars.iv63, 0
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv63
  %.pre = load double, double* %32, align 8
  br i1 %31, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader41
  %wide.trip.count = zext i32 %indvars.iv61 to i64
  %33 = and i64 %29, 1
  %lcmp.mod = icmp eq i64 %33, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %34

; <label>:34:                                     ; preds = %.prol.preheader
  %35 = load double, double* %4, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv63
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
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv63
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fsub double %42, %47
  store double %48, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv63
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

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader41
  %55 = phi double [ %.pre, %.preheader41 ], [ %.lcssa, %._crit_edge.loopexit ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv63
  %57 = load double, double* %56, align 8
  %58 = fdiv double %55, %57
  store double %58, double* %32, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %indvars.iv.next62 = add nsw i32 %indvars.iv61, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next64, %indvars.iv1
  br i1 %exitcond3, label %.preheader.us.preheader, label %.preheader41

._crit_edge50.loopexit:                           ; preds = %._crit_edge48.us
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50.loopexit, %.preheader43
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %indvars.iv.next69 = add nsw i32 %indvars.iv68, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond5, label %._crit_edge54, label %.preheader43

._crit_edge54:                                    ; preds = %._crit_edge50
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge12.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge12.us ]
  %5 = mul nuw nsw i64 %indvars.iv15, 2000
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
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge12.us, label %6

._crit_edge12.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond1, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge12.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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
