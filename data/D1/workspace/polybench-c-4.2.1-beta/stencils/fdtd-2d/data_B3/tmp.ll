; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
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
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
.lr.ph36.preheader:
  br label %.lr.ph36

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %4 = trunc i64 %indvars.iv38 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %8 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %9 = trunc i64 %indvars.iv.next to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv
  %12 = add nuw nsw i64 %indvars.iv, 2
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fmul <2 x double> %7, %16
  %18 = fdiv <2 x double> %17, <double 1.000000e+03, double 1.200000e+03>
  %19 = extractelement <2 x double> %18, i32 0
  %20 = extractelement <2 x double> %18, i32 1
  store double %19, double* %11, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv
  store double %20, double* %21, align 8
  %22 = add nuw nsw i64 %indvars.iv, 3
  %23 = trunc i64 %22 to i32
  %24 = sitofp i32 %23 to double
  %25 = fmul double %5, %24
  %26 = fdiv double %25, 1.000000e+03
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv
  store double %26, double* %27, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next39, 1000
  br i1 %exitcond40, label %._crit_edge33, label %.preheader.us

.lr.ph36:                                         ; preds = %.lr.ph36, %.lr.ph36.preheader
  %indvars.iv42 = phi i64 [ 0, %.lr.ph36.preheader ], [ %indvars.iv.next43.4, %.lr.ph36 ]
  %28 = trunc i64 %indvars.iv42 to i32
  %29 = sitofp i32 %28 to double
  %30 = getelementptr inbounds double, double* %3, i64 %indvars.iv42
  store double %29, double* %30, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %31 = trunc i64 %indvars.iv.next43 to i32
  %32 = sitofp i32 %31 to double
  %33 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next43
  store double %32, double* %33, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %34 = trunc i64 %indvars.iv.next43.1 to i32
  %35 = sitofp i32 %34 to double
  %36 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next43.1
  store double %35, double* %36, align 8
  %indvars.iv.next43.2 = add nsw i64 %indvars.iv42, 3
  %37 = trunc i64 %indvars.iv.next43.2 to i32
  %38 = sitofp i32 %37 to double
  %39 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next43.2
  store double %38, double* %39, align 8
  %indvars.iv.next43.3 = add nsw i64 %indvars.iv42, 4
  %40 = trunc i64 %indvars.iv.next43.3 to i32
  %41 = sitofp i32 %40 to double
  %42 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next43.3
  store double %41, double* %42, align 8
  %indvars.iv.next43.4 = add nsw i64 %indvars.iv42, 5
  %exitcond44.4 = icmp eq i64 %indvars.iv.next43.4, 500
  br i1 %exitcond44.4, label %.preheader.us.preheader, label %.lr.ph36

.preheader.us.preheader:                          ; preds = %.lr.ph36
  br label %.preheader.us

._crit_edge33:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
.preheader78.lr.ph:
  br label %.lr.ph

.lr.ph:                                           ; preds = %.preheader78.lr.ph, %._crit_edge91
  %indvars.iv115 = phi i64 [ 0, %.preheader78.lr.ph ], [ %indvars.iv.next116, %._crit_edge91 ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv115
  %5 = bitcast double* %4 to i64*
  br label %45

.preheader74.us:                                  ; preds = %.preheader74.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %6, %._crit_edge.us ], [ 0, %.preheader74.us.preheader ]
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %._crit_edge.us ], [ 1, %.preheader74.us.preheader ]
  %6 = add i64 %indvar, 1
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %1, i64 %6, i64 0
  %7 = add i64 %indvar, 2
  %scevgep72 = getelementptr [1200 x double], [1200 x double]* %1, i64 %7, i64 0
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep76 = getelementptr [1200 x double], [1200 x double]* %2, i64 %7, i64 0
  %8 = add nsw i64 %indvars.iv99, -1
  %bound078 = icmp ult double* %scevgep70, %scevgep76
  %bound179 = icmp ult double* %scevgep74, %scevgep72
  %memcheck.conflict81 = and i1 %bound078, %bound179
  br i1 %memcheck.conflict81, label %scalar.ph67.preheader, label %vector.body65.preheader

vector.body65.preheader:                          ; preds = %.preheader74.us
  br label %vector.body65

