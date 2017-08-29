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
  %16 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %16)
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
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next6, %._crit_edge.us ]
  %2 = add nuw nsw i64 %indvars.iv5, 1000
  %3 = trunc i64 %2 to i32
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %4 ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = sub nuw nsw i32 %3, %5
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = trunc i64 %indvars.iv.next to i32
  %10 = sub nuw nsw i32 %3, %9
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %7, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.000000e+03, double 1.000000e+03>
  %15 = bitcast double* %8 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us, label %4

._crit_edge.us:                                   ; preds = %4
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
.preheader4.lr.ph:
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge22, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %153, %._crit_edge22 ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge9.us, %.preheader4
  %indvar = phi i64 [ 0, %.preheader4 ], [ %indvar.next, %._crit_edge9.us ]
  %indvars.iv28 = phi i64 [ 1, %.preheader4 ], [ %indvars.iv.next29, %._crit_edge9.us ]
  %6 = add nuw nsw i64 %indvar, 1
  %7 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %scevgep41 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 999
  %scevgep43 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep45 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 999
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv28
  store double 1.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast double* %8 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i64 %indvars.iv28, -1
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %bound0 = icmp ult double* %scevgep, %scevgep45
  %bound1 = icmp ult double* %scevgep43, %scevgep41
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %15 = add nsw i64 %indvars.iv.lver.orig, -1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 %15
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv.lver.orig
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %14
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next29
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %15
  %.rhs.lver.orig = fmul double %17, 0xC09F400000000001
  %22 = fadd double %.rhs.lver.orig, 0x40AF420000000001
  %23 = fdiv double 0x409F400000000001, %22
  store double %23, double* %18, align 8
  %24 = bitcast double* %19 to <2 x double>*
  %25 = load <2 x double>, <2 x double>* %24, align 8
  %26 = fmul <2 x double> %25, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  %29 = fsub double %28, %27
  %30 = load double, double* %20, align 8
  %31 = fmul double %30, 0xC08F400000000001
  %32 = fsub double %29, %31
  %33 = load double, double* %21, align 8
  %34 = fmul double %33, 0xC09F400000000001
  %35 = fsub double %32, %34
  %36 = fdiv double %35, %22
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv.lver.orig
  store double %36, double* %37, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep48 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 0
  %scevgep47 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 0
  %load_initial = load double, double* %scevgep47, align 8
  %load_initial49 = load double, double* %scevgep48, align 8
  br label %54

._crit_edge9.us:                                  ; preds = %.lr.ph8.us
  %exitcond38 = icmp eq i64 %indvars.iv.next29, 999
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond38, label %.lver.check65.preheader, label %.lver.check

.lver.check65.preheader:                          ; preds = %._crit_edge9.us
  br label %.lver.check65

.lr.ph8.us:                                       ; preds = %.lr.ph8.us, %._crit_edge.us
  %indvars.iv26 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next27.1, %.lr.ph8.us ]
  %38 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %51, %.lr.ph8.us ]
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv26
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %38
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv26
  %43 = load double, double* %42, align 8
  %44 = fadd double %41, %43
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv28
  store double %44, double* %45, align 8
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, -1
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv.next27
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %44
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv.next27
  %50 = load double, double* %49, align 8
  %51 = fadd double %48, %50
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next27, i64 %indvars.iv28
  store double %51, double* %52, align 8
  %53 = icmp sgt i64 %indvars.iv.next27, 1
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, -2
  br i1 %53, label %.lr.ph8.us, label %._crit_edge9.us

; <label>:54:                                     ; preds = %54, %.ph
  %store_forwarded50 = phi double [ %load_initial49, %.ph ], [ %71, %54 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %59, %54 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %54 ]
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %14
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next29
  %.rhs = fmul double %store_forwarded, 0xC09F400000000001
  %58 = fadd double %.rhs, 0x40AF420000000001
  %59 = fdiv double 0x409F400000000001, %58
  store double %59, double* %55, align 8
  %60 = bitcast double* %56 to <2 x double>*
  %61 = load <2 x double>, <2 x double>* %60, align 8
  %62 = fmul <2 x double> %61, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %63 = extractelement <2 x double> %62, i32 0
  %64 = extractelement <2 x double> %62, i32 1
  %65 = fsub double %64, %63
  %66 = load double, double* %57, align 8
  %67 = fmul double %66, 0xC08F400000000001
  %68 = fsub double %65, %67
  %69 = fmul double %store_forwarded50, 0xC09F400000000001
  %70 = fsub double %68, %69
  %71 = fdiv double %70, %58
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv
  store double %71, double* %72, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %._crit_edge.us.loopexit74, label %54

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit74:                        ; preds = %54
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit74, %._crit_edge.us.loopexit
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv28
  store double 1.000000e+00, double* %73, align 8
  br label %.lr.ph8.us

