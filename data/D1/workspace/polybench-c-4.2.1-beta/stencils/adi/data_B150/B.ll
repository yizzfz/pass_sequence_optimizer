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
  br i1 true, label %.preheader.lr.ph, label %._crit_edge4

.preheader.lr.ph:                                 ; preds = %2
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv7 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next8, %._crit_edge.us ]
  %3 = add i64 %indvars.iv7, 1000
  %4 = trunc i64 %3 to i32
  br i1 true, label %._crit_edge.prol.loopexit.unr-lcssa, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.preheader.us
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader
  %5 = sitofp i32 %4 to double
  %6 = fdiv double %5, 1.000000e+03
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv7, i64 0
  store double %6, double* %7, align 8
  br label %._crit_edge.prol.loopexit.unr-lcssa

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %.preheader.us, %._crit_edge.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge.prol ], [ 0, %.preheader.us ]
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us.new ], [ %indvars.iv.next.1, %._crit_edge ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = sub i32 %4, %8
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.000000e+03
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  store double %11, double* %12, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = trunc i64 %indvars.iv.next to i32
  %14 = sub i32 %4, %13
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.000000e+03
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv.next
  store double %16, double* %17, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond6.1, label %._crit_edge.us.unr-lcssa, label %._crit_edge

._crit_edge.us.unr-lcssa:                         ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.prol.loopexit, %._crit_edge.us.unr-lcssa
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond10, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  %7 = fdiv double 1.000000e+00, 1.000000e+03
  %8 = fdiv double 1.000000e+00, 5.000000e+02
  %9 = fmul double %8, 2.000000e+00
  %10 = fmul double %7, %7
  %11 = fdiv double %9, %10
  %12 = fdiv double %8, %10
  %13 = fmul double %11, -5.000000e-01
  %14 = fadd double %11, 1.000000e+00
  %15 = fmul double %12, -5.000000e-01
  %16 = fadd double %12, 1.000000e+00
  br i1 false, label %._crit_edge24, label %.preheader4.lr.ph

.preheader4.lr.ph:                                ; preds = %6
  %17 = fsub double -0.000000e+00, %13
  %18 = fmul double %15, 2.000000e+00
  %19 = fadd double %18, 1.000000e+00
  %20 = fsub double -0.000000e+00, %15
  %21 = fmul double %13, 2.000000e+00
  %22 = fadd double %21, 1.000000e+00
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge22, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %151, %._crit_edge22 ]
  br i1 true, label %._crit_edge.lver.check.preheader, label %._crit_edge22

._crit_edge.lver.check.preheader:                 ; preds = %.preheader4
  br label %._crit_edge.lver.check

._crit_edge.lver.check:                           ; preds = %._crit_edge.lver.check.preheader, %._crit_edge9.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge9.us ], [ 0, %._crit_edge.lver.check.preheader ]
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %._crit_edge9.us ], [ 1, %._crit_edge.lver.check.preheader ]
  %23 = add nuw nsw i64 %indvar, 1
  %24 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %24, i64 0
  %scevgep45 = getelementptr [1000 x double], [1000 x double]* %4, i64 %24, i64 999
  %scevgep47 = getelementptr [1000 x double], [1000 x double]* %5, i64 %24, i64 0
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %5, i64 %24, i64 999
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv29
  store double 1.000000e+00, double* %25, align 8
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv29, i64 0
  store double 0.000000e+00, double* %26, align 8
  %27 = bitcast double* %25 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29
  %30 = bitcast [1000 x double]* %29 to i64*
  store i64 %28, i64* %30, align 8
  %31 = add nsw i64 %indvars.iv29, -1
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %bound0 = icmp ult double* %scevgep, %scevgep49
  %bound1 = icmp ult double* %scevgep47, %scevgep45
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge.lver.orig.preheader, label %._crit_edge.ph

