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
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %16

; <label>:16:                                     ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]*) unnamed_addr #0 {
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %15, %2
  %indvars.iv25 = phi i64 [ 0, %2 ], [ %indvars.iv.next3, %15 ]
  %3 = add nuw nsw i64 %indvars.iv25, 1000
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next.1, %.preheader ]
  %4 = sub nuw nsw i64 %3, %indvars.iv4
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv4
  %indvars.iv.next = or i64 %indvars.iv4, 1
  %8 = sub nuw nsw i64 %3, %indvars.iv.next
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv4, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %15, label %.preheader

; <label>:15:                                     ; preds = %.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond6, label %16, label %.preheader.preheader

; <label>:16:                                     ; preds = %15
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
  br label %.preheader4.preheader..lr.ph_crit_edge

.preheader4.preheader..lr.ph_crit_edge:           ; preds = %.preheader._crit_edge, %6
  %.0324 = phi i32 [ 1, %6 ], [ %171, %.preheader._crit_edge ]
  br label %.lver.check

.lver.check:                                      ; preds = %.preheader4, %.preheader4.preheader..lr.ph_crit_edge
  %indvar = phi i64 [ %indvar.next, %.preheader4 ], [ 0, %.preheader4.preheader..lr.ph_crit_edge ]
  %indvars.iv719 = phi i64 [ %16, %.preheader4 ], [ 1, %.preheader4.preheader..lr.ph_crit_edge ]
  %7 = add i64 %indvar, 1
  %8 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %8, i64 0
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %4, i64 %8, i64 999
  %scevgep33 = getelementptr [1000 x double], [1000 x double]* %5, i64 %8, i64 0
  %scevgep35 = getelementptr [1000 x double], [1000 x double]* %5, i64 %8, i64 999
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv719
  store double 1.000000e+00, double* %9, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv719, i64 0
  store double 0.000000e+00, double* %10, align 8
  %11 = bitcast double* %9 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv719
  %14 = bitcast [1000 x double]* %13 to i64*
  store i64 %12, i64* %14, align 8
  %15 = add nsw i64 %indvars.iv719, -1
  %16 = add nuw nsw i64 %indvars.iv719, 1
  %bound0 = icmp ult double* %scevgep, %scevgep35
  %bound1 = icmp ult double* %scevgep33, %scevgep31
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv17.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %17 = add nsw i64 %indvars.iv17.lver.orig, -1
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv719, i64 %17
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv719, i64 %indvars.iv17.lver.orig
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv17.lver.orig, i64 %15
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv17.lver.orig, i64 %16
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv719, i64 %17
  %24 = insertelement <2 x double> undef, double %19, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = fmul <2 x double> %25, <double 0xC09F400000000001, double 0xC09F400000000001>
  %27 = fadd <2 x double> %26, <double 0x40AF420000000001, double 0x40AF420000000001>
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %30 = fdiv double 0x409F400000000001, %28
  store double %30, double* %20, align 8
  %31 = bitcast double* %21 to <2 x double>*
  %32 = load <2 x double>, <2 x double>* %31, align 8
  %33 = fmul <2 x double> %32, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %34 = extractelement <2 x double> %33, i32 0
  %35 = extractelement <2 x double> %33, i32 1
  %36 = fsub double %35, %34
  %37 = load double, double* %22, align 8
  %38 = fmul double %37, 0xC08F400000000001
  %39 = fsub double %36, %38
  %40 = load double, double* %23, align 8
  %41 = fmul double %40, 0xC09F400000000001
  %42 = fsub double %39, %41
  %43 = fdiv double %42, %29
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv719, i64 %indvars.iv17.lver.orig
  store double %43, double* %44, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv17.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %.loopexit64, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep38 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep37 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %load_initial = load double, double* %scevgep37, align 8
  %load_initial39 = load double, double* %scevgep38, align 8
  br label %45