.lver.check65:                                    ; preds = %.lver.check65.preheader, %._crit_edge19.us
  %indvar51 = phi i64 [ %indvar.next52, %._crit_edge19.us ], [ 0, %.lver.check65.preheader ]
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge19.us ], [ 1, %.lver.check65.preheader ]
  %74 = add nuw nsw i64 %indvar51, 1
  %75 = add nuw nsw i64 %indvar51, 1
  %scevgep53 = getelementptr [1000 x double], [1000 x double]* %4, i64 %75, i64 0
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %4, i64 %75, i64 999
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %5, i64 %75, i64 0
  %scevgep59 = getelementptr [1000 x double], [1000 x double]* %5, i64 %75, i64 999
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %76, i64 0, i64 0
  store double 1.000000e+00, double* %77, align 8
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv36, i64 0
  store double 0.000000e+00, double* %78, align 8
  %79 = bitcast [1000 x double]* %76 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36
  %82 = bitcast [1000 x double]* %81 to i64*
  store i64 %80, i64* %82, align 8
  %83 = add nsw i64 %indvars.iv36, -1
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %bound061 = icmp ult double* %scevgep53, %scevgep59
  %bound162 = icmp ult double* %scevgep57, %scevgep55
  %memcheck.conflict64 = and i1 %bound061, %bound162
  br i1 %memcheck.conflict64, label %.ph66.lver.orig.preheader, label %.ph66

.ph66.lver.orig.preheader:                        ; preds = %.lver.check65
  br label %.ph66.lver.orig

.ph66.lver.orig:                                  ; preds = %.ph66.lver.orig.preheader, %.ph66.lver.orig
  %indvars.iv30.lver.orig = phi i64 [ %indvars.iv.next31.lver.orig, %.ph66.lver.orig ], [ 1, %.ph66.lver.orig.preheader ]
  %84 = add nsw i64 %indvars.iv30.lver.orig, -1
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv36, i64 %84
  %86 = load double, double* %85, align 8
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv30.lver.orig
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %83, i64 %indvars.iv30.lver.orig
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv30.lver.orig
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next37, i64 %indvars.iv30.lver.orig
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %84
  %92 = insertelement <2 x double> undef, double %86, i32 0
  %93 = shufflevector <2 x double> %92, <2 x double> undef, <2 x i32> zeroinitializer
  %94 = fmul <2 x double> %93, <double 0xC08F400000000001, double 0xC08F400000000001>
  %95 = fadd <2 x double> %94, <double 0x409F440000000001, double 0x409F440000000001>
  %96 = extractelement <2 x double> %95, i32 0
  %97 = extractelement <2 x double> %95, i32 1
  %98 = fdiv double 0x408F400000000001, %96
  store double %98, double* %87, align 8
  %99 = load double, double* %88, align 8
  %100 = fmul double %99, 0xC09F400000000001
  %101 = load double, double* %89, align 8
  %102 = fmul double %101, 0xC0AF3E0000000001
  %103 = fsub double %102, %100
  %104 = load double, double* %90, align 8
  %105 = fmul double %104, 0xC09F400000000001
  %106 = fsub double %103, %105
  %107 = load double, double* %91, align 8
  %108 = fmul double %107, 0xC08F400000000001
  %109 = fsub double %106, %108
  %110 = fdiv double %109, %97
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv30.lver.orig
  store double %110, double* %111, align 8
  %exitcond33.lver.orig = icmp eq i64 %indvars.iv30.lver.orig, 998
  %indvars.iv.next31.lver.orig = add nuw nsw i64 %indvars.iv30.lver.orig, 1
  br i1 %exitcond33.lver.orig, label %._crit_edge15.us.loopexit, label %.ph66.lver.orig

