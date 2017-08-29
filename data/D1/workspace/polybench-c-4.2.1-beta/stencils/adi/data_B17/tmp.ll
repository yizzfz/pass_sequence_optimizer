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
  %16 = bitcast i8* %3 to [1000 x double]*
  tail call void @print_array(i32 1000, [1000 x double]* %16)
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
  %2 = add i64 %indvars.iv5, 1000
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
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %145, %._crit_edge22 ]
  br label %._crit_edge.lver.check

._crit_edge.lver.check:                           ; preds = %._crit_edge9.us, %.preheader4
  %indvar = phi i64 [ %indvar.next, %._crit_edge9.us ], [ 0, %.preheader4 ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge9.us ], [ 1, %.preheader4 ]
  %6 = add i64 %indvar, 1
  %7 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %scevgep44 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 999
  %scevgep46 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep48 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 999
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv27
  store double 1.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast double* %8 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i64 %indvars.iv27, -1
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %bound0 = icmp ult double* %scevgep, %scevgep48
  %bound1 = icmp ult double* %scevgep46, %scevgep44
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge.lver.orig.preheader, label %._crit_edge.ph

._crit_edge.lver.orig.preheader:                  ; preds = %._crit_edge.lver.check
  br label %._crit_edge.lver.orig

._crit_edge.lver.orig:                            ; preds = %._crit_edge.lver.orig.preheader, %._crit_edge.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge.lver.orig ], [ 1, %._crit_edge.lver.orig.preheader ]
  %15 = add nsw i64 %indvars.iv.lver.orig, -1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %15
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, 0xC09F400000000001
  %19 = fadd double %18, 0x40AF420000000001
  %20 = fdiv double 0x409F400000000001, %19
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %20, double* %21, align 8
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %14
  %23 = bitcast double* %22 to <2 x double>*
  %24 = load <2 x double>, <2 x double>* %23, align 8
  %25 = fmul <2 x double> %24, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %28 = fsub double %27, %26
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next28
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, 0xC08F400000000001
  %32 = fsub double %28, %31
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %15
  %34 = load double, double* %33, align 8
  %35 = fmul double %34, 0xC09F400000000001
  %36 = fsub double %32, %35
  %37 = fdiv double %36, %19
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %37, double* %38, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %._crit_edge.lver.orig

._crit_edge.ph:                                   ; preds = %._crit_edge.lver.check
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 0
  %scevgep50 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 0
  %load_initial = load double, double* %scevgep50, align 8
  %load_initial52 = load double, double* %scevgep51, align 8
  br label %._crit_edge

._crit_edge9.us:                                  ; preds = %.lr.ph8.us
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond30, label %._crit_edge42.lver.check.preheader, label %._crit_edge.lver.check

._crit_edge42.lver.check.preheader:               ; preds = %._crit_edge9.us
  br label %._crit_edge42.lver.check

.lr.ph8.us:                                       ; preds = %.lr.ph8.us, %._crit_edge.us
  %indvars.iv25 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next26.1, %.lr.ph8.us ]
  %39 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %52, %.lr.ph8.us ]
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv25
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %39
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv25
  %44 = load double, double* %43, align 8
  %45 = fadd double %42, %44
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv27
  store double %45, double* %46, align 8
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, -1
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.next26
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %45
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.next26
  %51 = load double, double* %50, align 8
  %52 = fadd double %49, %51
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next26, i64 %indvars.iv27
  store double %52, double* %53, align 8
  %54 = icmp sgt i64 %indvars.iv.next26, 1
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, -2
  br i1 %54, label %.lr.ph8.us, label %._crit_edge9.us

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.ph
  %store_forwarded53 = phi double [ %load_initial52, %._crit_edge.ph ], [ %72, %._crit_edge ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge.ph ], [ %57, %._crit_edge ]
  %indvars.iv = phi i64 [ 1, %._crit_edge.ph ], [ %indvars.iv.next, %._crit_edge ]
  %55 = fmul double %store_forwarded, 0xC09F400000000001
  %56 = fadd double %55, 0x40AF420000000001
  %57 = fdiv double 0x409F400000000001, %56
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv
  store double %57, double* %58, align 8
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %14
  %60 = bitcast double* %59 to <2 x double>*
  %61 = load <2 x double>, <2 x double>* %60, align 8
  %62 = fmul <2 x double> %61, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %63 = extractelement <2 x double> %62, i32 0
  %64 = extractelement <2 x double> %62, i32 1
  %65 = fsub double %64, %63
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next28
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, 0xC08F400000000001
  %69 = fsub double %65, %68
  %70 = fmul double %store_forwarded53, 0xC09F400000000001
  %71 = fsub double %69, %70
  %72 = fdiv double %71, %56
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv
  store double %72, double* %73, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %._crit_edge.us.loopexit75, label %._crit_edge

