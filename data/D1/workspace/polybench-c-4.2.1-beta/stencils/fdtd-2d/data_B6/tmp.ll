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
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge25

.._crit_edge_crit_edge25:                         ; preds = %12
  br label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge25, %.._crit_edge_crit_edge, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) #2 {
.lr.ph28.preheader:
  br label %.lr.ph28.prol

.lr.ph28.prol:                                    ; preds = %.lr.ph28.prol..lr.ph28.prol_crit_edge, %.lr.ph28.preheader
  %indvars.iv35.prol = phi i64 [ 0, %.lr.ph28.preheader ], [ %indvars.iv.next36.prol, %.lr.ph28.prol..lr.ph28.prol_crit_edge ]
  %prol.iter = phi i32 [ 4, %.lr.ph28.preheader ], [ %prol.iter.sub, %.lr.ph28.prol..lr.ph28.prol_crit_edge ]
  %7 = trunc i64 %indvars.iv35.prol to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %6, i64 %indvars.iv35.prol
  store double %8, double* %9, align 8
  %indvars.iv.next36.prol = add nuw nsw i64 %indvars.iv35.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph28.preheader40, label %.lr.ph28.prol..lr.ph28.prol_crit_edge, !llvm.loop !1

.lr.ph28.prol..lr.ph28.prol_crit_edge:            ; preds = %.lr.ph28.prol
  br label %.lr.ph28.prol

.lr.ph28.preheader40:                             ; preds = %.lr.ph28.prol
  br label %.lr.ph28

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %10 = trunc i64 %indvars.iv30 to i32
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge_crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %14 = trunc i64 %indvars.iv.next to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv30, i64 %indvars.iv
  %17 = add nuw nsw i64 %indvars.iv, 2
  %18 = trunc i64 %17 to i32
  %19 = sitofp i32 %18 to double
  %20 = insertelement <2 x double> undef, double %15, i32 0
  %21 = insertelement <2 x double> %20, double %19, i32 1
  %22 = fmul <2 x double> %13, %21
  %23 = fdiv <2 x double> %22, <double 1.000000e+03, double 1.200000e+03>
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  store double %24, double* %16, align 8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv
  store double %25, double* %26, align 8
  %27 = add nuw nsw i64 %indvars.iv, 3
  %28 = trunc i64 %27 to i32
  %29 = sitofp i32 %28 to double
  %30 = fmul double %11, %29
  %31 = fdiv double %30, 1.000000e+03
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv30, i64 %indvars.iv
  store double %31, double* %32, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, 1000
  br i1 %exitcond33, label %._crit_edge25, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

.lr.ph28:                                         ; preds = %.lr.ph28..lr.ph28_crit_edge, %.lr.ph28.preheader40
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.7, %.lr.ph28..lr.ph28_crit_edge ], [ %indvars.iv.next36.prol, %.lr.ph28.preheader40 ]
  %33 = trunc i64 %indvars.iv35 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %6, i64 %indvars.iv35
  store double %34, double* %35, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %36 = trunc i64 %indvars.iv.next36 to i32
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next36
  store double %37, double* %38, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  %39 = trunc i64 %indvars.iv.next36.1 to i32
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next36.1
  store double %40, double* %41, align 8
  %indvars.iv.next36.2 = add nsw i64 %indvars.iv35, 3
  %42 = trunc i64 %indvars.iv.next36.2 to i32
  %43 = sitofp i32 %42 to double
  %44 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next36.2
  store double %43, double* %44, align 8
  %indvars.iv.next36.3 = add nsw i64 %indvars.iv35, 4
  %45 = trunc i64 %indvars.iv.next36.3 to i32
  %46 = sitofp i32 %45 to double
  %47 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next36.3
  store double %46, double* %47, align 8
  %indvars.iv.next36.4 = add nsw i64 %indvars.iv35, 5
  %48 = trunc i64 %indvars.iv.next36.4 to i32
  %49 = sitofp i32 %48 to double
  %50 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next36.4
  store double %49, double* %50, align 8
  %indvars.iv.next36.5 = add nsw i64 %indvars.iv35, 6
  %51 = trunc i64 %indvars.iv.next36.5 to i32
  %52 = sitofp i32 %51 to double
  %53 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next36.5
  store double %52, double* %53, align 8
  %indvars.iv.next36.6 = add nsw i64 %indvars.iv35, 7
  %54 = trunc i64 %indvars.iv.next36.6 to i32
  %55 = sitofp i32 %54 to double
  %56 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next36.6
  store double %55, double* %56, align 8
  %indvars.iv.next36.7 = add nsw i64 %indvars.iv35, 8
  %exitcond38.7 = icmp eq i64 %indvars.iv.next36.7, 500
  br i1 %exitcond38.7, label %.preheader.us.preheader, label %.lr.ph28..lr.ph28_crit_edge

