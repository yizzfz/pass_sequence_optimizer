; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader.lr.ph, label %._crit_edge4

.preheader.lr.ph:                                 ; preds = %2
  %4 = sitofp i32 %0 to double
  %5 = sext i32 %0 to i64
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %6 = icmp eq i32 %0, 1
  %wide.trip.count7 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %7 = insertelement <2 x double> undef, double %4, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %9 = add nsw i64 %indvars.iv5, %5
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, %4
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 0
  store double %12, double* %13, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %6, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %14 = trunc i64 %9 to i32
  %15 = trunc i64 %9 to i32
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %16 = trunc i64 %indvars.iv to i32
  %17 = sub i32 %14, %16
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %20 = trunc i64 %indvars.iv.next to i32
  %21 = sub i32 %15, %20
  %22 = sitofp i32 %21 to double
  %23 = insertelement <2 x double> undef, double %18, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  %25 = fdiv <2 x double> %24, %8
  %26 = bitcast double* %19 to <2 x double>*
  store <2 x double> %25, <2 x double>* %26, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
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
  %25 = icmp slt i32 %0, 1
  br i1 %25, label %._crit_edge24, label %.preheader4.lr.ph

.preheader4.lr.ph:                                ; preds = %6
  %26 = add nsw i32 %1, -1
  %27 = icmp sgt i32 %26, 1
  %28 = sext i32 %1 to i64
  %29 = add nsw i64 %28, -1
  %30 = add nsw i32 %1, -2
  %31 = icmp sgt i32 %1, 2
  %32 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %19
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  %35 = fmul <2 x double> %19, <double 2.000000e+00, double 2.000000e+00>
  %36 = fadd <2 x double> %35, <double 1.000000e+00, double 1.000000e+00>
  %37 = shufflevector <2 x double> %36, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %38 = extractelement <2 x double> %36, i32 0
  %39 = sext i32 %30 to i64
  %40 = add i32 %1, -3
  %wide.trip.count = zext i32 %26 to i64
  %xtraiter = and i32 %30, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %41 = icmp eq i32 %40, 0
  %42 = add nsw i64 %39, 1
  %indvars.iv.next26.prol = add nsw i64 %39, -1
  %wide.trip.count29 = zext i32 %26 to i64
  %wide.trip.count33 = zext i32 %26 to i64
  %xtraiter37 = and i32 %30, 1
  %lcmp.mod38 = icmp eq i32 %xtraiter37, 0
  %43 = icmp eq i32 %40, 0
  %44 = add nsw i64 %39, 1
  %indvars.iv.next36.prol = add nsw i64 %39, -1
  %wide.trip.count41 = zext i32 %26 to i64
  %45 = shufflevector <2 x double> %19, <2 x double> %37, <2 x i32> <i32 1, i32 2>
  %46 = shufflevector <2 x double> %19, <2 x double> %37, <2 x i32> <i32 1, i32 2>
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge22, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %212, %._crit_edge22 ]
  br i1 %27, label %.lver.check.preheader, label %._crit_edge22

.lver.check.preheader:                            ; preds = %.preheader4
  br label %.lver.check

.lver.check:                                      ; preds = %.lver.check.preheader, %._crit_edge9.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge9.us ], [ 0, %.lver.check.preheader ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge9.us ], [ 1, %.lver.check.preheader ]
  %47 = add i64 %indvar, 1
  %48 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %48, i64 0
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %4, i64 %48, i64 %wide.trip.count
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %5, i64 %48, i64 0
  %scevgep53 = getelementptr [1000 x double], [1000 x double]* %5, i64 %48, i64 %wide.trip.count
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv27
  store double 1.000000e+00, double* %49, align 8
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 0
  store double 0.000000e+00, double* %50, align 8
  %51 = bitcast double* %49 to i64*
  %52 = load i64, i64* %51, align 8
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27
  %54 = bitcast [1000 x double]* %53 to i64*
  store i64 %52, i64* %54, align 8
  %55 = add nsw i64 %indvars.iv27, -1
  %56 = add nuw nsw i64 %indvars.iv27, 1
  %bound0 = icmp ult double* %scevgep, %scevgep53
  %bound1 = icmp ult double* %scevgep51, %scevgep49
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %57 = add nsw i64 %indvars.iv.lver.orig, -1
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %57
  %59 = load double, double* %58, align 8
  %60 = fmul double %20, %59
  %61 = fadd double %23, %60
  %62 = fdiv double %33, %61
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %62, double* %63, align 8
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %55
  %65 = bitcast double* %64 to <2 x double>*
  %66 = load <2 x double>, <2 x double>* %65, align 8
  %67 = fmul <2 x double> %46, %66
  %68 = extractelement <2 x double> %67, i32 0
  %69 = extractelement <2 x double> %67, i32 1
  %70 = fsub double %69, %68
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %56
  %72 = load double, double* %71, align 8
  %73 = fmul double %21, %72
  %74 = fsub double %70, %73
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %57
  %76 = load double, double* %75, align 8
  %77 = fmul double %20, %76
  %78 = fsub double %74, %77
  %79 = fdiv double %78, %61
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %79, double* %80, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, %wide.trip.count
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep56 = getelementptr [1000 x double], [1000 x double]* %5, i64 %47, i64 0
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %4, i64 %47, i64 0
  %load_initial = load double, double* %scevgep55, align 8
  %load_initial57 = load double, double* %scevgep56, align 8
  br label %99

