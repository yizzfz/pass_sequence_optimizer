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
.preheader.preheader.us.preheader:
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.us.preheader
  %indvars.iv26.us = phi i64 [ 0, %.preheader.preheader.us.preheader ], [ %indvars.iv.next3.us, %.preheader._crit_edge.us ]
  %2 = add nuw nsw i64 %indvars.iv26.us, 1000
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us, %.preheader.preheader.us
  %indvars.iv5.us = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next.us.1, %.preheader.us ]
  %3 = sub nuw nsw i64 %2, %indvars.iv5.us
  %4 = trunc i64 %3 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv26.us, i64 %indvars.iv5.us
  %indvars.iv.next.us = or i64 %indvars.iv5.us, 1
  %7 = sub nuw nsw i64 %2, %indvars.iv.next.us
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = insertelement <2 x double> undef, double %5, i32 0
  %11 = insertelement <2 x double> %10, double %9, i32 1
  %12 = fdiv <2 x double> %11, <double 1.000000e+03, double 1.000000e+03>
  %13 = bitcast double* %6 to <2 x double>*
  store <2 x double> %12, <2 x double>* %13, align 8
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
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
.preheader4.preheader.lr.ph:
  br label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader._crit_edge, %.preheader4.preheader.lr.ph
  %.0339 = phi i32 [ 1, %.preheader4.preheader.lr.ph ], [ %151, %.preheader._crit_edge ]
  br label %._crit_edge.lver.check

._crit_edge.lver.check:                           ; preds = %.preheader4.preheader, %.preheader4.us
  %indvar = phi i64 [ 0, %.preheader4.preheader ], [ %indvar.next, %.preheader4.us ]
  %indvars.iv723.us = phi i64 [ 1, %.preheader4.preheader ], [ %15, %.preheader4.us ]
  %6 = add i64 %indvar, 1
  %7 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 999
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep53 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 999
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv723.us
  store double 1.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv723.us, i64 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast double* %8 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv723.us
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i64 %indvars.iv723.us, -1
  %15 = add nuw nsw i64 %indvars.iv723.us, 1
  %bound0 = icmp ult double* %scevgep, %scevgep53
  %bound1 = icmp ult double* %scevgep51, %scevgep49
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge.lver.orig.preheader, label %._crit_edge.ph

._crit_edge.lver.orig.preheader:                  ; preds = %._crit_edge.lver.check
  br label %._crit_edge.lver.orig

._crit_edge.lver.orig:                            ; preds = %._crit_edge.lver.orig.preheader, %._crit_edge.lver.orig
  %indvars.iv18.us.lver.orig = phi i64 [ %indvars.iv.next.us.lver.orig, %._crit_edge.lver.orig ], [ 1, %._crit_edge.lver.orig.preheader ]
  %16 = add nsw i64 %indvars.iv18.us.lver.orig, -1
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv723.us, i64 %16
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, 0xC09F400000000001
  %20 = fadd double %19, 0x40AF420000000001
  %21 = fdiv double 0x409F400000000001, %20
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv723.us, i64 %indvars.iv18.us.lver.orig
  store double %21, double* %22, align 8
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18.us.lver.orig, i64 %14
  %24 = bitcast double* %23 to <2 x double>*
  %25 = load <2 x double>, <2 x double>* %24, align 8
  %26 = fmul <2 x double> %25, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  %29 = fsub double %28, %27
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18.us.lver.orig, i64 %15
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, 0xC08F400000000001
  %33 = fsub double %29, %32
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv723.us, i64 %16
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, 0xC09F400000000001
  %37 = fsub double %33, %36
  %38 = fdiv double %37, %20
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv723.us, i64 %indvars.iv18.us.lver.orig
  store double %38, double* %39, align 8
  %indvars.iv.next.us.lver.orig = add nuw nsw i64 %indvars.iv18.us.lver.orig, 1
  %exitcond.us.lver.orig = icmp eq i64 %indvars.iv.next.us.lver.orig, 999
  br i1 %exitcond.us.lver.orig, label %._crit_edge.us.loopexit, label %._crit_edge.lver.orig

._crit_edge.ph:                                   ; preds = %._crit_edge.lver.check
  %scevgep56 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 0
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 0
  %load_initial = load double, double* %scevgep55, align 8
  %load_initial57 = load double, double* %scevgep56, align 8
  br label %._crit_edge