.lr.ph28..lr.ph28_crit_edge:                      ; preds = %.lr.ph28
  br label %.lr.ph28

.preheader.us.preheader:                          ; preds = %.lr.ph28
  br label %.preheader.us

._crit_edge25:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture readonly) #2 {
.preheader73.lr.ph:
  br label %.preheader73

.preheader73:                                     ; preds = %._crit_edge86..preheader73_crit_edge, %.preheader73.lr.ph
  %indvars.iv125 = phi i64 [ 0, %.preheader73.lr.ph ], [ %indvars.iv.next126, %._crit_edge86..preheader73_crit_edge ]
  %7 = getelementptr inbounds double, double* %6, i64 %indvars.iv125
  %8 = bitcast double* %7 to i64*
  br label %.lr.ph.new

.preheader69.us:                                  ; preds = %._crit_edge.us..preheader69.us_crit_edge, %.preheader69.us.preheader
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %._crit_edge.us..preheader69.us_crit_edge ], [ 1, %.preheader69.us.preheader ]
  %9 = add nsw i64 %indvars.iv100, -1
  br label %.preheader69.us.new

.preheader69.us.new:                              ; preds = %.preheader69.us.new..preheader69.us.new_crit_edge, %.preheader69.us
  %indvars.iv92 = phi i64 [ 0, %.preheader69.us ], [ %indvars.iv.next93.1, %.preheader69.us.new..preheader69.us.new_crit_edge ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %indvars.iv92
  %11 = load double, double* %10, align 8
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv100, i64 %indvars.iv92
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %9, i64 %indvars.iv92
  %15 = load double, double* %14, align 8
  %16 = fsub double %13, %15
  %17 = fmul double %16, 5.000000e-01
  %18 = fsub double %11, %17
  store double %18, double* %10, align 8
  %indvars.iv.next93 = or i64 %indvars.iv92, 1
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %indvars.iv.next93
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv100, i64 %indvars.iv.next93
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %9, i64 %indvars.iv.next93
  %24 = load double, double* %23, align 8
  %25 = fsub double %22, %24
  %26 = fmul double %25, 5.000000e-01
  %27 = fsub double %20, %26
  store double %27, double* %19, align 8
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next93.1, 1200
  br i1 %exitcond.1, label %._crit_edge.us, label %.preheader69.us.new..preheader69.us.new_crit_edge

.preheader69.us.new..preheader69.us.new_crit_edge: ; preds = %.preheader69.us.new
  br label %.preheader69.us.new

._crit_edge.us:                                   ; preds = %.preheader69.us.new
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond = icmp eq i64 %indvars.iv.next101, 1000
  br i1 %exitcond, label %.preheader68.us.preheader, label %._crit_edge.us..preheader69.us_crit_edge

._crit_edge.us..preheader69.us_crit_edge:         ; preds = %._crit_edge.us
  br label %.preheader69.us

.preheader68.us.preheader:                        ; preds = %._crit_edge.us
  br label %.preheader68.us

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.preheader73
  %indvars.iv = phi i64 [ 0, %.preheader73 ], [ %indvars.iv.next.7, %.lr.ph.new..lr.ph.new_crit_edge ]
  %28 = load i64, i64* %8, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %30 = bitcast double* %29 to i64*
  store i64 %28, i64* %30, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %31 = load i64, i64* %8, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %33 = bitcast double* %32 to i64*
  store i64 %31, i64* %33, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %34 = load i64, i64* %8, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %36 = bitcast double* %35 to i64*
  store i64 %34, i64* %36, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %37 = load i64, i64* %8, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %40 = load i64, i64* %8, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %42 = bitcast double* %41 to i64*
  store i64 %40, i64* %42, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %43 = load i64, i64* %8, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %45 = bitcast double* %44 to i64*
  store i64 %43, i64* %45, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %46 = load i64, i64* %8, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %48 = bitcast double* %47 to i64*
  store i64 %46, i64* %48, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %49 = load i64, i64* %8, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader69.us.preheader, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

.preheader69.us.preheader:                        ; preds = %.lr.ph.new
  br label %.preheader69.us

.preheader68.us:                                  ; preds = %._crit_edge80.us..preheader68.us_crit_edge, %.preheader68.us.preheader
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge80.us..preheader68.us_crit_edge ], [ 0, %.preheader68.us.preheader ]
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 1
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 1
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 0
  %57 = load double, double* %56, align 8
  %58 = fsub double %55, %57
  %59 = fmul double %58, 5.000000e-01
  %60 = fsub double %53, %59
  store double %60, double* %52, align 8
  br label %.preheader68.us.new

