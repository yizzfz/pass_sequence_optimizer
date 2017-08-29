; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  tail call void @print_array(i32 1000, [1000 x double]* %7)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [1000 x double]* nocapture) #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader.lr.ph, label %._crit_edge4

.preheader.lr.ph:                                 ; preds = %2
  %4 = sitofp i32 %0 to double
  %5 = sext i32 %0 to i64
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %6 = icmp eq i32 %0, 1
  %wide.trip.count7 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %7 = add nsw i64 %indvars.iv5, %5
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, %4
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 0
  store double %10, double* %11, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %6, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %12 = trunc i64 %7 to i32
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %13 = trunc i64 %indvars.iv to i32
  %14 = sub i32 %12, %13
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, %4
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  store double %16, double* %17, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = trunc i64 %indvars.iv.next to i32
  %19 = sub i32 %12, %18
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, %4
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %21, double* %22, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count7
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

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) #2 {
  %7 = sitofp i32 %1 to double
  %8 = insertelement <2 x double> undef, double %7, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  %10 = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %9
  %11 = sitofp i32 %0 to double
  %12 = fdiv double 1.000000e+00, %11
  %13 = insertelement <2 x double> undef, double %12, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = fmul <2 x double> %14, <double 2.000000e+00, double 1.000000e+00>
  %16 = fmul <2 x double> %10, %10
  %17 = fdiv <2 x double> %15, %16
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  %20 = fadd double %18, 1.000000e+00
  %21 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %17
  %22 = fdiv <2 x double> %21, <double 2.000000e+00, double 2.000000e+00>
  %23 = extractelement <2 x double> %22, i32 0
  %24 = extractelement <2 x double> %22, i32 1
  %25 = fadd double %19, 1.000000e+00
  %26 = icmp slt i32 %0, 1
  br i1 %26, label %._crit_edge24, label %.preheader4.lr.ph

.preheader4.lr.ph:                                ; preds = %6
  %27 = add nsw i32 %1, -1
  %28 = icmp sgt i32 %27, 1
  %29 = sext i32 %27 to i64
  %30 = add nsw i32 %1, -2
  %31 = icmp sgt i32 %1, 2
  %32 = fsub double -0.000000e+00, %23
  %33 = fmul double %24, 2.000000e+00
  %34 = fadd double %33, 1.000000e+00
  %35 = fsub double -0.000000e+00, %24
  %36 = fmul double %23, 2.000000e+00
  %37 = fadd double %36, 1.000000e+00
  %38 = sext i32 %30 to i64
  %wide.trip.count = zext i32 %27 to i64
  %xtraiter = and i32 %30, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %39 = icmp eq i32 %1, 3
  %indvars.iv.next26.prol = add nsw i64 %38, -1
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge22, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %197, %._crit_edge22 ]
  br i1 %28, label %.lver.check.preheader, label %._crit_edge22

.lver.check.preheader:                            ; preds = %.preheader4
  br label %.lver.check

.lver.check:                                      ; preds = %.lver.check.preheader, %._crit_edge9.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge9.us ], [ 0, %.lver.check.preheader ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge9.us ], [ 1, %.lver.check.preheader ]
  %40 = add nuw nsw i64 %indvar, 1
  %41 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %41, i64 0
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %4, i64 %41, i64 %wide.trip.count
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %5, i64 %41, i64 0
  %scevgep53 = getelementptr [1000 x double], [1000 x double]* %5, i64 %41, i64 %wide.trip.count
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv27
  store double 1.000000e+00, double* %42, align 8
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 0
  store double 0.000000e+00, double* %43, align 8
  %44 = bitcast double* %42 to i64*
  %45 = load i64, i64* %44, align 8
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27
  %47 = bitcast [1000 x double]* %46 to i64*
  store i64 %45, i64* %47, align 8
  %48 = add nsw i64 %indvars.iv27, -1
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %bound0 = icmp ult double* %scevgep, %scevgep53
  %bound1 = icmp ult double* %scevgep51, %scevgep49
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %49 = add nsw i64 %indvars.iv.lver.orig, -1
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %49
  %51 = load double, double* %50, align 8
  %52 = fmul double %23, %51
  %53 = fadd double %20, %52
  %54 = fdiv double %32, %53
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %54, double* %55, align 8
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %48
  %57 = load double, double* %56, align 8
  %58 = fmul double %24, %57
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv27
  %60 = load double, double* %59, align 8
  %61 = fmul double %34, %60
  %62 = fsub double %61, %58
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next28
  %64 = load double, double* %63, align 8
  %65 = fmul double %24, %64
  %66 = fsub double %62, %65
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %49
  %68 = load double, double* %67, align 8
  %69 = fmul double %23, %68
  %70 = fsub double %66, %69
  %71 = fdiv double %70, %53
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %71, double* %72, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, %wide.trip.count
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep56 = getelementptr [1000 x double], [1000 x double]* %5, i64 %40, i64 0
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %4, i64 %40, i64 0
  %load_initial = load double, double* %scevgep55, align 8
  %load_initial57 = load double, double* %scevgep56, align 8
  br label %91

