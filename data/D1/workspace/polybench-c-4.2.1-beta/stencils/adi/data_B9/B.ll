; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]* nocapture) unnamed_addr #2 {
  %3 = sext i32 %0 to i64
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader.preheader, label %._crit_edge8

.preheader.preheader:                             ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  %5 = sitofp i32 %0 to double
  %xtraiter = and i64 %wide.trip.count, 1
  %6 = icmp eq i64 %xtraiter, 0
  %7 = icmp eq i32 %0, 1
  %8 = insertelement <2 x double> undef, double %5, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %._crit_edge ], [ 0, %.preheader.preheader ]
  %10 = add nsw i64 %indvars.iv26, %3
  br i1 %6, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, %5
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv26, i64 0
  store double %13, double* %14, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader
  %indvars.iv5.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader ]
  br i1 %7, label %._crit_edge, label %.preheader.new.preheader

.preheader.new.preheader:                         ; preds = %.prol.loopexit
  br label %.preheader.new

.preheader.new:                                   ; preds = %.preheader.new.preheader, %.preheader.new
  %indvars.iv5 = phi i64 [ %indvars.iv.next.1, %.preheader.new ], [ %indvars.iv5.unr.ph, %.preheader.new.preheader ]
  %15 = sub i64 %10, %indvars.iv5
  %16 = trunc i64 %15 to i32
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %19 = sub i64 %10, %indvars.iv.next
  %20 = trunc i64 %19 to i32
  %21 = sitofp i32 %20 to double
  %22 = insertelement <2 x double> undef, double %17, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  %24 = fdiv <2 x double> %23, %9
  %25 = bitcast double* %18 to <2 x double>*
  store <2 x double> %24, <2 x double>* %25, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv5, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.preheader.new

._crit_edge.loopexit:                             ; preds = %.preheader.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, %3
  br i1 %exitcond, label %._crit_edge8.loopexit, label %.preheader

._crit_edge8.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  %7 = sitofp i32 %1 to double
  %8 = sitofp i32 %0 to double
  %9 = insertelement <2 x double> undef, double %7, i32 0
  %10 = insertelement <2 x double> %9, double %8, i32 1
  %11 = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %10
  %12 = extractelement <2 x double> %11, i32 0
  %13 = insertelement <2 x double> undef, double %12, i32 0
  %14 = insertelement <2 x double> %13, double 2.000000e+00, i32 1
  %15 = fmul <2 x double> %11, %14
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  %17 = shufflevector <2 x double> %15, <2 x double> %11, <2 x i32> <i32 1, i32 3>
  %18 = fdiv <2 x double> %17, %16
  %19 = fmul <2 x double> %18, <double -5.000000e-01, double -5.000000e-01>
  %20 = extractelement <2 x double> %19, i32 0
  %21 = extractelement <2 x double> %19, i32 1
  %22 = fadd <2 x double> %18, <double 1.000000e+00, double 1.000000e+00>
  %23 = extractelement <2 x double> %22, i32 0
  %24 = extractelement <2 x double> %22, i32 1
  %25 = add i32 %1, -1
  %26 = add i32 %1, -2
  %27 = sext i32 %26 to i64
  %28 = icmp slt i32 %0, 1
  br i1 %28, label %._crit_edge42, label %.preheader16.lr.ph

.preheader16.lr.ph:                               ; preds = %6
  %29 = sext i32 %25 to i64
  %wide.trip.count = zext i32 %25 to i64
  %30 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %19
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  %33 = fmul <2 x double> %19, <double 2.000000e+00, double 2.000000e+00>
  %34 = fadd <2 x double> %33, <double 1.000000e+00, double 1.000000e+00>
  %35 = shufflevector <2 x double> %34, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %36 = extractelement <2 x double> %34, i32 0
  %37 = icmp sgt i32 %25, 1
  %38 = icmp sgt i32 %26, 0
  %39 = shufflevector <2 x double> %19, <2 x double> %35, <2 x i32> <i32 1, i32 2>
  %40 = shufflevector <2 x double> %19, <2 x double> %35, <2 x i32> <i32 1, i32 2>
  %41 = icmp sgt i32 %25, 1
  %42 = icmp sgt i32 %26, 0
  br label %.preheader16

.preheader16:                                     ; preds = %._crit_edge40, %.preheader16.lr.ph
  %.0341 = phi i32 [ 1, %.preheader16.lr.ph ], [ %176, %._crit_edge40 ]
  br i1 %37, label %.lver.check.preheader, label %._crit_edge40

.lver.check.preheader:                            ; preds = %.preheader16
  br label %.lver.check

