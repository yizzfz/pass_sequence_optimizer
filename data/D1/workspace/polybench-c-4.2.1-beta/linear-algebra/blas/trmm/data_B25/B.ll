; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %.._crit_edge_crit_edge15

.._crit_edge_crit_edge15:                         ; preds = %10
  br label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge15, %.._crit_edge_crit_edge, %13
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.lr.ph, label %.._crit_edge35_crit_edge

.._crit_edge35_crit_edge:                         ; preds = %5
  br label %._crit_edge35

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %wide.trip.count66 = zext i32 %0 to i64
  %10 = insertelement <2 x double> undef, double %9, i32 0
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter44 = and i32 %1, 1
  %wide.trip.count52 = zext i32 %0 to i64
  %wide.trip.count41.1 = zext i32 %1 to i64
  %12 = insertelement <2 x double> undef, double %9, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  %14 = icmp eq i32 %xtraiter44, 0
  %15 = icmp eq i32 %1, 1
  %16 = insertelement <2 x double> undef, double %8, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge32.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv50 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next51, %._crit_edge32.us..preheader.us_crit_edge ]
  %18 = add nuw i64 %indvars.iv50, 4294967295
  %19 = icmp sgt i64 %indvars.iv50, 0
  br i1 %19, label %.lr.ph.us, label %.preheader.us.._crit_edge.us_crit_edge

.preheader.us.._crit_edge.us_crit_edge:           ; preds = %.preheader.us
  br label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %.preheader.us.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv50, i64 %indvars.iv50
  store double 1.000000e+00, double* %20, align 8
  %21 = trunc i64 %indvars.iv50 to i32
  %22 = add i32 %21, %1
  br i1 %14, label %._crit_edge.us..prol.loopexit43_crit_edge, label %.prol.preheader42

._crit_edge.us..prol.loopexit43_crit_edge:        ; preds = %._crit_edge.us
  br label %.prol.loopexit43

.prol.preheader42:                                ; preds = %._crit_edge.us
  %23 = srem i32 %22, %1
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 0
  store double %25, double* %26, align 8
  br label %.prol.loopexit43

.prol.loopexit43:                                 ; preds = %._crit_edge.us..prol.loopexit43_crit_edge, %.prol.preheader42
  %indvars.iv39.unr.ph = phi i64 [ 1, %.prol.preheader42 ], [ 0, %._crit_edge.us..prol.loopexit43_crit_edge ]
  br i1 %15, label %.prol.loopexit43.._crit_edge32.us_crit_edge, label %._crit_edge.us.new.preheader

.prol.loopexit43.._crit_edge32.us_crit_edge:      ; preds = %.prol.loopexit43
  br label %._crit_edge32.us

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit43
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.._crit_edge.us.new_crit_edge, %._crit_edge.us.new.preheader
  %indvars.iv39 = phi i64 [ %indvars.iv.next40.1, %._crit_edge.us.new.._crit_edge.us.new_crit_edge ], [ %indvars.iv39.unr.ph, %._crit_edge.us.new.preheader ]
  %27 = trunc i64 %indvars.iv39 to i32
  %28 = sub i32 %22, %27
  %29 = srem i32 %28, %1
  %30 = sitofp i32 %29 to double
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv39
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %32 = trunc i64 %indvars.iv.next40 to i32
  %33 = sub i32 %22, %32
  %34 = srem i32 %33, %1
  %35 = sitofp i32 %34 to double
  %36 = insertelement <2 x double> undef, double %30, i32 0
  %37 = insertelement <2 x double> %36, double %35, i32 1
  %38 = fdiv <2 x double> %37, %17
  %39 = bitcast double* %31 to <2 x double>*
  store <2 x double> %38, <2 x double>* %39, align 8
  %indvars.iv.next40.1 = add nuw nsw i64 %indvars.iv39, 2
  %exitcond.147 = icmp eq i64 %indvars.iv.next40.1, %wide.trip.count41.1
  br i1 %exitcond.147, label %._crit_edge32.us.loopexit, label %._crit_edge.us.new.._crit_edge.us.new_crit_edge