.preheader68.us.new:                              ; preds = %.preheader68.us.new..preheader68.us.new_crit_edge, %.preheader68.us
  %indvars.iv104 = phi i64 [ 2, %.preheader68.us ], [ %indvars.iv.next105.1, %.preheader68.us.new..preheader68.us.new_crit_edge ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 %indvars.iv104
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 %indvars.iv104
  %64 = load double, double* %63, align 8
  %65 = add nsw i64 %indvars.iv104, -1
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 %65
  %67 = load double, double* %66, align 8
  %68 = fsub double %64, %67
  %69 = fmul double %68, 5.000000e-01
  %70 = fsub double %62, %69
  store double %70, double* %61, align 8
  %indvars.iv.next105 = or i64 %indvars.iv104, 1
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 %indvars.iv.next105
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 %indvars.iv.next105
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 %indvars.iv104
  %76 = load double, double* %75, align 8
  %77 = fsub double %74, %76
  %78 = fmul double %77, 5.000000e-01
  %79 = fsub double %72, %78
  store double %79, double* %71, align 8
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  %exitcond107.1 = icmp eq i64 %indvars.iv.next105.1, 1200
  br i1 %exitcond107.1, label %._crit_edge80.us, label %.preheader68.us.new..preheader68.us.new_crit_edge

.preheader68.us.new..preheader68.us.new_crit_edge: ; preds = %.preheader68.us.new
  br label %.preheader68.us.new

._crit_edge80.us:                                 ; preds = %.preheader68.us.new
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next113, 1000
  br i1 %exitcond115, label %.preheader.us.preheader, label %._crit_edge80.us..preheader68.us_crit_edge

._crit_edge80.us..preheader68.us_crit_edge:       ; preds = %._crit_edge80.us
  br label %.preheader68.us

.preheader.us.preheader:                          ; preds = %._crit_edge80.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge84.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %._crit_edge84.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader.us
  %indvars.iv117 = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next118, %._crit_edge.._crit_edge_crit_edge ]
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv121, i64 %indvars.iv117
  %81 = load double, double* %80, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 %indvars.iv.next118
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 %indvars.iv117
  %85 = load double, double* %84, align 8
  %86 = fsub double %83, %85
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next122, i64 %indvars.iv117
  %88 = load double, double* %87, align 8
  %89 = fadd double %86, %88
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv121, i64 %indvars.iv117
  %91 = load double, double* %90, align 8
  %92 = fsub double %89, %91
  %93 = fmul double %92, 7.000000e-01
  %94 = fsub double %81, %93
  store double %94, double* %80, align 8
  %exitcond120 = icmp eq i64 %indvars.iv.next118, 1199
  br i1 %exitcond120, label %._crit_edge84.us, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge84.us:                                 ; preds = %._crit_edge
  %exitcond124 = icmp eq i64 %indvars.iv.next122, 999
  br i1 %exitcond124, label %._crit_edge86, label %._crit_edge84.us..preheader.us_crit_edge

._crit_edge84.us..preheader.us_crit_edge:         ; preds = %._crit_edge84.us
  br label %.preheader.us

._crit_edge86:                                    ; preds = %._crit_edge84.us
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next126, 500
  br i1 %exitcond128, label %._crit_edge88, label %._crit_edge86..preheader73_crit_edge

._crit_edge86..preheader73_crit_edge:             ; preds = %._crit_edge86
  br label %.preheader73

._crit_edge88:                                    ; preds = %._crit_edge86
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #0 {
.preheader38.us.preheader:
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader38.us

.preheader38.us:                                  ; preds = %._crit_edge49.us..preheader38.us_crit_edge, %.preheader38.us.preheader
  %indvars.iv73 = phi i64 [ 0, %.preheader38.us.preheader ], [ %indvars.iv.next74, %._crit_edge49.us..preheader38.us_crit_edge ]
  %9 = mul nsw i64 %indvars.iv73, 1000
  br label %._crit_edge80