.preheader4.us:                                   ; preds = %.lr.ph21.us
  %exitcond = icmp eq i64 %15, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %._crit_edge47.lver.check.preheader, label %._crit_edge.lver.check

._crit_edge47.lver.check.preheader:               ; preds = %.preheader4.us
  br label %._crit_edge47.lver.check

.lr.ph21.us:                                      ; preds = %.lr.ph21.us, %._crit_edge.us
  %indvars.iv519.us = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next6.us.1, %.lr.ph21.us ]
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv723.us, i64 %indvars.iv519.us
  %41 = load double, double* %40, align 8
  %42 = or i64 %indvars.iv519.us, 1
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %42, i64 %indvars.iv723.us
  %44 = load double, double* %43, align 8
  %45 = fmul double %41, %44
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv723.us, i64 %indvars.iv519.us
  %47 = load double, double* %46, align 8
  %48 = fadd double %45, %47
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv519.us, i64 %indvars.iv723.us
  store double %48, double* %49, align 8
  %indvars.iv.next6.us = add nsw i64 %indvars.iv519.us, -1
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv723.us, i64 %indvars.iv.next6.us
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %48
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv723.us, i64 %indvars.iv.next6.us
  %54 = load double, double* %53, align 8
  %55 = fadd double %52, %54
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next6.us, i64 %indvars.iv723.us
  store double %55, double* %56, align 8
  %57 = icmp sgt i64 %indvars.iv.next6.us, 1
  %indvars.iv.next6.us.1 = add nsw i64 %indvars.iv519.us, -2
  br i1 %57, label %.lr.ph21.us, label %.preheader4.us

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.ph
  %store_forwarded58 = phi double [ %load_initial57, %._crit_edge.ph ], [ %75, %._crit_edge ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge.ph ], [ %60, %._crit_edge ]
  %indvars.iv18.us = phi i64 [ 1, %._crit_edge.ph ], [ %indvars.iv.next.us, %._crit_edge ]
  %58 = fmul double %store_forwarded, 0xC09F400000000001
  %59 = fadd double %58, 0x40AF420000000001
  %60 = fdiv double 0x409F400000000001, %59
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv723.us, i64 %indvars.iv18.us
  store double %60, double* %61, align 8
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18.us, i64 %14
  %63 = bitcast double* %62 to <2 x double>*
  %64 = load <2 x double>, <2 x double>* %63, align 8
  %65 = fmul <2 x double> %64, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %66 = extractelement <2 x double> %65, i32 0
  %67 = extractelement <2 x double> %65, i32 1
  %68 = fsub double %67, %66
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv18.us, i64 %15
  %70 = load double, double* %69, align 8
  %71 = fmul double %70, 0xC08F400000000001
  %72 = fsub double %68, %71
  %73 = fmul double %store_forwarded58, 0xC09F400000000001
  %74 = fsub double %72, %73
  %75 = fdiv double %74, %59
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv723.us, i64 %indvars.iv18.us
  store double %75, double* %76, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv18.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 999
  br i1 %exitcond.us, label %._crit_edge.us.loopexit80, label %._crit_edge

._crit_edge.us.loopexit:                          ; preds = %._crit_edge.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit80:                        ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit80, %._crit_edge.us.loopexit
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv723.us
  store double 1.000000e+00, double* %77, align 8
  br label %.lr.ph21.us

._crit_edge47.lver.check:                         ; preds = %._crit_edge47.lver.check.preheader, %.preheader.us
  %indvar59 = phi i64 [ %indvar.next60, %.preheader.us ], [ 0, %._crit_edge47.lver.check.preheader ]
  %indvars.iv1536.us = phi i64 [ %88, %.preheader.us ], [ 1, %._crit_edge47.lver.check.preheader ]
  %78 = add i64 %indvar59, 1
  %79 = add i64 %indvar59, 1
  %scevgep61 = getelementptr [1000 x double], [1000 x double]* %4, i64 %79, i64 0
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %4, i64 %79, i64 999
  %scevgep65 = getelementptr [1000 x double], [1000 x double]* %5, i64 %79, i64 0
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %5, i64 %79, i64 999
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1536.us
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %80, i64 0, i64 0
  store double 1.000000e+00, double* %81, align 8
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1536.us, i64 0
  store double 0.000000e+00, double* %82, align 8
  %83 = bitcast [1000 x double]* %80 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1536.us
  %86 = bitcast [1000 x double]* %85 to i64*
  store i64 %84, i64* %86, align 8
  %87 = add nsw i64 %indvars.iv1536.us, -1
  %88 = add nuw nsw i64 %indvars.iv1536.us, 1
  %bound069 = icmp ult double* %scevgep61, %scevgep67
  %bound170 = icmp ult double* %scevgep65, %scevgep63
  %memcheck.conflict72 = and i1 %bound069, %bound170
  br i1 %memcheck.conflict72, label %._crit_edge47.lver.orig.preheader, label %._crit_edge47.ph