; <label>:45:                                     ; preds = %45, %.ph
  %store_forwarded40 = phi double [ %load_initial39, %.ph ], [ %67, %45 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %55, %45 ]
  %indvars.iv17 = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %45 ]
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv719, i64 %indvars.iv17
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv17, i64 %15
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv17, i64 %16
  %49 = insertelement <2 x double> undef, double %store_forwarded, i32 0
  %50 = shufflevector <2 x double> %49, <2 x double> undef, <2 x i32> zeroinitializer
  %51 = fmul <2 x double> %50, <double 0xC09F400000000001, double 0xC09F400000000001>
  %52 = fadd <2 x double> %51, <double 0x40AF420000000001, double 0x40AF420000000001>
  %53 = extractelement <2 x double> %52, i32 0
  %54 = extractelement <2 x double> %52, i32 1
  %55 = fdiv double 0x409F400000000001, %53
  store double %55, double* %46, align 8
  %56 = bitcast double* %47 to <2 x double>*
  %57 = load <2 x double>, <2 x double>* %56, align 8
  %58 = fmul <2 x double> %57, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %59 = extractelement <2 x double> %58, i32 0
  %60 = extractelement <2 x double> %58, i32 1
  %61 = fsub double %60, %59
  %62 = load double, double* %48, align 8
  %63 = fmul double %62, 0xC08F400000000001
  %64 = fsub double %61, %63
  %65 = fmul double %store_forwarded40, 0xC09F400000000001
  %66 = fsub double %64, %65
  %67 = fdiv double %66, %54
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv719, i64 %indvars.iv17
  store double %67, double* %68, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv17, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %.loopexit65, label %45

.loopexit64:                                      ; preds = %.ph.lver.orig
  br label %69

.loopexit65:                                      ; preds = %45
  br label %69

; <label>:69:                                     ; preds = %.loopexit65, %.loopexit64
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv719
  store double 1.000000e+00, double* %70, align 8
  br label %71

; <label>:71:                                     ; preds = %71, %69
  %72 = phi double [ 1.000000e+00, %69 ], [ %85, %71 ]
  %indvars.iv518 = phi i64 [ 998, %69 ], [ %indvars.iv.next6.1, %71 ]
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv719, i64 %indvars.iv518
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, %72
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv719, i64 %indvars.iv518
  %77 = load double, double* %76, align 8
  %78 = fadd double %75, %77
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv518, i64 %indvars.iv719
  store double %78, double* %79, align 8
  %indvars.iv.next6 = add nsw i64 %indvars.iv518, -1
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv719, i64 %indvars.iv.next6
  %81 = load double, double* %80, align 8
  %82 = fmul double %81, %78
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv719, i64 %indvars.iv.next6
  %84 = load double, double* %83, align 8
  %85 = fadd double %82, %84
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next6, i64 %indvars.iv719
  store double %85, double* %86, align 8
  %87 = icmp sgt i64 %indvars.iv.next6, 1
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv518, -2
  br i1 %87, label %71, label %.preheader4

.preheader4:                                      ; preds = %71
  %exitcond28 = icmp eq i64 %16, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond28, label %.lver.check55.preheader, label %.lver.check

.lver.check55.preheader:                          ; preds = %.preheader4
  br label %.lver.check55

.lver.check55:                                    ; preds = %.lver.check55.preheader, %.preheader
  %indvar41 = phi i64 [ %indvar.next42, %.preheader ], [ 0, %.lver.check55.preheader ]
  %indvars.iv1522 = phi i64 [ %98, %.preheader ], [ 1, %.lver.check55.preheader ]
  %88 = add i64 %indvar41, 1
  %89 = add i64 %indvar41, 1
  %scevgep43 = getelementptr [1000 x double], [1000 x double]* %4, i64 %89, i64 0
  %scevgep45 = getelementptr [1000 x double], [1000 x double]* %4, i64 %89, i64 999
  %scevgep47 = getelementptr [1000 x double], [1000 x double]* %5, i64 %89, i64 0
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %5, i64 %89, i64 999
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1522
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %90, i64 0, i64 0
  store double 1.000000e+00, double* %91, align 8
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1522, i64 0
  store double 0.000000e+00, double* %92, align 8
  %93 = bitcast [1000 x double]* %90 to i64*
  %94 = load i64, i64* %93, align 8
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1522
  %96 = bitcast [1000 x double]* %95 to i64*
  store i64 %94, i64* %96, align 8
  %97 = add nsw i64 %indvars.iv1522, -1
  %98 = add nuw nsw i64 %indvars.iv1522, 1
  %bound051 = icmp ult double* %scevgep43, %scevgep49
  %bound152 = icmp ult double* %scevgep47, %scevgep45
  %memcheck.conflict54 = and i1 %bound051, %bound152
  br i1 %memcheck.conflict54, label %.ph56.lver.orig.preheader, label %.ph56