._crit_edge80:                                    ; preds = %._crit_edge.._crit_edge80_crit_edge, %.preheader38.us
  %indvars.iv69 = phi i64 [ 0, %.preheader38.us ], [ %indvars.iv.next70, %._crit_edge.._crit_edge80_crit_edge ]
  %10 = add nsw i64 %indvars.iv69, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge80.._crit_edge_crit_edge

._crit_edge80.._crit_edge_crit_edge:              ; preds = %._crit_edge80
  br label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge80
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge80.._crit_edge_crit_edge, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv73, i64 %indvars.iv69
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, 1200
  br i1 %exitcond72, label %._crit_edge49.us, label %._crit_edge.._crit_edge80_crit_edge

._crit_edge.._crit_edge80_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge80

._crit_edge49.us:                                 ; preds = %._crit_edge
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, 1000
  br i1 %exitcond76, label %._crit_edge51, label %._crit_edge49.us..preheader38.us_crit_edge

._crit_edge49.us..preheader38.us_crit_edge:       ; preds = %._crit_edge49.us
  br label %.preheader38.us

._crit_edge51:                                    ; preds = %._crit_edge49.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader37.us

.preheader37.us:                                  ; preds = %._crit_edge44.us..preheader37.us_crit_edge, %._crit_edge51
  %indvars.iv64 = phi i64 [ 0, %._crit_edge51 ], [ %indvars.iv.next65, %._crit_edge44.us..preheader37.us_crit_edge ]
  %26 = mul nsw i64 %indvars.iv64, 1000
  br label %._crit_edge82

._crit_edge82:                                    ; preds = %._crit_edge81.._crit_edge82_crit_edge, %.preheader37.us
  %indvars.iv60 = phi i64 [ 0, %.preheader37.us ], [ %indvars.iv.next61, %._crit_edge81.._crit_edge82_crit_edge ]
  %27 = add nsw i64 %indvars.iv60, %26
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 20
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %._crit_edge82.._crit_edge81_crit_edge

._crit_edge82.._crit_edge81_crit_edge:            ; preds = %._crit_edge82
  br label %._crit_edge81

; <label>:31:                                     ; preds = %._crit_edge82
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %32) #5
  br label %._crit_edge81

._crit_edge81:                                    ; preds = %._crit_edge82.._crit_edge81_crit_edge, %31
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv64, i64 %indvars.iv60
  %35 = load double, double* %34, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %35) #6
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, 1200
  br i1 %exitcond63, label %._crit_edge44.us, label %._crit_edge81.._crit_edge82_crit_edge

._crit_edge81.._crit_edge82_crit_edge:            ; preds = %._crit_edge81
  br label %._crit_edge82

._crit_edge44.us:                                 ; preds = %._crit_edge81
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, 1000
  br i1 %exitcond67, label %._crit_edge46, label %._crit_edge44.us..preheader37.us_crit_edge

._crit_edge44.us..preheader37.us_crit_edge:       ; preds = %._crit_edge44.us
  br label %.preheader37.us

._crit_edge46:                                    ; preds = %._crit_edge44.us
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %._crit_edge46
  %indvars.iv55 = phi i64 [ 0, %._crit_edge46 ], [ %indvars.iv.next56, %._crit_edge.us..preheader.us_crit_edge ]
  %41 = mul nsw i64 %indvars.iv55, 1000
  br label %._crit_edge84

._crit_edge84:                                    ; preds = %._crit_edge83.._crit_edge84_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge83.._crit_edge84_crit_edge ]
  %42 = add nsw i64 %indvars.iv, %41
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, 20
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %._crit_edge84.._crit_edge83_crit_edge

._crit_edge84.._crit_edge83_crit_edge:            ; preds = %._crit_edge84
  br label %._crit_edge83

; <label>:46:                                     ; preds = %._crit_edge84
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %47) #5
  br label %._crit_edge83

._crit_edge83:                                    ; preds = %._crit_edge84.._crit_edge83_crit_edge, %46
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %50) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge83.._crit_edge84_crit_edge

._crit_edge83.._crit_edge84_crit_edge:            ; preds = %._crit_edge83
  br label %._crit_edge84

._crit_edge.us:                                   ; preds = %._crit_edge83
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 1000
  br i1 %exitcond58, label %._crit_edge41, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge41:                                    ; preds = %._crit_edge.us
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