.ph66:                                            ; preds = %.lver.check65
  %scevgep70 = getelementptr [1000 x double], [1000 x double]* %5, i64 %74, i64 0
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %4, i64 %74, i64 0
  %load_initial68 = load double, double* %scevgep67, align 8
  %load_initial71 = load double, double* %scevgep70, align 8
  br label %128

._crit_edge19.us:                                 ; preds = %.lr.ph18.us
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 999
  %indvar.next52 = add nuw nsw i64 %indvar51, 1
  br i1 %exitcond39, label %._crit_edge22, label %.lver.check65

.lr.ph18.us:                                      ; preds = %.lr.ph18.us, %._crit_edge15.us
  %indvars.iv34 = phi i64 [ 998, %._crit_edge15.us ], [ %indvars.iv.next35.1, %.lr.ph18.us ]
  %112 = phi double [ 1.000000e+00, %._crit_edge15.us ], [ %125, %.lr.ph18.us ]
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv34
  %114 = load double, double* %113, align 8
  %115 = fmul double %114, %112
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv34
  %117 = load double, double* %116, align 8
  %118 = fadd double %115, %117
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv34
  store double %118, double* %119, align 8
  %indvars.iv.next35 = add nsw i64 %indvars.iv34, -1
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv.next35
  %121 = load double, double* %120, align 8
  %122 = fmul double %121, %118
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv.next35
  %124 = load double, double* %123, align 8
  %125 = fadd double %122, %124
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv.next35
  store double %125, double* %126, align 8
  %127 = icmp sgt i64 %indvars.iv.next35, 1
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, -2
  br i1 %127, label %.lr.ph18.us, label %._crit_edge19.us

; <label>:128:                                    ; preds = %128, %.ph66
  %store_forwarded72 = phi double [ %load_initial71, %.ph66 ], [ %150, %128 ]
  %store_forwarded69 = phi double [ %load_initial68, %.ph66 ], [ %139, %128 ]
  %indvars.iv30 = phi i64 [ 1, %.ph66 ], [ %indvars.iv.next31, %128 ]
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv30
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %83, i64 %indvars.iv30
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv30
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next37, i64 %indvars.iv30
  %133 = insertelement <2 x double> undef, double %store_forwarded69, i32 0
  %134 = shufflevector <2 x double> %133, <2 x double> undef, <2 x i32> zeroinitializer
  %135 = fmul <2 x double> %134, <double 0xC08F400000000001, double 0xC08F400000000001>
  %136 = fadd <2 x double> %135, <double 0x409F440000000001, double 0x409F440000000001>
  %137 = extractelement <2 x double> %136, i32 0
  %138 = extractelement <2 x double> %136, i32 1
  %139 = fdiv double 0x408F400000000001, %137
  store double %139, double* %129, align 8
  %140 = load double, double* %130, align 8
  %141 = fmul double %140, 0xC09F400000000001
  %142 = load double, double* %131, align 8
  %143 = fmul double %142, 0xC0AF3E0000000001
  %144 = fsub double %143, %141
  %145 = load double, double* %132, align 8
  %146 = fmul double %145, 0xC09F400000000001
  %147 = fsub double %144, %146
  %148 = fmul double %store_forwarded72, 0xC08F400000000001
  %149 = fsub double %147, %148
  %150 = fdiv double %149, %138
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv30
  store double %150, double* %151, align 8
  %exitcond33 = icmp eq i64 %indvars.iv30, 998
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  br i1 %exitcond33, label %._crit_edge15.us.loopexit73, label %128

._crit_edge15.us.loopexit:                        ; preds = %.ph66.lver.orig
  br label %._crit_edge15.us

._crit_edge15.us.loopexit73:                      ; preds = %128
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit73, %._crit_edge15.us.loopexit
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 999
  store double 1.000000e+00, double* %152, align 8
  br label %.lr.ph18.us

._crit_edge22:                                    ; preds = %._crit_edge19.us
  %153 = add nuw nsw i32 %.0323, 1
  %exitcond75 = icmp ne i32 %153, 501
  br i1 %exitcond75, label %.preheader4, label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge22
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %..preheader.us_crit_edge
  %indvars.iv6 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next7, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv6, 1000
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge5, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge5

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
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
