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

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader23.lr.ph, label %._crit_edge30

.preheader23.lr.ph:                               ; preds = %3
  %5 = sitofp i32 %0 to double
  %xtraiter = and i32 %0, 1
  %wide.trip.count46 = zext i32 %0 to i64
  %6 = icmp eq i32 %xtraiter, 0
  %7 = icmp eq i32 %0, 1
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge26.us, %.preheader23.lr.ph
  %indvars.iv47 = phi i64 [ 0, %.preheader23.lr.ph ], [ %indvars.iv.next48, %._crit_edge26.us ]
  %8 = trunc i64 %indvars.iv47 to i32
  %9 = add i32 %8, %0
  br label %.preheader.us.us

._crit_edge26.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, %wide.trip.count46
  br i1 %exitcond50, label %._crit_edge30.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv44 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next45, %._crit_edge.us.us ]
  %10 = trunc i64 %indvars.iv44 to i32
  %11 = add i32 %9, %10
  br i1 %6, label %._crit_edge31.us.us.prol.loopexit, label %._crit_edge31.us.us.prol

._crit_edge31.us.us.prol:                         ; preds = %.preheader.us.us
  %12 = sitofp i32 %11 to double
  %13 = fmul double %12, 1.000000e+01
  %14 = fdiv double %13, %5
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv47, i64 %indvars.iv44, i64 0
  store double %14, double* %15, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv47, i64 %indvars.iv44, i64 0
  store double %14, double* %16, align 8
  br label %._crit_edge31.us.us.prol.loopexit

._crit_edge31.us.us.prol.loopexit:                ; preds = %._crit_edge31.us.us.prol, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge31.us.us.prol ], [ 0, %.preheader.us.us ]
  br i1 %7, label %._crit_edge.us.us, label %._crit_edge31.us.us.preheader

._crit_edge31.us.us.preheader:                    ; preds = %._crit_edge31.us.us.prol.loopexit
  br label %._crit_edge31.us.us

._crit_edge.us.us.loopexit:                       ; preds = %._crit_edge31.us.us
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %._crit_edge31.us.us.prol.loopexit
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond = icmp eq i64 %indvars.iv.next45, %wide.trip.count46
  br i1 %exitcond, label %._crit_edge26.us, label %.preheader.us.us

._crit_edge31.us.us:                              ; preds = %._crit_edge31.us.us.preheader, %._crit_edge31.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge31.us.us ], [ %indvars.iv.unr.ph, %._crit_edge31.us.us.preheader ]
  %17 = trunc i64 %indvars.iv to i32
  %18 = sub i32 %11, %17
  %19 = sitofp i32 %18 to double
  %20 = fmul double %19, 1.000000e+01
  %21 = fdiv double %20, %5
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv47, i64 %indvars.iv44, i64 %indvars.iv
  store double %21, double* %22, align 8
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv47, i64 %indvars.iv44, i64 %indvars.iv
  store double %21, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %24 = trunc i64 %indvars.iv.next to i32
  %25 = sub i32 %11, %24
  %26 = sitofp i32 %25 to double
  %27 = fmul double %26, 1.000000e+01
  %28 = fdiv double %27, %5
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv47, i64 %indvars.iv44, i64 %indvars.iv.next
  store double %28, double* %29, align 8
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv47, i64 %indvars.iv44, i64 %indvars.iv.next
  store double %28, double* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count46
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %._crit_edge31.us.us

._crit_edge30.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %5 = add nsw i32 %1, -1
  %wide.trip.count139 = zext i32 %5 to i64
  %6 = icmp sgt i32 %5, 1
  br label %.preheader116

.preheader116:                                    ; preds = %.preheader115._crit_edge, %4
  %.0111132 = phi i32 [ 1, %4 ], [ %83, %.preheader115._crit_edge ]
  br i1 %6, label %.preheader114.preheader, label %.preheader115._crit_edge

.preheader114.preheader:                          ; preds = %.preheader116
  br label %.preheader114

.preheader115:                                    ; preds = %.preheader114._crit_edge
  br i1 %6, label %.preheader113.preheader, label %.preheader115._crit_edge

