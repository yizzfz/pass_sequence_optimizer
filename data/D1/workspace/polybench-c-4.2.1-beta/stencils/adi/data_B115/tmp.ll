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
  br label %.preheader

.preheader:                                       ; preds = %16, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %16 ]
  %3 = add nuw nsw i64 %indvars.iv4, 1000
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %4 ]
  %5 = sub nuw nsw i64 %3, %indvars.iv
  %6 = trunc i64 %5 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = sub nuw nsw i64 %3, %indvars.iv.next
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %7, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.000000e+03, double 1.000000e+03>
  %15 = bitcast double* %8 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %16, label %4

; <label>:16:                                     ; preds = %4
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond6, label %17, label %.preheader

; <label>:17:                                     ; preds = %16
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
  br label %.preheader4

.preheader4:                                      ; preds = %167, %6
  %.0311 = phi i32 [ 1, %6 ], [ %168, %167 ]
  br label %.lver.check

.lver.check:                                      ; preds = %86, %.preheader4
  %indvar = phi i64 [ %7, %86 ], [ 0, %.preheader4 ]
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %86 ], [ 1, %.preheader4 ]
  %7 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %scevgep32 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 999
  %scevgep34 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep36 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 999
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv19
  store double 1.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv19, i64 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast double* %8 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i64 %indvars.iv19, -1
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %bound0 = icmp ult double* %scevgep, %scevgep36
  %bound1 = icmp ult double* %scevgep34, %scevgep32
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %15 = add nsw i64 %indvars.iv.lver.orig, -1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv19, i64 %15
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv19, i64 %indvars.iv.lver.orig
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %14
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next20
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 %15
  %22 = insertelement <2 x double> undef, double %17, i32 0
  %23 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  %24 = fmul <2 x double> %23, <double 0xC09F400000000001, double 0xC09F400000000001>
  %25 = fadd <2 x double> %24, <double 0x40AF420000000001, double 0x40AF420000000001>
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %28 = fdiv double 0x409F400000000001, %26
  store double %28, double* %18, align 8
  %29 = bitcast double* %19 to <2 x double>*
  %30 = load <2 x double>, <2 x double>* %29, align 8
  %31 = fmul <2 x double> %30, <double 0x408F400000000001, double 0xC09F3C0000000001>
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  %34 = fadd double %32, %33
  %35 = load double, double* %20, align 8
  %36 = fmul double %35, 0x408F400000000001
  %37 = fadd double %36, %34
  %38 = load double, double* %21, align 8
  %39 = fmul double %38, 0x409F400000000001
  %40 = fadd double %39, %37
  %41 = fdiv double %40, %27
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv.lver.orig
  store double %41, double* %42, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br i1 %exitcond.lver.orig, label %.loopexit65, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial40 = load double, double* %scevgep34, align 8
  br label %43

; <label>:43:                                     ; preds = %43, %.ph
  %store_forwarded41 = phi double [ %load_initial40, %.ph ], [ %65, %43 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %53, %43 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %43 ]
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv19, i64 %indvars.iv
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %14
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next20
  %47 = insertelement <2 x double> undef, double %store_forwarded, i32 0
  %48 = shufflevector <2 x double> %47, <2 x double> undef, <2 x i32> zeroinitializer
  %49 = fmul <2 x double> %48, <double 0xC09F400000000001, double 0xC09F400000000001>
  %50 = fadd <2 x double> %49, <double 0x40AF420000000001, double 0x40AF420000000001>
  %51 = extractelement <2 x double> %50, i32 0
  %52 = extractelement <2 x double> %50, i32 1
  %53 = fdiv double 0x409F400000000001, %51
  store double %53, double* %44, align 8
  %54 = bitcast double* %45 to <2 x double>*
  %55 = load <2 x double>, <2 x double>* %54, align 8
  %56 = fmul <2 x double> %55, <double 0x408F400000000001, double 0xC09F3C0000000001>
  %57 = extractelement <2 x double> %56, i32 0
  %58 = extractelement <2 x double> %56, i32 1
  %59 = fadd double %57, %58
  %60 = load double, double* %46, align 8
  %61 = fmul double %60, 0x408F400000000001
  %62 = fadd double %61, %59
  %63 = fmul double %store_forwarded41, 0x409F400000000001
  %64 = fadd double %63, %62
  %65 = fdiv double %64, %52
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv
  store double %65, double* %66, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %.loopexit66, label %43

.loopexit65:                                      ; preds = %.ph.lver.orig
  br label %67

.loopexit66:                                      ; preds = %43
  br label %67