.preheader:                                       ; preds = %._crit_edge22
  br i1 %41, label %.lver.check75.preheader, label %._crit_edge40

.lver.check75.preheader:                          ; preds = %.preheader
  br label %.lver.check75

.lver.check:                                      ; preds = %.lver.check.preheader, %._crit_edge22
  %indvar = phi i64 [ %indvar.next, %._crit_edge22 ], [ 0, %.lver.check.preheader ]
  %indvars.iv623 = phi i64 [ %52, %._crit_edge22 ], [ 1, %.lver.check.preheader ]
  %43 = add i64 %indvar, 1
  %44 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %44, i64 0
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %4, i64 %44, i64 %wide.trip.count
  %scevgep53 = getelementptr [1000 x double], [1000 x double]* %5, i64 %44, i64 0
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %5, i64 %44, i64 %wide.trip.count
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv623
  store double 1.000000e+00, double* %45, align 8
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv623, i64 0
  store double 0.000000e+00, double* %46, align 8
  %47 = bitcast double* %45 to i64*
  %48 = load i64, i64* %47, align 8
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv623
  %50 = bitcast [1000 x double]* %49 to i64*
  store i64 %48, i64* %50, align 8
  %51 = add nsw i64 %indvars.iv623, -1
  %52 = add nuw nsw i64 %indvars.iv623, 1
  %bound0 = icmp ult double* %scevgep, %scevgep55
  %bound1 = icmp ult double* %scevgep53, %scevgep51
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv18.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %53 = add nsw i64 %indvars.iv18.lver.orig, -1
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv623, i64 %53
  %55 = load double, double* %54, align 8
  %56 = fmul double %20, %55
  %57 = fadd double %23, %56
  %58 = fdiv double %31, %57
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv623, i64 %indvars.iv18.lver.orig
  store double %58, double* %59, align 8
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18.lver.orig, i64 %51
  %61 = bitcast double* %60 to <2 x double>*
  %62 = load <2 x double>, <2 x double>* %61, align 8
  %63 = fmul <2 x double> %40, %62
  %64 = extractelement <2 x double> %63, i32 0
  %65 = extractelement <2 x double> %63, i32 1
  %66 = fsub double %65, %64
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18.lver.orig, i64 %52
  %68 = load double, double* %67, align 8
  %69 = fmul double %21, %68
  %70 = fsub double %66, %69
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv623, i64 %53
  %72 = load double, double* %71, align 8
  %73 = fmul double %20, %72
  %74 = fsub double %70, %73
  %75 = fdiv double %74, %57
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv623, i64 %indvars.iv18.lver.orig
  store double %75, double* %76, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv18.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, %wide.trip.count
  br i1 %exitcond.lver.orig, label %._crit_edge.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %5, i64 %43, i64 0
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %4, i64 %43, i64 0
  %load_initial = load double, double* %scevgep57, align 8
  %load_initial59 = load double, double* %scevgep58, align 8
  br label %77

; <label>:77:                                     ; preds = %.ph, %77
  %store_forwarded60 = phi double [ %load_initial59, %.ph ], [ %95, %77 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %80, %77 ]
  %indvars.iv18 = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %77 ]
  %78 = fmul double %20, %store_forwarded
  %79 = fadd double %23, %78
  %80 = fdiv double %31, %79
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv623, i64 %indvars.iv18
  store double %80, double* %81, align 8
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %51
  %83 = bitcast double* %82 to <2 x double>*
  %84 = load <2 x double>, <2 x double>* %83, align 8
  %85 = fmul <2 x double> %39, %84
  %86 = extractelement <2 x double> %85, i32 0
  %87 = extractelement <2 x double> %85, i32 1
  %88 = fsub double %87, %86
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18, i64 %52
  %90 = load double, double* %89, align 8
  %91 = fmul double %21, %90
  %92 = fsub double %88, %91
  %93 = fmul double %20, %store_forwarded60
  %94 = fsub double %92, %93
  %95 = fdiv double %94, %79
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv623, i64 %indvars.iv18
  store double %95, double* %96, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit84, label %77

._crit_edge.loopexit:                             ; preds = %.ph.lver.orig
  br label %._crit_edge

._crit_edge.loopexit84:                           ; preds = %77
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit84, %._crit_edge.loopexit
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %29, i64 %indvars.iv623
  store double 1.000000e+00, double* %97, align 8
  br i1 %38, label %.lr.ph21.preheader, label %._crit_edge22

.lr.ph21.preheader:                               ; preds = %._crit_edge
  br label %.lr.ph21