.preheader113.preheader:                          ; preds = %.preheader115
  br label %.preheader113

.preheader114:                                    ; preds = %.preheader114.preheader, %.preheader114._crit_edge
  %indvars.iv141 = phi i64 [ %7, %.preheader114._crit_edge ], [ 1, %.preheader114.preheader ]
  %7 = add nuw nsw i64 %indvars.iv141, 1
  %8 = add nsw i64 %indvars.iv141, -1
  br label %.preheader112.us

.preheader112.us:                                 ; preds = %.preheader114, %._crit_edge.us
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge.us ], [ 1, %.preheader114 ]
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %9 = add nsw i64 %indvars.iv137, -1
  br label %._crit_edge133.us

._crit_edge133.us:                                ; preds = %._crit_edge133.us, %.preheader112.us
  %indvars.iv = phi i64 [ 1, %.preheader112.us ], [ %indvars.iv.next, %._crit_edge133.us ]
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %7, i64 %indvars.iv137, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv141, i64 %indvars.iv137, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %8, i64 %indvars.iv137, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv141, i64 %indvars.iv.next138, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = insertelement <2 x double> undef, double %13, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = fmul <2 x double> %19, <double 2.000000e+00, double 2.000000e+00>
  %21 = insertelement <2 x double> undef, double %11, i32 0
  %22 = insertelement <2 x double> %21, double %17, i32 1
  %23 = fsub <2 x double> %22, %20
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv141, i64 %9, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = insertelement <2 x double> undef, double %15, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fadd <2 x double> %27, %23
  %29 = fmul <2 x double> %28, <double 1.250000e-01, double 1.250000e-01>
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %32 = fadd double %30, %31
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv141, i64 %indvars.iv137, i64 %indvars.iv.next
  %34 = load double, double* %33, align 8
  %35 = fmul double %13, 2.000000e+00
  %36 = fsub double %34, %35
  %37 = add nsw i64 %indvars.iv, -1
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv141, i64 %indvars.iv137, i64 %37
  %39 = load double, double* %38, align 8
  %40 = fadd double %39, %36
  %41 = fmul double %40, 1.250000e-01
  %42 = fadd double %32, %41
  %43 = fadd double %13, %42
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv141, i64 %indvars.iv137, i64 %indvars.iv
  store double %43, double* %44, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count139
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge133.us

._crit_edge.us:                                   ; preds = %._crit_edge133.us
  %exitcond140 = icmp eq i64 %indvars.iv.next138, %wide.trip.count139
  br i1 %exitcond140, label %.preheader114._crit_edge, label %.preheader112.us

.preheader114._crit_edge:                         ; preds = %._crit_edge.us
  %exitcond144 = icmp eq i64 %7, %wide.trip.count139
  br i1 %exitcond144, label %.preheader115, label %.preheader114

.preheader113:                                    ; preds = %.preheader113.preheader, %.preheader113._crit_edge
  %indvars.iv154 = phi i64 [ %45, %.preheader113._crit_edge ], [ 1, %.preheader113.preheader ]
  %45 = add nuw nsw i64 %indvars.iv154, 1
  %46 = add nsw i64 %indvars.iv154, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader113, %._crit_edge125.us
  %indvars.iv150 = phi i64 [ %indvars.iv.next151, %._crit_edge125.us ], [ 1, %.preheader113 ]
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %47 = add nsw i64 %indvars.iv150, -1
  br label %._crit_edge134.us