.ph56.lver.orig.preheader:                        ; preds = %.lver.check55
  br label %.ph56.lver.orig

.ph56.lver.orig:                                  ; preds = %.ph56.lver.orig.preheader, %.ph56.lver.orig
  %indvars.iv920.lver.orig = phi i64 [ %indvars.iv.next10.lver.orig, %.ph56.lver.orig ], [ 1, %.ph56.lver.orig.preheader ]
  %99 = add nsw i64 %indvars.iv920.lver.orig, -1
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1522, i64 %99
  %101 = load double, double* %100, align 8
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1522, i64 %indvars.iv920.lver.orig
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %97, i64 %indvars.iv920.lver.orig
  %104 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1522, i64 %indvars.iv920.lver.orig
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %98, i64 %indvars.iv920.lver.orig
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1522, i64 %99
  %107 = insertelement <2 x double> undef, double %101, i32 0
  %108 = shufflevector <2 x double> %107, <2 x double> undef, <2 x i32> zeroinitializer
  %109 = fmul <2 x double> %108, <double 0xC08F400000000001, double 0xC08F400000000001>
  %110 = fadd <2 x double> %109, <double 0x409F440000000001, double 0x409F440000000001>
  %111 = extractelement <2 x double> %110, i32 0
  %112 = extractelement <2 x double> %110, i32 1
  %113 = fdiv double 0x408F400000000001, %111
  store double %113, double* %102, align 8
  %114 = load double, double* %103, align 8
  %115 = fmul double %114, 0xC09F400000000001
  %116 = load double, double* %104, align 8
  %117 = fmul double %116, 0xC0AF3E0000000001
  %118 = fsub double %117, %115
  %119 = load double, double* %105, align 8
  %120 = fmul double %119, 0xC09F400000000001
  %121 = fsub double %118, %120
  %122 = load double, double* %106, align 8
  %123 = fmul double %122, 0xC08F400000000001
  %124 = fsub double %121, %123
  %125 = fdiv double %124, %112
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1522, i64 %indvars.iv920.lver.orig
  store double %125, double* %126, align 8
  %indvars.iv.next10.lver.orig = add nuw nsw i64 %indvars.iv920.lver.orig, 1
  %exitcond12.lver.orig = icmp eq i64 %indvars.iv.next10.lver.orig, 999
  br i1 %exitcond12.lver.orig, label %.loopexit, label %.ph56.lver.orig

.ph56:                                            ; preds = %.lver.check55
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %5, i64 %88, i64 0
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %4, i64 %88, i64 0
  %load_initial58 = load double, double* %scevgep57, align 8
  %load_initial61 = load double, double* %scevgep60, align 8
  br label %127

