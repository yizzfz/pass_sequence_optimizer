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
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
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
define internal fastcc void @init_array(i32, [1000 x double]*) unnamed_addr #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv37.us = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next4.us, %._crit_edge.us ]
  %2 = add nuw nsw i64 %indvars.iv37.us, 1000
  %3 = trunc i64 %2 to i32
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12, %.preheader.us
  %indvars.iv6.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us.1, %._crit_edge12 ]
  %4 = sub nsw i64 0, %indvars.iv6.us
  %5 = trunc i64 %4 to i32
  %6 = add nsw i32 %3, %5
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv37.us, i64 %indvars.iv6.us
  %9 = trunc i64 %indvars.iv6.us to i32
  %10 = xor i32 %9, -1
  %11 = add nsw i32 %3, %10
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.000000e+03, double 1.000000e+03>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv6.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 1000
  br i1 %exitcond.us.1, label %._crit_edge.us, label %._crit_edge12

._crit_edge.us:                                   ; preds = %._crit_edge12
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv37.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next4.us, 1000
  br i1 %exitcond, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
.preheader7.lr.ph:
  %6 = alloca [1000 x double]*, align 8
  %7 = alloca [1000 x double]*, align 8
  %8 = alloca [1000 x double]*, align 8
  %9 = alloca [1000 x double]*, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  store [1000 x double]* %2, [1000 x double]** %6, align 8
  store [1000 x double]* %3, [1000 x double]** %7, align 8
  store [1000 x double]* %4, [1000 x double]** %8, align 8
  store [1000 x double]* %5, [1000 x double]** %9, align 8
  store double 0xC09F400000000001, double* %10, align 8
  store double 0xC09F400000000001, double* %12, align 8
  store double 0xC08F400000000001, double* %13, align 8
  store double 0x40AF420000000001, double* %11, align 8
  store double 0x409F440000000001, double* %14, align 8
  store double 0xC08F400000000001, double* %15, align 8
  br label %.preheader7

.preheader7:                                      ; preds = %._crit_edge63, %.preheader7.lr.ph
  %16 = phi i32 [ 1, %.preheader7.lr.ph ], [ %166, %._crit_edge63 ]
  %17 = phi [1000 x double]* [ %4, %.preheader7.lr.ph ], [ %84, %._crit_edge63 ]
  br label %.lr.ph41.split.us

.lr.ph41.split.us:                                ; preds = %._crit_edge.us._crit_edge, %.preheader7
  %18 = phi [1000 x double]* [ %84, %._crit_edge.us._crit_edge ], [ %17, %.preheader7 ]
  %indvars.iv2239.us = phi i64 [ %30, %._crit_edge.us._crit_edge ], [ 1, %.preheader7 ]
  %19 = load [1000 x double]*, [1000 x double]** %7, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 0, i64 %indvars.iv2239.us
  store double 1.000000e+00, double* %20, align 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %18, i64 %indvars.iv2239.us, i64 0
  store double 0.000000e+00, double* %21, align 8
  %22 = load [1000 x double]*, [1000 x double]** %7, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 0, i64 %indvars.iv2239.us
  %24 = bitcast double* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = load [1000 x double]*, [1000 x double]** %9, align 8
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %indvars.iv2239.us
  %28 = bitcast [1000 x double]* %27 to i64*
  store i64 %25, i64* %28, align 8
  %29 = add nsw i64 %indvars.iv2239.us, -1
  %30 = add nuw nsw i64 %indvars.iv2239.us, 1
  %.pre = load double, double* %10, align 8
  %.pre79 = load double, double* %11, align 8
  br label %47

._crit_edge.us._crit_edge:                        ; preds = %.lr.ph36.us
  %exitcond94 = icmp eq i64 %30, 999
  br i1 %exitcond94, label %.lr.ph62.split.us.preheader, label %.lr.ph41.split.us