scalar.ph67.preheader:                            ; preds = %.preheader74.us
  br label %scalar.ph67

vector.body65:                                    ; preds = %vector.body65.preheader, %vector.body65
  %index84 = phi i64 [ %index.next85, %vector.body65 ], [ 0, %vector.body65.preheader ]
  %offset.idx88 = shl i64 %index84, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv99, i64 %offset.idx88
  %10 = bitcast double* %9 to <4 x double>*
  %wide.vec92 = load <4 x double>, <4 x double>* %10, align 8, !alias.scope !1, !noalias !4
  %strided.vec93 = shufflevector <4 x double> %wide.vec92, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec94 = shufflevector <4 x double> %wide.vec92, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv99, i64 %offset.idx88
  %12 = bitcast double* %11 to <4 x double>*
  %wide.vec95 = load <4 x double>, <4 x double>* %12, align 8, !alias.scope !4
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %8, i64 %offset.idx88
  %14 = bitcast double* %13 to <4 x double>*
  %wide.vec98 = load <4 x double>, <4 x double>* %14, align 8, !alias.scope !4
  %15 = fsub <4 x double> %wide.vec95, %wide.vec98
  %16 = shufflevector <4 x double> %15, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fsub <2 x double> %strided.vec93, %17
  %19 = or i64 %offset.idx88, 1
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv99, i64 %19
  %21 = shufflevector <4 x double> %15, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %22 = fmul <2 x double> %21, <double 5.000000e-01, double 5.000000e-01>
  %23 = fsub <2 x double> %strided.vec94, %22
  %24 = getelementptr double, double* %20, i64 -1
  %25 = bitcast double* %24 to <4 x double>*
  %interleaved.vec101 = shufflevector <2 x double> %18, <2 x double> %23, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec101, <4 x double>* %25, align 8, !alias.scope !1, !noalias !4
  %index.next85 = add i64 %index84, 2
  %26 = icmp eq i64 %index.next85, 600
  br i1 %26, label %._crit_edge.us.loopexit102, label %vector.body65, !llvm.loop !6

scalar.ph67:                                      ; preds = %scalar.ph67.preheader, %scalar.ph67
  %indvars.iv97 = phi i64 [ %indvars.iv.next98.1, %scalar.ph67 ], [ 0, %scalar.ph67.preheader ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv97
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv99, i64 %indvars.iv97
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %8, i64 %indvars.iv97
  %32 = load double, double* %31, align 8
  %33 = fsub double %30, %32
  %34 = fmul double %33, 5.000000e-01
  %35 = fsub double %28, %34
  store double %35, double* %27, align 8
  %indvars.iv.next98 = or i64 %indvars.iv97, 1
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv.next98
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv99, i64 %indvars.iv.next98
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %8, i64 %indvars.iv.next98
  %41 = load double, double* %40, align 8
  %42 = fsub double %39, %41
  %43 = fmul double %42, 5.000000e-01
  %44 = fsub double %37, %43
  store double %44, double* %36, align 8
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next98.1, 1200
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %scalar.ph67, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph67
  br label %._crit_edge.us

._crit_edge.us.loopexit102:                       ; preds = %vector.body65
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit102, %._crit_edge.us.loopexit
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond = icmp eq i64 %indvars.iv.next100, 1000
  br i1 %exitcond, label %.preheader73.us.preheader, label %.preheader74.us

.preheader73.us.preheader:                        ; preds = %._crit_edge.us
  br label %.preheader73.us

; <label>:45:                                     ; preds = %45, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.7, %45 ]
  %46 = load i64, i64* %5, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %48 = bitcast double* %47 to i64*
  store i64 %46, i64* %48, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %49 = load i64, i64* %5, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %52 = load i64, i64* %5, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %55 = load i64, i64* %5, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %57 = bitcast double* %56 to i64*
  store i64 %55, i64* %57, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %58 = load i64, i64* %5, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %61 = load i64, i64* %5, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %64 = load i64, i64* %5, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %67 = load i64, i64* %5, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader74.us.preheader, label %45

.preheader74.us.preheader:                        ; preds = %45
  br label %.preheader74.us

