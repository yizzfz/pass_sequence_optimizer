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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array([1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1000 x double]*) unnamed_addr #0 {
.preheader.preheader.lr.ph..preheader.preheader.us_crit_edge:
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.lr.ph..preheader.preheader.us_crit_edge
  %indvars.iv26.us = phi i64 [ 0, %.preheader.preheader.lr.ph..preheader.preheader.us_crit_edge ], [ %indvars.iv.next3.us, %.preheader._crit_edge.us ]
  %1 = add nuw nsw i64 %indvars.iv26.us, 1000
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us, %.preheader.preheader.us
  %indvars.iv5.us = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next.us.1, %.preheader.us ]
  %2 = sub nuw nsw i64 %1, %indvars.iv5.us
  %3 = trunc i64 %2 to i32
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv26.us, i64 %indvars.iv5.us
  %indvars.iv.next.us = or i64 %indvars.iv5.us, 1
  %6 = sub nuw nsw i64 %1, %indvars.iv.next.us
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %4, i32 0
  %10 = insertelement <2 x double> %9, double %8, i32 1
  %11 = fdiv <2 x double> %10, <double 1.000000e+03, double 1.000000e+03>
  %12 = bitcast double* %5 to <2 x double>*
  store <2 x double> %11, <2 x double>* %12, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv5.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 1000
  br i1 %exitcond.us.1, label %.preheader._crit_edge.us, label %.preheader.us

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv26.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next3.us, 1000
  br i1 %exitcond, label %._crit_edge, label %.preheader.preheader.us

._crit_edge:                                      ; preds = %.preheader._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
.preheader4.preheader.lr.ph:
  br label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader._crit_edge, %.preheader4.preheader.lr.ph
  %.0338 = phi i32 [ 1, %.preheader4.preheader.lr.ph ], [ %149, %.preheader._crit_edge ]
  br label %._crit_edge.lver.check

._crit_edge.lver.check:                           ; preds = %.preheader4.us, %.preheader4.preheader
  %indvar = phi i64 [ 0, %.preheader4.preheader ], [ %4, %.preheader4.us ]
  %indvars.iv723.us = phi i64 [ 1, %.preheader4.preheader ], [ %12, %.preheader4.us ]
  %4 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 0
  %scevgep44 = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 999
  %scevgep46 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 0
  %scevgep48 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 999
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv723.us
  store double 1.000000e+00, double* %5, align 8
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv723.us, i64 0
  store double 0.000000e+00, double* %6, align 8
  %7 = bitcast double* %5 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv723.us
  %10 = bitcast [1000 x double]* %9 to i64*
  store i64 %8, i64* %10, align 8
  %11 = add nsw i64 %indvars.iv723.us, -1
  %12 = add nuw nsw i64 %indvars.iv723.us, 1
  %bound0 = icmp ult double* %scevgep, %scevgep48
  %bound1 = icmp ult double* %scevgep46, %scevgep44
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge.lver.orig.preheader, label %._crit_edge.ph

._crit_edge.lver.orig.preheader:                  ; preds = %._crit_edge.lver.check
  br label %._crit_edge.lver.orig

._crit_edge.lver.orig:                            ; preds = %._crit_edge.lver.orig.preheader, %._crit_edge.lver.orig
  %indvars.iv18.us.lver.orig = phi i64 [ %indvars.iv.next.us.lver.orig, %._crit_edge.lver.orig ], [ 1, %._crit_edge.lver.orig.preheader ]
  %13 = add nsw i64 %indvars.iv18.us.lver.orig, -1
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv723.us, i64 %13
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv723.us, i64 %indvars.iv18.us.lver.orig
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18.us.lver.orig, i64 %11
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18.us.lver.orig, i64 %12
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv723.us, i64 %13
  %.rhs.lver.orig = fmul double %15, 0xC09F400000000001
  %20 = fadd double %.rhs.lver.orig, 0x40AF420000000001
  %21 = fdiv double 0x409F400000000001, %20
  store double %21, double* %16, align 8
  %22 = bitcast double* %17 to <2 x double>*
  %23 = load <2 x double>, <2 x double>* %22, align 8
  %24 = fmul <2 x double> %23, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %27 = fsub double %26, %25
  %28 = load double, double* %18, align 8
  %29 = fmul double %28, 0xC08F400000000001
  %30 = fsub double %27, %29
  %31 = load double, double* %19, align 8
  %32 = fmul double %31, 0xC09F400000000001
  %33 = fsub double %30, %32
  %34 = fdiv double %33, %20
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv723.us, i64 %indvars.iv18.us.lver.orig
  store double %34, double* %35, align 8
  %indvars.iv.next.us.lver.orig = add nuw nsw i64 %indvars.iv18.us.lver.orig, 1
  %exitcond.us.lver.orig = icmp eq i64 %indvars.iv.next.us.lver.orig, 999
  br i1 %exitcond.us.lver.orig, label %._crit_edge.us.loopexit, label %._crit_edge.lver.orig