._crit_edge9.us.loopexit:                         ; preds = %.lr.ph8.us
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %.lr.ph8.us.prol.loopexit, %._crit_edge.us
  %exitcond30 = icmp eq i64 %indvars.iv.next28, %wide.trip.count
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond30, label %.lver.check73.preheader, label %.lver.check

.lver.check73.preheader:                          ; preds = %._crit_edge9.us
  br label %.lver.check73

.lr.ph8.us:                                       ; preds = %.lr.ph8.us.preheader83, %.lr.ph8.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26.1, %.lr.ph8.us ], [ %indvars.iv25.unr.ph, %.lr.ph8.us.preheader83 ]
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv25
  %74 = load double, double* %73, align 8
  %75 = add nsw i64 %indvars.iv25, 1
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %75, i64 %indvars.iv27
  %77 = load double, double* %76, align 8
  %78 = fmul double %74, %77
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv25
  %80 = load double, double* %79, align 8
  %81 = fadd double %78, %80
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv27
  store double %81, double* %82, align 8
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, -1
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.next26
  %84 = load double, double* %83, align 8
  %85 = fmul double %84, %81
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.next26
  %87 = load double, double* %86, align 8
  %88 = fadd double %85, %87
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next26, i64 %indvars.iv27
  store double %88, double* %89, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, -2
  %90 = icmp sgt i64 %indvars.iv.next26, 1
  br i1 %90, label %.lr.ph8.us, label %._crit_edge9.us.loopexit

; <label>:91:                                     ; preds = %91, %.ph
  %store_forwarded58 = phi double [ %load_initial57, %.ph ], [ %109, %91 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %94, %91 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %91 ]
  %92 = fmul double %23, %store_forwarded
  %93 = fadd double %20, %92
  %94 = fdiv double %32, %93
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv
  store double %94, double* %95, align 8
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %48
  %97 = load double, double* %96, align 8
  %98 = fmul double %24, %97
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv27
  %100 = load double, double* %99, align 8
  %101 = fmul double %34, %100
  %102 = fsub double %101, %98
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next28
  %104 = load double, double* %103, align 8
  %105 = fmul double %24, %104
  %106 = fsub double %102, %105
  %107 = fmul double %23, %store_forwarded58
  %108 = fsub double %106, %107
  %109 = fdiv double %108, %93
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv
  store double %109, double* %110, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit84, label %91

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit84:                        ; preds = %91
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit84, %._crit_edge.us.loopexit
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %29, i64 %indvars.iv27
  store double 1.000000e+00, double* %111, align 8
  br i1 %31, label %.lr.ph8.us.preheader, label %._crit_edge9.us

.lr.ph8.us.preheader:                             ; preds = %._crit_edge.us
  br i1 %lcmp.mod, label %.lr.ph8.us.prol.loopexit, label %.lr.ph8.us.prol

.lr.ph8.us.prol:                                  ; preds = %.lr.ph8.us.preheader
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %38
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %38
  %115 = load double, double* %114, align 8
  %116 = fadd double %113, %115
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %38, i64 %indvars.iv27
  store double %116, double* %117, align 8
  br label %.lr.ph8.us.prol.loopexit

.lr.ph8.us.prol.loopexit:                         ; preds = %.lr.ph8.us.prol, %.lr.ph8.us.preheader
  %indvars.iv25.unr.ph = phi i64 [ %indvars.iv.next26.prol, %.lr.ph8.us.prol ], [ %38, %.lr.ph8.us.preheader ]
  br i1 %39, label %._crit_edge9.us, label %.lr.ph8.us.preheader83

