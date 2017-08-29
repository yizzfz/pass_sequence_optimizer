; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %13

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge11

._crit_edge11:                                    ; preds = %8
  br label %13

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %12)
  br label %13

; <label>:13:                                     ; preds = %._crit_edge11, %._crit_edge, %11
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader23.lr.ph, label %.._crit_edge28_crit_edge

.._crit_edge28_crit_edge:                         ; preds = %3
  br label %._crit_edge28

.preheader23.lr.ph:                               ; preds = %3
  %5 = sitofp i32 %0 to double
  %xtraiter = and i32 %0, 1
  %.pre = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %6 = icmp eq i32 %xtraiter, 0
  %7 = icmp eq i32 %0, 1
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge26.us..preheader.us.us.preheader_crit_edge, %.preheader23.lr.ph
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge26.us..preheader.us.us.preheader_crit_edge ], [ 0, %.preheader23.lr.ph ]
  %8 = trunc i64 %indvars.iv41 to i32
  %9 = add i32 %8, %0
  br label %.preheader.us.us

._crit_edge26.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count40.pre-phi
  br i1 %exitcond44, label %._crit_edge28.loopexit, label %._crit_edge26.us..preheader.us.us.preheader_crit_edge

._crit_edge26.us..preheader.us.us.preheader_crit_edge: ; preds = %._crit_edge26.us
  br label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us..preheader.us.us_crit_edge, %.preheader.us.us.preheader
  %indvars.iv38 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next39, %._crit_edge.us.us..preheader.us.us_crit_edge ]
  %10 = trunc i64 %indvars.iv38 to i32
  %11 = add i32 %9, %10
  br i1 %6, label %.preheader.us.us..prol.loopexit_crit_edge, label %.prol.preheader

.preheader.us.us..prol.loopexit_crit_edge:        ; preds = %.preheader.us.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us.us
  %12 = sitofp i32 %11 to double
  %13 = fmul double %12, 1.000000e+01
  %14 = fdiv double %13, %5
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv38, i64 0
  store double %14, double* %15, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 0
  store double %14, double* %16, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us..prol.loopexit_crit_edge ]
  br i1 %7, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.preheader.us.us.new.preheader

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  br label %._crit_edge.us.us

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %wide.trip.count40.pre-phi = phi i64 [ %.pre, %.prol.loopexit.._crit_edge.us.us_crit_edge ], [ %wide.trip.count.1, %._crit_edge.us.us.loopexit ]
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond = icmp eq i64 %indvars.iv.next39, %wide.trip.count40.pre-phi
  br i1 %exitcond, label %._crit_edge26.us, label %._crit_edge.us.us..preheader.us.us_crit_edge

._crit_edge.us.us..preheader.us.us_crit_edge:     ; preds = %._crit_edge.us.us
  br label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new..preheader.us.us.new_crit_edge, %.preheader.us.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new..preheader.us.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %17 = trunc i64 %indvars.iv to i32
  %18 = sub i32 %11, %17
  %19 = sitofp i32 %18 to double
  %20 = fmul double %19, 1.000000e+01
  %21 = fdiv double %20, %5
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv
  store double %21, double* %22, align 8
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv
  store double %21, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %24 = trunc i64 %indvars.iv.next to i32
  %25 = sub i32 %11, %24
  %26 = sitofp i32 %25 to double
  %27 = fmul double %26, 1.000000e+01
  %28 = fdiv double %27, %5
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv.next
  store double %28, double* %29, align 8
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv.next
  store double %28, double* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new..preheader.us.us.new_crit_edge

.preheader.us.us.new..preheader.us.us.new_crit_edge: ; preds = %.preheader.us.us.new
  br label %.preheader.us.us.new

._crit_edge28.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %.._crit_edge28_crit_edge, %._crit_edge28.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %5 = add nsw i32 %1, -1
  %wide.trip.count = zext i32 %5 to i64
  %wide.trip.count137 = zext i32 %5 to i64
  %wide.trip.count142 = zext i32 %5 to i64
  %wide.trip.count150 = zext i32 %5 to i64
  %6 = icmp sgt i32 %5, 1
  %7 = icmp sgt i32 %5, 1
  br label %.preheader116

.preheader116:                                    ; preds = %._crit_edge127..preheader116_crit_edge, %4
  %.0111128 = phi i32 [ 1, %4 ], [ %86, %._crit_edge127..preheader116_crit_edge ]
  br i1 %6, label %.preheader114.preheader, label %.preheader116.._crit_edge127_crit_edge

.preheader116.._crit_edge127_crit_edge:           ; preds = %.preheader116
  br label %._crit_edge127

.preheader114.preheader:                          ; preds = %.preheader116
  br label %.preheader114

.preheader115:                                    ; preds = %._crit_edge119
  br i1 %7, label %.preheader113.preheader, label %.preheader115.._crit_edge127_crit_edge