._crit_edge9.us.loopexit:                         ; preds = %.lr.ph8.us
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %.lr.ph8.us.prol.loopexit, %._crit_edge.us
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, %wide.trip.count29
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond30, label %.preheader, label %.lver.check

.lr.ph8.us:                                       ; preds = %.lr.ph8.us.preheader83, %.lr.ph8.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26.1, %.lr.ph8.us ], [ %indvars.iv25.unr.ph, %.lr.ph8.us.preheader83 ]
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv25
  %82 = load double, double* %81, align 8
  %83 = add nsw i64 %indvars.iv25, 1
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %83, i64 %indvars.iv27
  %85 = load double, double* %84, align 8
  %86 = fmul double %82, %85
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv25
  %88 = load double, double* %87, align 8
  %89 = fadd double %86, %88
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv27
  store double %89, double* %90, align 8
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, -1
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.next26
  %92 = load double, double* %91, align 8
  %93 = fmul double %92, %89
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.next26
  %95 = load double, double* %94, align 8
  %96 = fadd double %93, %95
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next26, i64 %indvars.iv27
  store double %96, double* %97, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, -2
  %98 = icmp sgt i64 %indvars.iv.next26, 1
  br i1 %98, label %.lr.ph8.us, label %._crit_edge9.us.loopexit

; <label>:99:                                     ; preds = %99, %.ph
  %store_forwarded58 = phi double [ %load_initial57, %.ph ], [ %117, %99 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %102, %99 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %99 ]
  %100 = fmul double %20, %store_forwarded
  %101 = fadd double %23, %100
  %102 = fdiv double %33, %101
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv
  store double %102, double* %103, align 8
  %104 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %55
  %105 = bitcast double* %104 to <2 x double>*
  %106 = load <2 x double>, <2 x double>* %105, align 8
  %107 = fmul <2 x double> %45, %106
  %108 = extractelement <2 x double> %107, i32 0
  %109 = extractelement <2 x double> %107, i32 1
  %110 = fsub double %109, %108
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %56
  %112 = load double, double* %111, align 8
  %113 = fmul double %21, %112
  %114 = fsub double %110, %113
  %115 = fmul double %20, %store_forwarded58
  %116 = fsub double %114, %115
  %117 = fdiv double %116, %101
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv
  store double %117, double* %118, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit84, label %99

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit84:                        ; preds = %99
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit84, %._crit_edge.us.loopexit
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %29, i64 %indvars.iv27
  store double 1.000000e+00, double* %119, align 8
  br i1 %31, label %.lr.ph8.us.preheader, label %._crit_edge9.us

.lr.ph8.us.preheader:                             ; preds = %._crit_edge.us
  br i1 %lcmp.mod, label %.lr.ph8.us.prol.loopexit, label %.lr.ph8.us.prol

.lr.ph8.us.prol:                                  ; preds = %.lr.ph8.us.preheader
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %39
  %121 = load double, double* %120, align 8
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %42, i64 %indvars.iv27
  %123 = load double, double* %122, align 8
  %124 = fmul double %121, %123
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %39
  %126 = load double, double* %125, align 8
  %127 = fadd double %124, %126
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %39, i64 %indvars.iv27
  store double %127, double* %128, align 8
  br label %.lr.ph8.us.prol.loopexit

.lr.ph8.us.prol.loopexit:                         ; preds = %.lr.ph8.us.prol, %.lr.ph8.us.preheader
  %indvars.iv25.unr.ph = phi i64 [ %indvars.iv.next26.prol, %.lr.ph8.us.prol ], [ %39, %.lr.ph8.us.preheader ]
  br i1 %41, label %._crit_edge9.us, label %.lr.ph8.us.preheader83

