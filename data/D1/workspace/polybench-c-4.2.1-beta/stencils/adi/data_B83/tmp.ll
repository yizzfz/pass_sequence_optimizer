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
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us, label %3

._crit_edge.us:                                   ; preds = %3
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
.preheader4.lr.ph:
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge22, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %150, %._crit_edge22 ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge9.us, %.preheader4
  %indvar = phi i64 [ 0, %.preheader4 ], [ %4, %._crit_edge9.us ]
  %indvars.iv28 = phi i64 [ 1, %.preheader4 ], [ %indvars.iv.next29, %._crit_edge9.us ]
  %4 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 0
  %scevgep2 = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 999
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 0
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 999
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv28
  store double 1.000000e+00, double* %5, align 8
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 0
  store double 0.000000e+00, double* %6, align 8
  %7 = bitcast double* %5 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28
  %10 = bitcast [1000 x double]* %9 to i64*
  store i64 %8, i64* %10, align 8
  %11 = add nsw i64 %indvars.iv28, -1
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %12 = add nsw i64 %indvars.iv.lver.orig, -1
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %12
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv.lver.orig
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %11
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next29
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %12
  %.rhs.lver.orig = fmul double %14, 0xC09F400000000001
  %19 = fadd double %.rhs.lver.orig, 0x40AF420000000001
  %20 = fdiv double 0x409F400000000001, %19
  store double %20, double* %15, align 8
  %21 = bitcast double* %16 to <2 x double>*
  %22 = load <2 x double>, <2 x double>* %21, align 8
  %23 = fmul <2 x double> %22, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  %26 = fsub double %25, %24
  %27 = load double, double* %17, align 8
  %28 = fmul double %27, 0xC08F400000000001
  %29 = fsub double %26, %28
  %30 = load double, double* %18, align 8
  %31 = fmul double %30, 0xC09F400000000001
  %32 = fsub double %29, %31
  %33 = fdiv double %32, %19
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv.lver.orig
  store double %33, double* %34, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial10 = load double, double* %scevgep4, align 8
  br label %51

._crit_edge9.us:                                  ; preds = %.lr.ph8.us
  %exitcond38 = icmp eq i64 %indvars.iv.next29, 999
  br i1 %exitcond38, label %.lver.check26.preheader, label %.lver.check

.lver.check26.preheader:                          ; preds = %._crit_edge9.us
  br label %.lver.check26

.lr.ph8.us:                                       ; preds = %.lr.ph8.us, %._crit_edge.us
  %indvars.iv26 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next27.1, %.lr.ph8.us ]
  %35 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %48, %.lr.ph8.us ]
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv26
  %37 = load double, double* %36, align 8
  %38 = fmul double %37, %35
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv26
  %40 = load double, double* %39, align 8
  %41 = fadd double %38, %40
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv28
  store double %41, double* %42, align 8
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, -1
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv.next27
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %41
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv.next27
  %47 = load double, double* %46, align 8
  %48 = fadd double %45, %47
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next27, i64 %indvars.iv28
  store double %48, double* %49, align 8
  %50 = icmp sgt i64 %indvars.iv.next27, 1
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, -2
  br i1 %50, label %.lr.ph8.us, label %._crit_edge9.us

; <label>:51:                                     ; preds = %51, %.ph
  %store_forwarded11 = phi double [ %load_initial10, %.ph ], [ %68, %51 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %56, %51 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %51 ]
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %11
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next29
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
  %66 = fmul double %store_forwarded11, 0xC09F400000000001
  %67 = fsub double %65, %66
  %68 = fdiv double %67, %55
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv
  store double %68, double* %69, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %._crit_edge.us.loopexit35, label %51

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit35:                        ; preds = %51
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit35, %._crit_edge.us.loopexit
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv28
  store double 1.000000e+00, double* %70, align 8
  br label %.lr.ph8.us

.lver.check26:                                    ; preds = %.lver.check26.preheader, %._crit_edge19.us
  %indvar12 = phi i64 [ %71, %._crit_edge19.us ], [ 0, %.lver.check26.preheader ]
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge19.us ], [ 1, %.lver.check26.preheader ]
  %71 = add i64 %indvar12, 1
  %scevgep14 = getelementptr [1000 x double], [1000 x double]* %2, i64 %71, i64 0
  %scevgep16 = getelementptr [1000 x double], [1000 x double]* %2, i64 %71, i64 999
  %scevgep18 = getelementptr [1000 x double], [1000 x double]* %3, i64 %71, i64 0
  %scevgep20 = getelementptr [1000 x double], [1000 x double]* %3, i64 %71, i64 999
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv36
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %72, i64 0, i64 0
  store double 1.000000e+00, double* %73, align 8
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 0
  store double 0.000000e+00, double* %74, align 8
  %75 = bitcast [1000 x double]* %72 to i64*
  %76 = load i64, i64* %75, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36
  %78 = bitcast [1000 x double]* %77 to i64*
  store i64 %76, i64* %78, align 8
  %79 = add nsw i64 %indvars.iv36, -1
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %bound022 = icmp ult double* %scevgep14, %scevgep20
  %bound123 = icmp ult double* %scevgep18, %scevgep16
  %memcheck.conflict25 = and i1 %bound022, %bound123
  br i1 %memcheck.conflict25, label %.ph27.lver.orig.preheader, label %.ph27