.preheader115.._crit_edge127_crit_edge:           ; preds = %.preheader115
  br label %._crit_edge127

.preheader113.preheader:                          ; preds = %.preheader115
  br label %.preheader113

.preheader114:                                    ; preds = %._crit_edge119..preheader114_crit_edge, %.preheader114.preheader
  %indvars.iv135 = phi i64 [ %8, %._crit_edge119..preheader114_crit_edge ], [ 1, %.preheader114.preheader ]
  %8 = add nuw nsw i64 %indvars.iv135, 1
  %9 = add nsw i64 %indvars.iv135, -1
  br label %.preheader112.us

.preheader112.us:                                 ; preds = %._crit_edge.us..preheader112.us_crit_edge, %.preheader114
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %._crit_edge.us..preheader112.us_crit_edge ], [ 1, %.preheader114 ]
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %10 = add nsw i64 %indvars.iv131, -1
  br label %11

; <label>:11:                                     ; preds = %._crit_edge, %.preheader112.us
  %indvars.iv = phi i64 [ 1, %.preheader112.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %8, i64 %indvars.iv131, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %indvars.iv131, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %9, i64 %indvars.iv131, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %indvars.iv.next132, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = insertelement <2 x double> undef, double %15, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  %22 = fmul <2 x double> %21, <double 2.000000e+00, double 2.000000e+00>
  %23 = insertelement <2 x double> undef, double %13, i32 0
  %24 = insertelement <2 x double> %23, double %19, i32 1
  %25 = fsub <2 x double> %24, %22
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %10, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = insertelement <2 x double> undef, double %17, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fadd <2 x double> %29, %25
  %31 = fmul <2 x double> %30, <double 1.250000e-01, double 1.250000e-01>
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  %34 = fadd double %32, %33
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %indvars.iv131, i64 %indvars.iv.next
  %36 = load double, double* %35, align 8
  %37 = fmul double %15, 2.000000e+00
  %38 = fsub double %36, %37
  %39 = add nsw i64 %indvars.iv, -1
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %indvars.iv131, i64 %39
  %41 = load double, double* %40, align 8
  %42 = fadd double %41, %38
  %43 = fmul double %42, 1.250000e-01
  %44 = fadd double %34, %43
  %45 = fadd double %15, %44
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv135, i64 %indvars.iv131, i64 %indvars.iv
  store double %45, double* %46, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %11
  br label %11

._crit_edge.us:                                   ; preds = %11
  %exitcond134 = icmp eq i64 %indvars.iv.next132, %indvars.iv.next
  br i1 %exitcond134, label %._crit_edge119, label %._crit_edge.us..preheader112.us_crit_edge

._crit_edge.us..preheader112.us_crit_edge:        ; preds = %._crit_edge.us
  br label %.preheader112.us

._crit_edge119:                                   ; preds = %._crit_edge.us
  %exitcond138 = icmp eq i64 %8, %wide.trip.count137
  br i1 %exitcond138, label %.preheader115, label %._crit_edge119..preheader114_crit_edge

._crit_edge119..preheader114_crit_edge:           ; preds = %._crit_edge119
  br label %.preheader114

.preheader113:                                    ; preds = %._crit_edge125..preheader113_crit_edge, %.preheader113.preheader
  %indvars.iv148 = phi i64 [ %47, %._crit_edge125..preheader113_crit_edge ], [ 1, %.preheader113.preheader ]
  %47 = add nuw nsw i64 %indvars.iv148, 1
  %48 = add nsw i64 %indvars.iv148, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge123.us..preheader.us_crit_edge, %.preheader113
  %indvars.iv144 = phi i64 [ %indvars.iv.next145, %._crit_edge123.us..preheader.us_crit_edge ], [ 1, %.preheader113 ]
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %49 = add nsw i64 %indvars.iv144, -1
  br label %50

; <label>:50:                                     ; preds = %._crit_edge154, %.preheader.us
  %indvars.iv140 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next141, %._crit_edge154 ]
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %47, i64 %indvars.iv144, i64 %indvars.iv140
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %indvars.iv144, i64 %indvars.iv140
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %48, i64 %indvars.iv144, i64 %indvars.iv140
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %indvars.iv.next145, i64 %indvars.iv140
  %58 = load double, double* %57, align 8
  %59 = insertelement <2 x double> undef, double %54, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> undef, <2 x i32> zeroinitializer
  %61 = fmul <2 x double> %60, <double 2.000000e+00, double 2.000000e+00>
  %62 = insertelement <2 x double> undef, double %52, i32 0
  %63 = insertelement <2 x double> %62, double %58, i32 1
  %64 = fsub <2 x double> %63, %61
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %49, i64 %indvars.iv140
  %66 = load double, double* %65, align 8
  %67 = insertelement <2 x double> undef, double %56, i32 0
  %68 = insertelement <2 x double> %67, double %66, i32 1
  %69 = fadd <2 x double> %68, %64
  %70 = fmul <2 x double> %69, <double 1.250000e-01, double 1.250000e-01>
  %71 = extractelement <2 x double> %70, i32 0
  %72 = extractelement <2 x double> %70, i32 1
  %73 = fadd double %71, %72
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %indvars.iv144, i64 %indvars.iv.next141
  %75 = load double, double* %74, align 8
  %76 = fmul double %54, 2.000000e+00
  %77 = fsub double %75, %76
  %78 = add nsw i64 %indvars.iv140, -1
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %indvars.iv144, i64 %78
  %80 = load double, double* %79, align 8
  %81 = fadd double %80, %77
  %82 = fmul double %81, 1.250000e-01
  %83 = fadd double %73, %82
  %84 = fadd double %54, %83
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv148, i64 %indvars.iv144, i64 %indvars.iv140
  store double %84, double* %85, align 8
  %exitcond143 = icmp eq i64 %indvars.iv.next141, %wide.trip.count142
  br i1 %exitcond143, label %._crit_edge123.us, label %._crit_edge154