._crit_edge.us.loopexit:                          ; preds = %._crit_edge.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit75:                        ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit75, %._crit_edge.us.loopexit
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv27
  store double 1.000000e+00, double* %74, align 8
  br label %.lr.ph8.us

._crit_edge42.lver.check:                         ; preds = %._crit_edge42.lver.check.preheader, %._crit_edge19.us
  %indvar54 = phi i64 [ %indvar.next55, %._crit_edge19.us ], [ 0, %._crit_edge42.lver.check.preheader ]
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge19.us ], [ 1, %._crit_edge42.lver.check.preheader ]
  %75 = add i64 %indvar54, 1
  %76 = add i64 %indvar54, 1
  %scevgep56 = getelementptr [1000 x double], [1000 x double]* %4, i64 %76, i64 0
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %4, i64 %76, i64 999
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %5, i64 %76, i64 0
  %scevgep62 = getelementptr [1000 x double], [1000 x double]* %5, i64 %76, i64 999
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %77, i64 0, i64 0
  store double 1.000000e+00, double* %78, align 8
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv37, i64 0
  store double 0.000000e+00, double* %79, align 8
  %80 = bitcast [1000 x double]* %77 to i64*
  %81 = load i64, i64* %80, align 8
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37
  %83 = bitcast [1000 x double]* %82 to i64*
  store i64 %81, i64* %83, align 8
  %84 = add nsw i64 %indvars.iv37, -1
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %bound064 = icmp ult double* %scevgep56, %scevgep62
  %bound165 = icmp ult double* %scevgep60, %scevgep58
  %memcheck.conflict67 = and i1 %bound064, %bound165
  br i1 %memcheck.conflict67, label %._crit_edge42.lver.orig.preheader, label %._crit_edge42.ph

._crit_edge42.lver.orig.preheader:                ; preds = %._crit_edge42.lver.check
  br label %._crit_edge42.lver.orig

._crit_edge42.lver.orig:                          ; preds = %._crit_edge42.lver.orig.preheader, %._crit_edge42.lver.orig
  %indvars.iv31.lver.orig = phi i64 [ %indvars.iv.next32.lver.orig, %._crit_edge42.lver.orig ], [ 1, %._crit_edge42.lver.orig.preheader ]
  %85 = add nsw i64 %indvars.iv31.lver.orig, -1
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv37, i64 %85
  %87 = load double, double* %86, align 8
  %88 = fmul double %87, 0xC08F400000000001
  %89 = fadd double %88, 0x409F440000000001
  %90 = fdiv double 0x408F400000000001, %89
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  store double %90, double* %91, align 8
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %84, i64 %indvars.iv31.lver.orig
  %93 = load double, double* %92, align 8
  %94 = fmul double %93, 0xC09F400000000001
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  %96 = load double, double* %95, align 8
  %97 = fmul double %96, 0xC0AF3E0000000001
  %98 = fsub double %97, %94
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next38, i64 %indvars.iv31.lver.orig
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, 0xC09F400000000001
  %102 = fsub double %98, %101
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %85
  %104 = load double, double* %103, align 8
  %105 = fmul double %104, 0xC08F400000000001
  %106 = fsub double %102, %105
  %107 = fdiv double %106, %89
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  store double %107, double* %108, align 8
  %indvars.iv.next32.lver.orig = add nuw nsw i64 %indvars.iv31.lver.orig, 1
  %exitcond34.lver.orig = icmp eq i64 %indvars.iv.next32.lver.orig, 999
  br i1 %exitcond34.lver.orig, label %._crit_edge15.us.loopexit, label %._crit_edge42.lver.orig

