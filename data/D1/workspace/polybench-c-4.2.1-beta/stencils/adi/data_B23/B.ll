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
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  tail call void @print_array(i32 1000, [1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, [1000 x double]*) #0 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next6, %._crit_edge.us ]
  %2 = add nuw nsw i64 %indvars.iv5, 1000
  %3 = trunc i64 %2 to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %._crit_edge ]
  %4 = trunc i64 %indvars.iv to i32
  %5 = sub nuw nsw i32 %3, %4
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sub nuw nsw i32 %3, %8
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) #0 {
.preheader4.lr.ph:
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge22, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %143, %._crit_edge22 ]
  br label %._crit_edge.lver.check

._crit_edge.lver.check:                           ; preds = %.preheader4, %._crit_edge9.us
  %indvar = phi i64 [ 0, %.preheader4 ], [ %6, %._crit_edge9.us ]
  %indvars.iv27 = phi i64 [ 1, %.preheader4 ], [ %indvars.iv.next28, %._crit_edge9.us ]
  %6 = add i64 %indvar, 1
  %scevgep50 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 0
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 0
  %scevgep44 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 999
  %scevgep48 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 999
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv27
  store double 1.000000e+00, double* %7, align 8
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 0
  store double 0.000000e+00, double* %8, align 8
  %9 = bitcast double* %7 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27
  %12 = bitcast [1000 x double]* %11 to i64*
  store i64 %10, i64* %12, align 8
  %13 = add nsw i64 %indvars.iv27, -1
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %bound0 = icmp ult double* %scevgep50, %scevgep48
  %bound1 = icmp ult double* %scevgep51, %scevgep44
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %._crit_edge.lver.orig.preheader, label %._crit_edge.ph

._crit_edge.lver.orig.preheader:                  ; preds = %._crit_edge.lver.check
  br label %._crit_edge.lver.orig

._crit_edge.lver.orig:                            ; preds = %._crit_edge.lver.orig.preheader, %._crit_edge.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge.lver.orig ], [ 1, %._crit_edge.lver.orig.preheader ]
  %14 = add nsw i64 %indvars.iv.lver.orig, -1
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %14
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, 0xC09F400000000001
  %18 = fadd double %17, 0x40AF420000000001
  %19 = fdiv double 0x409F400000000001, %18
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %19, double* %20, align 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %13
  %22 = bitcast double* %21 to <2 x double>*
  %23 = load <2 x double>, <2 x double>* %22, align 8
  %24 = fmul <2 x double> %23, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %27 = fsub double %26, %25
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next28
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, 0xC08F400000000001
  %31 = fsub double %27, %30
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %14
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, 0xC09F400000000001
  %35 = fsub double %31, %34
  %36 = fdiv double %35, %18
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %36, double* %37, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %._crit_edge.lver.orig

._crit_edge.ph:                                   ; preds = %._crit_edge.lver.check
  %load_initial = load double, double* %scevgep50, align 8
  %load_initial52 = load double, double* %scevgep51, align 8
  br label %._crit_edge

._crit_edge9.us:                                  ; preds = %.lr.ph8.us
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 999
  br i1 %exitcond30, label %._crit_edge42.lver.check.preheader, label %._crit_edge.lver.check

._crit_edge42.lver.check.preheader:               ; preds = %._crit_edge9.us
  br label %._crit_edge42.lver.check