._crit_edge.ph:                                   ; preds = %._crit_edge.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial52 = load double, double* %scevgep46, align 8
  br label %._crit_edge

.preheader4.us:                                   ; preds = %.lr.ph21.us
  %exitcond = icmp eq i64 %12, 999
  br i1 %exitcond, label %._crit_edge41.lver.check.preheader, label %._crit_edge.lver.check

._crit_edge41.lver.check.preheader:               ; preds = %.preheader4.us
  br label %._crit_edge41.lver.check

.lr.ph21.us:                                      ; preds = %.lr.ph21.us, %._crit_edge.us
  %36 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %49, %.lr.ph21.us ]
  %indvars.iv519.us = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next6.us.1, %.lr.ph21.us ]
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv723.us, i64 %indvars.iv519.us
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %36
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv723.us, i64 %indvars.iv519.us
  %41 = load double, double* %40, align 8
  %42 = fadd double %39, %41
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv519.us, i64 %indvars.iv723.us
  store double %42, double* %43, align 8
  %indvars.iv.next6.us = add nsw i64 %indvars.iv519.us, -1
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv723.us, i64 %indvars.iv.next6.us
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %42
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv723.us, i64 %indvars.iv.next6.us
  %48 = load double, double* %47, align 8
  %49 = fadd double %46, %48
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next6.us, i64 %indvars.iv723.us
  store double %49, double* %50, align 8
  %51 = icmp sgt i64 %indvars.iv.next6.us, 1
  %indvars.iv.next6.us.1 = add nsw i64 %indvars.iv519.us, -2
  br i1 %51, label %.lr.ph21.us, label %.preheader4.us

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.ph
  %store_forwarded53 = phi double [ %load_initial52, %._crit_edge.ph ], [ %68, %._crit_edge ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge.ph ], [ %56, %._crit_edge ]
  %indvars.iv18.us = phi i64 [ 1, %._crit_edge.ph ], [ %indvars.iv.next.us, %._crit_edge ]
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv723.us, i64 %indvars.iv18.us
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18.us, i64 %11
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv18.us, i64 %12
  %.rhs = fmul double %store_forwarded, 0xC09F400000000001
  %55 = fadd double %.rhs, 0x40AF420000000001
  %56 = fdiv double 0x409F400000000001, %55
  store double %56, double* %52, align 8
  %57 = bitcast double* %53 to <2 x double>*
  %58 = load <2 x double>, <2 x double>* %57, align 8
  %59 = fmul <2 x double> %58, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %60 = extractelement <2 x double> %59, i32 0
  %61 = extractelement <2 x double> %59, i32 1
  %62 = fsub double %61, %60
  %63 = load double, double* %54, align 8
  %64 = fmul double %63, 0xC08F400000000001
  %65 = fsub double %62, %64
  %66 = fmul double %store_forwarded53, 0xC09F400000000001
  %67 = fsub double %65, %66
  %68 = fdiv double %67, %55
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv723.us, i64 %indvars.iv18.us
  store double %68, double* %69, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv18.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 999
  br i1 %exitcond.us, label %._crit_edge.us.loopexit2, label %._crit_edge

._crit_edge.us.loopexit:                          ; preds = %._crit_edge.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit2:                         ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit2, %._crit_edge.us.loopexit
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv723.us
  store double 1.000000e+00, double* %70, align 8
  br label %.lr.ph21.us

._crit_edge41.lver.check:                         ; preds = %._crit_edge41.lver.check.preheader, %.preheader.us
  %indvar54 = phi i64 [ %71, %.preheader.us ], [ 0, %._crit_edge41.lver.check.preheader ]
  %indvars.iv1535.us = phi i64 [ %80, %.preheader.us ], [ 1, %._crit_edge41.lver.check.preheader ]
  %71 = add i64 %indvar54, 1
  %scevgep56 = getelementptr [1000 x double], [1000 x double]* %2, i64 %71, i64 0
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %2, i64 %71, i64 999
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %3, i64 %71, i64 0
  %scevgep62 = getelementptr [1000 x double], [1000 x double]* %3, i64 %71, i64 999
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1535.us
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %72, i64 0, i64 0
  store double 1.000000e+00, double* %73, align 8
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1535.us, i64 0
  store double 0.000000e+00, double* %74, align 8
  %75 = bitcast [1000 x double]* %72 to i64*
  %76 = load i64, i64* %75, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1535.us
  %78 = bitcast [1000 x double]* %77 to i64*
  store i64 %76, i64* %78, align 8
  %79 = add nsw i64 %indvars.iv1535.us, -1
  %80 = add nuw nsw i64 %indvars.iv1535.us, 1
  %bound064 = icmp ult double* %scevgep56, %scevgep62
  %bound165 = icmp ult double* %scevgep60, %scevgep58
  %memcheck.conflict67 = and i1 %bound064, %bound165
  br i1 %memcheck.conflict67, label %._crit_edge41.lver.orig.preheader, label %._crit_edge41.ph

