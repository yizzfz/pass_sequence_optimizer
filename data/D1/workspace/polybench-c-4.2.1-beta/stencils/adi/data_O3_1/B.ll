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
  %13 = trunc i64 %7 to i32
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %14 = trunc i64 %indvars.iv to i32
  %15 = sub i32 %12, %14
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, %4
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  store double %17, double* %18, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %19 = trunc i64 %indvars.iv.next to i32
  %20 = sub i32 %13, %19
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, %4
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %22, double* %23, align 8
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
  %28 = icmp sgt i32 %1, 2
  %29 = fsub double -0.000000e+00, %17
  %30 = fmul double %15, 2.000000e+00
  %31 = fadd double %30, 1.000000e+00
  %32 = sext i32 %23 to i64
  %33 = add i32 %1, -3
  %wide.trip.count = zext i32 %20 to i64
  %xtraiter = and i32 %23, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %34 = icmp eq i32 %33, 0
  %35 = add nsw i64 %32, 1
  %indvars.iv.next26.prol = add nsw i64 %32, -1
  %wide.trip.count29 = zext i32 %20 to i64
  %36 = icmp sgt i32 %20, 1
  %37 = sext i32 %20 to i64
  %wide.trip.count33 = zext i32 %20 to i64
  %xtraiter37 = and i32 %23, 1
  %lcmp.mod38 = icmp eq i32 %xtraiter37, 0
  %38 = icmp eq i32 %33, 0
  %39 = add nsw i64 %32, 1
  %indvars.iv.next36.prol = add nsw i64 %32, -1
  %wide.trip.count41 = zext i32 %20 to i64
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge22, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %212, %._crit_edge22 ]
  br i1 %21, label %.lver.check.preheader, label %._crit_edge22

.lver.check.preheader:                            ; preds = %.preheader4
  br label %.lver.check

.lver.check:                                      ; preds = %.lver.check.preheader, %._crit_edge9.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge9.us ], [ 0, %.lver.check.preheader ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge9.us ], [ 1, %.lver.check.preheader ]
  %40 = add i64 %indvar, 1
  %41 = add i64 %indvar, 1
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
  %52 = fmul double %15, %51
  %53 = fadd double %16, %52
  %54 = fdiv double %25, %53
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %54, double* %55, align 8
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %48
  %57 = load double, double* %56, align 8
  %58 = fmul double %17, %57
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv27
  %60 = load double, double* %59, align 8
  %61 = fmul double %27, %60
  %62 = fsub double %61, %58
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next28
  %64 = load double, double* %63, align 8
  %65 = fmul double %17, %64
  %66 = fsub double %62, %65
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %49
  %68 = load double, double* %67, align 8
  %69 = fmul double %15, %68
  %70 = fsub double %66, %69
  %71 = load double, double* %50, align 8
  %72 = fmul double %15, %71
  %73 = fadd double %16, %72
  %74 = fdiv double %70, %73
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %74, double* %75, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, %wide.trip.count
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %4, i64 %40, i64 0
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %5, i64 %40, i64 0
  %load_initial = load double, double* %scevgep55, align 8
  %load_initial59 = load double, double* %scevgep58, align 8
  br label %94

._crit_edge9.us.loopexit:                         ; preds = %.lr.ph8.us
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %.lr.ph8.us.prol.loopexit, %._crit_edge.us
  %exitcond30 = icmp eq i64 %indvars.iv.next28, %wide.trip.count29
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond30, label %.preheader, label %.lver.check

.lr.ph8.us:                                       ; preds = %.lr.ph8.us.preheader87, %.lr.ph8.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26.1, %.lr.ph8.us ], [ %indvars.iv25.unr.ph, %.lr.ph8.us.preheader87 ]
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv25
  %77 = load double, double* %76, align 8
  %78 = add nsw i64 %indvars.iv25, 1
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %78, i64 %indvars.iv27
  %80 = load double, double* %79, align 8
  %81 = fmul double %77, %80
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv25
  %83 = load double, double* %82, align 8
  %84 = fadd double %81, %83
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv27
  store double %84, double* %85, align 8
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, -1
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.next26
  %87 = load double, double* %86, align 8
  %88 = fmul double %87, %84
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.next26
  %90 = load double, double* %89, align 8
  %91 = fadd double %88, %90
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next26, i64 %indvars.iv27
  store double %91, double* %92, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, -2
  %93 = icmp sgt i64 %indvars.iv.next26, 1
  br i1 %93, label %.lr.ph8.us, label %._crit_edge9.us.loopexit