.lr.ph36.us:                                      ; preds = %.lr.ph36.us, %._crit_edge.us
  %31 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %44, %.lr.ph36.us ]
  %indvars.iv2034.us = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next21.us.1, %.lr.ph36.us ]
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv2239.us, i64 %indvars.iv2034.us
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, %31
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv2239.us, i64 %indvars.iv2034.us
  %36 = load double, double* %35, align 8
  %37 = fadd double %34, %36
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv2034.us, i64 %indvars.iv2239.us
  store double %37, double* %38, align 8
  %indvars.iv.next21.us = add nsw i64 %indvars.iv2034.us, -1
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv2239.us, i64 %indvars.iv.next21.us
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %37
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv2239.us, i64 %indvars.iv.next21.us
  %43 = load double, double* %42, align 8
  %44 = fadd double %41, %43
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv.next21.us, i64 %indvars.iv2239.us
  store double %44, double* %45, align 8
  %46 = icmp sgt i64 %indvars.iv.next21.us, 1
  %indvars.iv.next21.us.1 = add nsw i64 %indvars.iv2034.us, -2
  br i1 %46, label %.lr.ph36.us, label %._crit_edge.us._crit_edge

; <label>:47:                                     ; preds = %47, %.lr.ph41.split.us
  %48 = phi double [ %.pre79, %.lr.ph41.split.us ], [ %88, %47 ]
  %49 = phi double [ %.pre, %.lr.ph41.split.us ], [ %78, %47 ]
  %50 = phi [1000 x double]* [ %18, %.lr.ph41.split.us ], [ %84, %47 ]
  %indvars.iv30.us = phi i64 [ 1, %.lr.ph41.split.us ], [ %indvars.iv.next.us, %47 ]
  %51 = load double, double* %12, align 8
  %52 = fsub double -0.000000e+00, %51
  %53 = add nsw i64 %indvars.iv30.us, -1
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %50, i64 %indvars.iv2239.us, i64 %53
  %55 = load double, double* %54, align 8
  %56 = fmul double %49, %55
  %57 = fadd double %56, %48
  %58 = fdiv double %52, %57
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %50, i64 %indvars.iv2239.us, i64 %indvars.iv30.us
  store double %58, double* %59, align 8
  %60 = load double, double* %13, align 8
  %61 = load [1000 x double]*, [1000 x double]** %6, align 8
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %indvars.iv30.us, i64 %29
  %63 = bitcast double* %62 to <2 x double>*
  %64 = fmul double %60, 2.000000e+00
  %65 = fadd double %64, 1.000000e+00
  %66 = load <2 x double>, <2 x double>* %63, align 8
  %67 = insertelement <2 x double> undef, double %60, i32 0
  %68 = insertelement <2 x double> %67, double %65, i32 1
  %69 = fmul <2 x double> %68, %66
  %70 = extractelement <2 x double> %69, i32 0
  %71 = extractelement <2 x double> %69, i32 1
  %72 = fsub double %71, %70
  %73 = load double, double* %15, align 8
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %indvars.iv30.us, i64 %30
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fsub double %72, %76
  %78 = load double, double* %10, align 8
  %79 = load [1000 x double]*, [1000 x double]** %9, align 8
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv2239.us, i64 %53
  %81 = load double, double* %80, align 8
  %82 = fmul double %78, %81
  %83 = fsub double %77, %82
  %84 = load [1000 x double]*, [1000 x double]** %8, align 8
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv2239.us, i64 %53
  %86 = load double, double* %85, align 8
  %87 = fmul double %78, %86
  %88 = load double, double* %11, align 8
  %89 = fadd double %87, %88
  %90 = fdiv double %83, %89
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv2239.us, i64 %indvars.iv30.us
  store double %90, double* %91, align 8
  %exitcond = icmp eq i64 %indvars.iv30.us, 998
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv30.us, 1
  br i1 %exitcond, label %._crit_edge.us, label %47

._crit_edge.us:                                   ; preds = %47
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 999, i64 %indvars.iv2239.us
  store double 1.000000e+00, double* %92, align 8
  br label %.lr.ph36.us

.lr.ph62.split.us.preheader:                      ; preds = %._crit_edge.us._crit_edge
  %.pre96 = load double, double* %14, align 8
  %.pre97 = load [1000 x double]*, [1000 x double]** %7, align 8
  %.pre98 = load double, double* %12, align 8
  %93 = fsub double -0.000000e+00, %73
  %94 = fmul double %78, 2.000000e+00
  %95 = fadd double %94, 1.000000e+00
  br label %._crit_edge78.lver.check