._crit_edge41.lver.orig.preheader:                ; preds = %._crit_edge41.lver.check
  br label %._crit_edge41.lver.orig

._crit_edge41.lver.orig:                          ; preds = %._crit_edge41.lver.orig.preheader, %._crit_edge41.lver.orig
  %indvars.iv927.us.lver.orig = phi i64 [ %indvars.iv.next10.us.lver.orig, %._crit_edge41.lver.orig ], [ 1, %._crit_edge41.lver.orig.preheader ]
  %81 = add nsw i64 %indvars.iv927.us.lver.orig, -1
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1535.us, i64 %81
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1535.us, i64 %indvars.iv927.us.lver.orig
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %79, i64 %indvars.iv927.us.lver.orig
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1535.us, i64 %indvars.iv927.us.lver.orig
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %80, i64 %indvars.iv927.us.lver.orig
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1535.us, i64 %81
  %89 = insertelement <2 x double> undef, double %83, i32 0
  %90 = shufflevector <2 x double> %89, <2 x double> undef, <2 x i32> zeroinitializer
  %91 = fmul <2 x double> %90, <double 0xC08F400000000001, double 0xC08F400000000001>
  %92 = fadd <2 x double> %91, <double 0x409F440000000001, double 0x409F440000000001>
  %93 = extractelement <2 x double> %92, i32 0
  %94 = extractelement <2 x double> %92, i32 1
  %95 = fdiv double 0x408F400000000001, %93
  store double %95, double* %84, align 8
  %96 = load double, double* %85, align 8
  %97 = fmul double %96, 0xC09F400000000001
  %98 = load double, double* %86, align 8
  %99 = fmul double %98, 0xC0AF3E0000000001
  %100 = fsub double %99, %97
  %101 = load double, double* %87, align 8
  %102 = fmul double %101, 0xC09F400000000001
  %103 = fsub double %100, %102
  %104 = load double, double* %88, align 8
  %105 = fmul double %104, 0xC08F400000000001
  %106 = fsub double %103, %105
  %107 = fdiv double %106, %94
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1535.us, i64 %indvars.iv927.us.lver.orig
  store double %107, double* %108, align 8
  %indvars.iv.next10.us.lver.orig = add nuw nsw i64 %indvars.iv927.us.lver.orig, 1
  %exitcond12.us.lver.orig = icmp eq i64 %indvars.iv.next10.us.lver.orig, 999
  br i1 %exitcond12.us.lver.orig, label %._crit_edge30.us.loopexit, label %._crit_edge41.lver.orig

._crit_edge41.ph:                                 ; preds = %._crit_edge41.lver.check
  %load_initial69 = load double, double* %scevgep56, align 8
  %load_initial72 = load double, double* %scevgep60, align 8
  br label %._crit_edge41

.preheader.us:                                    ; preds = %.lr.ph33.us
  %exitcond42 = icmp eq i64 %80, 999
  br i1 %exitcond42, label %.preheader._crit_edge, label %._crit_edge41.lver.check

.lr.ph33.us:                                      ; preds = %.lr.ph33.us, %._crit_edge30.us
  %109 = phi double [ 1.000000e+00, %._crit_edge30.us ], [ %122, %.lr.ph33.us ]
  %indvars.iv1331.us = phi i64 [ 998, %._crit_edge30.us ], [ %indvars.iv.next14.us.1, %.lr.ph33.us ]
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1535.us, i64 %indvars.iv1331.us
  %111 = load double, double* %110, align 8
  %112 = fmul double %111, %109
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1535.us, i64 %indvars.iv1331.us
  %114 = load double, double* %113, align 8
  %115 = fadd double %112, %114
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1535.us, i64 %indvars.iv1331.us
  store double %115, double* %116, align 8
  %indvars.iv.next14.us = add nsw i64 %indvars.iv1331.us, -1
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1535.us, i64 %indvars.iv.next14.us
  %118 = load double, double* %117, align 8
  %119 = fmul double %118, %115
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1535.us, i64 %indvars.iv.next14.us
  %121 = load double, double* %120, align 8
  %122 = fadd double %119, %121
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1535.us, i64 %indvars.iv.next14.us
  store double %122, double* %123, align 8
  %124 = icmp sgt i64 %indvars.iv.next14.us, 1
  %indvars.iv.next14.us.1 = add nsw i64 %indvars.iv1331.us, -2
  br i1 %124, label %.lr.ph33.us, label %.preheader.us

