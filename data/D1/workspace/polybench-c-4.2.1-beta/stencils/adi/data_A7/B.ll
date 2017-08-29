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
  tail call void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  tail call void @print_array([1000 x double]* %7)
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
define internal void @init_array([1000 x double]*) #0 {
.preheader.lr.ph:
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %1 = add nsw i64 %indvars.iv5, 1000
  %2 = trunc i64 %1 to i32
  %3 = trunc i64 %1 to i32
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader.us.new
  %indvars.iv = phi i64 [ 0, %.preheader.us.new ], [ %indvars.iv.next.1, %4 ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = sub i32 %2, %5
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %9 = trunc i64 %indvars.iv to i32
  %10 = or i32 %9, 1
  %11 = sub i32 %3, %10
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.000000e+03, double 1.000000e+03>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us, label %4

._crit_edge.us:                                   ; preds = %4
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us.new

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) #0 {
.preheader4.lr.ph:
  br label %.lr.ph11.split.us.preheader

.lr.ph11.split.us.preheader:                      ; preds = %._crit_edge22, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %145, %._crit_edge22 ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge9.us, %.lr.ph11.split.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge9.us ], [ 0, %.lr.ph11.split.us.preheader ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge9.us ], [ 1, %.lr.ph11.split.us.preheader ]
  %4 = add i64 %indvar, 1
  %5 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %scevgep2 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 999
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 999
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv27
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = bitcast double* %6 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27
  %11 = bitcast [1000 x double]* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = add nsw i64 %indvars.iv27, -1
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %13 = add nsw i64 %indvars.iv.lver.orig, -1
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %13
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, 0xC09F400000000001
  %17 = fadd double %16, 0x40AF420000000001
  %18 = fdiv double 0x409F400000000001, %17
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %12
  %21 = bitcast double* %20 to <2 x double>*
  %22 = load <2 x double>, <2 x double>* %21, align 8
  %23 = fmul <2 x double> %22, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  %26 = fsub double %25, %24
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next28
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, 0xC08F400000000001
  %30 = fsub double %26, %29
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %13
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, 0xC09F400000000001
  %34 = fsub double %30, %33
  %35 = fdiv double %34, %17
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %35, double* %36, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %.lr.ph8.us.preheader.new.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep9 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 0
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 0
  %load_initial = load double, double* %scevgep8, align 8
  %load_initial10 = load double, double* %scevgep9, align 8
  br label %53

._crit_edge9.us:                                  ; preds = %.lr.ph8.us
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond30, label %.lver.check26.preheader, label %.lver.check

.lver.check26.preheader:                          ; preds = %._crit_edge9.us
  br label %.lver.check26

.lr.ph8.us:                                       ; preds = %.lr.ph8.us, %.lr.ph8.us.preheader.new
  %indvars.iv25 = phi i64 [ 998, %.lr.ph8.us.preheader.new ], [ %indvars.iv.next26.1, %.lr.ph8.us ]
  %37 = phi double [ 1.000000e+00, %.lr.ph8.us.preheader.new ], [ %50, %.lr.ph8.us ]
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv25
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %37
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv25
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv27
  store double %43, double* %44, align 8
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, -1
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv.next26
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %43
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv.next26
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next26, i64 %indvars.iv27
  store double %50, double* %51, align 8
  %52 = icmp sgt i64 %indvars.iv.next26, 1
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, -2
  br i1 %52, label %.lr.ph8.us, label %._crit_edge9.us

; <label>:53:                                     ; preds = %53, %.ph
  %store_forwarded11 = phi double [ %load_initial10, %.ph ], [ %71, %53 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %56, %53 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %53 ]
  %54 = fmul double %store_forwarded, 0xC09F400000000001
  %55 = fadd double %54, 0x40AF420000000001
  %56 = fdiv double 0x409F400000000001, %55
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv
  store double %56, double* %57, align 8
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %12
  %59 = bitcast double* %58 to <2 x double>*
  %60 = load <2 x double>, <2 x double>* %59, align 8
  %61 = fmul <2 x double> %60, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %62 = extractelement <2 x double> %61, i32 0
  %63 = extractelement <2 x double> %61, i32 1
  %64 = fsub double %63, %62
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next28
  %66 = load double, double* %65, align 8
  %67 = fmul double %66, 0xC08F400000000001
  %68 = fsub double %64, %67
  %69 = fmul double %store_forwarded11, 0xC09F400000000001
  %70 = fsub double %68, %69
  %71 = fdiv double %70, %55
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv
  store double %71, double* %72, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %.lr.ph8.us.preheader.new.loopexit35, label %53