.preheader73.us:                                  ; preds = %.preheader73.us.preheader, %._crit_edge85.us
  %indvars.iv105 = phi i64 [ %70, %._crit_edge85.us ], [ 0, %.preheader73.us.preheader ]
  %scevgep32 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv105, i64 2
  %70 = add i64 %indvars.iv105, 1
  %scevgep34 = getelementptr [1200 x double], [1200 x double]* %0, i64 %70, i64 0
  %scevgep36 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv105, i64 1
  %scevgep38 = getelementptr [1200 x double], [1200 x double]* %2, i64 %70, i64 0
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv105, i64 1
  %72 = load double, double* %71, align 8
  %73 = load double, double* %scevgep36, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv105, i64 0
  %75 = load double, double* %74, align 8
  %76 = fsub double %73, %75
  %77 = fmul double %76, 5.000000e-01
  %78 = fsub double %72, %77
  store double %78, double* %71, align 8
  %bound040 = icmp ult double* %scevgep32, %scevgep38
  %bound141 = icmp ult double* %scevgep36, %scevgep34
  %memcheck.conflict43 = and i1 %bound040, %bound141
  br i1 %memcheck.conflict43, label %scalar.ph29.preheader, label %vector.body27.preheader

vector.body27.preheader:                          ; preds = %.preheader73.us
  br label %vector.body27

scalar.ph29.preheader.loopexit:                   ; preds = %vector.body27
  br label %scalar.ph29.preheader

scalar.ph29.preheader:                            ; preds = %scalar.ph29.preheader.loopexit, %.preheader73.us
  %indvars.iv.next1032.ph = phi i64 [ 2, %.preheader73.us ], [ 1198, %scalar.ph29.preheader.loopexit ]
  %indvars.iv1021.ph = phi i64 [ 1, %.preheader73.us ], [ 1197, %scalar.ph29.preheader.loopexit ]
  br label %scalar.ph29

vector.body27:                                    ; preds = %vector.body27.preheader, %vector.body27
  %index46 = phi i64 [ %index.next47, %vector.body27 ], [ 0, %vector.body27.preheader ]
  %79 = shl i64 %index46, 1
  %offset.idx = or i64 %79, 2
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv105, i64 %offset.idx
  %81 = bitcast double* %80 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %81, align 8, !alias.scope !10, !noalias !13
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec58 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv105, i64 %offset.idx
  %83 = getelementptr double, double* %82, i64 -1
  %84 = bitcast double* %83 to <4 x double>*
  %wide.vec59 = load <4 x double>, <4 x double>* %84, align 8, !alias.scope !13
  %strided.vec60 = shufflevector <4 x double> %wide.vec59, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec61 = shufflevector <4 x double> %wide.vec59, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %85 = fsub <2 x double> %strided.vec61, %strided.vec60
  %86 = fmul <2 x double> %85, <double 5.000000e-01, double 5.000000e-01>
  %87 = fsub <2 x double> %strided.vec, %86
  %88 = or i64 %79, 3
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv105, i64 %88
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv105, i64 %88
  %91 = getelementptr double, double* %90, i64 -1
  %92 = bitcast double* %91 to <4 x double>*
  %wide.vec62 = load <4 x double>, <4 x double>* %92, align 8, !alias.scope !13
  %strided.vec63 = shufflevector <4 x double> %wide.vec62, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec64 = shufflevector <4 x double> %wide.vec62, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %93 = fsub <2 x double> %strided.vec64, %strided.vec63
  %94 = fmul <2 x double> %93, <double 5.000000e-01, double 5.000000e-01>
  %95 = fsub <2 x double> %strided.vec58, %94
  %96 = getelementptr double, double* %89, i64 -1
  %97 = bitcast double* %96 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %87, <2 x double> %95, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %97, align 8, !alias.scope !10, !noalias !13
  %index.next47 = add i64 %index46, 2
  %98 = icmp eq i64 %index.next47, 598
  br i1 %98, label %scalar.ph29.preheader.loopexit, label %vector.body27, !llvm.loop !15

._crit_edge85.us:                                 ; preds = %scalar.ph29
  %exitcond107 = icmp eq i64 %70, 1000
  br i1 %exitcond107, label %.preheader.us.preheader, label %.preheader73.us

