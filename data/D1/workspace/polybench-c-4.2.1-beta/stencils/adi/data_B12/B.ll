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
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
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
  %5 = zext i32 %0 to i64
  %xtraiter = and i64 %5, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %6 = icmp eq i32 %0, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next6, %._crit_edge.us ]
  %7 = add i64 %indvars.iv5, %5
  %8 = trunc i64 %7 to i32
  br i1 %lcmp.mod, label %._crit_edge.prol.loopexit.unr-lcssa, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.preheader.us
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, %4
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 0
  store double %10, double* %11, align 8
  br label %._crit_edge.prol.loopexit.unr-lcssa

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %.preheader.us, %._crit_edge.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge.prol ], [ 0, %.preheader.us ]
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.unr-lcssa
  br i1 %6, label %._crit_edge.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us.new ], [ %indvars.iv.next.1, %._crit_edge ]
  %12 = trunc i64 %indvars.iv to i32
  %13 = sub i32 %8, %12
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, %4
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  store double %15, double* %16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %17 = trunc i64 %indvars.iv.next to i32
  %18 = sub i32 %8, %17
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %4
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %20, double* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %5
  br i1 %exitcond.1, label %._crit_edge.us.unr-lcssa, label %._crit_edge

._crit_edge.us.unr-lcssa:                         ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.prol.loopexit, %._crit_edge.us.unr-lcssa
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %5
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  %7 = sitofp i32 %1 to double
  %8 = fdiv double 1.000000e+00, %7
  %9 = sitofp i32 %0 to double
  %10 = fdiv double 1.000000e+00, %9
  %11 = fmul double %10, 2.000000e+00
  %12 = fmul double %8, %8
  %13 = fdiv double %11, %12
  %14 = fdiv double %10, %12
  %15 = fmul double %13, -5.000000e-01
  %16 = fadd double %13, 1.000000e+00
  %17 = fmul double %14, -5.000000e-01
  %18 = fadd double %14, 1.000000e+00
  %19 = icmp slt i32 %0, 1
  br i1 %19, label %._crit_edge24, label %.preheader4.lr.ph

.preheader4.lr.ph:                                ; preds = %6
  %20 = add nsw i32 %1, -1
  %21 = icmp sgt i32 %20, 1
  %22 = sext i32 %20 to i64
  %23 = add nsw i32 %1, -2
  %24 = icmp sgt i32 %1, 2
  %25 = fsub double -0.000000e+00, %15
  %26 = fmul double %17, 2.000000e+00
  %27 = fadd double %26, 1.000000e+00
  %28 = fsub double -0.000000e+00, %17
  %29 = fmul double %15, 2.000000e+00
  %30 = fadd double %29, 1.000000e+00
  %31 = sext i32 %23 to i64
  %wide.trip.count = zext i32 %20 to i64
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge22, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %154, %._crit_edge22 ]
  br i1 %21, label %._crit_edge.lver.check.preheader, label %._crit_edge22

._crit_edge.lver.check.preheader:                 ; preds = %.preheader4
  br label %._crit_edge.lver.check

._crit_edge.lver.check:                           ; preds = %._crit_edge.lver.check.preheader, %._crit_edge9.us
  %indvar = phi i64 [ %32, %._crit_edge9.us ], [ 0, %._crit_edge.lver.check.preheader ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge9.us ], [ 1, %._crit_edge.lver.check.preheader ]
  %32 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %32, i64 0
  %scevgep44 = getelementptr [1000 x double], [1000 x double]* %4, i64 %32, i64 %wide.trip.count
  %scevgep46 = getelementptr [1000 x double], [1000 x double]* %5, i64 %32, i64 0
  %scevgep48 = getelementptr [1000 x double], [1000 x double]* %5, i64 %32, i64 %wide.trip.count
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv27
  store double 1.000000e+00, double* %33, align 8
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 0
  store double 0.000000e+00, double* %34, align 8
  %35 = bitcast double* %33 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27
  %38 = bitcast [1000 x double]* %37 to i64*
  store i64 %36, i64* %38, align 8
  %39 = add nsw i64 %indvars.iv27, -1
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %bound0 = icmp ult double* %scevgep, %scevgep48
  %bound1 = icmp ult double* %scevgep46, %scevgep44
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge.lver.orig.preheader, label %._crit_edge.ph

._crit_edge.lver.orig.preheader:                  ; preds = %._crit_edge.lver.check
  br label %._crit_edge.lver.orig

._crit_edge.lver.orig:                            ; preds = %._crit_edge.lver.orig.preheader, %._crit_edge.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge.lver.orig ], [ 1, %._crit_edge.lver.orig.preheader ]
  %40 = add nsw i64 %indvars.iv.lver.orig, -1
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %40
  %42 = load double, double* %41, align 8
  %43 = fmul double %15, %42
  %44 = fadd double %16, %43
  %45 = fdiv double %25, %44
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %45, double* %46, align 8
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %39
  %48 = load double, double* %47, align 8
  %49 = fmul double %17, %48
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv27
  %51 = load double, double* %50, align 8
  %52 = fmul double %27, %51
  %53 = fsub double %52, %49
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next28
  %55 = load double, double* %54, align 8
  %56 = fmul double %17, %55
  %57 = fsub double %53, %56
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %40
  %59 = load double, double* %58, align 8
  %60 = fmul double %15, %59
  %61 = fsub double %57, %60
  %62 = fdiv double %61, %44
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %62, double* %63, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, %wide.trip.count
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %._crit_edge.lver.orig