; <label>:94:                                     ; preds = %94, %.ph
  %store_forwarded60 = phi double [ %load_initial59, %.ph ], [ %114, %94 ]
  %store_forwarded57 = phi double [ %load_initial, %.ph ], [ %97, %94 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %94 ]
  %95 = fmul double %15, %store_forwarded57
  %96 = fadd double %16, %95
  %97 = fdiv double %25, %96
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv
  store double %97, double* %98, align 8
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %48
  %100 = load double, double* %99, align 8
  %101 = fmul double %17, %100
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv27
  %103 = load double, double* %102, align 8
  %104 = fmul double %27, %103
  %105 = fsub double %104, %101
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next28
  %107 = load double, double* %106, align 8
  %108 = fmul double %17, %107
  %109 = fsub double %105, %108
  %110 = fmul double %15, %store_forwarded60
  %111 = fsub double %109, %110
  %112 = fmul double %15, %store_forwarded57
  %113 = fadd double %16, %112
  %114 = fdiv double %111, %113
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv
  store double %114, double* %115, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit88, label %94

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit88:                        ; preds = %94
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit88, %._crit_edge.us.loopexit
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %22, i64 %indvars.iv27
  store double 1.000000e+00, double* %116, align 8
  br i1 %24, label %.lr.ph8.us.preheader, label %._crit_edge9.us

.lr.ph8.us.preheader:                             ; preds = %._crit_edge.us
  br i1 %lcmp.mod, label %.lr.ph8.us.prol.loopexit, label %.lr.ph8.us.prol

.lr.ph8.us.prol:                                  ; preds = %.lr.ph8.us.preheader
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %32
  %118 = load double, double* %117, align 8
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %35, i64 %indvars.iv27
  %120 = load double, double* %119, align 8
  %121 = fmul double %118, %120
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %32
  %123 = load double, double* %122, align 8
  %124 = fadd double %121, %123
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %32, i64 %indvars.iv27
  store double %124, double* %125, align 8
  br label %.lr.ph8.us.prol.loopexit

.lr.ph8.us.prol.loopexit:                         ; preds = %.lr.ph8.us.prol, %.lr.ph8.us.preheader
  %indvars.iv25.unr.ph = phi i64 [ %indvars.iv.next26.prol, %.lr.ph8.us.prol ], [ %32, %.lr.ph8.us.preheader ]
  br i1 %34, label %._crit_edge9.us, label %.lr.ph8.us.preheader87

.lr.ph8.us.preheader87:                           ; preds = %.lr.ph8.us.prol.loopexit
  br label %.lr.ph8.us

.preheader:                                       ; preds = %._crit_edge9.us
  br i1 %36, label %.lver.check75.preheader, label %._crit_edge22

.lver.check75.preheader:                          ; preds = %.preheader
  br label %.lver.check75

.lver.check75:                                    ; preds = %.lver.check75.preheader, %._crit_edge19.us
  %indvar61 = phi i64 [ %indvar.next62, %._crit_edge19.us ], [ 0, %.lver.check75.preheader ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge19.us ], [ 1, %.lver.check75.preheader ]
  %126 = add i64 %indvar61, 1
  %127 = add i64 %indvar61, 1
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %4, i64 %127, i64 0
  %scevgep65 = getelementptr [1000 x double], [1000 x double]* %4, i64 %127, i64 %wide.trip.count
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %5, i64 %127, i64 0
  %scevgep69 = getelementptr [1000 x double], [1000 x double]* %5, i64 %127, i64 %wide.trip.count
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 0
  store double 1.000000e+00, double* %128, align 8
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 0
  store double 0.000000e+00, double* %129, align 8
  %130 = bitcast double* %128 to i64*
  %131 = load i64, i64* %130, align 8
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39
  %133 = bitcast [1000 x double]* %132 to i64*
  store i64 %131, i64* %133, align 8
  %134 = add nsw i64 %indvars.iv39, -1
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %bound071 = icmp ult double* %scevgep63, %scevgep69
  %bound172 = icmp ult double* %scevgep67, %scevgep65
  %memcheck.conflict74 = and i1 %bound071, %bound172
  br i1 %memcheck.conflict74, label %.ph76.lver.orig.preheader, label %.ph76

.ph76.lver.orig.preheader:                        ; preds = %.lver.check75
  br label %.ph76.lver.orig

.ph76.lver.orig:                                  ; preds = %.ph76.lver.orig.preheader, %.ph76.lver.orig
  %indvars.iv31.lver.orig = phi i64 [ %indvars.iv.next32.lver.orig, %.ph76.lver.orig ], [ 1, %.ph76.lver.orig.preheader ]
  %135 = add nsw i64 %indvars.iv31.lver.orig, -1
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %135
  %137 = load double, double* %136, align 8
  %138 = fmul double %17, %137
  %139 = fadd double %18, %138
  %140 = fdiv double %29, %139
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  store double %140, double* %141, align 8
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %134, i64 %indvars.iv31.lver.orig
  %143 = load double, double* %142, align 8
  %144 = fmul double %15, %143
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  %146 = load double, double* %145, align 8
  %147 = fmul double %31, %146
  %148 = fsub double %147, %144
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next40, i64 %indvars.iv31.lver.orig
  %150 = load double, double* %149, align 8
  %151 = fmul double %15, %150
  %152 = fsub double %148, %151
  %153 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %135
  %154 = load double, double* %153, align 8
  %155 = fmul double %17, %154
  %156 = fsub double %152, %155
  %157 = load double, double* %136, align 8
  %158 = fmul double %17, %157
  %159 = fadd double %18, %158
  %160 = fdiv double %156, %159
  %161 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  store double %160, double* %161, align 8
  %indvars.iv.next32.lver.orig = add nuw nsw i64 %indvars.iv31.lver.orig, 1
  %exitcond34.lver.orig = icmp eq i64 %indvars.iv.next32.lver.orig, %wide.trip.count33
  br i1 %exitcond34.lver.orig, label %._crit_edge15.us.loopexit, label %.ph76.lver.orig