.lr.ph8.us.preheader83:                           ; preds = %.lr.ph8.us.prol.loopexit
  br label %.lr.ph8.us

.lver.check73:                                    ; preds = %.lver.check73.preheader, %._crit_edge19.us
  %indvar59 = phi i64 [ %indvar.next60, %._crit_edge19.us ], [ 0, %.lver.check73.preheader ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge19.us ], [ 1, %.lver.check73.preheader ]
  %118 = add nuw nsw i64 %indvar59, 1
  %119 = add nuw nsw i64 %indvar59, 1
  %scevgep61 = getelementptr [1000 x double], [1000 x double]* %4, i64 %119, i64 0
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %4, i64 %119, i64 %wide.trip.count
  %scevgep65 = getelementptr [1000 x double], [1000 x double]* %5, i64 %119, i64 0
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %5, i64 %119, i64 %wide.trip.count
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %120, i64 0, i64 0
  store double 1.000000e+00, double* %121, align 8
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 0
  store double 0.000000e+00, double* %122, align 8
  %123 = bitcast [1000 x double]* %120 to i64*
  %124 = load i64, i64* %123, align 8
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39
  %126 = bitcast [1000 x double]* %125 to i64*
  store i64 %124, i64* %126, align 8
  %127 = add nsw i64 %indvars.iv39, -1
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %bound069 = icmp ult double* %scevgep61, %scevgep67
  %bound170 = icmp ult double* %scevgep65, %scevgep63
  %memcheck.conflict72 = and i1 %bound069, %bound170
  br i1 %memcheck.conflict72, label %.ph74.lver.orig.preheader, label %.ph74

.ph74.lver.orig.preheader:                        ; preds = %.lver.check73
  br label %.ph74.lver.orig

.ph74.lver.orig:                                  ; preds = %.ph74.lver.orig.preheader, %.ph74.lver.orig
  %indvars.iv31.lver.orig = phi i64 [ %indvars.iv.next32.lver.orig, %.ph74.lver.orig ], [ 1, %.ph74.lver.orig.preheader ]
  %128 = add nsw i64 %indvars.iv31.lver.orig, -1
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %128
  %130 = load double, double* %129, align 8
  %131 = fmul double %24, %130
  %132 = fadd double %25, %131
  %133 = fdiv double %35, %132
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  store double %133, double* %134, align 8
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %127, i64 %indvars.iv31.lver.orig
  %136 = load double, double* %135, align 8
  %137 = fmul double %23, %136
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  %139 = load double, double* %138, align 8
  %140 = fmul double %37, %139
  %141 = fsub double %140, %137
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next40, i64 %indvars.iv31.lver.orig
  %143 = load double, double* %142, align 8
  %144 = fmul double %23, %143
  %145 = fsub double %141, %144
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %128
  %147 = load double, double* %146, align 8
  %148 = fmul double %24, %147
  %149 = fsub double %145, %148
  %150 = fdiv double %149, %132
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  store double %150, double* %151, align 8
  %indvars.iv.next32.lver.orig = add nuw nsw i64 %indvars.iv31.lver.orig, 1
  %exitcond34.lver.orig = icmp eq i64 %indvars.iv.next32.lver.orig, %wide.trip.count
  br i1 %exitcond34.lver.orig, label %._crit_edge15.us.loopexit, label %.ph74.lver.orig

.ph74:                                            ; preds = %.lver.check73
  %scevgep78 = getelementptr [1000 x double], [1000 x double]* %5, i64 %118, i64 0
  %scevgep75 = getelementptr [1000 x double], [1000 x double]* %4, i64 %118, i64 0
  %load_initial76 = load double, double* %scevgep75, align 8
  %load_initial79 = load double, double* %scevgep78, align 8
  br label %170

._crit_edge19.us.loopexit:                        ; preds = %.lr.ph18.us
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge19.us.loopexit, %.lr.ph18.us.prol.loopexit, %._crit_edge15.us
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count
  %indvar.next60 = add nuw nsw i64 %indvar59, 1
  br i1 %exitcond42, label %._crit_edge22.loopexit, label %.lver.check73