._crit_edge.lver.orig.preheader:                  ; preds = %._crit_edge.lver.check
  br label %._crit_edge.lver.orig

._crit_edge.lver.orig:                            ; preds = %._crit_edge.lver.orig.preheader, %._crit_edge.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge.lver.orig ], [ 1, %._crit_edge.lver.orig.preheader ]
  %32 = add nsw i64 %indvars.iv.lver.orig, -1
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv29, i64 %32
  %34 = load double, double* %33, align 8
  %35 = fmul double %13, %34
  %36 = fadd double %14, %35
  %37 = fdiv double %17, %36
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv.lver.orig
  store double %37, double* %38, align 8
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %31
  %40 = load double, double* %39, align 8
  %41 = fmul double %15, %40
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv29
  %43 = load double, double* %42, align 8
  %44 = fmul double %19, %43
  %45 = fsub double %44, %41
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next30
  %47 = load double, double* %46, align 8
  %48 = fmul double %15, %47
  %49 = fsub double %45, %48
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29, i64 %32
  %51 = load double, double* %50, align 8
  %52 = fmul double %13, %51
  %53 = fsub double %49, %52
  %54 = fdiv double %53, %36
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29, i64 %indvars.iv.lver.orig
  store double %54, double* %55, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond26.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond26.lver.orig, label %._crit_edge.us.loopexit, label %._crit_edge.lver.orig

._crit_edge.ph:                                   ; preds = %._crit_edge.lver.check
  %scevgep52 = getelementptr [1000 x double], [1000 x double]* %5, i64 %23, i64 0
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %4, i64 %23, i64 0
  %load_initial = load double, double* %scevgep51, align 8
  %load_initial53 = load double, double* %scevgep52, align 8
  br label %._crit_edge

._crit_edge9.us.loopexit:                         ; preds = %.lr.ph8.us
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %._crit_edge.us
  %exitcond32 = icmp eq i64 %indvars.iv.next30, 999
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond32, label %._crit_edge43.lver.check.preheader, label %._crit_edge.lver.check

._crit_edge43.lver.check.preheader:               ; preds = %._crit_edge9.us
  br label %._crit_edge43.lver.check

.lr.ph8.us:                                       ; preds = %.lr.ph8.us.preheader, %.lr.ph8.us
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %.lr.ph8.us ], [ 998, %.lr.ph8.us.preheader ]
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv27
  %57 = load double, double* %56, align 8
  %58 = add nsw i64 %indvars.iv27, 1
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %58, i64 %indvars.iv29
  %60 = load double, double* %59, align 8
  %61 = fmul double %57, %60
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29, i64 %indvars.iv27
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv29
  store double %64, double* %65, align 8
  %66 = icmp sgt i64 %indvars.iv27, 1
  %indvars.iv.next28 = add nsw i64 %indvars.iv27, -1
  br i1 %66, label %.lr.ph8.us, label %._crit_edge9.us.loopexit

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.ph
  %store_forwarded54 = phi double [ %load_initial53, %._crit_edge.ph ], [ %84, %._crit_edge ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge.ph ], [ %69, %._crit_edge ]
  %indvars.iv = phi i64 [ 1, %._crit_edge.ph ], [ %indvars.iv.next, %._crit_edge ]
  %67 = fmul double %13, %store_forwarded
  %68 = fadd double %14, %67
  %69 = fdiv double %17, %68
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv
  store double %69, double* %70, align 8
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %31
  %72 = load double, double* %71, align 8
  %73 = fmul double %15, %72
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv29
  %75 = load double, double* %74, align 8
  %76 = fmul double %19, %75
  %77 = fsub double %76, %73
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next30
  %79 = load double, double* %78, align 8
  %80 = fmul double %15, %79
  %81 = fsub double %77, %80
  %82 = fmul double %13, %store_forwarded54
  %83 = fsub double %81, %82
  %84 = fdiv double %83, %68
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv29, i64 %indvars.iv
  store double %84, double* %85, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond26, label %._crit_edge.us.loopexit76, label %._crit_edge