.ph76:                                            ; preds = %.lver.check75
  %scevgep77 = getelementptr [1000 x double], [1000 x double]* %4, i64 %126, i64 0
  %scevgep82 = getelementptr [1000 x double], [1000 x double]* %5, i64 %126, i64 0
  %load_initial78 = load double, double* %scevgep77, align 8
  %load_initial83 = load double, double* %scevgep82, align 8
  br label %180

._crit_edge19.us.loopexit:                        ; preds = %.lr.ph18.us
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge19.us.loopexit, %.lr.ph18.us.prol.loopexit, %._crit_edge15.us
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  %indvar.next62 = add i64 %indvar61, 1
  br i1 %exitcond42, label %._crit_edge22.loopexit, label %.lver.check75

.lr.ph18.us:                                      ; preds = %.lr.ph18.us.preheader85, %.lr.ph18.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %.lr.ph18.us ], [ %indvars.iv35.unr.ph, %.lr.ph18.us.preheader85 ]
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv35
  %163 = load double, double* %162, align 8
  %164 = add nsw i64 %indvars.iv35, 1
  %165 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %164
  %166 = load double, double* %165, align 8
  %167 = fmul double %163, %166
  %168 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv35
  %169 = load double, double* %168, align 8
  %170 = fadd double %167, %169
  %171 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv35
  store double %170, double* %171, align 8
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, -1
  %172 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv.next36
  %173 = load double, double* %172, align 8
  %174 = fmul double %173, %170
  %175 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv.next36
  %176 = load double, double* %175, align 8
  %177 = fadd double %174, %176
  %178 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next36
  store double %177, double* %178, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, -2
  %179 = icmp sgt i64 %indvars.iv.next36, 1
  br i1 %179, label %.lr.ph18.us, label %._crit_edge19.us.loopexit

; <label>:180:                                    ; preds = %180, %.ph76
  %store_forwarded84 = phi double [ %load_initial83, %.ph76 ], [ %200, %180 ]
  %store_forwarded81 = phi double [ %load_initial78, %.ph76 ], [ %183, %180 ]
  %indvars.iv31 = phi i64 [ 1, %.ph76 ], [ %indvars.iv.next32, %180 ]
  %181 = fmul double %17, %store_forwarded81
  %182 = fadd double %18, %181
  %183 = fdiv double %29, %182
  %184 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv31
  store double %183, double* %184, align 8
  %185 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %134, i64 %indvars.iv31
  %186 = load double, double* %185, align 8
  %187 = fmul double %15, %186
  %188 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv31
  %189 = load double, double* %188, align 8
  %190 = fmul double %31, %189
  %191 = fsub double %190, %187
  %192 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next40, i64 %indvars.iv31
  %193 = load double, double* %192, align 8
  %194 = fmul double %15, %193
  %195 = fsub double %191, %194
  %196 = fmul double %17, %store_forwarded84
  %197 = fsub double %195, %196
  %198 = fmul double %17, %store_forwarded81
  %199 = fadd double %18, %198
  %200 = fdiv double %197, %199
  %201 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv31
  store double %200, double* %201, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge15.us.loopexit86, label %180

._crit_edge15.us.loopexit:                        ; preds = %.ph76.lver.orig
  br label %._crit_edge15.us

._crit_edge15.us.loopexit86:                      ; preds = %180
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit86, %._crit_edge15.us.loopexit
  %202 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %37
  store double 1.000000e+00, double* %202, align 8
  br i1 %28, label %.lr.ph18.us.preheader, label %._crit_edge19.us

.lr.ph18.us.preheader:                            ; preds = %._crit_edge15.us
  br i1 %lcmp.mod38, label %.lr.ph18.us.prol.loopexit, label %.lr.ph18.us.prol

.lr.ph18.us.prol:                                 ; preds = %.lr.ph18.us.preheader
  %203 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %32
  %204 = load double, double* %203, align 8
  %205 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %39
  %206 = load double, double* %205, align 8
  %207 = fmul double %204, %206
  %208 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %32
  %209 = load double, double* %208, align 8
  %210 = fadd double %207, %209
  %211 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %32
  store double %210, double* %211, align 8
  br label %.lr.ph18.us.prol.loopexit

.lr.ph18.us.prol.loopexit:                        ; preds = %.lr.ph18.us.prol, %.lr.ph18.us.preheader
  %indvars.iv35.unr.ph = phi i64 [ %indvars.iv.next36.prol, %.lr.ph18.us.prol ], [ %32, %.lr.ph18.us.preheader ]
  br i1 %38, label %._crit_edge19.us, label %.lr.ph18.us.preheader85

.lr.ph18.us.preheader85:                          ; preds = %.lr.ph18.us.prol.loopexit
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