.lr.ph18.us:                                      ; preds = %.lr.ph18.us.preheader81, %.lr.ph18.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %.lr.ph18.us ], [ %indvars.iv35.unr.ph, %.lr.ph18.us.preheader81 ]
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv35
  %153 = load double, double* %152, align 8
  %154 = add nsw i64 %indvars.iv35, 1
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %154
  %156 = load double, double* %155, align 8
  %157 = fmul double %153, %156
  %158 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv35
  %159 = load double, double* %158, align 8
  %160 = fadd double %157, %159
  %161 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv35
  store double %160, double* %161, align 8
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, -1
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv.next36
  %163 = load double, double* %162, align 8
  %164 = fmul double %163, %160
  %165 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv.next36
  %166 = load double, double* %165, align 8
  %167 = fadd double %164, %166
  %168 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next36
  store double %167, double* %168, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, -2
  %169 = icmp sgt i64 %indvars.iv.next36, 1
  br i1 %169, label %.lr.ph18.us, label %._crit_edge19.us.loopexit

; <label>:170:                                    ; preds = %170, %.ph74
  %store_forwarded80 = phi double [ %load_initial79, %.ph74 ], [ %188, %170 ]
  %store_forwarded77 = phi double [ %load_initial76, %.ph74 ], [ %173, %170 ]
  %indvars.iv31 = phi i64 [ 1, %.ph74 ], [ %indvars.iv.next32, %170 ]
  %171 = fmul double %24, %store_forwarded77
  %172 = fadd double %25, %171
  %173 = fdiv double %35, %172
  %174 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv31
  store double %173, double* %174, align 8
  %175 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %127, i64 %indvars.iv31
  %176 = load double, double* %175, align 8
  %177 = fmul double %23, %176
  %178 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv31
  %179 = load double, double* %178, align 8
  %180 = fmul double %37, %179
  %181 = fsub double %180, %177
  %182 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next40, i64 %indvars.iv31
  %183 = load double, double* %182, align 8
  %184 = fmul double %23, %183
  %185 = fsub double %181, %184
  %186 = fmul double %24, %store_forwarded80
  %187 = fsub double %185, %186
  %188 = fdiv double %187, %172
  %189 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv31
  store double %188, double* %189, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count
  br i1 %exitcond34, label %._crit_edge15.us.loopexit82, label %170

._crit_edge15.us.loopexit:                        ; preds = %.ph74.lver.orig
  br label %._crit_edge15.us

._crit_edge15.us.loopexit82:                      ; preds = %170
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit82, %._crit_edge15.us.loopexit
  %190 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %29
  store double 1.000000e+00, double* %190, align 8
  br i1 %31, label %.lr.ph18.us.preheader, label %._crit_edge19.us

.lr.ph18.us.preheader:                            ; preds = %._crit_edge15.us
  br i1 %lcmp.mod, label %.lr.ph18.us.prol.loopexit, label %.lr.ph18.us.prol

.lr.ph18.us.prol:                                 ; preds = %.lr.ph18.us.preheader
  %191 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %38
  %192 = load double, double* %191, align 8
  %193 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %38
  %194 = load double, double* %193, align 8
  %195 = fadd double %192, %194
  %196 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %38
  store double %195, double* %196, align 8
  br label %.lr.ph18.us.prol.loopexit

.lr.ph18.us.prol.loopexit:                        ; preds = %.lr.ph18.us.prol, %.lr.ph18.us.preheader
  %indvars.iv35.unr.ph = phi i64 [ %indvars.iv.next26.prol, %.lr.ph18.us.prol ], [ %38, %.lr.ph18.us.preheader ]
  br i1 %39, label %._crit_edge19.us, label %.lr.ph18.us.preheader81

.lr.ph18.us.preheader81:                          ; preds = %.lr.ph18.us.prol.loopexit
  br label %.lr.ph18.us

._crit_edge22.loopexit:                           ; preds = %._crit_edge19.us
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %.preheader4
  %197 = add nuw nsw i32 %.0323, 1
  %exitcond43 = icmp eq i32 %.0323, %0
  br i1 %exitcond43, label %._crit_edge24.loopexit, label %.preheader4

._crit_edge24.loopexit:                           ; preds = %._crit_edge22
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %6
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1000 x double]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
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
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count
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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
