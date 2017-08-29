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
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next6, %._crit_edge.us ]
  %1 = add nuw nsw i64 %indvars.iv5, 1000
  %2 = trunc i64 %1 to i32
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %3 ]
  %4 = trunc i64 %indvars.iv to i32
  %5 = sub nuw nsw i32 %2, %4
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sub nuw nsw i32 %2, %8
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %exitcond7.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond7.1, label %._crit_edge.us, label %3

._crit_edge.us:                                   ; preds = %3
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
.preheader4.lr.ph:
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge22, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %151, %._crit_edge22 ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge9.us, %.preheader4
  %indvar = phi i64 [ 0, %.preheader4 ], [ %indvar.next, %._crit_edge9.us ]
  %indvars.iv28 = phi i64 [ 1, %.preheader4 ], [ %indvars.iv.next29, %._crit_edge9.us ]
  %4 = add i64 %indvar, 1
  %5 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %scevgep2 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 999
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 999
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv28
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = bitcast double* %6 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28
  %11 = bitcast [1000 x double]* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = add nsw i64 %indvars.iv28, -1
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %13 = add nsw i64 %indvars.iv.lver.orig, -1
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %13
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv.lver.orig
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %12
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next29
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %13
  %.rhs.lver.orig = fmul double %15, 0xC09F400000000001
  %20 = fadd double %.rhs.lver.orig, 0x40AF420000000001
  %21 = fdiv double 0x409F400000000001, %20
  store double %21, double* %16, align 8
  %22 = bitcast double* %17 to <2 x double>*
  %23 = load <2 x double>, <2 x double>* %22, align 8
  %24 = fmul <2 x double> %23, <double 0x408F400000000001, double 0xC09F3C0000000001>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %27 = fadd double %25, %26
  %28 = load double, double* %18, align 8
  %29 = fmul double %28, 0xC08F400000000001
  %30 = fsub double %27, %29
  %31 = load double, double* %19, align 8
  %32 = fmul double %31, 0xC09F400000000001
  %33 = fsub double %30, %32
  %34 = fdiv double %33, %20
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv.lver.orig
  store double %34, double* %35, align 8
  %exitcond38.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br i1 %exitcond38.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep9 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 0
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 0
  %load_initial = load double, double* %scevgep8, align 8
  %load_initial10 = load double, double* %scevgep9, align 8
  br label %52

._crit_edge9.us:                                  ; preds = %.lr.ph8.us
  %exitcond39 = icmp eq i64 %indvars.iv.next29, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond39, label %.lver.check26.preheader, label %.lver.check

.lver.check26.preheader:                          ; preds = %._crit_edge9.us
  br label %.lver.check26

.lr.ph8.us:                                       ; preds = %.lr.ph8.us, %._crit_edge.us
  %indvars.iv26 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next27.1, %.lr.ph8.us ]
  %36 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %49, %.lr.ph8.us ]
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv26
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %36
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv26
  %41 = load double, double* %40, align 8
  %42 = fadd double %39, %41
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv28
  store double %42, double* %43, align 8
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, -1
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv.next27
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %42
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv.next27
  %48 = load double, double* %47, align 8
  %49 = fadd double %46, %48
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next27, i64 %indvars.iv28
  store double %49, double* %50, align 8
  %51 = icmp sgt i64 %indvars.iv.next27, 1
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, -2
  br i1 %51, label %.lr.ph8.us, label %._crit_edge9.us

; <label>:52:                                     ; preds = %52, %.ph
  %store_forwarded11 = phi double [ %load_initial10, %.ph ], [ %69, %52 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %57, %52 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %52 ]
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %12
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next29
  %.rhs = fmul double %store_forwarded, 0xC09F400000000001
  %56 = fadd double %.rhs, 0x40AF420000000001
  %57 = fdiv double 0x409F400000000001, %56
  store double %57, double* %53, align 8
  %58 = bitcast double* %54 to <2 x double>*
  %59 = load <2 x double>, <2 x double>* %58, align 8
  %60 = fmul <2 x double> %59, <double 0x408F400000000001, double 0xC09F3C0000000001>
  %61 = extractelement <2 x double> %60, i32 0
  %62 = extractelement <2 x double> %60, i32 1
  %63 = fadd double %61, %62
  %64 = load double, double* %55, align 8
  %65 = fmul double %64, 0xC08F400000000001
  %66 = fsub double %63, %65
  %67 = fmul double %store_forwarded11, 0xC09F400000000001
  %68 = fsub double %66, %67
  %69 = fdiv double %68, %56
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv
  store double %69, double* %70, align 8
  %exitcond38 = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond38, label %._crit_edge.us.loopexit35, label %52

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit35:                        ; preds = %52
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit35, %._crit_edge.us.loopexit
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv28
  store double 1.000000e+00, double* %71, align 8
  br label %.lr.ph8.us