._crit_edge.us.new.._crit_edge.us.new_crit_edge:  ; preds = %._crit_edge.us.new
  br label %._crit_edge.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new..lr.ph.us.new_crit_edge, %.lr.ph.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new..lr.ph.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %40 = add nuw nsw i64 %indvars.iv, %indvars.iv50
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, %0
  %43 = sitofp i32 %42 to double
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv50, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %45 = add nuw nsw i64 %indvars.iv.next, %indvars.iv50
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, %0
  %48 = sitofp i32 %47 to double
  %49 = insertelement <2 x double> undef, double %43, i32 0
  %50 = insertelement <2 x double> %49, double %48, i32 1
  %51 = fdiv <2 x double> %50, %13
  %52 = bitcast double* %44 to <2 x double>*
  store <2 x double> %51, <2 x double>* %52, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv50
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new..lr.ph.us.new_crit_edge

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  br label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter69 = and i64 %indvars.iv50, 1
  %lcmp.mod = icmp eq i64 %xtraiter69, 0
  br i1 %lcmp.mod, label %.lr.ph.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph.us..prol.loopexit_crit_edge:               ; preds = %.lr.ph.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph.us
  %53 = trunc i64 %indvars.iv50 to i32
  %54 = srem i32 %53, %0
  %55 = sitofp i32 %54 to double
  %56 = fdiv double %55, %9
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv50, i64 0
  store double %56, double* %57, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us..prol.loopexit_crit_edge ]
  %58 = trunc i64 %18 to i32
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.lr.ph.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge32.us.loopexit:                        ; preds = %._crit_edge.us.new
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %.prol.loopexit43.._crit_edge32.us_crit_edge, %._crit_edge32.us.loopexit
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond, label %._crit_edge35.loopexit, label %._crit_edge32.us..preheader.us_crit_edge

._crit_edge32.us..preheader.us_crit_edge:         ; preds = %._crit_edge32.us
  br label %.preheader.us

.preheader:                                       ; preds = %._crit_edge..preheader_crit_edge, %.preheader.preheader
  %indvars.iv64 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next65, %._crit_edge..preheader_crit_edge ]
  %60 = add nuw i64 %indvars.iv64, 4294967295
  %61 = icmp sgt i64 %indvars.iv64, 0
  br i1 %61, label %.lr.ph, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter6068 = and i64 %indvars.iv64, 1
  %lcmp.mod61 = icmp eq i64 %xtraiter6068, 0
  br i1 %lcmp.mod61, label %.lr.ph..prol.loopexit59_crit_edge, label %.prol.preheader58

.lr.ph..prol.loopexit59_crit_edge:                ; preds = %.lr.ph
  br label %.prol.loopexit59

.prol.preheader58:                                ; preds = %.lr.ph
  %62 = trunc i64 %indvars.iv64 to i32
  %63 = srem i32 %62, %0
  %64 = sitofp i32 %63 to double
  %65 = fdiv double %64, %9
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv64, i64 0
  store double %65, double* %66, align 8
  br label %.prol.loopexit59

.prol.loopexit59:                                 ; preds = %.lr.ph..prol.loopexit59_crit_edge, %.prol.preheader58
  %indvars.iv53.unr.ph = phi i64 [ 1, %.prol.preheader58 ], [ 0, %.lr.ph..prol.loopexit59_crit_edge ]
  %67 = trunc i64 %60 to i32
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %.prol.loopexit59.._crit_edge_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit59.._crit_edge_crit_edge:           ; preds = %.prol.loopexit59
  br label %._crit_edge

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit59
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv53 = phi i64 [ %indvars.iv.next54.1, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv53.unr.ph, %.lr.ph.new.preheader ]
  %69 = add nuw nsw i64 %indvars.iv53, %indvars.iv64
  %70 = trunc i64 %69 to i32
  %71 = srem i32 %70, %0
  %72 = sitofp i32 %71 to double
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv64, i64 %indvars.iv53
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %74 = add nuw nsw i64 %indvars.iv.next54, %indvars.iv64
  %75 = trunc i64 %74 to i32
  %76 = srem i32 %75, %0
  %77 = sitofp i32 %76 to double
  %78 = insertelement <2 x double> undef, double %72, i32 0
  %79 = insertelement <2 x double> %78, double %77, i32 1
  %80 = fdiv <2 x double> %79, %11
  %81 = bitcast double* %73 to <2 x double>*
  store <2 x double> %80, <2 x double>* %81, align 8
  %indvars.iv.next54.1 = add nuw nsw i64 %indvars.iv53, 2
  %exitcond57.1 = icmp eq i64 %indvars.iv.next54.1, %indvars.iv64
  br i1 %exitcond57.1, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit59.._crit_edge_crit_edge, %.preheader.._crit_edge_crit_edge, %._crit_edge.loopexit
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv64, i64 %indvars.iv64
  store double 1.000000e+00, double* %82, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count66
  br i1 %exitcond67, label %._crit_edge35.loopexit73, label %._crit_edge..preheader_crit_edge

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  br label %.preheader

._crit_edge35.loopexit:                           ; preds = %._crit_edge32.us
  br label %._crit_edge35

._crit_edge35.loopexit73:                         ; preds = %._crit_edge
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %.._crit_edge35_crit_edge, %._crit_edge35.loopexit73, %._crit_edge35.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader27.us.preheader, label %.._crit_edge31_crit_edge