._crit_edge47.lver.orig.preheader:                ; preds = %._crit_edge47.lver.check
  br label %._crit_edge47.lver.orig

._crit_edge47.lver.orig:                          ; preds = %._crit_edge47.lver.orig.preheader, %._crit_edge47.lver.orig
  %indvars.iv928.us.lver.orig = phi i64 [ %indvars.iv.next10.us.lver.orig, %._crit_edge47.lver.orig ], [ 1, %._crit_edge47.lver.orig.preheader ]
  %89 = add nsw i64 %indvars.iv928.us.lver.orig, -1
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1536.us, i64 %89
  %91 = load double, double* %90, align 8
  %92 = fmul double %91, 0xC08F400000000001
  %93 = fadd double %92, 0x409F440000000001
  %94 = fdiv double 0x408F400000000001, %93
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1536.us, i64 %indvars.iv928.us.lver.orig
  store double %94, double* %95, align 8
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %87, i64 %indvars.iv928.us.lver.orig
  %97 = load double, double* %96, align 8
  %98 = fmul double %97, 0xC09F400000000001
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1536.us, i64 %indvars.iv928.us.lver.orig
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, 0xC0AF3E0000000001
  %102 = fsub double %101, %98
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %88, i64 %indvars.iv928.us.lver.orig
  %104 = load double, double* %103, align 8
  %105 = fmul double %104, 0xC09F400000000001
  %106 = fsub double %102, %105
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1536.us, i64 %89
  %108 = load double, double* %107, align 8
  %109 = fmul double %108, 0xC08F400000000001
  %110 = fsub double %106, %109
  %111 = fdiv double %110, %93
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1536.us, i64 %indvars.iv928.us.lver.orig
  store double %111, double* %112, align 8
  %indvars.iv.next10.us.lver.orig = add nuw nsw i64 %indvars.iv928.us.lver.orig, 1
  %exitcond12.us.lver.orig = icmp eq i64 %indvars.iv.next10.us.lver.orig, 999
  br i1 %exitcond12.us.lver.orig, label %._crit_edge31.us.loopexit, label %._crit_edge47.lver.orig

._crit_edge47.ph:                                 ; preds = %._crit_edge47.lver.check
  %scevgep76 = getelementptr [1000 x double], [1000 x double]* %5, i64 %78, i64 0
  %scevgep73 = getelementptr [1000 x double], [1000 x double]* %4, i64 %78, i64 0
  %load_initial74 = load double, double* %scevgep73, align 8
  %load_initial77 = load double, double* %scevgep76, align 8
  br label %._crit_edge47

.preheader.us:                                    ; preds = %.lr.ph34.us
  %exitcond44 = icmp eq i64 %88, 999
  %indvar.next60 = add i64 %indvar59, 1
  br i1 %exitcond44, label %.preheader._crit_edge, label %._crit_edge47.lver.check