.lver.check26:                                    ; preds = %.lver.check26.preheader, %._crit_edge19.us
  %indvar12 = phi i64 [ %indvar.next13, %._crit_edge19.us ], [ 0, %.lver.check26.preheader ]
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge19.us ], [ 1, %.lver.check26.preheader ]
  %72 = add i64 %indvar12, 1
  %73 = add i64 %indvar12, 1
  %scevgep14 = getelementptr [1000 x double], [1000 x double]* %2, i64 %73, i64 0
  %scevgep16 = getelementptr [1000 x double], [1000 x double]* %2, i64 %73, i64 999
  %scevgep18 = getelementptr [1000 x double], [1000 x double]* %3, i64 %73, i64 0
  %scevgep20 = getelementptr [1000 x double], [1000 x double]* %3, i64 %73, i64 999
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv36, i64 0
  store double 1.000000e+00, double* %74, align 8
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 0
  store double 0.000000e+00, double* %75, align 8
  %76 = bitcast double* %74 to i64*
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36
  %79 = bitcast [1000 x double]* %78 to i64*
  store i64 %77, i64* %79, align 8
  %80 = add nsw i64 %indvars.iv36, -1
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %bound022 = icmp ult double* %scevgep14, %scevgep20
  %bound123 = icmp ult double* %scevgep18, %scevgep16
  %memcheck.conflict25 = and i1 %bound022, %bound123
  br i1 %memcheck.conflict25, label %.ph27.lver.orig.preheader, label %.ph27

.ph27.lver.orig.preheader:                        ; preds = %.lver.check26
  br label %.ph27.lver.orig

.ph27.lver.orig:                                  ; preds = %.ph27.lver.orig.preheader, %.ph27.lver.orig
  %indvars.iv30.lver.orig = phi i64 [ %indvars.iv.next31.lver.orig, %.ph27.lver.orig ], [ 1, %.ph27.lver.orig.preheader ]
  %81 = add nsw i64 %indvars.iv30.lver.orig, -1
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %81
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv30.lver.orig
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %80, i64 %indvars.iv30.lver.orig
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv30.lver.orig
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next37, i64 %indvars.iv30.lver.orig
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %81
  %89 = insertelement <2 x double> undef, double %83, i32 0
  %90 = shufflevector <2 x double> %89, <2 x double> undef, <2 x i32> zeroinitializer
  %91 = fmul <2 x double> %90, <double 0xC08F400000000001, double 0xC08F400000000001>
  %92 = fadd <2 x double> %91, <double 0x409F440000000001, double 0x409F440000000001>
  %93 = extractelement <2 x double> %92, i32 0
  %94 = extractelement <2 x double> %92, i32 1
  %95 = fdiv double 0x408F400000000001, %93
  store double %95, double* %84, align 8
  %96 = load double, double* %85, align 8
  %97 = fmul double %96, 0x409F400000000001
  %98 = load double, double* %86, align 8
  %99 = fmul double %98, 0xC0AF3E0000000001
  %100 = fadd double %97, %99
  %101 = load double, double* %87, align 8
  %102 = fmul double %101, 0xC09F400000000001
  %103 = fsub double %100, %102
  %104 = load double, double* %88, align 8
  %105 = fmul double %104, 0xC08F400000000001
  %106 = fsub double %103, %105
  %107 = fdiv double %106, %94
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv30.lver.orig
  store double %107, double* %108, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv30.lver.orig, 998
  %indvars.iv.next31.lver.orig = add nuw nsw i64 %indvars.iv30.lver.orig, 1
  br i1 %exitcond.lver.orig, label %._crit_edge15.us.loopexit, label %.ph27.lver.orig