.._crit_edge31_crit_edge:                         ; preds = %5
  br label %._crit_edge31

.preheader27.us.preheader:                        ; preds = %5
  %8 = add i32 %1, -1
  %9 = add i32 %0, 1
  %10 = add i32 %0, -2
  %11 = sext i32 %0 to i64
  %wide.trip.count52 = zext i32 %1 to i64
  %wide.trip.count46.1 = zext i32 %0 to i64
  %xtraiter = and i32 %1, 3
  %12 = add nsw i32 %xtraiter, -1
  %13 = zext i32 %12 to i64
  %14 = add nuw nsw i64 %13, 1
  %15 = icmp eq i32 %xtraiter, 0
  %16 = icmp ult i32 %8, 3
  %17 = insertelement <2 x double> undef, double %2, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  %19 = insertelement <2 x double> undef, double %2, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %..loopexit_crit_edge.us..preheader27.us_crit_edge, %.preheader27.us.preheader
  %indvars.iv53 = phi i64 [ 0, %.preheader27.us.preheader ], [ %indvars.iv.next54, %..loopexit_crit_edge.us..preheader27.us_crit_edge ]
  %indvars.iv42 = phi i64 [ 1, %.preheader27.us.preheader ], [ %indvars.iv.next43, %..loopexit_crit_edge.us..preheader27.us_crit_edge ]
  %21 = sub nsw i64 0, %indvars.iv53
  %22 = trunc i64 %21 to i32
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %23 = icmp slt i64 %indvars.iv.next54, %11
  br i1 %23, label %.preheader.us.us.preheader, label %.preheader.us32.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader27.us
  %24 = add i32 %9, %22
  %xtraiter47 = and i32 %24, 1
  %25 = sub i32 0, %22
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv42, i64 %indvars.iv53
  %indvars.iv.next45.prol = add nuw nsw i64 %indvars.iv42, 1
  %27 = icmp eq i32 %xtraiter47, 0
  %28 = icmp eq i32 %10, %25
  br label %.preheader.us.us

.preheader.us32.preheader:                        ; preds = %.preheader27.us
  br i1 %15, label %.preheader.us32.preheader..preheader.us32.prol.loopexit_crit_edge, label %.preheader.us32.prol.preheader

.preheader.us32.preheader..preheader.us32.prol.loopexit_crit_edge: ; preds = %.preheader.us32.preheader
  br label %.preheader.us32.prol.loopexit

.preheader.us32.prol.preheader:                   ; preds = %.preheader.us32.preheader
  br label %.preheader.us32.prol

.preheader.us32.prol:                             ; preds = %.preheader.us32.prol.preheader, %.preheader.us32.prol..preheader.us32.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.us32.prol..preheader.us32.prol_crit_edge ], [ 0, %.preheader.us32.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.preheader.us32.prol..preheader.us32.prol_crit_edge ], [ %xtraiter, %.preheader.us32.prol.preheader ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.prol
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, %2
  store double %31, double* %29, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us32.prol.loopexit.loopexit, label %.preheader.us32.prol..preheader.us32.prol_crit_edge, !llvm.loop !1

.preheader.us32.prol..preheader.us32.prol_crit_edge: ; preds = %.preheader.us32.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.preheader.us32.prol

.preheader.us32.prol.loopexit.loopexit:           ; preds = %.preheader.us32.prol
  br label %.preheader.us32.prol.loopexit

.preheader.us32.prol.loopexit:                    ; preds = %.preheader.us32.preheader..preheader.us32.prol.loopexit_crit_edge, %.preheader.us32.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us32.preheader..preheader.us32.prol.loopexit_crit_edge ], [ %14, %.preheader.us32.prol.loopexit.loopexit ]
  br i1 %16, label %.preheader.us32.prol.loopexit...loopexit_crit_edge.us_crit_edge, label %.preheader.us32.preheader65

.preheader.us32.prol.loopexit...loopexit_crit_edge.us_crit_edge: ; preds = %.preheader.us32.prol.loopexit
  br label %..loopexit_crit_edge.us

.preheader.us32.preheader65:                      ; preds = %.preheader.us32.prol.loopexit
  br label %.preheader.us32