.lr.ph21:                                         ; preds = %.lr.ph21.preheader, %.lr.ph21
  %indvars.iv419 = phi i64 [ %indvars.iv.next5, %.lr.ph21 ], [ %27, %.lr.ph21.preheader ]
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv623, i64 %indvars.iv419
  %99 = load double, double* %98, align 8
  %100 = add nsw i64 %indvars.iv419, 1
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %100, i64 %indvars.iv623
  %102 = load double, double* %101, align 8
  %103 = fmul double %99, %102
  %104 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv623, i64 %indvars.iv419
  %105 = load double, double* %104, align 8
  %106 = fadd double %103, %105
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv419, i64 %indvars.iv623
  store double %106, double* %107, align 8
  %indvars.iv.next5 = add nsw i64 %indvars.iv419, -1
  %108 = icmp sgt i64 %indvars.iv419, 1
  br i1 %108, label %.lr.ph21, label %._crit_edge22.loopexit

._crit_edge22.loopexit:                           ; preds = %.lr.ph21
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %._crit_edge
  %exitcond45 = icmp eq i64 %52, %29
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond45, label %.preheader, label %.lver.check

.lver.check75:                                    ; preds = %.lver.check75.preheader, %._crit_edge35
  %indvar61 = phi i64 [ %indvar.next62, %._crit_edge35 ], [ 0, %.lver.check75.preheader ]
  %indvars.iv1436 = phi i64 [ %119, %._crit_edge35 ], [ 1, %.lver.check75.preheader ]
  %109 = add i64 %indvar61, 1
  %110 = add i64 %indvar61, 1
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %4, i64 %110, i64 0
  %scevgep65 = getelementptr [1000 x double], [1000 x double]* %4, i64 %110, i64 %wide.trip.count
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %5, i64 %110, i64 0
  %scevgep69 = getelementptr [1000 x double], [1000 x double]* %5, i64 %110, i64 %wide.trip.count
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1436
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %111, i64 0, i64 0
  store double 1.000000e+00, double* %112, align 8
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1436, i64 0
  store double 0.000000e+00, double* %113, align 8
  %114 = bitcast [1000 x double]* %111 to i64*
  %115 = load i64, i64* %114, align 8
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1436
  %117 = bitcast [1000 x double]* %116 to i64*
  store i64 %115, i64* %117, align 8
  %118 = add nsw i64 %indvars.iv1436, -1
  %119 = add nuw nsw i64 %indvars.iv1436, 1
  %bound071 = icmp ult double* %scevgep63, %scevgep69
  %bound172 = icmp ult double* %scevgep67, %scevgep65
  %memcheck.conflict74 = and i1 %bound071, %bound172
  br i1 %memcheck.conflict74, label %.ph76.lver.orig.preheader, label %.ph76

.ph76.lver.orig.preheader:                        ; preds = %.lver.check75
  br label %.ph76.lver.orig

.ph76.lver.orig:                                  ; preds = %.ph76.lver.orig.preheader, %.ph76.lver.orig
  %indvars.iv828.lver.orig = phi i64 [ %indvars.iv.next9.lver.orig, %.ph76.lver.orig ], [ 1, %.ph76.lver.orig.preheader ]
  %120 = add nsw i64 %indvars.iv828.lver.orig, -1
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1436, i64 %120
  %122 = load double, double* %121, align 8
  %123 = fmul double %21, %122
  %124 = fadd double %24, %123
  %125 = fdiv double %32, %124
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1436, i64 %indvars.iv828.lver.orig
  store double %125, double* %126, align 8
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %118, i64 %indvars.iv828.lver.orig
  %128 = load double, double* %127, align 8
  %129 = fmul double %20, %128
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1436, i64 %indvars.iv828.lver.orig
  %131 = load double, double* %130, align 8
  %132 = fmul double %36, %131
  %133 = fsub double %132, %129
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %119, i64 %indvars.iv828.lver.orig
  %135 = load double, double* %134, align 8
  %136 = fmul double %20, %135
  %137 = fsub double %133, %136
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1436, i64 %120
  %139 = load double, double* %138, align 8
  %140 = fmul double %21, %139
  %141 = fsub double %137, %140
  %142 = fdiv double %141, %124
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1436, i64 %indvars.iv828.lver.orig
  store double %142, double* %143, align 8
  %indvars.iv.next9.lver.orig = add nuw nsw i64 %indvars.iv828.lver.orig, 1
  %exitcond11.lver.orig = icmp eq i64 %indvars.iv.next9.lver.orig, %wide.trip.count
  br i1 %exitcond11.lver.orig, label %._crit_edge31.loopexit, label %.ph76.lver.orig