.ph27:                                            ; preds = %.lver.check26
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %3, i64 %72, i64 0
  %scevgep28 = getelementptr [1000 x double], [1000 x double]* %2, i64 %72, i64 0
  %load_initial29 = load double, double* %scevgep28, align 8
  %load_initial32 = load double, double* %scevgep31, align 8
  br label %125

._crit_edge19.us:                                 ; preds = %.lr.ph18.us
  %exitcond40 = icmp eq i64 %indvars.iv.next37, 999
  %indvar.next13 = add i64 %indvar12, 1
  br i1 %exitcond40, label %._crit_edge22, label %.lver.check26

.lr.ph18.us:                                      ; preds = %.lr.ph18.us, %._crit_edge15.us
  %indvars.iv34 = phi i64 [ 998, %._crit_edge15.us ], [ %indvars.iv.next35.1, %.lr.ph18.us ]
  %109 = phi double [ 1.000000e+00, %._crit_edge15.us ], [ %122, %.lr.ph18.us ]
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv34
  %111 = load double, double* %110, align 8
  %112 = fmul double %111, %109
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv34
  %114 = load double, double* %113, align 8
  %115 = fadd double %112, %114
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv34
  store double %115, double* %116, align 8
  %indvars.iv.next35 = add nsw i64 %indvars.iv34, -1
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv.next35
  %118 = load double, double* %117, align 8
  %119 = fmul double %118, %115
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv.next35
  %121 = load double, double* %120, align 8
  %122 = fadd double %119, %121
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv.next35
  store double %122, double* %123, align 8
  %124 = icmp sgt i64 %indvars.iv.next35, 1
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, -2
  br i1 %124, label %.lr.ph18.us, label %._crit_edge19.us

; <label>:125:                                    ; preds = %125, %.ph27
  %store_forwarded33 = phi double [ %load_initial32, %.ph27 ], [ %147, %125 ]
  %store_forwarded30 = phi double [ %load_initial29, %.ph27 ], [ %136, %125 ]
  %indvars.iv30 = phi i64 [ 1, %.ph27 ], [ %indvars.iv.next31, %125 ]
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv30
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %80, i64 %indvars.iv30
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv30
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next37, i64 %indvars.iv30
  %130 = insertelement <2 x double> undef, double %store_forwarded30, i32 0
  %131 = shufflevector <2 x double> %130, <2 x double> undef, <2 x i32> zeroinitializer
  %132 = fmul <2 x double> %131, <double 0xC08F400000000001, double 0xC08F400000000001>
  %133 = fadd <2 x double> %132, <double 0x409F440000000001, double 0x409F440000000001>
  %134 = extractelement <2 x double> %133, i32 0
  %135 = extractelement <2 x double> %133, i32 1
  %136 = fdiv double 0x408F400000000001, %134
  store double %136, double* %126, align 8
  %137 = load double, double* %127, align 8
  %138 = fmul double %137, 0x409F400000000001
  %139 = load double, double* %128, align 8
  %140 = fmul double %139, 0xC0AF3E0000000001
  %141 = fadd double %138, %140
  %142 = load double, double* %129, align 8
  %143 = fmul double %142, 0xC09F400000000001
  %144 = fsub double %141, %143
  %145 = fmul double %store_forwarded33, 0xC08F400000000001
  %146 = fsub double %144, %145
  %147 = fdiv double %146, %135
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv30
  store double %147, double* %148, align 8
  %exitcond = icmp eq i64 %indvars.iv30, 998
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  br i1 %exitcond, label %._crit_edge15.us.loopexit34, label %125

._crit_edge15.us.loopexit:                        ; preds = %.ph27.lver.orig
  br label %._crit_edge15.us

._crit_edge15.us.loopexit34:                      ; preds = %125
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit34, %._crit_edge15.us.loopexit
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv36, i64 999
  store double 1.000000e+00, double* %149, align 8
  br label %.lr.ph18.us

._crit_edge22:                                    ; preds = %._crit_edge19.us
  %150 = icmp slt i32 %.0323, 500
  %151 = add nuw nsw i32 %.0323, 1
  br i1 %150, label %.preheader4, label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge22
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]*) unnamed_addr #0 {
..preheader.us_crit_edge:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %..preheader.us_crit_edge
  %indvars.iv6 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next7, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv6, 1000
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge5, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge5

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
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