._crit_edge154:                                   ; preds = %50
  br label %50

._crit_edge123.us:                                ; preds = %50
  %exitcond147 = icmp eq i64 %indvars.iv.next145, %wide.trip.count142
  br i1 %exitcond147, label %._crit_edge125, label %._crit_edge123.us..preheader.us_crit_edge

._crit_edge123.us..preheader.us_crit_edge:        ; preds = %._crit_edge123.us
  br label %.preheader.us

._crit_edge125:                                   ; preds = %._crit_edge123.us
  %exitcond151 = icmp eq i64 %47, %wide.trip.count150
  br i1 %exitcond151, label %._crit_edge127.loopexit, label %._crit_edge125..preheader113_crit_edge

._crit_edge125..preheader113_crit_edge:           ; preds = %._crit_edge125
  br label %.preheader113

._crit_edge127.loopexit:                          ; preds = %._crit_edge125
  br label %._crit_edge127

._crit_edge127:                                   ; preds = %.preheader115.._crit_edge127_crit_edge, %.preheader116.._crit_edge127_crit_edge, %._crit_edge127.loopexit
  %86 = add nuw nsw i32 %.0111128, 1
  %exitcond152 = icmp eq i32 %86, 501
  br i1 %exitcond152, label %87, label %._crit_edge127..preheader116_crit_edge

._crit_edge127..preheader116_crit_edge:           ; preds = %._crit_edge127
  br label %.preheader116

; <label>:87:                                     ; preds = %._crit_edge127
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader20.lr.ph, label %.._crit_edge25_crit_edge

.._crit_edge25_crit_edge:                         ; preds = %2
  br label %._crit_edge25

.preheader20.lr.ph:                               ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge23.us..preheader.us.us.preheader_crit_edge, %.preheader20.lr.ph
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge23.us..preheader.us.us.preheader_crit_edge ], [ 0, %.preheader20.lr.ph ]
  %9 = mul nsw i64 %indvars.iv39, %8
  %10 = trunc i64 %9 to i32
  br label %.preheader.us.us

._crit_edge23.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %indvars.iv.next
  br i1 %exitcond42, label %._crit_edge25.loopexit, label %._crit_edge23.us..preheader.us.us.preheader_crit_edge

._crit_edge23.us..preheader.us.us.preheader_crit_edge: ; preds = %._crit_edge23.us
  br label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us..preheader.us.us_crit_edge, %.preheader.us.us.preheader
  %indvars.iv35 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next36, %._crit_edge.us.us..preheader.us.us_crit_edge ]
  %11 = trunc i64 %indvars.iv35 to i32
  %12 = add i32 %11, %10
  %13 = mul i32 %12, %0
  %14 = zext i32 %13 to i64
  br label %15

._crit_edge.us.us:                                ; preds = %22
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, %indvars.iv.next
  br i1 %exitcond38, label %._crit_edge23.us, label %._crit_edge.us.us..preheader.us.us_crit_edge

._crit_edge.us.us..preheader.us.us_crit_edge:     ; preds = %._crit_edge.us.us
  br label %.preheader.us.us

; <label>:15:                                     ; preds = %._crit_edge43, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge43 ], [ 0, %.preheader.us.us ]
  %16 = add i64 %indvars.iv, %14
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 20
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %._crit_edge

._crit_edge:                                      ; preds = %15
  br label %22

; <label>:20:                                     ; preds = %15
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %21) #5
  br label %22

; <label>:22:                                     ; preds = %._crit_edge, %20
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %25) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %._crit_edge43

._crit_edge43:                                    ; preds = %22
  br label %15

._crit_edge25.loopexit:                           ; preds = %._crit_edge23.us
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %.._crit_edge25_crit_edge, %._crit_edge25.loopexit
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