.lr.ph8.us.preheader83:                           ; preds = %.lr.ph8.us.prol.loopexit
  br label %.lr.ph8.us

.preheader:                                       ; preds = %._crit_edge9.us
  br i1 %27, label %.lver.check73.preheader, label %._crit_edge22

.lver.check73.preheader:                          ; preds = %.preheader
  br label %.lver.check73

.lver.check73:                                    ; preds = %.lver.check73.preheader, %._crit_edge19.us
  %indvar59 = phi i64 [ %indvar.next60, %._crit_edge19.us ], [ 0, %.lver.check73.preheader ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge19.us ], [ 1, %.lver.check73.preheader ]
  %129 = add i64 %indvar59, 1
  %130 = add i64 %indvar59, 1
  %scevgep61 = getelementptr [1000 x double], [1000 x double]* %4, i64 %130, i64 0
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %4, i64 %130, i64 %wide.trip.count
  %scevgep65 = getelementptr [1000 x double], [1000 x double]* %5, i64 %130, i64 0
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %5, i64 %130, i64 %wide.trip.count
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %131, i64 0, i64 0
  store double 1.000000e+00, double* %132, align 8
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 0
  store double 0.000000e+00, double* %133, align 8
  %134 = bitcast [1000 x double]* %131 to i64*
  %135 = load i64, i64* %134, align 8
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39
  %137 = bitcast [1000 x double]* %136 to i64*
  store i64 %135, i64* %137, align 8
  %138 = add nsw i64 %indvars.iv39, -1
  %139 = add nuw nsw i64 %indvars.iv39, 1
  %bound069 = icmp ult double* %scevgep61, %scevgep67
  %bound170 = icmp ult double* %scevgep65, %scevgep63
  %memcheck.conflict72 = and i1 %bound069, %bound170
  br i1 %memcheck.conflict72, label %.ph74.lver.orig.preheader, label %.ph74

.ph74.lver.orig.preheader:                        ; preds = %.lver.check73
  br label %.ph74.lver.orig

.ph74.lver.orig:                                  ; preds = %.ph74.lver.orig.preheader, %.ph74.lver.orig
  %indvars.iv31.lver.orig = phi i64 [ %indvars.iv.next32.lver.orig, %.ph74.lver.orig ], [ 1, %.ph74.lver.orig.preheader ]
  %140 = add nsw i64 %indvars.iv31.lver.orig, -1
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %140
  %142 = load double, double* %141, align 8
  %143 = fmul double %21, %142
  %144 = fadd double %24, %143
  %145 = fdiv double %34, %144
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  store double %145, double* %146, align 8
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %138, i64 %indvars.iv31.lver.orig
  %148 = load double, double* %147, align 8
  %149 = fmul double %20, %148
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  %151 = load double, double* %150, align 8
  %152 = fmul double %38, %151
  %153 = fsub double %152, %149
  %154 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %139, i64 %indvars.iv31.lver.orig
  %155 = load double, double* %154, align 8
  %156 = fmul double %20, %155
  %157 = fsub double %153, %156
  %158 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %140
  %159 = load double, double* %158, align 8
  %160 = fmul double %21, %159
  %161 = fsub double %157, %160
  %162 = fdiv double %161, %144
  %163 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  store double %162, double* %163, align 8
  %indvars.iv.next32.lver.orig = add nuw nsw i64 %indvars.iv31.lver.orig, 1
  %exitcond34.lver.orig = icmp eq i64 %indvars.iv.next32.lver.orig, %wide.trip.count33
  br i1 %exitcond34.lver.orig, label %._crit_edge15.us.loopexit, label %.ph74.lver.orig

.ph74:                                            ; preds = %.lver.check73
  %scevgep78 = getelementptr [1000 x double], [1000 x double]* %5, i64 %129, i64 0
  %scevgep75 = getelementptr [1000 x double], [1000 x double]* %4, i64 %129, i64 0
  %load_initial76 = load double, double* %scevgep75, align 8
  %load_initial79 = load double, double* %scevgep78, align 8
  br label %182

._crit_edge19.us.loopexit:                        ; preds = %.lr.ph18.us
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge19.us.loopexit, %.lr.ph18.us.prol.loopexit, %._crit_edge15.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  %indvar.next60 = add i64 %indvar59, 1
  br i1 %exitcond42, label %._crit_edge22.loopexit, label %.lver.check73