.lr.ph34.us:                                      ; preds = %.lr.ph34.us, %._crit_edge31.us
  %indvars.iv1332.us = phi i64 [ 998, %._crit_edge31.us ], [ %indvars.iv.next14.us.1, %.lr.ph34.us ]
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1536.us, i64 %indvars.iv1332.us
  %114 = load double, double* %113, align 8
  %115 = or i64 %indvars.iv1332.us, 1
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1536.us, i64 %115
  %117 = load double, double* %116, align 8
  %118 = fmul double %114, %117
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1536.us, i64 %indvars.iv1332.us
  %120 = load double, double* %119, align 8
  %121 = fadd double %118, %120
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1536.us, i64 %indvars.iv1332.us
  store double %121, double* %122, align 8
  %indvars.iv.next14.us = add nsw i64 %indvars.iv1332.us, -1
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1536.us, i64 %indvars.iv.next14.us
  %124 = load double, double* %123, align 8
  %125 = fmul double %124, %121
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1536.us, i64 %indvars.iv.next14.us
  %127 = load double, double* %126, align 8
  %128 = fadd double %125, %127
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1536.us, i64 %indvars.iv.next14.us
  store double %128, double* %129, align 8
  %130 = icmp sgt i64 %indvars.iv.next14.us, 1
  %indvars.iv.next14.us.1 = add nsw i64 %indvars.iv1332.us, -2
  br i1 %130, label %.lr.ph34.us, label %.preheader.us

._crit_edge47:                                    ; preds = %._crit_edge47, %._crit_edge47.ph
  %store_forwarded78 = phi double [ %load_initial77, %._crit_edge47.ph ], [ %148, %._crit_edge47 ]
  %store_forwarded75 = phi double [ %load_initial74, %._crit_edge47.ph ], [ %133, %._crit_edge47 ]
  %indvars.iv928.us = phi i64 [ 1, %._crit_edge47.ph ], [ %indvars.iv.next10.us, %._crit_edge47 ]
  %131 = fmul double %store_forwarded75, 0xC08F400000000001
  %132 = fadd double %131, 0x409F440000000001
  %133 = fdiv double 0x408F400000000001, %132
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1536.us, i64 %indvars.iv928.us
  store double %133, double* %134, align 8
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %87, i64 %indvars.iv928.us
  %136 = load double, double* %135, align 8
  %137 = fmul double %136, 0xC09F400000000001
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1536.us, i64 %indvars.iv928.us
  %139 = load double, double* %138, align 8
  %140 = fmul double %139, 0xC0AF3E0000000001
  %141 = fsub double %140, %137
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %88, i64 %indvars.iv928.us
  %143 = load double, double* %142, align 8
  %144 = fmul double %143, 0xC09F400000000001
  %145 = fsub double %141, %144
  %146 = fmul double %store_forwarded78, 0xC08F400000000001
  %147 = fsub double %145, %146
  %148 = fdiv double %147, %132
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1536.us, i64 %indvars.iv928.us
  store double %148, double* %149, align 8
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv928.us, 1
  %exitcond12.us = icmp eq i64 %indvars.iv.next10.us, 999
  br i1 %exitcond12.us, label %._crit_edge31.us.loopexit79, label %._crit_edge47

._crit_edge31.us.loopexit:                        ; preds = %._crit_edge47.lver.orig
  br label %._crit_edge31.us

._crit_edge31.us.loopexit79:                      ; preds = %._crit_edge47
  br label %._crit_edge31.us

._crit_edge31.us:                                 ; preds = %._crit_edge31.us.loopexit79, %._crit_edge31.us.loopexit
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1536.us, i64 999
  store double 1.000000e+00, double* %150, align 8
  br label %.lr.ph34.us

.preheader._crit_edge:                            ; preds = %.preheader.us
  %exitcond46 = icmp eq i32 %.0339, 500
  %151 = add nuw nsw i32 %.0339, 1
  br i1 %exitcond46, label %._crit_edge40, label %.preheader4.preheader

._crit_edge40:                                    ; preds = %.preheader._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
.preheader.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.us.preheader
  %indvars.iv26.us = phi i64 [ 0, %.preheader.preheader.us.preheader ], [ %indvars.iv.next3.us, %.preheader._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv26.us, 1000
  br label %.preheader.us._crit_edge

.preheader.us._crit_edge:                         ; preds = %.preheader.us, %.preheader.preheader.us
  %indvars.iv5.us = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next.us, %.preheader.us ]
  %7 = add nuw nsw i64 %indvars.iv5.us, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.preheader.us

; <label>:11:                                     ; preds = %.preheader.us._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv26.us, i64 %indvars.iv5.us
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv5.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1000
  br i1 %exitcond.us, label %.preheader._crit_edge.us, label %.preheader.us._crit_edge

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv26.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next3.us, 1000
  br i1 %exitcond, label %._crit_edge, label %.preheader.preheader.us

._crit_edge:                                      ; preds = %.preheader._crit_edge.us
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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
