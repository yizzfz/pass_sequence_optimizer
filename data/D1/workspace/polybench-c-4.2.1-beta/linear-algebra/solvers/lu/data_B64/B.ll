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
  tail call fastcc void @print_array([2000 x double]* %4)
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

.lr.ph96:                                         ; preds = %._crit_edge98.thread, %.preheader74.lr.ph
  %indvars.iv132 = phi i64 [ 0, %.preheader74.lr.ph ], [ %indvars.iv.next133, %._crit_edge98.thread ]
  %1 = sub i64 1998, %indvars.iv132
  %2 = shl i64 %1, 3
  %3 = and i64 %2, 34359738360
  br label %7

.preheader73:                                     ; preds = %7
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %4 = icmp slt i64 %indvars.iv.next133, 2000
  br i1 %4, label %._crit_edge98.thread, label %.preheader72.us.preheader

._crit_edge98.thread:                             ; preds = %.preheader73
  %5 = add nuw nsw i64 %3, 8
  %scevgep130 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv132, i64 %indvars.iv.next133
  %scevgep130131 = bitcast double* %scevgep130 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep130131, i8 0, i64 %5, i32 8, i1 false)
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv132, i64 %indvars.iv132
  store double 1.000000e+00, double* %6, align 8
  br label %.lr.ph96

; <label>:7:                                      ; preds = %7, %.lr.ph96
  %indvars.iv120 = phi i64 [ 0, %.lr.ph96 ], [ %indvars.iv.next121, %7 ]
  %8 = sub nsw i64 0, %indvars.iv120
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv132, i64 %indvars.iv120
  store double %13, double* %14, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond124 = icmp eq i64 %indvars.iv120, %indvars.iv132
  br i1 %exitcond124, label %.preheader73, label %7

.preheader72.us.preheader:                        ; preds = %.preheader73
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv132, i64 %indvars.iv132
  store double 1.000000e+00, double* %15, align 8
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge93.us

._crit_edge93.us:                                 ; preds = %._crit_edge93.us, %.preheader72.us.preheader
  %indvars.iv118 = phi i64 [ 0, %.preheader72.us.preheader ], [ %indvars.iv.next119.7, %._crit_edge93.us ]
  %17 = mul nuw nsw i64 %indvars.iv118, 16000
  %scevgep = getelementptr i8, i8* %16, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119 = or i64 %indvars.iv118, 1
  %18 = mul nuw nsw i64 %indvars.iv.next119, 16000
  %scevgep.1 = getelementptr i8, i8* %16, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.1 = or i64 %indvars.iv118, 2
  %19 = mul nuw nsw i64 %indvars.iv.next119.1, 16000
  %scevgep.2 = getelementptr i8, i8* %16, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.2 = or i64 %indvars.iv118, 3
  %20 = mul nuw nsw i64 %indvars.iv.next119.2, 16000
  %scevgep.3 = getelementptr i8, i8* %16, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.3 = or i64 %indvars.iv118, 4
  %21 = mul nuw nsw i64 %indvars.iv.next119.3, 16000
  %scevgep.4 = getelementptr i8, i8* %16, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.4 = or i64 %indvars.iv118, 5
  %22 = mul nuw nsw i64 %indvars.iv.next119.4, 16000
  %scevgep.5 = getelementptr i8, i8* %16, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.5 = or i64 %indvars.iv118, 6
  %23 = mul nuw nsw i64 %indvars.iv.next119.5, 16000
  %scevgep.6 = getelementptr i8, i8* %16, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.6 = or i64 %indvars.iv118, 7
  %24 = mul nuw nsw i64 %indvars.iv.next119.6, 16000
  %scevgep.7 = getelementptr i8, i8* %16, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.7 = add nsw i64 %indvars.iv118, 8
  %exitcond45.7 = icmp eq i64 %indvars.iv.next119.7, 2000
  br i1 %exitcond45.7, label %.preheader69.us.us.preheader.preheader, label %._crit_edge93.us

.preheader69.us.us.preheader.preheader:           ; preds = %._crit_edge93.us
  %25 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader69.us.us.preheader