.preheader.us32:                                  ; preds = %.preheader.us32..preheader.us32_crit_edge, %.preheader.us32.preheader65
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us32..preheader.us32_crit_edge ], [ %indvars.iv.unr, %.preheader.us32.preheader65 ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv
  %33 = bitcast double* %32 to <2 x double>*
  %34 = load <2 x double>, <2 x double>* %33, align 8
  %35 = fmul <2 x double> %34, %18
  %36 = bitcast double* %32 to <2 x double>*
  store <2 x double> %35, <2 x double>* %36, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next.1
  %38 = bitcast double* %37 to <2 x double>*
  %39 = load <2 x double>, <2 x double>* %38, align 8
  %40 = fmul <2 x double> %39, %20
  %41 = bitcast double* %37 to <2 x double>*
  store <2 x double> %40, <2 x double>* %41, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count52
  br i1 %exitcond.3, label %..loopexit_crit_edge.us.loopexit66, label %.preheader.us32..preheader.us32_crit_edge

.preheader.us32..preheader.us32_crit_edge:        ; preds = %.preheader.us32
  br label %.preheader.us32

..loopexit_crit_edge.us.loopexit:                 ; preds = %._crit_edge.us.us
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us.loopexit66:               ; preds = %.preheader.us32
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %.preheader.us32.prol.loopexit...loopexit_crit_edge.us_crit_edge, %..loopexit_crit_edge.us.loopexit66, %..loopexit_crit_edge.us.loopexit
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count46.1
  br i1 %exitcond56, label %._crit_edge31.loopexit, label %..loopexit_crit_edge.us..preheader27.us_crit_edge

..loopexit_crit_edge.us..preheader27.us_crit_edge: ; preds = %..loopexit_crit_edge.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  br label %.preheader27.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us..preheader.us.us_crit_edge, %.preheader.us.us.preheader
  %indvars.iv50 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next51, %._crit_edge.us.us..preheader.us.us_crit_edge ]
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv50
  br i1 %27, label %.preheader.us.us..prol.loopexit_crit_edge, label %.prol.preheader

.preheader.us.us..prol.loopexit_crit_edge:        ; preds = %.preheader.us.us
  %.pre58.pre = load double, double* %42, align 8
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us.us
  %43 = load double, double* %26, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv42, i64 %indvars.iv50
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = load double, double* %42, align 8
  %48 = fadd double %47, %46
  store double %48, double* %42, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us..prol.loopexit_crit_edge, %.prol.preheader
  %.pre58 = phi double [ %48, %.prol.preheader ], [ %.pre58.pre, %.preheader.us.us..prol.loopexit_crit_edge ]
  %indvars.iv44.unr.ph = phi i64 [ %indvars.iv.next45.prol, %.prol.preheader ], [ %indvars.iv42, %.preheader.us.us..prol.loopexit_crit_edge ]
  br i1 %28, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.preheader.us.us.new.preheader

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  br label %._crit_edge.us.us

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %49 = phi double [ %.pre58, %.prol.loopexit.._crit_edge.us.us_crit_edge ], [ %63, %._crit_edge.us.us.loopexit ]
  %50 = fmul double %49, %2
  store double %50, double* %42, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond, label %..loopexit_crit_edge.us.loopexit, label %._crit_edge.us.us..preheader.us.us_crit_edge

._crit_edge.us.us..preheader.us.us_crit_edge:     ; preds = %._crit_edge.us.us
  br label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new..preheader.us.us.new_crit_edge, %.preheader.us.us.new.preheader
  %51 = phi double [ %63, %.preheader.us.us.new..preheader.us.us.new_crit_edge ], [ %.pre58, %.preheader.us.us.new.preheader ]
  %indvars.iv44 = phi i64 [ %indvars.iv.next45.1, %.preheader.us.us.new..preheader.us.us.new_crit_edge ], [ %indvars.iv44.unr.ph, %.preheader.us.us.new.preheader ]
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv44, i64 %indvars.iv53
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv50
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %51, %56
  store double %57, double* %42, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next45, i64 %indvars.iv53
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next45, i64 %indvars.iv50
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %57, %62
  store double %63, double* %42, align 8
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next45.1, %wide.trip.count46.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new..preheader.us.us.new_crit_edge

.preheader.us.us.new..preheader.us.us.new_crit_edge: ; preds = %.preheader.us.us.new
  br label %.preheader.us.us.new

._crit_edge31.loopexit:                           ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %.._crit_edge31_crit_edge, %._crit_edge31.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %.._crit_edge14_crit_edge

.._crit_edge14_crit_edge:                         ; preds = %3
  br label %._crit_edge14

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count18 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us..preheader.us_crit_edge ]
  %11 = mul nsw i64 %indvars.iv16, %10
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge.._crit_edge21_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge21_crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge21.._crit_edge_crit_edge

._crit_edge21.._crit_edge_crit_edge:              ; preds = %._crit_edge21
  br label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge21
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge21.._crit_edge_crit_edge, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge.._crit_edge21_crit_edge

._crit_edge.._crit_edge21_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge21

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count18
  br i1 %exitcond19, label %._crit_edge14.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %.._crit_edge14_crit_edge, %._crit_edge14.loopexit
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