.lr.ph8.us:                                       ; preds = %.lr.ph8.us, %._crit_edge.us
  %indvars.iv25 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next26.1, %.lr.ph8.us ]
  %38 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %51, %.lr.ph8.us ]
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv25
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %38
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv25
  %43 = load double, double* %42, align 8
  %44 = fadd double %41, %43
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv27
  store double %44, double* %45, align 8
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, -1
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.next26
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %44
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.next26
  %50 = load double, double* %49, align 8
  %51 = fadd double %48, %50
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next26, i64 %indvars.iv27
  store double %51, double* %52, align 8
  %53 = icmp sgt i64 %indvars.iv.next26, 1
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, -2
  br i1 %53, label %.lr.ph8.us, label %._crit_edge9.us

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.ph
  %store_forwarded53 = phi double [ %load_initial52, %._crit_edge.ph ], [ %71, %._crit_edge ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge.ph ], [ %56, %._crit_edge ]
  %indvars.iv = phi i64 [ 1, %._crit_edge.ph ], [ %indvars.iv.next, %._crit_edge ]
  %54 = fmul double %store_forwarded, 0xC09F400000000001
  %55 = fadd double %54, 0x40AF420000000001
  %56 = fdiv double 0x409F400000000001, %55
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv
  store double %56, double* %57, align 8
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %13
  %59 = bitcast double* %58 to <2 x double>*
  %60 = load <2 x double>, <2 x double>* %59, align 8
  %61 = fmul <2 x double> %60, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %62 = extractelement <2 x double> %61, i32 0
  %63 = extractelement <2 x double> %61, i32 1
  %64 = fsub double %63, %62
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next28
  %66 = load double, double* %65, align 8
  %67 = fmul double %66, 0xC08F400000000001
  %68 = fsub double %64, %67
  %69 = fmul double %store_forwarded53, 0xC09F400000000001
  %70 = fsub double %68, %69
  %71 = fdiv double %70, %55
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv
  store double %71, double* %72, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %._crit_edge.us.loopexit75, label %._crit_edge

._crit_edge.us.loopexit:                          ; preds = %._crit_edge.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit75:                        ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit75, %._crit_edge.us.loopexit
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv27
  store double 1.000000e+00, double* %73, align 8
  br label %.lr.ph8.us

._crit_edge42.lver.check:                         ; preds = %._crit_edge42.lver.check.preheader, %._crit_edge19.us
  %indvar54 = phi i64 [ %74, %._crit_edge19.us ], [ 0, %._crit_edge42.lver.check.preheader ]
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge19.us ], [ 1, %._crit_edge42.lver.check.preheader ]
  %74 = add i64 %indvar54, 1
  %scevgep68 = getelementptr [1000 x double], [1000 x double]* %4, i64 %74, i64 0
  %scevgep71 = getelementptr [1000 x double], [1000 x double]* %5, i64 %74, i64 0
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %4, i64 %74, i64 999
  %scevgep62 = getelementptr [1000 x double], [1000 x double]* %5, i64 %74, i64 999
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %75, i64 0, i64 0
  store double 1.000000e+00, double* %76, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv37, i64 0
  store double 0.000000e+00, double* %77, align 8
  %78 = bitcast [1000 x double]* %75 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37
  %81 = bitcast [1000 x double]* %80 to i64*
  store i64 %79, i64* %81, align 8
  %82 = add nsw i64 %indvars.iv37, -1
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %bound064 = icmp ult double* %scevgep68, %scevgep62
  %bound165 = icmp ult double* %scevgep71, %scevgep58
  %found.conflict66 = and i1 %bound064, %bound165
  br i1 %found.conflict66, label %._crit_edge42.lver.orig.preheader, label %._crit_edge42.ph

._crit_edge42.lver.orig.preheader:                ; preds = %._crit_edge42.lver.check
  br label %._crit_edge42.lver.orig

._crit_edge42.lver.orig:                          ; preds = %._crit_edge42.lver.orig.preheader, %._crit_edge42.lver.orig
  %indvars.iv31.lver.orig = phi i64 [ %indvars.iv.next32.lver.orig, %._crit_edge42.lver.orig ], [ 1, %._crit_edge42.lver.orig.preheader ]
  %83 = add nsw i64 %indvars.iv31.lver.orig, -1
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv37, i64 %83
  %85 = load double, double* %84, align 8
  %86 = fmul double %85, 0xC08F400000000001
  %87 = fadd double %86, 0x409F440000000001
  %88 = fdiv double 0x408F400000000001, %87
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  store double %88, double* %89, align 8
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %82, i64 %indvars.iv31.lver.orig
  %91 = load double, double* %90, align 8
  %92 = fmul double %91, 0xC09F400000000001
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  %94 = load double, double* %93, align 8
  %95 = fmul double %94, 0xC0AF3E0000000001
  %96 = fsub double %95, %92
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next38, i64 %indvars.iv31.lver.orig
  %98 = load double, double* %97, align 8
  %99 = fmul double %98, 0xC09F400000000001
  %100 = fsub double %96, %99
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %83
  %102 = load double, double* %101, align 8
  %103 = fmul double %102, 0xC08F400000000001
  %104 = fsub double %100, %103
  %105 = fdiv double %104, %87
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  store double %105, double* %106, align 8
  %indvars.iv.next32.lver.orig = add nuw nsw i64 %indvars.iv31.lver.orig, 1
  %exitcond34.lver.orig = icmp eq i64 %indvars.iv.next32.lver.orig, 999
  br i1 %exitcond34.lver.orig, label %._crit_edge15.us.loopexit, label %._crit_edge42.lver.orig