._crit_edge.ph:                                   ; preds = %._crit_edge.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial52 = load double, double* %scevgep46, align 8
  br label %._crit_edge

._crit_edge9.us.loopexit:                         ; preds = %.lr.ph8.us
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %._crit_edge.us
  %exitcond30 = icmp eq i64 %indvars.iv.next28, %wide.trip.count
  br i1 %exitcond30, label %.preheader, label %._crit_edge.lver.check

.lr.ph8.us:                                       ; preds = %.lr.ph8.us.preheader, %.lr.ph8.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %.lr.ph8.us ], [ %31, %.lr.ph8.us.preheader ]
  %64 = phi double [ %70, %.lr.ph8.us ], [ 1.000000e+00, %.lr.ph8.us.preheader ]
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv25
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv25
  %69 = load double, double* %68, align 8
  %70 = fadd double %67, %69
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv27
  store double %70, double* %71, align 8
  %72 = icmp sgt i64 %indvars.iv25, 1
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, -1
  br i1 %72, label %.lr.ph8.us, label %._crit_edge9.us.loopexit

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.ph
  %store_forwarded53 = phi double [ %load_initial52, %._crit_edge.ph ], [ %90, %._crit_edge ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge.ph ], [ %75, %._crit_edge ]
  %indvars.iv = phi i64 [ 1, %._crit_edge.ph ], [ %indvars.iv.next, %._crit_edge ]
  %73 = fmul double %15, %store_forwarded
  %74 = fadd double %16, %73
  %75 = fdiv double %25, %74
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv
  store double %75, double* %76, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %39
  %78 = load double, double* %77, align 8
  %79 = fmul double %17, %78
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv27
  %81 = load double, double* %80, align 8
  %82 = fmul double %27, %81
  %83 = fsub double %82, %79
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next28
  %85 = load double, double* %84, align 8
  %86 = fmul double %17, %85
  %87 = fsub double %83, %86
  %88 = fmul double %15, %store_forwarded53
  %89 = fsub double %87, %88
  %90 = fdiv double %89, %74
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv
  store double %90, double* %91, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit75, label %._crit_edge

._crit_edge.us.loopexit:                          ; preds = %._crit_edge.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit75:                        ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit75, %._crit_edge.us.loopexit
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %22, i64 %indvars.iv27
  store double 1.000000e+00, double* %92, align 8
  br i1 %24, label %.lr.ph8.us.preheader, label %._crit_edge9.us

.lr.ph8.us.preheader:                             ; preds = %._crit_edge.us
  br label %.lr.ph8.us

.preheader:                                       ; preds = %._crit_edge9.us
  br i1 true, label %._crit_edge42.lver.check.preheader, label %.preheader.._crit_edge22_crit_edge

.preheader.._crit_edge22_crit_edge:               ; preds = %.preheader
  br label %._crit_edge22

._crit_edge42.lver.check.preheader:               ; preds = %.preheader
  br label %._crit_edge42.lver.check

._crit_edge42.lver.check:                         ; preds = %._crit_edge42.lver.check.preheader, %._crit_edge19.us
  %indvar54 = phi i64 [ %93, %._crit_edge19.us ], [ 0, %._crit_edge42.lver.check.preheader ]
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge19.us ], [ 1, %._crit_edge42.lver.check.preheader ]
  %93 = add i64 %indvar54, 1
  %scevgep56 = getelementptr [1000 x double], [1000 x double]* %4, i64 %93, i64 0
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %4, i64 %93, i64 %wide.trip.count
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %5, i64 %93, i64 0
  %scevgep62 = getelementptr [1000 x double], [1000 x double]* %5, i64 %93, i64 %wide.trip.count
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 0
  store double 1.000000e+00, double* %94, align 8
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv37, i64 0
  store double 0.000000e+00, double* %95, align 8
  %96 = bitcast double* %94 to i64*
  %97 = load i64, i64* %96, align 8
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37
  %99 = bitcast [1000 x double]* %98 to i64*
  store i64 %97, i64* %99, align 8
  %100 = add nsw i64 %indvars.iv37, -1
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %bound064 = icmp ult double* %scevgep56, %scevgep62
  %bound165 = icmp ult double* %scevgep60, %scevgep58
  %memcheck.conflict67 = and i1 %bound064, %bound165
  br i1 %memcheck.conflict67, label %._crit_edge42.lver.orig.preheader, label %._crit_edge42.ph

._crit_edge42.lver.orig.preheader:                ; preds = %._crit_edge42.lver.check
  br label %._crit_edge42.lver.orig