._crit_edge78.lver.check:                         ; preds = %._crit_edge53.us._crit_edge, %.lr.ph62.split.us.preheader
  %indvar = phi i64 [ 0, %.lr.ph62.split.us.preheader ], [ %96, %._crit_edge53.us._crit_edge ]
  %indvars.iv2860.us = phi i64 [ 1, %.lr.ph62.split.us.preheader ], [ %104, %._crit_edge53.us._crit_edge ]
  %96 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %84, i64 %96, i64 0
  %scevgep110 = getelementptr [1000 x double], [1000 x double]* %84, i64 %96, i64 999
  %scevgep112 = getelementptr [1000 x double], [1000 x double]* %79, i64 %96, i64 0
  %scevgep114 = getelementptr [1000 x double], [1000 x double]* %79, i64 %96, i64 999
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %indvars.iv2860.us, i64 0
  store double 1.000000e+00, double* %97, align 8
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv2860.us, i64 0
  store double 0.000000e+00, double* %98, align 8
  %99 = bitcast double* %97 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv2860.us
  %102 = bitcast [1000 x double]* %101 to i64*
  store i64 %100, i64* %102, align 8
  %103 = add nsw i64 %indvars.iv2860.us, -1
  %104 = add nuw nsw i64 %indvars.iv2860.us, 1
  %bound0 = icmp ult double* %scevgep, %scevgep114
  %bound1 = icmp ult double* %scevgep112, %scevgep110
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge78.lver.orig.preheader, label %._crit_edge78.ph

._crit_edge78.lver.orig.preheader:                ; preds = %._crit_edge78.lver.check
  br label %._crit_edge78.lver.orig

._crit_edge78.lver.orig:                          ; preds = %._crit_edge78.lver.orig.preheader, %._crit_edge78.lver.orig
  %indvars.iv2450.us.lver.orig = phi i64 [ %indvars.iv.next25.us.lver.orig, %._crit_edge78.lver.orig ], [ 1, %._crit_edge78.lver.orig.preheader ]
  %105 = add nsw i64 %indvars.iv2450.us.lver.orig, -1
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv2860.us, i64 %105
  %107 = load double, double* %106, align 8
  %108 = fmul double %60, %107
  %109 = fadd double %108, %.pre96
  %110 = fdiv double %93, %109
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv2860.us, i64 %indvars.iv2450.us.lver.orig
  store double %110, double* %111, align 8
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre97, i64 %103, i64 %indvars.iv2450.us.lver.orig
  %113 = load double, double* %112, align 8
  %114 = fmul double %78, %113
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre97, i64 %indvars.iv2860.us, i64 %indvars.iv2450.us.lver.orig
  %116 = load double, double* %115, align 8
  %117 = fmul double %95, %116
  %118 = fsub double %117, %114
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre97, i64 %104, i64 %indvars.iv2450.us.lver.orig
  %120 = load double, double* %119, align 8
  %121 = fmul double %.pre98, %120
  %122 = fsub double %118, %121
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv2860.us, i64 %105
  %124 = load double, double* %123, align 8
  %125 = fmul double %60, %124
  %126 = fsub double %122, %125
  %127 = fdiv double %126, %109
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv2860.us, i64 %indvars.iv2450.us.lver.orig
  store double %127, double* %128, align 8
  %indvars.iv.next25.us.lver.orig = add nuw nsw i64 %indvars.iv2450.us.lver.orig, 1
  %exitcond.us.lver.orig = icmp eq i64 %indvars.iv.next25.us.lver.orig, 999
  br i1 %exitcond.us.lver.orig, label %._crit_edge53.us.loopexit, label %._crit_edge78.lver.orig

._crit_edge78.ph:                                 ; preds = %._crit_edge78.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial118 = load double, double* %scevgep112, align 8
  br label %._crit_edge78

._crit_edge53.us._crit_edge:                      ; preds = %.lr.ph57.us
  %exitcond95 = icmp eq i64 %104, 999
  br i1 %exitcond95, label %._crit_edge63, label %._crit_edge78.lver.check

