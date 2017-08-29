; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #3
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call void @print_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.lr.ph7.preheader:
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %.lr.ph7, %.lr.ph7.preheader
  %indvars.iv16 = phi i64 [ 0, %.lr.ph7.preheader ], [ %indvars.iv.next17.4, %.lr.ph7 ]
  %4 = trunc i64 %indvars.iv16 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv16
  store double %5, double* %6, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %7 = trunc i64 %indvars.iv.next17 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next17
  store double %8, double* %9, align 8
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv16, 2
  %10 = trunc i64 %indvars.iv.next17.1 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next17.1
  store double %11, double* %12, align 8
  %indvars.iv.next17.2 = add nsw i64 %indvars.iv16, 3
  %13 = trunc i64 %indvars.iv.next17.2 to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next17.2
  store double %14, double* %15, align 8
  %indvars.iv.next17.3 = add nsw i64 %indvars.iv16, 4
  %16 = trunc i64 %indvars.iv.next17.3 to i32
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next17.3
  store double %17, double* %18, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next17.3, 499
  %indvars.iv.next17.4 = add nsw i64 %indvars.iv16, 5
  br i1 %exitcond.4, label %.lr.ph2.split.us.preheader, label %.lr.ph7

.lr.ph2.split.us.preheader:                       ; preds = %.lr.ph7
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge.us ], [ 0, %.lr.ph2.split.us.preheader ]
  %19 = trunc i64 %indvars.iv13 to i32
  %20 = sitofp i32 %19 to double
  %21 = insertelement <2 x double> undef, double %20, i32 0
  %22 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph2.split.us ], [ %indvars.iv.next, %._crit_edge12 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %23 = trunc i64 %indvars.iv.next to i32
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv
  %26 = add nuw nsw i64 %indvars.iv, 2
  %27 = trunc i64 %26 to i32
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %24, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fmul <2 x double> %22, %30
  %32 = fdiv <2 x double> %31, <double 1.000000e+03, double 1.200000e+03>
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  store double %33, double* %25, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  store double %34, double* %35, align 8
  %36 = add nuw nsw i64 %indvars.iv, 3
  %37 = trunc i64 %36 to i32
  %38 = sitofp i32 %37 to double
  %39 = fmul double %20, %38
  %40 = fdiv double %39, 1.000000e+03
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  store double %40, double* %41, align 8
  %exitcond20 = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond20, label %._crit_edge.us, label %._crit_edge12

._crit_edge.us:                                   ; preds = %._crit_edge12
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond1, label %._crit_edge11, label %.lr.ph2.split.us

._crit_edge11:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.lr.ph64:
  %scevgep208 = getelementptr [1200 x double], [1200 x double]* %1, i64 1, i64 0
  br label %._crit_edge59._crit_edge

._crit_edge59._crit_edge:                         ; preds = %._crit_edge59, %.lr.ph64
  %indvars.iv101 = phi i64 [ 0, %.lr.ph64 ], [ %indvars.iv.next102, %._crit_edge59 ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv101
  %5 = bitcast double* %4 to [1200 x double]*
  %bound0211 = icmp ugt [1200 x double]* %5, %1
  %bound1212 = icmp ult double* %4, %scevgep208
  %memcheck.conflict214 = and i1 %bound0211, %bound1212
  br i1 %memcheck.conflict214, label %scalar.ph205.preheader, label %vector.body203.preheader

vector.body203.preheader:                         ; preds = %._crit_edge59._crit_edge
  %6 = bitcast double* %4 to i64*
  br label %vector.body203

scalar.ph205.preheader:                           ; preds = %._crit_edge59._crit_edge
  %7 = bitcast double* %4 to i64*
  br label %scalar.ph205

vector.body203:                                   ; preds = %vector.body203, %vector.body203.preheader
  %index217 = phi i64 [ 0, %vector.body203.preheader ], [ %index.next218.2, %vector.body203 ]
  %8 = load i64, i64* %6, align 8, !alias.scope !1
  %9 = insertelement <2 x i64> undef, i64 %8, i32 0
  %10 = shufflevector <2 x i64> %9, <2 x i64> undef, <2 x i32> zeroinitializer
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index217
  %12 = bitcast double* %11 to <2 x i64>*
  store <2 x i64> %10, <2 x i64>* %12, align 8, !alias.scope !4, !noalias !1
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x i64>*
  store <2 x i64> %10, <2 x i64>* %14, align 8, !alias.scope !4, !noalias !1
  %index.next218 = add nuw nsw i64 %index217, 4
  %15 = load i64, i64* %6, align 8, !alias.scope !1
  %16 = insertelement <2 x i64> undef, i64 %15, i32 0
  %17 = shufflevector <2 x i64> %16, <2 x i64> undef, <2 x i32> zeroinitializer
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next218
  %19 = bitcast double* %18 to <2 x i64>*
  store <2 x i64> %17, <2 x i64>* %19, align 8, !alias.scope !4, !noalias !1
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x i64>*
  store <2 x i64> %17, <2 x i64>* %21, align 8, !alias.scope !4, !noalias !1
  %index.next218.1 = add nsw i64 %index217, 8
  %22 = load i64, i64* %6, align 8, !alias.scope !1
  %23 = insertelement <2 x i64> undef, i64 %22, i32 0
  %24 = shufflevector <2 x i64> %23, <2 x i64> undef, <2 x i32> zeroinitializer
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next218.1
  %26 = bitcast double* %25 to <2 x i64>*
  store <2 x i64> %24, <2 x i64>* %26, align 8, !alias.scope !4, !noalias !1
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x i64>*
  store <2 x i64> %24, <2 x i64>* %28, align 8, !alias.scope !4, !noalias !1
  %index.next218.2 = add nsw i64 %index217, 12
  %29 = icmp eq i64 %index.next218.2, 1200
  br i1 %29, label %.lr.ph28.split.us.preheader.loopexit2, label %vector.body203, !llvm.loop !6

scalar.ph205:                                     ; preds = %scalar.ph205, %scalar.ph205.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph205.preheader ], [ %indvars.iv.next.7, %scalar.ph205 ]
  %30 = load i64, i64* %7, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %32 = bitcast double* %31 to i64*
  store i64 %30, i64* %32, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %33 = load i64, i64* %7, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %35 = bitcast double* %34 to i64*
  store i64 %33, i64* %35, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %36 = load i64, i64* %7, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %38 = bitcast double* %37 to i64*
  store i64 %36, i64* %38, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %39 = load i64, i64* %7, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %41 = bitcast double* %40 to i64*
  store i64 %39, i64* %41, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %42 = load i64, i64* %7, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %45 = load i64, i64* %7, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %47 = bitcast double* %46 to i64*
  store i64 %45, i64* %47, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %48 = load i64, i64* %7, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %50 = bitcast double* %49 to i64*
  store i64 %48, i64* %50, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %51 = load i64, i64* %7, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %53 = bitcast double* %52 to i64*
  store i64 %51, i64* %53, align 8
  %exitcond103.7 = icmp eq i64 %indvars.iv.next.6, 1199
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  br i1 %exitcond103.7, label %.lr.ph28.split.us.preheader.loopexit, label %scalar.ph205, !llvm.loop !9

.lr.ph28.split.us.preheader.loopexit:             ; preds = %scalar.ph205
  br label %.lr.ph28.split.us.preheader

.lr.ph28.split.us.preheader.loopexit2:            ; preds = %vector.body203
  br label %.lr.ph28.split.us.preheader

.lr.ph28.split.us.preheader:                      ; preds = %.lr.ph28.split.us.preheader.loopexit2, %.lr.ph28.split.us.preheader.loopexit
  br label %.lr.ph28.split.us

.lr.ph28.split.us:                                ; preds = %._crit_edge22.us, %.lr.ph28.split.us.preheader
  %indvar = phi i64 [ %54, %._crit_edge22.us ], [ 0, %.lr.ph28.split.us.preheader ]
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %._crit_edge22.us ], [ 1, %.lr.ph28.split.us.preheader ]
  %54 = add nuw nsw i64 %indvar, 1
  %scevgep175 = getelementptr [1200 x double], [1200 x double]* %1, i64 %54, i64 0
  %55 = add nuw nsw i64 %indvar, 2
  %scevgep177 = getelementptr [1200 x double], [1200 x double]* %1, i64 %55, i64 0
  %scevgep179 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep181 = getelementptr [1200 x double], [1200 x double]* %2, i64 %55, i64 0
  %56 = add nsw i64 %indvars.iv85, -1
  %bound0183 = icmp ult double* %scevgep175, %scevgep181
  %bound1184 = icmp ult double* %scevgep179, %scevgep177
  %memcheck.conflict186 = and i1 %bound0183, %bound1184
  br i1 %memcheck.conflict186, label %scalar.ph172.preheader, label %vector.body170.preheader