.lr.ph8.us.preheader.new.loopexit:                ; preds = %.ph.lver.orig
  br label %.lr.ph8.us.preheader.new

.lr.ph8.us.preheader.new.loopexit35:              ; preds = %53
  br label %.lr.ph8.us.preheader.new

.lr.ph8.us.preheader.new:                         ; preds = %.lr.ph8.us.preheader.new.loopexit35, %.lr.ph8.us.preheader.new.loopexit
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv27
  store double 1.000000e+00, double* %73, align 8
  br label %.lr.ph8.us

.lver.check26:                                    ; preds = %.lver.check26.preheader, %._crit_edge19.us
  %indvar12 = phi i64 [ %indvar.next13, %._crit_edge19.us ], [ 0, %.lver.check26.preheader ]
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge19.us ], [ 1, %.lver.check26.preheader ]
  %74 = add i64 %indvar12, 1
  %75 = add i64 %indvar12, 1
  %scevgep14 = getelementptr [1000 x double], [1000 x double]* %2, i64 %75, i64 0
  %scevgep16 = getelementptr [1000 x double], [1000 x double]* %2, i64 %75, i64 999
  %scevgep18 = getelementptr [1000 x double], [1000 x double]* %3, i64 %75, i64 0
  %scevgep20 = getelementptr [1000 x double], [1000 x double]* %3, i64 %75, i64 999
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 0, i64 0
  store double 1.000000e+00, double* %77, align 8
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 0
  store double 0.000000e+00, double* %78, align 8
  %79 = bitcast [1000 x double]* %76 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37
  %82 = bitcast [1000 x double]* %81 to i64*
  store i64 %80, i64* %82, align 8
  %83 = add nsw i64 %indvars.iv37, -1
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %bound022 = icmp ult double* %scevgep14, %scevgep20
  %bound123 = icmp ult double* %scevgep18, %scevgep16
  %memcheck.conflict25 = and i1 %bound022, %bound123
  br i1 %memcheck.conflict25, label %.ph27.lver.orig.preheader, label %.ph27

.ph27.lver.orig.preheader:                        ; preds = %.lver.check26
  br label %.ph27.lver.orig

.ph27.lver.orig:                                  ; preds = %.ph27.lver.orig.preheader, %.ph27.lver.orig
  %indvars.iv31.lver.orig = phi i64 [ %indvars.iv.next32.lver.orig, %.ph27.lver.orig ], [ 1, %.ph27.lver.orig.preheader ]
  %84 = add nsw i64 %indvars.iv31.lver.orig, -1
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %84
  %86 = load double, double* %85, align 8
  %87 = fmul double %86, 0xC08F400000000001
  %88 = fadd double %87, 0x409F440000000001
  %89 = fdiv double 0x408F400000000001, %88
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  store double %89, double* %90, align 8
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %83, i64 %indvars.iv31.lver.orig
  %92 = load double, double* %91, align 8
  %93 = fmul double %92, 0xC09F400000000001
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  %95 = load double, double* %94, align 8
  %96 = fmul double %95, 0xC0AF3E0000000001
  %97 = fsub double %96, %93
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next38, i64 %indvars.iv31.lver.orig
  %99 = load double, double* %98, align 8
  %100 = fmul double %99, 0xC09F400000000001
  %101 = fsub double %97, %100
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %84
  %103 = load double, double* %102, align 8
  %104 = fmul double %103, 0xC08F400000000001
  %105 = fsub double %101, %104
  %106 = fdiv double %105, %88
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv31.lver.orig
  store double %106, double* %107, align 8
  %indvars.iv.next32.lver.orig = add nuw nsw i64 %indvars.iv31.lver.orig, 1
  %exitcond34.lver.orig = icmp eq i64 %indvars.iv.next32.lver.orig, 999
  br i1 %exitcond34.lver.orig, label %.lr.ph18.us.preheader.new.loopexit, label %.ph27.lver.orig