._crit_edge42.ph:                                 ; preds = %._crit_edge42.lver.check
  %load_initial69 = load double, double* %scevgep68, align 8
  %load_initial72 = load double, double* %scevgep71, align 8
  br label %._crit_edge42

._crit_edge19.us:                                 ; preds = %.lr.ph18.us
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 999
  br i1 %exitcond40, label %._crit_edge22, label %._crit_edge42.lver.check

.lr.ph18.us:                                      ; preds = %.lr.ph18.us, %._crit_edge15.us
  %indvars.iv35 = phi i64 [ 998, %._crit_edge15.us ], [ %indvars.iv.next36.1, %.lr.ph18.us ]
  %107 = phi double [ 1.000000e+00, %._crit_edge15.us ], [ %120, %.lr.ph18.us ]
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv35
  %109 = load double, double* %108, align 8
  %110 = fmul double %109, %107
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv35
  %112 = load double, double* %111, align 8
  %113 = fadd double %110, %112
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv35
  store double %113, double* %114, align 8
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, -1
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next36
  %116 = load double, double* %115, align 8
  %117 = fmul double %116, %113
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv.next36
  %119 = load double, double* %118, align 8
  %120 = fadd double %117, %119
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv.next36
  store double %120, double* %121, align 8
  %122 = icmp sgt i64 %indvars.iv.next36, 1
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, -2
  br i1 %122, label %.lr.ph18.us, label %._crit_edge19.us

._crit_edge42:                                    ; preds = %._crit_edge42, %._crit_edge42.ph
  %store_forwarded73 = phi double [ %load_initial72, %._crit_edge42.ph ], [ %140, %._crit_edge42 ]
  %store_forwarded70 = phi double [ %load_initial69, %._crit_edge42.ph ], [ %125, %._crit_edge42 ]
  %indvars.iv31 = phi i64 [ 1, %._crit_edge42.ph ], [ %indvars.iv.next32, %._crit_edge42 ]
  %123 = fmul double %store_forwarded70, 0xC08F400000000001
  %124 = fadd double %123, 0x409F440000000001
  %125 = fdiv double 0x408F400000000001, %124
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv31
  store double %125, double* %126, align 8
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %82, i64 %indvars.iv31
  %128 = load double, double* %127, align 8
  %129 = fmul double %128, 0xC09F400000000001
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv31
  %131 = load double, double* %130, align 8
  %132 = fmul double %131, 0xC0AF3E0000000001
  %133 = fsub double %132, %129
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next38, i64 %indvars.iv31
  %135 = load double, double* %134, align 8
  %136 = fmul double %135, 0xC09F400000000001
  %137 = fsub double %133, %136
  %138 = fmul double %store_forwarded73, 0xC08F400000000001
  %139 = fsub double %137, %138
  %140 = fdiv double %139, %124
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv31
  store double %140, double* %141, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 999
  br i1 %exitcond34, label %._crit_edge15.us.loopexit74, label %._crit_edge42

._crit_edge15.us.loopexit:                        ; preds = %._crit_edge42.lver.orig
  br label %._crit_edge15.us

._crit_edge15.us.loopexit74:                      ; preds = %._crit_edge42
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit74, %._crit_edge15.us.loopexit
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 999
  store double 1.000000e+00, double* %142, align 8
  br label %.lr.ph18.us

._crit_edge22:                                    ; preds = %._crit_edge19.us
  %exitcond41 = icmp eq i32 %.0323, 500
  %143 = add nuw nsw i32 %.0323, 1
  br i1 %exitcond41, label %._crit_edge24, label %.preheader4

._crit_edge24:                                    ; preds = %._crit_edge22
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1000 x double]*) #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv5, 1000
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge9, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge9

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