.ph76:                                            ; preds = %.lver.check75
  %scevgep80 = getelementptr [1000 x double], [1000 x double]* %5, i64 %109, i64 0
  %scevgep77 = getelementptr [1000 x double], [1000 x double]* %4, i64 %109, i64 0
  %load_initial78 = load double, double* %scevgep77, align 8
  %load_initial81 = load double, double* %scevgep80, align 8
  br label %144

; <label>:144:                                    ; preds = %.ph76, %144
  %store_forwarded82 = phi double [ %load_initial81, %.ph76 ], [ %162, %144 ]
  %store_forwarded79 = phi double [ %load_initial78, %.ph76 ], [ %147, %144 ]
  %indvars.iv828 = phi i64 [ 1, %.ph76 ], [ %indvars.iv.next9, %144 ]
  %145 = fmul double %21, %store_forwarded79
  %146 = fadd double %24, %145
  %147 = fdiv double %32, %146
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1436, i64 %indvars.iv828
  store double %147, double* %148, align 8
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %118, i64 %indvars.iv828
  %150 = load double, double* %149, align 8
  %151 = fmul double %20, %150
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1436, i64 %indvars.iv828
  %153 = load double, double* %152, align 8
  %154 = fmul double %36, %153
  %155 = fsub double %154, %151
  %156 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %119, i64 %indvars.iv828
  %157 = load double, double* %156, align 8
  %158 = fmul double %20, %157
  %159 = fsub double %155, %158
  %160 = fmul double %21, %store_forwarded82
  %161 = fsub double %159, %160
  %162 = fdiv double %161, %146
  %163 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1436, i64 %indvars.iv828
  store double %162, double* %163, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv828, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, %wide.trip.count
  br i1 %exitcond11, label %._crit_edge31.loopexit83, label %144

._crit_edge31.loopexit:                           ; preds = %.ph76.lver.orig
  br label %._crit_edge31

._crit_edge31.loopexit83:                         ; preds = %144
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit83, %._crit_edge31.loopexit
  %164 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1436, i64 %29
  store double 1.000000e+00, double* %164, align 8
  br i1 %42, label %.lr.ph34.preheader, label %._crit_edge35

.lr.ph34.preheader:                               ; preds = %._crit_edge31
  br label %.lr.ph34

.lr.ph34:                                         ; preds = %.lr.ph34.preheader, %.lr.ph34
  %indvars.iv1232 = phi i64 [ %indvars.iv.next13, %.lr.ph34 ], [ %27, %.lr.ph34.preheader ]
  %165 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1436, i64 %indvars.iv1232
  %166 = load double, double* %165, align 8
  %167 = add nsw i64 %indvars.iv1232, 1
  %168 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1436, i64 %167
  %169 = load double, double* %168, align 8
  %170 = fmul double %166, %169
  %171 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1436, i64 %indvars.iv1232
  %172 = load double, double* %171, align 8
  %173 = fadd double %170, %172
  %174 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1436, i64 %indvars.iv1232
  store double %173, double* %174, align 8
  %indvars.iv.next13 = add nsw i64 %indvars.iv1232, -1
  %175 = icmp sgt i64 %indvars.iv1232, 1
  br i1 %175, label %.lr.ph34, label %._crit_edge35.loopexit

._crit_edge35.loopexit:                           ; preds = %.lr.ph34
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit, %._crit_edge31
  %exitcond47 = icmp eq i64 %119, %29
  %indvar.next62 = add i64 %indvar61, 1
  br i1 %exitcond47, label %._crit_edge40.loopexit, label %.lver.check75

._crit_edge40.loopexit:                           ; preds = %._crit_edge35
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40.loopexit, %.preheader16, %.preheader
  %176 = add nuw nsw i32 %.0341, 1
  %exitcond49 = icmp eq i32 %.0341, %0
  br i1 %exitcond49, label %._crit_edge42.loopexit, label %.preheader16

._crit_edge42.loopexit:                           ; preds = %._crit_edge40
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %6
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.preheader, label %._crit_edge8

.preheader.preheader:                             ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %._crit_edge ], [ 0, %.preheader.preheader ]
  %9 = mul nsw i64 %indvars.iv26, %7
  br label %10

; <label>:10:                                     ; preds = %.preheader, %17
  %indvars.iv5 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv5, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge, label %10

._crit_edge:                                      ; preds = %17
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next3, %7
  br i1 %exitcond10, label %._crit_edge8.loopexit, label %.preheader

._crit_edge8.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