.ph27:                                            ; preds = %.lver.check26
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %3, i64 %74, i64 0
  %scevgep28 = getelementptr [1000 x double], [1000 x double]* %2, i64 %74, i64 0
  %load_initial29 = load double, double* %scevgep28, align 8
  %load_initial32 = load double, double* %scevgep31, align 8
  br label %124

._crit_edge19.us:                                 ; preds = %.lr.ph18.us
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 999
  %indvar.next13 = add i64 %indvar12, 1
  br i1 %exitcond40, label %._crit_edge22, label %.lver.check26

.lr.ph18.us:                                      ; preds = %.lr.ph18.us, %.lr.ph18.us.preheader.new
  %indvars.iv35 = phi i64 [ 998, %.lr.ph18.us.preheader.new ], [ %indvars.iv.next36.1, %.lr.ph18.us ]
  %108 = phi double [ 1.000000e+00, %.lr.ph18.us.preheader.new ], [ %121, %.lr.ph18.us ]
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv35
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, %108
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv35
  %113 = load double, double* %112, align 8
  %114 = fadd double %111, %113
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv35
  store double %114, double* %115, align 8
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, -1
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv.next36
  %117 = load double, double* %116, align 8
  %118 = fmul double %117, %114
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv.next36
  %120 = load double, double* %119, align 8
  %121 = fadd double %118, %120
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv.next36
  store double %121, double* %122, align 8
  %123 = icmp sgt i64 %indvars.iv.next36, 1
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, -2
  br i1 %123, label %.lr.ph18.us, label %._crit_edge19.us

; <label>:124:                                    ; preds = %124, %.ph27
  %store_forwarded33 = phi double [ %load_initial32, %.ph27 ], [ %142, %124 ]
  %store_forwarded30 = phi double [ %load_initial29, %.ph27 ], [ %127, %124 ]
  %indvars.iv31 = phi i64 [ 1, %.ph27 ], [ %indvars.iv.next32, %124 ]
  %125 = fmul double %store_forwarded30, 0xC08F400000000001
  %126 = fadd double %125, 0x409F440000000001
  %127 = fdiv double 0x408F400000000001, %126
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv31
  store double %127, double* %128, align 8
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %83, i64 %indvars.iv31
  %130 = load double, double* %129, align 8
  %131 = fmul double %130, 0xC09F400000000001
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv37, i64 %indvars.iv31
  %133 = load double, double* %132, align 8
  %134 = fmul double %133, 0xC0AF3E0000000001
  %135 = fsub double %134, %131
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next38, i64 %indvars.iv31
  %137 = load double, double* %136, align 8
  %138 = fmul double %137, 0xC09F400000000001
  %139 = fsub double %135, %138
  %140 = fmul double %store_forwarded33, 0xC08F400000000001
  %141 = fsub double %139, %140
  %142 = fdiv double %141, %126
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv31
  store double %142, double* %143, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 999
  br i1 %exitcond34, label %.lr.ph18.us.preheader.new.loopexit34, label %124

.lr.ph18.us.preheader.new.loopexit:               ; preds = %.ph27.lver.orig
  br label %.lr.ph18.us.preheader.new

.lr.ph18.us.preheader.new.loopexit34:             ; preds = %124
  br label %.lr.ph18.us.preheader.new

.lr.ph18.us.preheader.new:                        ; preds = %.lr.ph18.us.preheader.new.loopexit34, %.lr.ph18.us.preheader.new.loopexit
  %144 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv37, i64 999
  store double 1.000000e+00, double* %144, align 8
  br label %.lr.ph18.us

._crit_edge22:                                    ; preds = %._crit_edge19.us
  %145 = add nuw nsw i32 %.0323, 1
  %exitcond41 = icmp eq i32 %145, 501
  br i1 %exitcond41, label %._crit_edge24, label %.lr.ph11.split.us.preheader

._crit_edge24:                                    ; preds = %._crit_edge22
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1000 x double]*) #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv5, 1000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