.lr.ph57.us:                                      ; preds = %.lr.ph57.us, %._crit_edge53.us
  %129 = phi double [ 1.000000e+00, %._crit_edge53.us ], [ %142, %.lr.ph57.us ]
  %indvars.iv2655.us = phi i64 [ 998, %._crit_edge53.us ], [ %indvars.iv.next27.us.1, %.lr.ph57.us ]
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv2860.us, i64 %indvars.iv2655.us
  %131 = load double, double* %130, align 8
  %132 = fmul double %131, %129
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv2860.us, i64 %indvars.iv2655.us
  %134 = load double, double* %133, align 8
  %135 = fadd double %132, %134
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %indvars.iv2860.us, i64 %indvars.iv2655.us
  store double %135, double* %136, align 8
  %indvars.iv.next27.us = add nsw i64 %indvars.iv2655.us, -1
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv2860.us, i64 %indvars.iv.next27.us
  %138 = load double, double* %137, align 8
  %139 = fmul double %138, %135
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv2860.us, i64 %indvars.iv.next27.us
  %141 = load double, double* %140, align 8
  %142 = fadd double %139, %141
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %indvars.iv2860.us, i64 %indvars.iv.next27.us
  store double %142, double* %143, align 8
  %144 = icmp sgt i64 %indvars.iv.next27.us, 1
  %indvars.iv.next27.us.1 = add nsw i64 %indvars.iv2655.us, -2
  br i1 %144, label %.lr.ph57.us, label %._crit_edge53.us._crit_edge

._crit_edge78:                                    ; preds = %._crit_edge78, %._crit_edge78.ph
  %store_forwarded119 = phi double [ %load_initial118, %._crit_edge78.ph ], [ %162, %._crit_edge78 ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge78.ph ], [ %147, %._crit_edge78 ]
  %indvars.iv2450.us = phi i64 [ 1, %._crit_edge78.ph ], [ %indvars.iv.next25.us, %._crit_edge78 ]
  %145 = fmul double %60, %store_forwarded
  %146 = fadd double %145, %.pre96
  %147 = fdiv double %93, %146
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %84, i64 %indvars.iv2860.us, i64 %indvars.iv2450.us
  store double %147, double* %148, align 8
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre97, i64 %103, i64 %indvars.iv2450.us
  %150 = load double, double* %149, align 8
  %151 = fmul double %78, %150
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre97, i64 %indvars.iv2860.us, i64 %indvars.iv2450.us
  %153 = load double, double* %152, align 8
  %154 = fmul double %95, %153
  %155 = fsub double %154, %151
  %156 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre97, i64 %104, i64 %indvars.iv2450.us
  %157 = load double, double* %156, align 8
  %158 = fmul double %.pre98, %157
  %159 = fsub double %155, %158
  %160 = fmul double %60, %store_forwarded119
  %161 = fsub double %159, %160
  %162 = fdiv double %161, %146
  %163 = getelementptr inbounds [1000 x double], [1000 x double]* %79, i64 %indvars.iv2860.us, i64 %indvars.iv2450.us
  store double %162, double* %163, align 8
  %indvars.iv.next25.us = add nuw nsw i64 %indvars.iv2450.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next25.us, 999
  br i1 %exitcond.us, label %._crit_edge53.us.loopexit120, label %._crit_edge78

._crit_edge53.us.loopexit:                        ; preds = %._crit_edge78.lver.orig
  br label %._crit_edge53.us

._crit_edge53.us.loopexit120:                     ; preds = %._crit_edge78
  br label %._crit_edge53.us

._crit_edge53.us:                                 ; preds = %._crit_edge53.us.loopexit120, %._crit_edge53.us.loopexit
  %164 = getelementptr inbounds [1000 x double], [1000 x double]* %61, i64 %indvars.iv2860.us, i64 999
  store double 1.000000e+00, double* %164, align 8
  br label %.lr.ph57.us

._crit_edge63:                                    ; preds = %._crit_edge53.us._crit_edge
  %165 = icmp slt i32 %16, 500
  %166 = add nuw nsw i32 %16, 1
  br i1 %165, label %.preheader7, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge63
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv26.us = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next3.us, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv26.us, 1000
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv5.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge11 ]
  %7 = add nuw nsw i64 %6, %indvars.iv5.us
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge11

; <label>:11:                                     ; preds = %._crit_edge12
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge12, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv26.us, i64 %indvars.iv5.us
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv5.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1000
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge12

._crit_edge.us:                                   ; preds = %._crit_edge11
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv26.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next3.us, 1000
  br i1 %exitcond, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #4
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