.preheader69.us.us.preheader:                     ; preds = %._crit_edge82.us, %.preheader69.us.us.preheader.preheader
  %indvars.iv113 = phi i64 [ %26, %._crit_edge82.us ], [ 0, %.preheader69.us.us.preheader.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv113
  %26 = add nuw nsw i64 %indvars.iv113, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %26
  %27 = bitcast double* %scevgep5 to i8*
  %28 = bitcast double* %scevgep3 to i8*
  br label %.preheader69.us.us

._crit_edge82.us:                                 ; preds = %._crit_edge80.us.us
  %exitcond44 = icmp eq i64 %26, 2000
  br i1 %exitcond44, label %.preheader.us.preheader, label %.preheader69.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge82.us
  br label %.preheader.us

.preheader69.us.us:                               ; preds = %._crit_edge80.us.us, %.preheader69.us.us.preheader
  %indvars.iv111 = phi i64 [ 0, %.preheader69.us.us.preheader ], [ %indvars.iv.next112, %._crit_edge80.us.us ]
  %29 = mul nuw nsw i64 %indvars.iv111, 16000
  %scevgep1 = getelementptr i8, i8* %16, i64 %29
  %30 = add nuw nsw i64 %29, 16000
  %scevgep2 = getelementptr i8, i8* %16, i64 %30
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv111, i64 %indvars.iv113
  %bound0 = icmp ult i8* %scevgep1, %27
  %bound1 = icmp ult i8* %28, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %31 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader69.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader69.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %32 = or i64 %index, 1
  %33 = or i64 %index, 2
  %34 = or i64 %index, 3
  %35 = load double, double* %31, align 8, !alias.scope !1
  %36 = insertelement <2 x double> undef, double %35, i32 0
  %37 = shufflevector <2 x double> %36, <2 x double> undef, <2 x i32> zeroinitializer
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv113
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %32, i64 %indvars.iv113
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %33, i64 %indvars.iv113
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %34, i64 %indvars.iv113
  %42 = load double, double* %38, align 8, !alias.scope !4
  %43 = load double, double* %39, align 8, !alias.scope !4
  %44 = load double, double* %40, align 8, !alias.scope !4
  %45 = load double, double* %41, align 8, !alias.scope !4
  %46 = insertelement <2 x double> undef, double %42, i32 0
  %47 = insertelement <2 x double> %46, double %43, i32 1
  %48 = insertelement <2 x double> undef, double %44, i32 0
  %49 = insertelement <2 x double> %48, double %45, i32 1
  %50 = fmul <2 x double> %37, %47
  %51 = fmul <2 x double> %37, %49
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv111, i64 %index
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !6, !noalias !8
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !6, !noalias !8
  %56 = fadd <2 x double> %wide.load, %50
  %57 = fadd <2 x double> %wide.load12, %51
  store <2 x double> %56, <2 x double>* %53, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %57, <2 x double>* %55, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %58 = icmp eq i64 %index.next, 2000
  br i1 %58, label %._crit_edge80.us.us.loopexit47, label %vector.body, !llvm.loop !9

._crit_edge80.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge80.us.us

._crit_edge80.us.us.loopexit47:                   ; preds = %vector.body
  br label %._crit_edge80.us.us

._crit_edge80.us.us:                              ; preds = %._crit_edge80.us.us.loopexit47, %._crit_edge80.us.us.loopexit
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next112, 2000
  br i1 %exitcond43, label %._crit_edge82.us, label %.preheader69.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv108 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next109.1, %scalar.ph ]
  %59 = load double, double* %31, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv108, i64 %indvars.iv113
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv111, i64 %indvars.iv108
  %64 = load double, double* %63, align 8
  %65 = fadd double %64, %62
  store double %65, double* %63, align 8
  %indvars.iv.next109 = or i64 %indvars.iv108, 1
  %66 = load double, double* %31, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next109, i64 %indvars.iv113
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv111, i64 %indvars.iv.next109
  %71 = load double, double* %70, align 8
  %72 = fadd double %71, %69
  store double %72, double* %70, align 8
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108, 2
  %exitcond110.1 = icmp eq i64 %indvars.iv.next109, 1999
  br i1 %exitcond110.1, label %._crit_edge80.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv106 = phi i64 [ %73, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %73 = add nuw nsw i64 %indvars.iv106, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %73, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %74 = mul nuw nsw i64 %indvars.iv106, 16000
  %scevgep22 = getelementptr i8, i8* %16, i64 %74
  %75 = add nuw nsw i64 %74, 16000
  %scevgep23 = getelementptr i8, i8* %16, i64 %75
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
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv106, i64 %index30
  %77 = bitcast double* %76 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !13
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !13
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %index30
  %81 = bitcast double* %80 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %81, align 8, !alias.scope !16, !noalias !13
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %83, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv106, i64 %index.next31
  %85 = bitcast double* %84 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %85, align 8, !alias.scope !13
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !13
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %index.next31
  %89 = bitcast double* %88 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %89, align 8, !alias.scope !16, !noalias !13
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %91, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %92 = icmp eq i64 %index.next31.1, 2000
  br i1 %92, label %._crit_edge.us.loopexit46, label %vector.body13, !llvm.loop !18

scalar.ph15:                                      ; preds = %scalar.ph15, %scalar.ph15.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph15.preheader ], [ %indvars.iv.next.4, %scalar.ph15 ]
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv106, i64 %indvars.iv
  %94 = bitcast double* %93 to i64*
  %95 = load i64, i64* %94, align 8
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv
  %97 = bitcast double* %96 to i64*
  store i64 %95, i64* %97, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next
  %99 = bitcast double* %98 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv.next
  %102 = bitcast double* %101 to i64*
  store i64 %100, i64* %102, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %104 = bitcast double* %103 to i64*
  %105 = load i64, i64* %104, align 8
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %109 = bitcast double* %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %112 = bitcast double* %111 to i64*
  store i64 %110, i64* %112, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %113 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.3
  %114 = bitcast double* %113 to i64*
  %115 = load i64, i64* %114, align 8
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv.next.3
  %117 = bitcast double* %116 to i64*
  store i64 %115, i64* %117, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge.us.loopexit, label %scalar.ph15, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph15
  br label %._crit_edge.us