.preheader.us.preheader:                          ; preds = %._crit_edge85.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge89.us
  %indvars.iv112 = phi i64 [ %99, %._crit_edge89.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 0
  %scevgep4 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 1199
  %scevgep6 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv112, i64 0
  %99 = add i64 %indvars.iv112, 1
  %scevgep8 = getelementptr [1200 x double], [1200 x double]* %0, i64 %99, i64 0
  %scevgep10 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv112, i64 0
  %scevgep12 = getelementptr [1200 x double], [1200 x double]* %1, i64 %99, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %found.conflict = and i1 %bound0, %bound1
  %bound014 = icmp ult double* %scevgep, %scevgep12
  %bound115 = icmp ult double* %scevgep10, %scevgep4
  %found.conflict16 = and i1 %bound014, %bound115
  %conflict.rdx = or i1 %found.conflict, %found.conflict16
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 %index
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !16, !noalias !19
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !16, !noalias !19
  %104 = or i64 %index, 1
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv112, i64 %104
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !22
  %107 = getelementptr double, double* %105, i64 2
  %108 = bitcast double* %107 to <2 x double>*
  %wide.load20 = load <2 x double>, <2 x double>* %108, align 8, !alias.scope !22
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv112, i64 %index
  %110 = bitcast double* %109 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %110, align 8, !alias.scope !22
  %111 = getelementptr double, double* %109, i64 2
  %112 = bitcast double* %111 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %112, align 8, !alias.scope !22
  %113 = fsub <2 x double> %wide.load19, %wide.load21
  %114 = fsub <2 x double> %wide.load20, %wide.load22
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %99, i64 %index
  %116 = bitcast double* %115 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %116, align 8, !alias.scope !23
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !23
  %119 = fadd <2 x double> %113, %wide.load23
  %120 = fadd <2 x double> %114, %wide.load24
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv112, i64 %index
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load25 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !23
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load26 = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !23
  %125 = fsub <2 x double> %119, %wide.load25
  %126 = fsub <2 x double> %120, %wide.load26
  %127 = fmul <2 x double> %125, <double 7.000000e-01, double 7.000000e-01>
  %128 = fmul <2 x double> %126, <double 7.000000e-01, double 7.000000e-01>
  %129 = fsub <2 x double> %wide.load, %127
  %130 = fsub <2 x double> %wide.load18, %128
  store <2 x double> %129, <2 x double>* %101, align 8, !alias.scope !16, !noalias !19
  store <2 x double> %130, <2 x double>* %103, align 8, !alias.scope !16, !noalias !19
  %index.next = add i64 %index, 4
  %131 = icmp eq i64 %index.next, 1196
  br i1 %131, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !24

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %.preheader.us
  %indvars.iv109.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %scalar.ph ], [ %indvars.iv109.ph, %scalar.ph.preheader ]
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112, i64 %indvars.iv109
  %133 = load double, double* %132, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv112, i64 %indvars.iv.next110
  %135 = load double, double* %134, align 8
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv112, i64 %indvars.iv109
  %137 = load double, double* %136, align 8
  %138 = fsub double %135, %137
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %99, i64 %indvars.iv109
  %140 = load double, double* %139, align 8
  %141 = fadd double %138, %140
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv112, i64 %indvars.iv109
  %143 = load double, double* %142, align 8
  %144 = fsub double %141, %143
  %145 = fmul double %144, 7.000000e-01
  %146 = fsub double %133, %145
  store double %146, double* %132, align 8
  %exitcond111 = icmp eq i64 %indvars.iv.next110, 1199
  br i1 %exitcond111, label %._crit_edge89.us, label %scalar.ph, !llvm.loop !25

._crit_edge89.us:                                 ; preds = %scalar.ph
  %exitcond114 = icmp eq i64 %99, 999
  br i1 %exitcond114, label %._crit_edge91, label %.preheader.us

._crit_edge91:                                    ; preds = %._crit_edge89.us
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next116, 500
  br i1 %exitcond117, label %._crit_edge93, label %.lr.ph

._crit_edge93:                                    ; preds = %._crit_edge91
  ret void