._crit_edge42.lver.orig:                          ; preds = %._crit_edge42.lver.orig.preheader, %._crit_edge42.lver.orig
  %indvars.iv31.lver.orig = phi i64 [ %indvars.iv.next32.lver.orig, %._crit_edge42.lver.orig ], [ 1, %._crit_edge42.lver.orig.preheader ]
  %101 = add nsw i64 %indvars.iv31.lver.orig, -1
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv37, i64 %101
  %103 = load double, double* %102, align 8
  %104 = fmul double %17, %103
  %105 = fadd double %18, %104
  %106 = fdiv double %28, %105
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  store double %106, double* %107, align 8
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %100, i64 %indvars.iv31.lver.orig
  %109 = load double, double* %108, align 8
  %110 = fmul double %15, %109
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  %112 = load double, double* %111, align 8
  %113 = fmul double %30, %112
  %114 = fsub double %113, %110
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next38, i64 %indvars.iv31.lver.orig
  %116 = load double, double* %115, align 8
  %117 = fmul double %15, %116
  %118 = fsub double %114, %117
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %101
  %120 = load double, double* %119, align 8
  %121 = fmul double %17, %120
  %122 = fsub double %118, %121
  %123 = fdiv double %122, %105
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  store double %123, double* %124, align 8
  %indvars.iv.next32.lver.orig = add nuw nsw i64 %indvars.iv31.lver.orig, 1
  %exitcond34.lver.orig = icmp eq i64 %indvars.iv.next32.lver.orig, %wide.trip.count
  br i1 %exitcond34.lver.orig, label %._crit_edge15.us.loopexit, label %._crit_edge42.lver.orig

._crit_edge42.ph:                                 ; preds = %._crit_edge42.lver.check
  %load_initial69 = load double, double* %scevgep56, align 8
  %load_initial72 = load double, double* %scevgep60, align 8
  br label %._crit_edge42

._crit_edge19.us.loopexit:                        ; preds = %.lr.ph18.us
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge19.us.loopexit, %._crit_edge15.us
  %exitcond40 = icmp eq i64 %indvars.iv.next38, %wide.trip.count
  br i1 %exitcond40, label %._crit_edge22.loopexit, label %._crit_edge42.lver.check

.lr.ph18.us:                                      ; preds = %.lr.ph18.us.preheader, %.lr.ph18.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %.lr.ph18.us ], [ %31, %.lr.ph18.us.preheader ]
  %125 = phi double [ %131, %.lr.ph18.us ], [ 1.000000e+00, %.lr.ph18.us.preheader ]
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv35
  %127 = load double, double* %126, align 8
  %128 = fmul double %127, %125
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv35
  %130 = load double, double* %129, align 8
  %131 = fadd double %128, %130
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv35
  store double %131, double* %132, align 8
  %133 = icmp sgt i64 %indvars.iv35, 1
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, -1
  br i1 %133, label %.lr.ph18.us, label %._crit_edge19.us.loopexit

._crit_edge42:                                    ; preds = %._crit_edge42, %._crit_edge42.ph
  %store_forwarded73 = phi double [ %load_initial72, %._crit_edge42.ph ], [ %151, %._crit_edge42 ]
  %store_forwarded70 = phi double [ %load_initial69, %._crit_edge42.ph ], [ %136, %._crit_edge42 ]
  %indvars.iv31 = phi i64 [ 1, %._crit_edge42.ph ], [ %indvars.iv.next32, %._crit_edge42 ]
  %134 = fmul double %17, %store_forwarded70
  %135 = fadd double %18, %134
  %136 = fdiv double %28, %135
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv31
  store double %136, double* %137, align 8
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %100, i64 %indvars.iv31
  %139 = load double, double* %138, align 8
  %140 = fmul double %15, %139
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv31
  %142 = load double, double* %141, align 8
  %143 = fmul double %30, %142
  %144 = fsub double %143, %140
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next38, i64 %indvars.iv31
  %146 = load double, double* %145, align 8
  %147 = fmul double %15, %146
  %148 = fsub double %144, %147
  %149 = fmul double %17, %store_forwarded73
  %150 = fsub double %148, %149
  %151 = fdiv double %150, %135
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv31
  store double %151, double* %152, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count
  br i1 %exitcond34, label %._crit_edge15.us.loopexit74, label %._crit_edge42

._crit_edge15.us.loopexit:                        ; preds = %._crit_edge42.lver.orig
  br label %._crit_edge15.us

._crit_edge15.us.loopexit74:                      ; preds = %._crit_edge42
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit74, %._crit_edge15.us.loopexit
  %153 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %22
  store double 1.000000e+00, double* %153, align 8
  br i1 %24, label %.lr.ph18.us.preheader, label %._crit_edge19.us

.lr.ph18.us.preheader:                            ; preds = %._crit_edge15.us
  br label %.lr.ph18.us

._crit_edge22.loopexit:                           ; preds = %._crit_edge19.us
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %.preheader.._crit_edge22_crit_edge, %._crit_edge22.loopexit, %.preheader4
  %exitcond41 = icmp eq i32 %.0323, %0
  %154 = add nuw nsw i32 %.0323, 1
  br i1 %exitcond41, label %._crit_edge24.loopexit, label %.preheader4

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
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv5, %8
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge9

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