vector.body170.preheader:                         ; preds = %.lr.ph28.split.us
  br label %vector.body170

scalar.ph172.preheader:                           ; preds = %.lr.ph28.split.us
  br label %scalar.ph172

vector.body170:                                   ; preds = %vector.body170.preheader, %vector.body170
  %index189 = phi i64 [ %index.next190, %vector.body170 ], [ 0, %vector.body170.preheader ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv85, i64 %index189
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load197 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !10, !noalias !13
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load198 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !10, !noalias !13
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv85, i64 %index189
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load199 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !13
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load200 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !13
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %56, i64 %index189
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load201 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !13
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load202 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !13
  %69 = fsub <2 x double> %wide.load199, %wide.load201
  %70 = fsub <2 x double> %wide.load200, %wide.load202
  %71 = fmul <2 x double> %69, <double 5.000000e-01, double 5.000000e-01>
  %72 = fmul <2 x double> %70, <double 5.000000e-01, double 5.000000e-01>
  %73 = fsub <2 x double> %wide.load197, %71
  %74 = fsub <2 x double> %wide.load198, %72
  store <2 x double> %73, <2 x double>* %58, align 8, !alias.scope !10, !noalias !13
  store <2 x double> %74, <2 x double>* %60, align 8, !alias.scope !10, !noalias !13
  %index.next190 = add nuw nsw i64 %index189, 4
  %75 = icmp eq i64 %index.next190, 1200
  br i1 %75, label %._crit_edge22.us.loopexit1, label %vector.body170, !llvm.loop !15

scalar.ph172:                                     ; preds = %scalar.ph172, %scalar.ph172.preheader
  %indvars.iv81 = phi i64 [ 0, %scalar.ph172.preheader ], [ %indvars.iv.next82.1, %scalar.ph172 ]
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv85, i64 %indvars.iv81
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv85, i64 %indvars.iv81
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %56, i64 %indvars.iv81
  %81 = load double, double* %80, align 8
  %82 = fsub double %79, %81
  %83 = fmul double %82, 5.000000e-01
  %84 = fsub double %77, %83
  store double %84, double* %76, align 8
  %indvars.iv.next82 = or i64 %indvars.iv81, 1
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv85, i64 %indvars.iv.next82
  %86 = load double, double* %85, align 8
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv85, i64 %indvars.iv.next82
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %56, i64 %indvars.iv.next82
  %90 = load double, double* %89, align 8
  %91 = fsub double %88, %90
  %92 = fmul double %91, 5.000000e-01
  %93 = fsub double %86, %92
  store double %93, double* %85, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next82, 1199
  %indvars.iv.next82.1 = add nsw i64 %indvars.iv81, 2
  br i1 %exitcond.1, label %._crit_edge22.us.loopexit, label %scalar.ph172, !llvm.loop !16

._crit_edge22.us.loopexit:                        ; preds = %scalar.ph172
  br label %._crit_edge22.us

._crit_edge22.us.loopexit1:                       ; preds = %vector.body170
  br label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %._crit_edge22.us.loopexit1, %._crit_edge22.us.loopexit
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond3 = icmp eq i64 %54, 999
  br i1 %exitcond3, label %.lr.ph45.split.us.preheader, label %.lr.ph28.split.us

.lr.ph45.split.us.preheader:                      ; preds = %._crit_edge22.us
  br label %.lr.ph45.split.us

.lr.ph45.split.us:                                ; preds = %._crit_edge40.us, %.lr.ph45.split.us.preheader
  %indvars.iv92 = phi i64 [ %94, %._crit_edge40.us ], [ 0, %.lr.ph45.split.us.preheader ]
  %scevgep142 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv92, i64 1
  %94 = add nuw nsw i64 %indvars.iv92, 1
  %scevgep144 = getelementptr [1200 x double], [1200 x double]* %0, i64 %94, i64 0
  %scevgep146 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv92, i64 0
  %scevgep148 = getelementptr [1200 x double], [1200 x double]* %2, i64 %94, i64 0
  %bound0150 = icmp ult double* %scevgep142, %scevgep148
  %bound1151 = icmp ult double* %scevgep146, %scevgep144
  %memcheck.conflict153 = and i1 %bound0150, %bound1151
  br i1 %memcheck.conflict153, label %scalar.ph139.preheader, label %vector.body137.preheader

vector.body137.preheader:                         ; preds = %.lr.ph45.split.us
  br label %vector.body137

vector.body137:                                   ; preds = %vector.body137.preheader, %vector.body137
  %index156 = phi i64 [ %index.next157, %vector.body137 ], [ 0, %vector.body137.preheader ]
  %offset.idx = or i64 %index156, 1
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv92, i64 %offset.idx
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load164 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !17, !noalias !20
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load165 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !17, !noalias !20
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv92, i64 %offset.idx
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load166 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !20
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x double>*
  %wide.load167 = load <2 x double>, <2 x double>* %102, align 8, !alias.scope !20
  %103 = add nsw i64 %offset.idx, -1
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv92, i64 %103
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load168 = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !20
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load169 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !20
  %108 = fsub <2 x double> %wide.load166, %wide.load168
  %109 = fsub <2 x double> %wide.load167, %wide.load169
  %110 = fmul <2 x double> %108, <double 5.000000e-01, double 5.000000e-01>
  %111 = fmul <2 x double> %109, <double 5.000000e-01, double 5.000000e-01>
  %112 = fsub <2 x double> %wide.load164, %110
  %113 = fsub <2 x double> %wide.load165, %111
  store <2 x double> %112, <2 x double>* %96, align 8, !alias.scope !17, !noalias !20
  store <2 x double> %113, <2 x double>* %98, align 8, !alias.scope !17, !noalias !20
  %index.next157 = add nuw nsw i64 %index156, 4
  %114 = icmp eq i64 %index.next157, 1196
  br i1 %114, label %scalar.ph139.preheader.loopexit, label %vector.body137, !llvm.loop !22

scalar.ph139.preheader.loopexit:                  ; preds = %vector.body137
  br label %scalar.ph139.preheader

scalar.ph139.preheader:                           ; preds = %scalar.ph139.preheader.loopexit, %.lr.ph45.split.us
  %indvars.iv88.ph = phi i64 [ 1, %.lr.ph45.split.us ], [ 1197, %scalar.ph139.preheader.loopexit ]
  br i1 true, label %scalar.ph139.prol.preheader, label %scalar.ph139.preheader.scalar.ph139.prol.loopexit.unr-lcssa_crit_edge

scalar.ph139.preheader.scalar.ph139.prol.loopexit.unr-lcssa_crit_edge: ; preds = %scalar.ph139.preheader
  br label %scalar.ph139.prol.loopexit.unr-lcssa

scalar.ph139.prol.preheader:                      ; preds = %scalar.ph139.preheader
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv88.ph
  %116 = load double, double* %115, align 8
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv92, i64 %indvars.iv88.ph
  %118 = load double, double* %117, align 8
  %119 = add nsw i64 %indvars.iv88.ph, -1
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv92, i64 %119
  %121 = load double, double* %120, align 8
  %122 = fsub double %118, %121
  %123 = fmul double %122, 5.000000e-01
  %124 = fsub double %116, %123
  store double %124, double* %115, align 8
  %indvars.iv.next89.prol = add nuw nsw i64 %indvars.iv88.ph, 1
  br label %scalar.ph139.prol.loopexit.unr-lcssa

scalar.ph139.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph139.preheader.scalar.ph139.prol.loopexit.unr-lcssa_crit_edge, %scalar.ph139.prol.preheader
  %indvars.iv88.unr.ph = phi i64 [ %indvars.iv.next89.prol, %scalar.ph139.prol.preheader ], [ undef, %scalar.ph139.preheader.scalar.ph139.prol.loopexit.unr-lcssa_crit_edge ]
  br i1 false, label %._crit_edge40.us, label %scalar.ph139.preheader.new

scalar.ph139.preheader.new:                       ; preds = %scalar.ph139.prol.loopexit.unr-lcssa
  br label %scalar.ph139

scalar.ph139:                                     ; preds = %scalar.ph139, %scalar.ph139.preheader.new
  %indvars.iv88 = phi i64 [ %indvars.iv88.unr.ph, %scalar.ph139.preheader.new ], [ %indvars.iv.next89.1, %scalar.ph139 ]
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv88
  %126 = load double, double* %125, align 8
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv92, i64 %indvars.iv88
  %128 = load double, double* %127, align 8
  %129 = add nsw i64 %indvars.iv88, -1
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv92, i64 %129
  %131 = load double, double* %130, align 8
  %132 = fsub double %128, %131
  %133 = fmul double %132, 5.000000e-01
  %134 = fsub double %126, %133
  store double %134, double* %125, align 8
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv92, i64 %indvars.iv.next89
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv92, i64 %indvars.iv.next89
  %138 = load double, double* %137, align 8
  %139 = load double, double* %127, align 8
  %140 = fsub double %138, %139
  %141 = fmul double %140, 5.000000e-01
  %142 = fsub double %136, %141
  store double %142, double* %135, align 8
  %exitcond104.1 = icmp eq i64 %indvars.iv.next89, 1199
  %indvars.iv.next89.1 = add nsw i64 %indvars.iv88, 2
  br i1 %exitcond104.1, label %._crit_edge40.us.unr-lcssa, label %scalar.ph139, !llvm.loop !23

._crit_edge40.us.unr-lcssa:                       ; preds = %scalar.ph139
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %scalar.ph139.prol.loopexit.unr-lcssa, %._crit_edge40.us.unr-lcssa
  %exitcond4 = icmp eq i64 %94, 1000
  br i1 %exitcond4, label %.lr.ph58.split.us.preheader, label %.lr.ph45.split.us

.lr.ph58.split.us.preheader:                      ; preds = %._crit_edge40.us
  br label %.lr.ph58.split.us

.lr.ph58.split.us:                                ; preds = %._crit_edge55.us, %.lr.ph58.split.us.preheader
  %indvars.iv99 = phi i64 [ %143, %._crit_edge55.us ], [ 0, %.lr.ph58.split.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv99, i64 0
  %scevgep114 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv99, i64 1199
  %scevgep116 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv99, i64 0
  %143 = add nuw nsw i64 %indvars.iv99, 1
  %scevgep118 = getelementptr [1200 x double], [1200 x double]* %0, i64 %143, i64 0
  %scevgep120 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv99, i64 0
  %scevgep122 = getelementptr [1200 x double], [1200 x double]* %1, i64 %143, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep118
  %bound1 = icmp ult double* %scevgep116, %scevgep114
  %found.conflict = and i1 %bound0, %bound1
  %bound0124 = icmp ult double* %scevgep, %scevgep122
  %bound1125 = icmp ult double* %scevgep120, %scevgep114
  %found.conflict126 = and i1 %bound0124, %bound1125
  %conflict.rdx = or i1 %found.conflict, %found.conflict126
  br i1 %conflict.rdx, label %._crit_edge79.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph58.split.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv99, i64 %index
  %145 = bitcast double* %144 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %145, align 8, !alias.scope !24, !noalias !27
  %146 = getelementptr double, double* %144, i64 2
  %147 = bitcast double* %146 to <2 x double>*
  %wide.load128 = load <2 x double>, <2 x double>* %147, align 8, !alias.scope !24, !noalias !27
  %148 = or i64 %index, 1
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv99, i64 %148
  %150 = bitcast double* %149 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %150, align 8, !alias.scope !30
  %151 = getelementptr double, double* %149, i64 2
  %152 = bitcast double* %151 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %152, align 8, !alias.scope !30
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv99, i64 %index
  %154 = bitcast double* %153 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %154, align 8, !alias.scope !30
  %155 = getelementptr double, double* %153, i64 2
  %156 = bitcast double* %155 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %156, align 8, !alias.scope !30
  %157 = fsub <2 x double> %wide.load129, %wide.load131
  %158 = fsub <2 x double> %wide.load130, %wide.load132
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %143, i64 %index
  %160 = bitcast double* %159 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %160, align 8, !alias.scope !31
  %161 = getelementptr double, double* %159, i64 2
  %162 = bitcast double* %161 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %162, align 8, !alias.scope !31
  %163 = fadd <2 x double> %157, %wide.load133
  %164 = fadd <2 x double> %158, %wide.load134
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv99, i64 %index
  %166 = bitcast double* %165 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %166, align 8, !alias.scope !31
  %167 = getelementptr double, double* %165, i64 2
  %168 = bitcast double* %167 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %168, align 8, !alias.scope !31
  %169 = fsub <2 x double> %163, %wide.load135
  %170 = fsub <2 x double> %164, %wide.load136
  %171 = fmul <2 x double> %169, <double 7.000000e-01, double 7.000000e-01>
  %172 = fmul <2 x double> %170, <double 7.000000e-01, double 7.000000e-01>
  %173 = fsub <2 x double> %wide.load, %171
  %174 = fsub <2 x double> %wide.load128, %172
  store <2 x double> %173, <2 x double>* %145, align 8, !alias.scope !24, !noalias !27
  store <2 x double> %174, <2 x double>* %147, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %175 = icmp eq i64 %index.next, 1196
  br i1 %175, label %._crit_edge79.preheader.loopexit, label %vector.body, !llvm.loop !32

._crit_edge79.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge79.preheader

._crit_edge79.preheader:                          ; preds = %._crit_edge79.preheader.loopexit, %.lr.ph58.split.us
  %indvars.iv95.ph = phi i64 [ 0, %.lr.ph58.split.us ], [ 1196, %._crit_edge79.preheader.loopexit ]
  br label %._crit_edge79

._crit_edge79:                                    ; preds = %._crit_edge79.preheader, %._crit_edge79
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %._crit_edge79 ], [ %indvars.iv95.ph, %._crit_edge79.preheader ]
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv99, i64 %indvars.iv95
  %177 = load double, double* %176, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv99, i64 %indvars.iv.next96
  %179 = load double, double* %178, align 8
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv99, i64 %indvars.iv95
  %181 = load double, double* %180, align 8
  %182 = fsub double %179, %181
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %143, i64 %indvars.iv95
  %184 = load double, double* %183, align 8
  %185 = fadd double %182, %184
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv95
  %187 = load double, double* %186, align 8
  %188 = fsub double %185, %187
  %189 = fmul double %188, 7.000000e-01
  %190 = fsub double %177, %189
  store double %190, double* %176, align 8
  %exitcond105 = icmp eq i64 %indvars.iv95, 1198
  br i1 %exitcond105, label %._crit_edge55.us, label %._crit_edge79, !llvm.loop !33

._crit_edge55.us:                                 ; preds = %._crit_edge79
  %exitcond5 = icmp eq i64 %143, 999
  br i1 %exitcond5, label %._crit_edge59, label %.lr.ph58.split.us

._crit_edge59:                                    ; preds = %._crit_edge55.us
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next102, 500
  br i1 %exitcond6, label %._crit_edge75, label %._crit_edge59._crit_edge

._crit_edge75:                                    ; preds = %._crit_edge59
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.lr.ph20.split.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %._crit_edge17.us, %.lr.ph20.split.us.preheader
  %indvars.iv50 = phi i64 [ 0, %.lr.ph20.split.us.preheader ], [ %indvars.iv.next51, %._crit_edge17.us ]
  %7 = mul nuw nsw i64 %indvars.iv50, 1000
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge33, %.lr.ph20.split.us
  %indvars.iv48 = phi i64 [ 0, %.lr.ph20.split.us ], [ %indvars.iv.next49, %._crit_edge33 ]
  %8 = add nuw nsw i64 %indvars.iv48, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge33

; <label>:12:                                     ; preds = %._crit_edge34
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc29 = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge34, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv50, i64 %indvars.iv48
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next49, 1200
  br i1 %exitcond4, label %._crit_edge17.us, label %._crit_edge34

._crit_edge17.us:                                 ; preds = %._crit_edge33
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next51, 1000
  br i1 %exitcond5, label %._crit_edge, label %.lr.ph20.split.us

._crit_edge:                                      ; preds = %._crit_edge17.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %._crit_edge8.us, %._crit_edge
  %indvars.iv45 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next46, %._crit_edge8.us ]
  %24 = mul nuw nsw i64 %indvars.iv45, 1000
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge36, %.lr.ph11.split.us
  %indvars.iv43 = phi i64 [ 0, %.lr.ph11.split.us ], [ %indvars.iv.next44, %._crit_edge36 ]
  %25 = add nuw nsw i64 %indvars.iv43, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge36