.ph27.lver.orig.preheader:                        ; preds = %.lver.check26
  br label %.ph27.lver.orig

.ph27.lver.orig:                                  ; preds = %.ph27.lver.orig.preheader, %.ph27.lver.orig
  %indvars.iv30.lver.orig = phi i64 [ %indvars.iv.next31.lver.orig, %.ph27.lver.orig ], [ 1, %.ph27.lver.orig.preheader ]
  %80 = add nsw i64 %indvars.iv30.lver.orig, -1
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %80
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv30.lver.orig
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %79, i64 %indvars.iv30.lver.orig
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv30.lver.orig
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next37, i64 %indvars.iv30.lver.orig
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %80
  %88 = insertelement <2 x double> undef, double %82, i32 0
  %89 = shufflevector <2 x double> %88, <2 x double> undef, <2 x i32> zeroinitializer
  %90 = fmul <2 x double> %89, <double 0xC08F400000000001, double 0xC08F400000000001>
  %91 = fadd <2 x double> %90, <double 0x409F440000000001, double 0x409F440000000001>
  %92 = extractelement <2 x double> %91, i32 0
  %93 = extractelement <2 x double> %91, i32 1
  %94 = fdiv double 0x408F400000000001, %92
  store double %94, double* %83, align 8
  %95 = load double, double* %84, align 8
  %96 = fmul double %95, 0xC09F400000000001
  %97 = load double, double* %85, align 8
  %98 = fmul double %97, 0xC0AF3E0000000001
  %99 = fsub double %98, %96
  %100 = load double, double* %86, align 8
  %101 = fmul double %100, 0xC09F400000000001
  %102 = fsub double %99, %101
  %103 = load double, double* %87, align 8
  %104 = fmul double %103, 0xC08F400000000001
  %105 = fsub double %102, %104
  %106 = fdiv double %105, %93
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv30.lver.orig
  store double %106, double* %107, align 8
  %exitcond33.lver.orig = icmp eq i64 %indvars.iv30.lver.orig, 998
  %indvars.iv.next31.lver.orig = add nuw nsw i64 %indvars.iv30.lver.orig, 1
  br i1 %exitcond33.lver.orig, label %._crit_edge15.us.loopexit, label %.ph27.lver.orig

.ph27:                                            ; preds = %.lver.check26
  %load_initial29 = load double, double* %scevgep14, align 8
  %load_initial32 = load double, double* %scevgep18, align 8
  br label %124

._crit_edge19.us:                                 ; preds = %.lr.ph18.us
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 999
  br i1 %exitcond39, label %._crit_edge22, label %.lver.check26

.lr.ph18.us:                                      ; preds = %.lr.ph18.us, %._crit_edge15.us
  %indvars.iv34 = phi i64 [ 998, %._crit_edge15.us ], [ %indvars.iv.next35.1, %.lr.ph18.us ]
  %108 = phi double [ 1.000000e+00, %._crit_edge15.us ], [ %121, %.lr.ph18.us ]
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv34
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, %108
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv34
  %113 = load double, double* %112, align 8
  %114 = fadd double %111, %113
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv34
  store double %114, double* %115, align 8
  %indvars.iv.next35 = add nsw i64 %indvars.iv34, -1
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv.next35
  %117 = load double, double* %116, align 8
  %118 = fmul double %117, %114
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv.next35
  %120 = load double, double* %119, align 8
  %121 = fadd double %118, %120
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv.next35
  store double %121, double* %122, align 8
  %123 = icmp sgt i64 %indvars.iv.next35, 1
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, -2
  br i1 %123, label %.lr.ph18.us, label %._crit_edge19.us

; <label>:124:                                    ; preds = %124, %.ph27
  %store_forwarded33 = phi double [ %load_initial32, %.ph27 ], [ %146, %124 ]
  %store_forwarded30 = phi double [ %load_initial29, %.ph27 ], [ %135, %124 ]
  %indvars.iv30 = phi i64 [ 1, %.ph27 ], [ %indvars.iv.next31, %124 ]
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv30
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %79, i64 %indvars.iv30
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv30
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next37, i64 %indvars.iv30
  %129 = insertelement <2 x double> undef, double %store_forwarded30, i32 0
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
  %144 = fmul double %store_forwarded33, 0xC08F400000000001
  %145 = fsub double %143, %144
  %146 = fdiv double %145, %134
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv30
  store double %146, double* %147, align 8
  %exitcond33 = icmp eq i64 %indvars.iv30, 998
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  br i1 %exitcond33, label %._crit_edge15.us.loopexit34, label %124

._crit_edge15.us.loopexit:                        ; preds = %.ph27.lver.orig
  br label %._crit_edge15.us

._crit_edge15.us.loopexit34:                      ; preds = %124
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit34, %._crit_edge15.us.loopexit
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv36, i64 999
  store double 1.000000e+00, double* %148, align 8
  br label %.lr.ph18.us

._crit_edge22:                                    ; preds = %._crit_edge19.us
  %149 = icmp slt i32 %.0323, 500
  %150 = add nuw nsw i32 %.0323, 1
  br i1 %149, label %.preheader4, label %._crit_edge24

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