._crit_edge41:                                    ; preds = %._crit_edge41, %._crit_edge41.ph
  %store_forwarded73 = phi double [ %load_initial72, %._crit_edge41.ph ], [ %146, %._crit_edge41 ]
  %store_forwarded70 = phi double [ %load_initial69, %._crit_edge41.ph ], [ %135, %._crit_edge41 ]
  %indvars.iv927.us = phi i64 [ 1, %._crit_edge41.ph ], [ %indvars.iv.next10.us, %._crit_edge41 ]
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1535.us, i64 %indvars.iv927.us
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %79, i64 %indvars.iv927.us
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1535.us, i64 %indvars.iv927.us
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %80, i64 %indvars.iv927.us
  %129 = insertelement <2 x double> undef, double %store_forwarded70, i32 0
  %130 = shufflevector <2 x double> %129, <2 x double> undef, <2 x i32> zeroinitializer
  %131 = fmul <2 x double> %130, <double 0xC08F400000000001, double 0xC08F400000000001>
  %132 = fadd <2 x double> %131, <double 0x409F440000000001, double 0x409F440000000001>
  %133 = extractelement <2 x double> %132, i32 0
  %134 = extractelement <2 x double> %132, i32 1
  %135 = fdiv double 0x408F400000000001, %133
  store double %135, double* %125, align 8
  %136 = load double, double* %126, align 8
  %137 = fmul double %136, 0xC09F400000000001
  %138 = load double, double* %127, align 8
  %139 = fmul double %138, 0xC0AF3E0000000001
  %140 = fsub double %139, %137
  %141 = load double, double* %128, align 8
  %142 = fmul double %141, 0xC09F400000000001
  %143 = fsub double %140, %142
  %144 = fmul double %store_forwarded73, 0xC08F400000000001
  %145 = fsub double %143, %144
  %146 = fdiv double %145, %134
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1535.us, i64 %indvars.iv927.us
  store double %146, double* %147, align 8
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv927.us, 1
  %exitcond12.us = icmp eq i64 %indvars.iv.next10.us, 999
  br i1 %exitcond12.us, label %._crit_edge30.us.loopexit1, label %._crit_edge41

._crit_edge30.us.loopexit:                        ; preds = %._crit_edge41.lver.orig
  br label %._crit_edge30.us

._crit_edge30.us.loopexit1:                       ; preds = %._crit_edge41
  br label %._crit_edge30.us

._crit_edge30.us:                                 ; preds = %._crit_edge30.us.loopexit1, %._crit_edge30.us.loopexit
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1535.us, i64 999
  store double 1.000000e+00, double* %148, align 8
  br label %.lr.ph33.us

.preheader._crit_edge:                            ; preds = %.preheader.us
  %exitcond40 = icmp eq i32 %.0338, 500
  %149 = add nuw nsw i32 %.0338, 1
  br i1 %exitcond40, label %._crit_edge39, label %.preheader4.preheader

._crit_edge39:                                    ; preds = %.preheader._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]*) unnamed_addr #0 {
.preheader.preheader.lr.ph..preheader.preheader.us_crit_edge:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.lr.ph..preheader.preheader.us_crit_edge
  %indvars.iv26.us = phi i64 [ 0, %.preheader.preheader.lr.ph..preheader.preheader.us_crit_edge ], [ %indvars.iv.next3.us, %.preheader._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv26.us, 1000
  br label %.preheader.us._crit_edge

.preheader.us._crit_edge:                         ; preds = %.preheader.us, %.preheader.preheader.us
  %indvars.iv5.us = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next.us, %.preheader.us ]
  %6 = add nuw nsw i64 %indvars.iv5.us, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %.preheader.us

; <label>:10:                                     ; preds = %.preheader.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv26.us, i64 %indvars.iv5.us
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv5.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1000
  br i1 %exitcond.us, label %.preheader._crit_edge.us, label %.preheader.us._crit_edge

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv26.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next3.us, 1000
  br i1 %exitcond, label %._crit_edge, label %.preheader.preheader.us

._crit_edge:                                      ; preds = %.preheader._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