; <label>:29:                                     ; preds = %._crit_edge37
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc26 = call i32 @fputc(i32 10, %struct._IO_FILE* %30) #4
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %._crit_edge37, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv43
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #5
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next44, 1200
  br i1 %exitcond2, label %._crit_edge8.us, label %._crit_edge37

._crit_edge8.us:                                  ; preds = %._crit_edge36
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next46, 1000
  br i1 %exitcond3, label %._crit_edge35, label %.lr.ph11.split.us

._crit_edge35:                                    ; preds = %._crit_edge8.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %._crit_edge35
  %indvars.iv41 = phi i64 [ 0, %._crit_edge35 ], [ %indvars.iv.next42, %._crit_edge.us ]
  %39 = mul nuw nsw i64 %indvars.iv41, 1000
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge39, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph2.split.us ], [ %indvars.iv.next, %._crit_edge39 ]
  %40 = add nuw nsw i64 %indvars.iv, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge39

; <label>:44:                                     ; preds = %._crit_edge40
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %45) #4
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge40, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv41, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge40

._crit_edge.us:                                   ; preds = %._crit_edge39
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next42, 1000
  br i1 %exitcond1, label %._crit_edge38, label %.lr.ph2.split.us

._crit_edge38:                                    ; preds = %._crit_edge.us
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !7, !8}
!23 = distinct !{!23, !7, !8}
!24 = !{!25}
!25 = distinct !{!25, !26}
!26 = distinct !{!26, !"LVerDomain"}
!27 = !{!28, !29}
!28 = distinct !{!28, !26}
!29 = distinct !{!29, !26}
!30 = !{!28}
!31 = !{!29}
!32 = distinct !{!32, !7, !8}
!33 = distinct !{!33, !7, !8}