._crit_edge.us.loopexit:                          ; preds = %._crit_edge.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit76:                        ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit76, %._crit_edge.us.loopexit
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv29
  store double 1.000000e+00, double* %86, align 8
  br i1 true, label %.lr.ph8.us.preheader, label %._crit_edge9.us

.lr.ph8.us.preheader:                             ; preds = %._crit_edge.us
  br label %.lr.ph8.us

._crit_edge43.lver.check:                         ; preds = %._crit_edge43.lver.check.preheader, %._crit_edge19.us
  %indvar55 = phi i64 [ %indvar.next56, %._crit_edge19.us ], [ 0, %._crit_edge43.lver.check.preheader ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge19.us ], [ 1, %._crit_edge43.lver.check.preheader ]
  %87 = add nuw nsw i64 %indvar55, 1
  %88 = add nuw nsw i64 %indvar55, 1
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %4, i64 %88, i64 0
  %scevgep59 = getelementptr [1000 x double], [1000 x double]* %4, i64 %88, i64 999
  %scevgep61 = getelementptr [1000 x double], [1000 x double]* %5, i64 %88, i64 0
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %5, i64 %88, i64 999
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 0
  store double 1.000000e+00, double* %89, align 8
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 0
  store double 0.000000e+00, double* %90, align 8
  %91 = bitcast double* %89 to i64*
  %92 = load i64, i64* %91, align 8
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39
  %94 = bitcast [1000 x double]* %93 to i64*
  store i64 %92, i64* %94, align 8
  %95 = add nsw i64 %indvars.iv39, -1
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %bound065 = icmp ult double* %scevgep57, %scevgep63
  %bound166 = icmp ult double* %scevgep61, %scevgep59
  %memcheck.conflict68 = and i1 %bound065, %bound166
  br i1 %memcheck.conflict68, label %._crit_edge43.lver.orig.preheader, label %._crit_edge43.ph

._crit_edge43.lver.orig.preheader:                ; preds = %._crit_edge43.lver.check
  br label %._crit_edge43.lver.orig

._crit_edge43.lver.orig:                          ; preds = %._crit_edge43.lver.orig.preheader, %._crit_edge43.lver.orig
  %indvars.iv33.lver.orig = phi i64 [ %indvars.iv.next34.lver.orig, %._crit_edge43.lver.orig ], [ 1, %._crit_edge43.lver.orig.preheader ]
  %96 = add nsw i64 %indvars.iv33.lver.orig, -1
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %96
  %98 = load double, double* %97, align 8
  %99 = fmul double %15, %98
  %100 = fadd double %16, %99
  %101 = fdiv double %20, %100
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv33.lver.orig
  store double %101, double* %102, align 8
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %95, i64 %indvars.iv33.lver.orig
  %104 = load double, double* %103, align 8
  %105 = fmul double %13, %104
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv33.lver.orig
  %107 = load double, double* %106, align 8
  %108 = fmul double %22, %107
  %109 = fsub double %108, %105
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next40, i64 %indvars.iv33.lver.orig
  %111 = load double, double* %110, align 8
  %112 = fmul double %13, %111
  %113 = fsub double %109, %112
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %96
  %115 = load double, double* %114, align 8
  %116 = fmul double %15, %115
  %117 = fsub double %113, %116
  %118 = fdiv double %117, %100
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv33.lver.orig
  store double %118, double* %119, align 8
  %indvars.iv.next34.lver.orig = add nuw nsw i64 %indvars.iv33.lver.orig, 1
  %exitcond36.lver.orig = icmp eq i64 %indvars.iv.next34.lver.orig, 999
  br i1 %exitcond36.lver.orig, label %._crit_edge15.us.loopexit, label %._crit_edge43.lver.orig