scalar.ph29:                                      ; preds = %scalar.ph29.preheader, %scalar.ph29
  %indvars.iv.next1032 = phi i64 [ %indvars.iv.next103, %scalar.ph29 ], [ %indvars.iv.next1032.ph, %scalar.ph29.preheader ]
  %indvars.iv1021 = phi i64 [ %indvars.iv.next103.1, %scalar.ph29 ], [ %indvars.iv1021.ph, %scalar.ph29.preheader ]
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv105, i64 %indvars.iv.next1032
  %148 = load double, double* %147, align 8
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv105, i64 %indvars.iv.next1032
  %150 = load double, double* %149, align 8
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv105, i64 %indvars.iv1021
  %152 = load double, double* %151, align 8
  %153 = fsub double %150, %152
  %154 = fmul double %153, 5.000000e-01
  %155 = fsub double %148, %154
  store double %155, double* %147, align 8
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv1021, 2
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv105, i64 %indvars.iv.next103.1
  %157 = load double, double* %156, align 8
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv105, i64 %indvars.iv.next103.1
  %159 = load double, double* %158, align 8
  %160 = add nsw i64 %indvars.iv1021, 1
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv105, i64 %160
  %162 = load double, double* %161, align 8
  %163 = fsub double %159, %162
  %164 = fmul double %163, 5.000000e-01
  %165 = fsub double %157, %164
  store double %165, double* %156, align 8
  %indvars.iv.next103 = add nsw i64 %indvars.iv1021, 3
  %exitcond104 = icmp eq i64 %indvars.iv.next103, 1200
  br i1 %exitcond104, label %._crit_edge85.us, label %scalar.ph29, !llvm.loop !26
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader47.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader47.us

.preheader47.us:                                  ; preds = %._crit_edge58.us, %.preheader47.us.preheader
  %indvars.iv78 = phi i64 [ 0, %.preheader47.us.preheader ], [ %indvars.iv.next79, %._crit_edge58.us ]
  %7 = mul nuw nsw i64 %indvars.iv78, 1000
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader47.us
  %indvars.iv75 = phi i64 [ 0, %.preheader47.us ], [ %indvars.iv.next76, %15 ]
  %9 = add nuw nsw i64 %indvars.iv75, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc45.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv78, i64 %indvars.iv75
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next76, 1200
  br i1 %exitcond77, label %._crit_edge58.us, label %8

._crit_edge58.us:                                 ; preds = %15
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next79, 1000
  br i1 %exitcond80, label %.preheader46.us.preheader, label %.preheader47.us

.preheader46.us.preheader:                        ; preds = %._crit_edge58.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader46.us

.preheader46.us:                                  ; preds = %._crit_edge53.us, %.preheader46.us.preheader
  %indvars.iv71 = phi i64 [ 0, %.preheader46.us.preheader ], [ %indvars.iv.next72, %._crit_edge53.us ]
  %26 = mul nuw nsw i64 %indvars.iv71, 1000
  br label %27

; <label>:27:                                     ; preds = %34, %.preheader46.us
  %indvars.iv68 = phi i64 [ 0, %.preheader46.us ], [ %indvars.iv.next69, %34 ]
  %28 = add nuw nsw i64 %indvars.iv68, %26
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %27
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc42.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #5
  br label %34

; <label>:34:                                     ; preds = %32, %27
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv68
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #6
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next69, 1200
  br i1 %exitcond70, label %._crit_edge53.us, label %27

._crit_edge53.us:                                 ; preds = %34
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next72, 1000
  br i1 %exitcond73, label %.preheader.us.preheader, label %.preheader46.us

.preheader.us.preheader:                          ; preds = %._crit_edge53.us
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv64 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next65, %._crit_edge.us ]
  %43 = mul nuw nsw i64 %indvars.iv64, 1000
  br label %44

; <label>:44:                                     ; preds = %51, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %51 ]
  %45 = add nuw nsw i64 %indvars.iv, %43
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, 20
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %51

; <label>:49:                                     ; preds = %44
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %50) #5
  br label %51

; <label>:51:                                     ; preds = %49, %44
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv64, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %54) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %44

._crit_edge.us:                                   ; preds = %51
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next65, 1000
  br i1 %exitcond66, label %._crit_edge50, label %.preheader.us

._crit_edge50:                                    ; preds = %._crit_edge.us
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

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
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20, !21}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !18}
!22 = !{!20}
!23 = !{!21}
!24 = distinct !{!24, !7, !8}
!25 = distinct !{!25, !7, !8}
!26 = distinct !{!26, !7, !8}