; <label>:67:                                     ; preds = %.loopexit66, %.loopexit65
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv19
  store double 1.000000e+00, double* %68, align 8
  br label %69

; <label>:69:                                     ; preds = %69, %67
  %indvars.iv17 = phi i64 [ 998, %67 ], [ %indvars.iv.next18.1, %69 ]
  %70 = phi double [ 1.000000e+00, %67 ], [ %83, %69 ]
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv19, i64 %indvars.iv17
  %72 = load double, double* %71, align 8
  %73 = fmul double %72, %70
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv17
  %75 = load double, double* %74, align 8
  %76 = fadd double %73, %75
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv17, i64 %indvars.iv19
  store double %76, double* %77, align 8
  %indvars.iv.next18 = add nsw i64 %indvars.iv17, -1
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv19, i64 %indvars.iv.next18
  %79 = load double, double* %78, align 8
  %80 = fmul double %79, %76
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv.next18
  %82 = load double, double* %81, align 8
  %83 = fadd double %80, %82
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next18, i64 %indvars.iv19
  store double %83, double* %84, align 8
  %85 = icmp sgt i64 %indvars.iv.next18, 1
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, -2
  br i1 %85, label %69, label %86

; <label>:86:                                     ; preds = %69
  %exitcond28 = icmp eq i64 %indvars.iv.next20, 999
  br i1 %exitcond28, label %.lver.check56.preheader, label %.lver.check

.lver.check56.preheader:                          ; preds = %86
  br label %.lver.check56

.lver.check56:                                    ; preds = %.lver.check56.preheader, %166
  %indvar42 = phi i64 [ %87, %166 ], [ 0, %.lver.check56.preheader ]
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %166 ], [ 1, %.lver.check56.preheader ]
  %87 = add i64 %indvar42, 1
  %scevgep44 = getelementptr [1000 x double], [1000 x double]* %4, i64 %87, i64 0
  %scevgep46 = getelementptr [1000 x double], [1000 x double]* %4, i64 %87, i64 999
  %scevgep48 = getelementptr [1000 x double], [1000 x double]* %5, i64 %87, i64 0
  %scevgep50 = getelementptr [1000 x double], [1000 x double]* %5, i64 %87, i64 999
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv26, i64 0
  store double 1.000000e+00, double* %88, align 8
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv26, i64 0
  store double 0.000000e+00, double* %89, align 8
  %90 = bitcast double* %88 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26
  %93 = bitcast [1000 x double]* %92 to i64*
  store i64 %91, i64* %93, align 8
  %94 = add nsw i64 %indvars.iv26, -1
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %bound052 = icmp ult double* %scevgep44, %scevgep50
  %bound153 = icmp ult double* %scevgep48, %scevgep46
  %memcheck.conflict55 = and i1 %bound052, %bound153
  br i1 %memcheck.conflict55, label %.ph57.lver.orig.preheader, label %.ph57

.ph57.lver.orig.preheader:                        ; preds = %.lver.check56
  br label %.ph57.lver.orig

.ph57.lver.orig:                                  ; preds = %.ph57.lver.orig.preheader, %.ph57.lver.orig
  %indvars.iv21.lver.orig = phi i64 [ %indvars.iv.next22.lver.orig, %.ph57.lver.orig ], [ 1, %.ph57.lver.orig.preheader ]
  %95 = add nsw i64 %indvars.iv21.lver.orig, -1
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv26, i64 %95
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv26, i64 %indvars.iv21.lver.orig
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %94, i64 %indvars.iv21.lver.orig
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv21.lver.orig
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next27, i64 %indvars.iv21.lver.orig
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %95
  %103 = insertelement <2 x double> undef, double %97, i32 0
  %104 = shufflevector <2 x double> %103, <2 x double> undef, <2 x i32> zeroinitializer
  %105 = fmul <2 x double> %104, <double 0xC08F400000000001, double 0xC08F400000000001>
  %106 = fadd <2 x double> %105, <double 0x409F440000000001, double 0x409F440000000001>
  %107 = extractelement <2 x double> %106, i32 0
  %108 = extractelement <2 x double> %106, i32 1
  %109 = fdiv double 0x408F400000000001, %107
  store double %109, double* %98, align 8
  %110 = load double, double* %99, align 8
  %111 = fmul double %110, 0x409F400000000001
  %112 = load double, double* %100, align 8
  %113 = fmul double %112, 0x40AF3E0000000001
  %114 = fsub double %111, %113
  %115 = load double, double* %101, align 8
  %116 = fmul double %115, 0x409F400000000001
  %117 = fadd double %114, %116
  %118 = load double, double* %102, align 8
  %119 = fmul double %118, 0x408F400000000001
  %120 = fadd double %117, %119
  %121 = fdiv double %120, %108
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv21.lver.orig
  store double %121, double* %122, align 8
  %exitcond23.lver.orig = icmp eq i64 %indvars.iv21.lver.orig, 998
  %indvars.iv.next22.lver.orig = add nuw nsw i64 %indvars.iv21.lver.orig, 1
  br i1 %exitcond23.lver.orig, label %.loopexit, label %.ph57.lver.orig