._crit_edge42.ph:                                 ; preds = %._crit_edge42.lver.check
  %scevgep71 = getelementptr [1000 x double], [1000 x double]* %5, i64 %75, i64 0
  %scevgep68 = getelementptr [1000 x double], [1000 x double]* %4, i64 %75, i64 0
  %load_initial69 = load double, double* %scevgep68, align 8
  %load_initial72 = load double, double* %scevgep71, align 8
  br label %._crit_edge42

._crit_edge19.us:                                 ; preds = %.lr.ph18.us
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 999
  %indvar.next55 = add i64 %indvar54, 1
  br i1 %exitcond40, label %._crit_edge22, label %._crit_edge42.lver.check

.lr.ph18.us:                                      ; preds = %.lr.ph18.us, %._crit_edge15.us
  %indvars.iv35 = phi i64 [ 998, %._crit_edge15.us ], [ %indvars.iv.next36.1, %.lr.ph18.us ]
  %109 = phi double [ 1.000000e+00, %._crit_edge15.us ], [ %122, %.lr.ph18.us ]
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv35
  %111 = load double, double* %110, align 8
  %112 = fmul double %111, %109
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv35
  %114 = load double, double* %113, align 8
  %115 = fadd double %112, %114
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv35
  store double %115, double* %116, align 8
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, -1
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next36
  %118 = load double, double* %117, align 8
  %119 = fmul double %118, %115
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv.next36
  %121 = load double, double* %120, align 8
  %122 = fadd double %119, %121
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv.next36
  store double %122, double* %123, align 8
  %124 = icmp sgt i64 %indvars.iv.next36, 1
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, -2
  br i1 %124, label %.lr.ph18.us, label %._crit_edge19.us

._crit_edge42:                                    ; preds = %._crit_edge42, %._crit_edge42.ph
  %store_forwarded73 = phi double [ %load_initial72, %._crit_edge42.ph ], [ %142, %._crit_edge42 ]
  %store_forwarded70 = phi double [ %load_initial69, %._crit_edge42.ph ], [ %127, %._crit_edge42 ]
  %indvars.iv31 = phi i64 [ 1, %._crit_edge42.ph ], [ %indvars.iv.next32, %._crit_edge42 ]
  %125 = fmul double %store_forwarded70, 0xC08F400000000001
  %126 = fadd double %125, 0x409F440000000001
  %127 = fdiv double 0x408F400000000001, %126
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv31
  store double %127, double* %128, align 8
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %84, i64 %indvars.iv31
  %130 = load double, double* %129, align 8
  %131 = fmul double %130, 0xC09F400000000001
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv31
  %133 = load double, double* %132, align 8
  %134 = fmul double %133, 0xC0AF3E0000000001
  %135 = fsub double %134, %131
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next38, i64 %indvars.iv31
  %137 = load double, double* %136, align 8
  %138 = fmul double %137, 0xC09F400000000001
  %139 = fsub double %135, %138
  %140 = fmul double %store_forwarded73, 0xC08F400000000001
  %141 = fsub double %139, %140
  %142 = fdiv double %141, %126
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv31
  store double %142, double* %143, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 999
  br i1 %exitcond34, label %._crit_edge15.us.loopexit74, label %._crit_edge42

._crit_edge15.us.loopexit:                        ; preds = %._crit_edge42.lver.orig
  br label %._crit_edge15.us

._crit_edge15.us.loopexit74:                      ; preds = %._crit_edge42
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit74, %._crit_edge15.us.loopexit
  %144 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 999
  store double 1.000000e+00, double* %144, align 8
  br label %.lr.ph18.us

._crit_edge22:                                    ; preds = %._crit_edge19.us
  %exitcond41 = icmp eq i32 %.0323, 500
  %145 = add nuw nsw i32 %.0323, 1
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
  %6 = mul nsw i64 %indvars.iv5, 1000
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nsw i64 %indvars.iv, %6
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