.lr.ph18.us:                                      ; preds = %.lr.ph18.us.preheader81, %.lr.ph18.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %.lr.ph18.us ], [ %indvars.iv35.unr.ph, %.lr.ph18.us.preheader81 ]
  %164 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv35
  %165 = load double, double* %164, align 8
  %166 = add nsw i64 %indvars.iv35, 1
  %167 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %166
  %168 = load double, double* %167, align 8
  %169 = fmul double %165, %168
  %170 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv35
  %171 = load double, double* %170, align 8
  %172 = fadd double %169, %171
  %173 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv35
  store double %172, double* %173, align 8
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, -1
  %174 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv.next36
  %175 = load double, double* %174, align 8
  %176 = fmul double %175, %172
  %177 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv.next36
  %178 = load double, double* %177, align 8
  %179 = fadd double %176, %178
  %180 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next36
  store double %179, double* %180, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, -2
  %181 = icmp sgt i64 %indvars.iv.next36, 1
  br i1 %181, label %.lr.ph18.us, label %._crit_edge19.us.loopexit

; <label>:182:                                    ; preds = %182, %.ph74
  %store_forwarded80 = phi double [ %load_initial79, %.ph74 ], [ %200, %182 ]
  %store_forwarded77 = phi double [ %load_initial76, %.ph74 ], [ %185, %182 ]
  %indvars.iv31 = phi i64 [ 1, %.ph74 ], [ %indvars.iv.next32, %182 ]
  %183 = fmul double %21, %store_forwarded77
  %184 = fadd double %24, %183
  %185 = fdiv double %34, %184
  %186 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv31
  store double %185, double* %186, align 8
  %187 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %138, i64 %indvars.iv31
  %188 = load double, double* %187, align 8
  %189 = fmul double %20, %188
  %190 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv31
  %191 = load double, double* %190, align 8
  %192 = fmul double %38, %191
  %193 = fsub double %192, %189
  %194 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %139, i64 %indvars.iv31
  %195 = load double, double* %194, align 8
  %196 = fmul double %20, %195
  %197 = fsub double %193, %196
  %198 = fmul double %21, %store_forwarded80
  %199 = fsub double %197, %198
  %200 = fdiv double %199, %184
  %201 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv31
  store double %200, double* %201, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge15.us.loopexit82, label %182

._crit_edge15.us.loopexit:                        ; preds = %.ph74.lver.orig
  br label %._crit_edge15.us

._crit_edge15.us.loopexit82:                      ; preds = %182
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit82, %._crit_edge15.us.loopexit
  %202 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %29
  store double 1.000000e+00, double* %202, align 8
  br i1 %31, label %.lr.ph18.us.preheader, label %._crit_edge19.us

.lr.ph18.us.preheader:                            ; preds = %._crit_edge15.us
  br i1 %lcmp.mod38, label %.lr.ph18.us.prol.loopexit, label %.lr.ph18.us.prol

.lr.ph18.us.prol:                                 ; preds = %.lr.ph18.us.preheader
  %203 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %39
  %204 = load double, double* %203, align 8
  %205 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %44
  %206 = load double, double* %205, align 8
  %207 = fmul double %204, %206
  %208 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %39
  %209 = load double, double* %208, align 8
  %210 = fadd double %207, %209
  %211 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %39
  store double %210, double* %211, align 8
  br label %.lr.ph18.us.prol.loopexit

.lr.ph18.us.prol.loopexit:                        ; preds = %.lr.ph18.us.prol, %.lr.ph18.us.preheader
  %indvars.iv35.unr.ph = phi i64 [ %indvars.iv.next36.prol, %.lr.ph18.us.prol ], [ %39, %.lr.ph18.us.preheader ]
  br i1 %43, label %._crit_edge19.us, label %.lr.ph18.us.preheader81

.lr.ph18.us.preheader81:                          ; preds = %.lr.ph18.us.prol.loopexit
  br label %.lr.ph18.us

._crit_edge22.loopexit:                           ; preds = %._crit_edge19.us
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %.preheader4, %.preheader
  %212 = add nuw nsw i32 %.0323, 1
  %exitcond43 = icmp eq i32 %.0323, %0
  br i1 %exitcond43, label %._crit_edge24.loopexit, label %.preheader4

._crit_edge24.loopexit:                           ; preds = %._crit_edge22
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %6
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
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count7 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv5, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