._crit_edge43.ph:                                 ; preds = %._crit_edge43.lver.check
  %scevgep72 = getelementptr [1000 x double], [1000 x double]* %5, i64 %87, i64 0
  %scevgep69 = getelementptr [1000 x double], [1000 x double]* %4, i64 %87, i64 0
  %load_initial70 = load double, double* %scevgep69, align 8
  %load_initial73 = load double, double* %scevgep72, align 8
  br label %._crit_edge43

._crit_edge19.us.loopexit:                        ; preds = %.lr.ph18.us
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge19.us.loopexit, %._crit_edge15.us
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 999
  %indvar.next56 = add nuw nsw i64 %indvar55, 1
  br i1 %exitcond42, label %._crit_edge22.loopexit, label %._crit_edge43.lver.check

.lr.ph18.us:                                      ; preds = %.lr.ph18.us.preheader, %.lr.ph18.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %.lr.ph18.us ], [ 998, %.lr.ph18.us.preheader ]
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv37
  %121 = load double, double* %120, align 8
  %122 = add nsw i64 %indvars.iv37, 1
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %122
  %124 = load double, double* %123, align 8
  %125 = fmul double %121, %124
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv37
  %127 = load double, double* %126, align 8
  %128 = fadd double %125, %127
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv37
  store double %128, double* %129, align 8
  %130 = icmp sgt i64 %indvars.iv37, 1
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, -1
  br i1 %130, label %.lr.ph18.us, label %._crit_edge19.us.loopexit

._crit_edge43:                                    ; preds = %._crit_edge43, %._crit_edge43.ph
  %store_forwarded74 = phi double [ %load_initial73, %._crit_edge43.ph ], [ %148, %._crit_edge43 ]
  %store_forwarded71 = phi double [ %load_initial70, %._crit_edge43.ph ], [ %133, %._crit_edge43 ]
  %indvars.iv33 = phi i64 [ 1, %._crit_edge43.ph ], [ %indvars.iv.next34, %._crit_edge43 ]
  %131 = fmul double %15, %store_forwarded71
  %132 = fadd double %16, %131
  %133 = fdiv double %20, %132
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv33
  store double %133, double* %134, align 8
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %95, i64 %indvars.iv33
  %136 = load double, double* %135, align 8
  %137 = fmul double %13, %136
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv33
  %139 = load double, double* %138, align 8
  %140 = fmul double %22, %139
  %141 = fsub double %140, %137
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next40, i64 %indvars.iv33
  %143 = load double, double* %142, align 8
  %144 = fmul double %13, %143
  %145 = fsub double %141, %144
  %146 = fmul double %15, %store_forwarded74
  %147 = fsub double %145, %146
  %148 = fdiv double %147, %132
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv33
  store double %148, double* %149, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 999
  br i1 %exitcond36, label %._crit_edge15.us.loopexit75, label %._crit_edge43

._crit_edge15.us.loopexit:                        ; preds = %._crit_edge43.lver.orig
  br label %._crit_edge15.us

._crit_edge15.us.loopexit75:                      ; preds = %._crit_edge43
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit75, %._crit_edge15.us.loopexit
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 999
  store double 1.000000e+00, double* %150, align 8
  br i1 true, label %.lr.ph18.us.preheader, label %._crit_edge19.us

.lr.ph18.us.preheader:                            ; preds = %._crit_edge15.us
  br label %.lr.ph18.us

._crit_edge22.loopexit:                           ; preds = %._crit_edge19.us
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %.preheader4
  %exitcond = icmp eq i32 %.0323, 500
  %151 = add nuw nsw i32 %.0323, 1
  br i1 %exitcond, label %._crit_edge24.loopexit, label %.preheader4

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
  br i1 true, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next8, %._crit_edge.us ]
  %7 = mul nsw i64 %indvars.iv7, 1000
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge11, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond6, label %._crit_edge.us, label %._crit_edge11

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond10, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