._crit_edge134.us:                                ; preds = %._crit_edge134.us, %.preheader.us
  %indvars.iv146 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next147, %._crit_edge134.us ]
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %45, i64 %indvars.iv150, i64 %indvars.iv146
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv154, i64 %indvars.iv150, i64 %indvars.iv146
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %46, i64 %indvars.iv150, i64 %indvars.iv146
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv154, i64 %indvars.iv.next151, i64 %indvars.iv146
  %55 = load double, double* %54, align 8
  %56 = insertelement <2 x double> undef, double %51, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  %58 = fmul <2 x double> %57, <double 2.000000e+00, double 2.000000e+00>
  %59 = insertelement <2 x double> undef, double %49, i32 0
  %60 = insertelement <2 x double> %59, double %55, i32 1
  %61 = fsub <2 x double> %60, %58
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv154, i64 %47, i64 %indvars.iv146
  %63 = load double, double* %62, align 8
  %64 = insertelement <2 x double> undef, double %53, i32 0
  %65 = insertelement <2 x double> %64, double %63, i32 1
  %66 = fadd <2 x double> %65, %61
  %67 = fmul <2 x double> %66, <double 1.250000e-01, double 1.250000e-01>
  %68 = extractelement <2 x double> %67, i32 0
  %69 = extractelement <2 x double> %67, i32 1
  %70 = fadd double %68, %69
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv154, i64 %indvars.iv150, i64 %indvars.iv.next147
  %72 = load double, double* %71, align 8
  %73 = fmul double %51, 2.000000e+00
  %74 = fsub double %72, %73
  %75 = add nsw i64 %indvars.iv146, -1
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv154, i64 %indvars.iv150, i64 %75
  %77 = load double, double* %76, align 8
  %78 = fadd double %77, %74
  %79 = fmul double %78, 1.250000e-01
  %80 = fadd double %70, %79
  %81 = fadd double %51, %80
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv154, i64 %indvars.iv150, i64 %indvars.iv146
  store double %81, double* %82, align 8
  %exitcond149 = icmp eq i64 %indvars.iv.next147, %wide.trip.count139
  br i1 %exitcond149, label %._crit_edge125.us, label %._crit_edge134.us

._crit_edge125.us:                                ; preds = %._crit_edge134.us
  %exitcond153 = icmp eq i64 %indvars.iv.next151, %wide.trip.count139
  br i1 %exitcond153, label %.preheader113._crit_edge, label %.preheader.us

.preheader113._crit_edge:                         ; preds = %._crit_edge125.us
  %exitcond157 = icmp eq i64 %45, %wide.trip.count139
  br i1 %exitcond157, label %.preheader115._crit_edge.loopexit, label %.preheader113

.preheader115._crit_edge.loopexit:                ; preds = %.preheader113._crit_edge
  br label %.preheader115._crit_edge

.preheader115._crit_edge:                         ; preds = %.preheader115._crit_edge.loopexit, %.preheader116, %.preheader115
  %83 = add nuw nsw i32 %.0111132, 1
  %exitcond158 = icmp eq i32 %83, 501
  br i1 %exitcond158, label %84, label %.preheader116

; <label>:84:                                     ; preds = %.preheader115._crit_edge
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
  br i1 %7, label %.preheader20.lr.ph, label %._crit_edge28

.preheader20.lr.ph:                               ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge24.us, %.preheader20.lr.ph
  %indvars.iv49 = phi i64 [ 0, %.preheader20.lr.ph ], [ %indvars.iv.next50, %._crit_edge24.us ]
  %9 = mul nsw i64 %indvars.iv49, %8
  %10 = trunc i64 %9 to i32
  br label %.preheader.us.us

._crit_edge24.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, %wide.trip.count
  br i1 %exitcond52, label %._crit_edge28.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next46, %._crit_edge.us.us ]
  %11 = trunc i64 %indvars.iv45 to i32
  %12 = add i32 %11, %10
  %13 = mul i32 %12, %0
  %14 = zext i32 %13 to i64
  br label %._crit_edge30.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge29.us.us
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, %wide.trip.count
  br i1 %exitcond48, label %._crit_edge24.us, label %.preheader.us.us

._crit_edge30.us.us:                              ; preds = %._crit_edge29.us.us, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge29.us.us ]
  %15 = add i64 %indvars.iv, %14
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %._crit_edge29.us.us

; <label>:19:                                     ; preds = %._crit_edge30.us.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5
  br label %._crit_edge29.us.us

._crit_edge29.us.us:                              ; preds = %._crit_edge30.us.us, %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv49, i64 %indvars.iv45, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %._crit_edge30.us.us

._crit_edge28.loopexit:                           ; preds = %._crit_edge24.us
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit, %2
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #5
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