; <label>:127:                                    ; preds = %127, %.ph56
  %store_forwarded62 = phi double [ %load_initial61, %.ph56 ], [ %149, %127 ]
  %store_forwarded59 = phi double [ %load_initial58, %.ph56 ], [ %138, %127 ]
  %indvars.iv920 = phi i64 [ 1, %.ph56 ], [ %indvars.iv.next10, %127 ]
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1522, i64 %indvars.iv920
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %97, i64 %indvars.iv920
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv1522, i64 %indvars.iv920
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %98, i64 %indvars.iv920
  %132 = insertelement <2 x double> undef, double %store_forwarded59, i32 0
  %133 = shufflevector <2 x double> %132, <2 x double> undef, <2 x i32> zeroinitializer
  %134 = fmul <2 x double> %133, <double 0xC08F400000000001, double 0xC08F400000000001>
  %135 = fadd <2 x double> %134, <double 0x409F440000000001, double 0x409F440000000001>
  %136 = extractelement <2 x double> %135, i32 0
  %137 = extractelement <2 x double> %135, i32 1
  %138 = fdiv double 0x408F400000000001, %136
  store double %138, double* %128, align 8
  %139 = load double, double* %129, align 8
  %140 = fmul double %139, 0xC09F400000000001
  %141 = load double, double* %130, align 8
  %142 = fmul double %141, 0xC0AF3E0000000001
  %143 = fsub double %142, %140
  %144 = load double, double* %131, align 8
  %145 = fmul double %144, 0xC09F400000000001
  %146 = fsub double %143, %145
  %147 = fmul double %store_forwarded62, 0xC08F400000000001
  %148 = fsub double %146, %147
  %149 = fdiv double %148, %137
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1522, i64 %indvars.iv920
  store double %149, double* %150, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv920, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 999
  br i1 %exitcond12, label %.loopexit63, label %127

.loopexit:                                        ; preds = %.ph56.lver.orig
  br label %151

.loopexit63:                                      ; preds = %127
  br label %151

; <label>:151:                                    ; preds = %.loopexit63, %.loopexit
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1522, i64 999
  store double 1.000000e+00, double* %152, align 8
  br label %153

; <label>:153:                                    ; preds = %153, %151
  %154 = phi double [ 1.000000e+00, %151 ], [ %167, %153 ]
  %indvars.iv1321 = phi i64 [ 998, %151 ], [ %indvars.iv.next14.1, %153 ]
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1522, i64 %indvars.iv1321
  %156 = load double, double* %155, align 8
  %157 = fmul double %156, %154
  %158 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1522, i64 %indvars.iv1321
  %159 = load double, double* %158, align 8
  %160 = fadd double %157, %159
  %161 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1522, i64 %indvars.iv1321
  store double %160, double* %161, align 8
  %indvars.iv.next14 = add nsw i64 %indvars.iv1321, -1
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1522, i64 %indvars.iv.next14
  %163 = load double, double* %162, align 8
  %164 = fmul double %163, %160
  %165 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1522, i64 %indvars.iv.next14
  %166 = load double, double* %165, align 8
  %167 = fadd double %164, %166
  %168 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1522, i64 %indvars.iv.next14
  store double %167, double* %168, align 8
  %169 = icmp sgt i64 %indvars.iv.next14, 1
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv1321, -2
  br i1 %169, label %153, label %.preheader

.preheader:                                       ; preds = %153
  %exitcond29 = icmp eq i64 %98, 999
  %indvar.next42 = add i64 %indvar41, 1
  br i1 %exitcond29, label %.preheader._crit_edge, label %.lver.check55

.preheader._crit_edge:                            ; preds = %.preheader
  %170 = icmp sgt i32 %.0324, 499
  %171 = add nuw nsw i32 %.0324, 1
  br i1 %170, label %172, label %.preheader4.preheader..lr.ph_crit_edge

; <label>:172:                                    ; preds = %.preheader._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %19, %2
  %indvars.iv25 = phi i64 [ 0, %2 ], [ %indvars.iv.next3, %19 ]
  %7 = mul nuw nsw i64 %indvars.iv25, 1000
  br label %8

; <label>:8:                                      ; preds = %.preheader, %.preheader.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %9 = add nuw nsw i64 %indvars.iv4, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %.preheader

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #4
  br label %.preheader

.preheader:                                       ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv4
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %19, label %8

; <label>:19:                                     ; preds = %.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond6, label %20, label %.preheader.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #4
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