.ph57:                                            ; preds = %.lver.check56
  %load_initial59 = load double, double* %scevgep44, align 8
  %load_initial62 = load double, double* %scevgep48, align 8
  br label %123

; <label>:123:                                    ; preds = %123, %.ph57
  %store_forwarded63 = phi double [ %load_initial62, %.ph57 ], [ %145, %123 ]
  %store_forwarded60 = phi double [ %load_initial59, %.ph57 ], [ %134, %123 ]
  %indvars.iv21 = phi i64 [ 1, %.ph57 ], [ %indvars.iv.next22, %123 ]
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv26, i64 %indvars.iv21
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %94, i64 %indvars.iv21
  %126 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv21
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next27, i64 %indvars.iv21
  %128 = insertelement <2 x double> undef, double %store_forwarded60, i32 0
  %129 = shufflevector <2 x double> %128, <2 x double> undef, <2 x i32> zeroinitializer
  %130 = fmul <2 x double> %129, <double 0xC08F400000000001, double 0xC08F400000000001>
  %131 = fadd <2 x double> %130, <double 0x409F440000000001, double 0x409F440000000001>
  %132 = extractelement <2 x double> %131, i32 0
  %133 = extractelement <2 x double> %131, i32 1
  %134 = fdiv double 0x408F400000000001, %132
  store double %134, double* %124, align 8
  %135 = load double, double* %125, align 8
  %136 = fmul double %135, 0x409F400000000001
  %137 = load double, double* %126, align 8
  %138 = fmul double %137, 0x40AF3E0000000001
  %139 = fsub double %136, %138
  %140 = load double, double* %127, align 8
  %141 = fmul double %140, 0x409F400000000001
  %142 = fadd double %139, %141
  %143 = fmul double %store_forwarded63, 0x408F400000000001
  %144 = fadd double %142, %143
  %145 = fdiv double %144, %133
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv21
  store double %145, double* %146, align 8
  %exitcond23 = icmp eq i64 %indvars.iv21, 998
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  br i1 %exitcond23, label %.loopexit64, label %123

.loopexit:                                        ; preds = %.ph57.lver.orig
  br label %147

.loopexit64:                                      ; preds = %123
  br label %147

; <label>:147:                                    ; preds = %.loopexit64, %.loopexit
  %148 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv26, i64 999
  store double 1.000000e+00, double* %148, align 8
  br label %149

; <label>:149:                                    ; preds = %149, %147
  %indvars.iv24 = phi i64 [ 998, %147 ], [ %indvars.iv.next25.1, %149 ]
  %150 = phi double [ 1.000000e+00, %147 ], [ %163, %149 ]
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv26, i64 %indvars.iv24
  %152 = load double, double* %151, align 8
  %153 = fmul double %152, %150
  %154 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv24
  %155 = load double, double* %154, align 8
  %156 = fadd double %153, %155
  %157 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv24
  store double %156, double* %157, align 8
  %indvars.iv.next25 = add nsw i64 %indvars.iv24, -1
  %158 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv26, i64 %indvars.iv.next25
  %159 = load double, double* %158, align 8
  %160 = fmul double %159, %156
  %161 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv.next25
  %162 = load double, double* %161, align 8
  %163 = fadd double %160, %162
  %164 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv.next25
  store double %163, double* %164, align 8
  %165 = icmp sgt i64 %indvars.iv.next25, 1
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, -2
  br i1 %165, label %149, label %166

; <label>:166:                                    ; preds = %149
  %exitcond29 = icmp eq i64 %indvars.iv.next27, 999
  br i1 %exitcond29, label %167, label %.lver.check56

; <label>:167:                                    ; preds = %166
  %168 = add nuw nsw i32 %.0311, 1
  %exitcond30 = icmp eq i32 %168, 501
  br i1 %exitcond30, label %169, label %.preheader4

; <label>:169:                                    ; preds = %167
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
  br label %.preheader

.preheader:                                       ; preds = %18, %2
  %indvars.iv5 = phi i64 [ 0, %2 ], [ %indvars.iv.next6, %18 ]
  %7 = mul nuw nsw i64 %indvars.iv5, 1000
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge4
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge4, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %18, label %._crit_edge4

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #4
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