._crit_edge.us.loopexit46:                        ; preds = %vector.body13
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit46, %._crit_edge.us.loopexit
  %exitcond42 = icmp eq i64 %73, 2000
  br i1 %exitcond42, label %._crit_edge77, label %.preheader.us

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
  %6 = icmp eq i64 %2, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge49.us, %.preheader.us.preheader
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %._crit_edge49.us ], [ %indvars.iv1, %.preheader.us.preheader ]
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv75
  %.pre61 = load double, double* %7, align 8
  br i1 %lcmp.mod9, label %.prol.preheader6, label %.prol.loopexit7.unr-lcssa

.prol.preheader6:                                 ; preds = %.preheader.us
  %8 = load double, double* %4, align 8
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv75
  %10 = load double, double* %9, align 8
  %11 = fmul double %8, %10
  %12 = fsub double %.pre61, %11
  store double %12, double* %7, align 8
  br label %.prol.loopexit7.unr-lcssa

.prol.loopexit7.unr-lcssa:                        ; preds = %.preheader.us, %.prol.preheader6
  %indvars.iv67.unr.ph = phi i64 [ 1, %.prol.preheader6 ], [ 0, %.preheader.us ]
  %.unr10.ph = phi double [ %12, %.prol.preheader6 ], [ %.pre61, %.preheader.us ]
  br i1 %6, label %._crit_edge49.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit7.unr-lcssa
  br label %13

; <label>:13:                                     ; preds = %13, %.preheader.us.new
  %indvars.iv67 = phi i64 [ %indvars.iv67.unr.ph, %.preheader.us.new ], [ %indvars.iv.next68.1, %13 ]
  %14 = phi double [ %.unr10.ph, %.preheader.us.new ], [ %26, %13 ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv67
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv67, i64 %indvars.iv75
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %14, %19
  store double %20, double* %7, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next68
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next68, i64 %indvars.iv75
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %7, align 8
  %indvars.iv.next68.1 = add nsw i64 %indvars.iv67, 2
  %exitcond72.1 = icmp eq i64 %indvars.iv.next68, %wide.trip.count71
  br i1 %exitcond72.1, label %._crit_edge49.us.unr-lcssa, label %13

._crit_edge49.us.unr-lcssa:                       ; preds = %13
  br label %._crit_edge49.us

._crit_edge49.us:                                 ; preds = %.prol.loopexit7.unr-lcssa, %._crit_edge49.us.unr-lcssa
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next76, 2000
  br i1 %exitcond4, label %._crit_edge51.loopexit, label %.preheader.us

.preheader42:                                     ; preds = %._crit_edge, %.preheader42.preheader
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge ], [ 0, %.preheader42.preheader ]
  %indvars.iv62 = phi i32 [ %indvars.iv.next63, %._crit_edge ], [ -1, %.preheader42.preheader ]
  %27 = add i64 %indvars.iv64, 4294967295
  %28 = and i64 %27, 4294967295
  %29 = icmp sgt i64 %indvars.iv64, 0
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv64
  %.pre = load double, double* %30, align 8
  br i1 %29, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader42
  %wide.trip.count = zext i32 %indvars.iv62 to i64
  %31 = and i64 %27, 1
  %lcmp.mod = icmp eq i64 %31, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  %32 = load double, double* %4, align 8
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv64
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fsub double %.pre, %35
  store double %36, double* %30, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %.prol.preheader
  %.lcssa.unr.ph = phi double [ %36, %.prol.preheader ], [ undef, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %36, %.prol.preheader ], [ %.pre, %.lr.ph ]
  %37 = icmp eq i64 %28, 0
  br i1 %37, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit.unr-lcssa
  br label %38

; <label>:38:                                     ; preds = %38, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %38 ]
  %39 = phi double [ %.unr.ph, %.lr.ph.new ], [ %51, %38 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv64
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fsub double %39, %44
  store double %45, double* %30, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv64
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fsub double %45, %50
  store double %51, double* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %38

._crit_edge.loopexit.unr-lcssa:                   ; preds = %38
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit.unr-lcssa, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit.unr-lcssa ], [ %51, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader42
  %52 = phi double [ %.pre, %.preheader42 ], [ %.lcssa, %._crit_edge.loopexit ]
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv64
  %54 = load double, double* %53, align 8
  %55 = fdiv double %52, %54
  store double %55, double* %30, align 8
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
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
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
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
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
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
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
