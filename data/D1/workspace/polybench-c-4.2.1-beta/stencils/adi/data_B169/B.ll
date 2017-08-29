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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
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
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader

.preheader:                                       ; preds = %15, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %15 ]
  %2 = add nuw nsw i64 %indvars.iv1, 1000
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %3 ]
  %4 = sub nuw nsw i64 %2, %indvars.iv
  %5 = trunc i64 %4 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = sub nuw nsw i64 %2, %indvars.iv.next
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %15, label %3

; <label>:15:                                     ; preds = %3
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %16, label %.preheader

; <label>:16:                                     ; preds = %15
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader4

.preheader4:                                      ; preds = %165, %4
  %.0311 = phi i32 [ 1, %4 ], [ %166, %165 ]
  br label %.lver.check

.lver.check:                                      ; preds = %84, %.preheader4
  %indvar = phi i64 [ %5, %84 ], [ 0, %.preheader4 ]
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %84 ], [ 1, %.preheader4 ]
  %5 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 0
  %scevgep15 = getelementptr [1000 x double], [1000 x double]* %2, i64 %5, i64 999
  %scevgep17 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 0
  %scevgep19 = getelementptr [1000 x double], [1000 x double]* %3, i64 %5, i64 999
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv3
  store double 1.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 0
  store double 0.000000e+00, double* %7, align 8
  %8 = bitcast double* %6 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3
  %11 = bitcast [1000 x double]* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = add nsw i64 %indvars.iv3, -1
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %bound0 = icmp ult double* %scevgep, %scevgep19
  %bound1 = icmp ult double* %scevgep17, %scevgep15
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %13 = add nsw i64 %indvars.iv.lver.orig, -1
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %13
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv.lver.orig
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %12
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next4
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %13
  %20 = insertelement <2 x double> undef, double %15, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  %22 = fmul <2 x double> %21, <double 0xC09F400000000001, double 0xC09F400000000001>
  %23 = fadd <2 x double> %22, <double 0x40AF420000000001, double 0x40AF420000000001>
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  %26 = fdiv double 0x409F400000000001, %24
  store double %26, double* %16, align 8
  %27 = bitcast double* %17 to <2 x double>*
  %28 = load <2 x double>, <2 x double>* %27, align 8
  %29 = fmul <2 x double> %28, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %32 = fsub double %31, %30
  %33 = load double, double* %18, align 8
  %34 = fmul double %33, 0xC08F400000000001
  %35 = fsub double %32, %34
  %36 = load double, double* %19, align 8
  %37 = fmul double %36, 0xC09F400000000001
  %38 = fsub double %35, %37
  %39 = fdiv double %38, %25
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv.lver.orig
  store double %39, double* %40, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br i1 %exitcond.lver.orig, label %.loopexit48, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial23 = load double, double* %scevgep17, align 8
  br label %41

; <label>:41:                                     ; preds = %41, %.ph
  %store_forwarded24 = phi double [ %load_initial23, %.ph ], [ %63, %41 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %51, %41 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %41 ]
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %12
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next4
  %45 = insertelement <2 x double> undef, double %store_forwarded, i32 0
  %46 = shufflevector <2 x double> %45, <2 x double> undef, <2 x i32> zeroinitializer
  %47 = fmul <2 x double> %46, <double 0xC09F400000000001, double 0xC09F400000000001>
  %48 = fadd <2 x double> %47, <double 0x40AF420000000001, double 0x40AF420000000001>
  %49 = extractelement <2 x double> %48, i32 0
  %50 = extractelement <2 x double> %48, i32 1
  %51 = fdiv double 0x409F400000000001, %49
  store double %51, double* %42, align 8
  %52 = bitcast double* %43 to <2 x double>*
  %53 = load <2 x double>, <2 x double>* %52, align 8
  %54 = fmul <2 x double> %53, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %55 = extractelement <2 x double> %54, i32 0
  %56 = extractelement <2 x double> %54, i32 1
  %57 = fsub double %56, %55
  %58 = load double, double* %44, align 8
  %59 = fmul double %58, 0xC08F400000000001
  %60 = fsub double %57, %59
  %61 = fmul double %store_forwarded24, 0xC09F400000000001
  %62 = fsub double %60, %61
  %63 = fdiv double %62, %50
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv
  store double %63, double* %64, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %.loopexit49, label %41

.loopexit48:                                      ; preds = %.ph.lver.orig
  br label %65

.loopexit49:                                      ; preds = %41
  br label %65

; <label>:65:                                     ; preds = %.loopexit49, %.loopexit48
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv3
  store double 1.000000e+00, double* %66, align 8
  br label %67

; <label>:67:                                     ; preds = %67, %65
  %indvars.iv1 = phi i64 [ 998, %65 ], [ %indvars.iv.next2.1, %67 ]
  %68 = phi double [ 1.000000e+00, %65 ], [ %81, %67 ]
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv1
  %70 = load double, double* %69, align 8
  %71 = fmul double %70, %68
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv1
  %73 = load double, double* %72, align 8
  %74 = fadd double %71, %73
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv3
  store double %74, double* %75, align 8
  %indvars.iv.next2 = add nsw i64 %indvars.iv1, -1
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv.next2
  %77 = load double, double* %76, align 8
  %78 = fmul double %77, %74
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv.next2
  %80 = load double, double* %79, align 8
  %81 = fadd double %78, %80
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next2, i64 %indvars.iv3
  store double %81, double* %82, align 8
  %83 = icmp sgt i64 %indvars.iv.next2, 1
  %indvars.iv.next2.1 = add nsw i64 %indvars.iv1, -2
  br i1 %83, label %67, label %84

; <label>:84:                                     ; preds = %67
  %exitcond12 = icmp eq i64 %indvars.iv.next4, 999
  br i1 %exitcond12, label %.lver.check39.preheader, label %.lver.check

.lver.check39.preheader:                          ; preds = %84
  br label %.lver.check39

.lver.check39:                                    ; preds = %.lver.check39.preheader, %164
  %indvar25 = phi i64 [ %85, %164 ], [ 0, %.lver.check39.preheader ]
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %164 ], [ 1, %.lver.check39.preheader ]
  %85 = add nuw nsw i64 %indvar25, 1
  %scevgep27 = getelementptr [1000 x double], [1000 x double]* %2, i64 %85, i64 0
  %scevgep29 = getelementptr [1000 x double], [1000 x double]* %2, i64 %85, i64 999
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %3, i64 %85, i64 0
  %scevgep33 = getelementptr [1000 x double], [1000 x double]* %3, i64 %85, i64 999
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 0
  store double 1.000000e+00, double* %86, align 8
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 0
  store double 0.000000e+00, double* %87, align 8
  %88 = bitcast double* %86 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10
  %91 = bitcast [1000 x double]* %90 to i64*
  store i64 %89, i64* %91, align 8
  %92 = add nsw i64 %indvars.iv10, -1
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %bound035 = icmp ult double* %scevgep27, %scevgep33
  %bound136 = icmp ult double* %scevgep31, %scevgep29
  %memcheck.conflict38 = and i1 %bound035, %bound136
  br i1 %memcheck.conflict38, label %.ph40.lver.orig.preheader, label %.ph40

.ph40.lver.orig.preheader:                        ; preds = %.lver.check39
  br label %.ph40.lver.orig

.ph40.lver.orig:                                  ; preds = %.ph40.lver.orig.preheader, %.ph40.lver.orig
  %indvars.iv5.lver.orig = phi i64 [ %indvars.iv.next6.lver.orig, %.ph40.lver.orig ], [ 1, %.ph40.lver.orig.preheader ]
  %93 = add nsw i64 %indvars.iv5.lver.orig, -1
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %93
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv5.lver.orig
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %92, i64 %indvars.iv5.lver.orig
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv5.lver.orig
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next11, i64 %indvars.iv5.lver.orig
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %93
  %101 = insertelement <2 x double> undef, double %95, i32 0
  %102 = shufflevector <2 x double> %101, <2 x double> undef, <2 x i32> zeroinitializer
  %103 = fmul <2 x double> %102, <double 0xC08F400000000001, double 0xC08F400000000001>
  %104 = fadd <2 x double> %103, <double 0x409F440000000001, double 0x409F440000000001>
  %105 = extractelement <2 x double> %104, i32 0
  %106 = extractelement <2 x double> %104, i32 1
  %107 = fdiv double 0x408F400000000001, %105
  store double %107, double* %96, align 8
  %108 = load double, double* %97, align 8
  %109 = fmul double %108, 0xC09F400000000001
  %110 = load double, double* %98, align 8
  %111 = fmul double %110, 0xC0AF3E0000000001
  %112 = fsub double %111, %109
  %113 = load double, double* %99, align 8
  %114 = fmul double %113, 0xC09F400000000001
  %115 = fsub double %112, %114
  %116 = load double, double* %100, align 8
  %117 = fmul double %116, 0xC08F400000000001
  %118 = fsub double %115, %117
  %119 = fdiv double %118, %106
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv5.lver.orig
  store double %119, double* %120, align 8
  %exitcond7.lver.orig = icmp eq i64 %indvars.iv5.lver.orig, 998
  %indvars.iv.next6.lver.orig = add nuw nsw i64 %indvars.iv5.lver.orig, 1
  br i1 %exitcond7.lver.orig, label %.loopexit, label %.ph40.lver.orig

.ph40:                                            ; preds = %.lver.check39
  %load_initial42 = load double, double* %scevgep27, align 8
  %load_initial45 = load double, double* %scevgep31, align 8
  br label %121

; <label>:121:                                    ; preds = %121, %.ph40
  %store_forwarded46 = phi double [ %load_initial45, %.ph40 ], [ %143, %121 ]
  %store_forwarded43 = phi double [ %load_initial42, %.ph40 ], [ %132, %121 ]
  %indvars.iv5 = phi i64 [ 1, %.ph40 ], [ %indvars.iv.next6, %121 ]
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv5
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %92, i64 %indvars.iv5
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv5
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next11, i64 %indvars.iv5
  %126 = insertelement <2 x double> undef, double %store_forwarded43, i32 0
  %127 = shufflevector <2 x double> %126, <2 x double> undef, <2 x i32> zeroinitializer
  %128 = fmul <2 x double> %127, <double 0xC08F400000000001, double 0xC08F400000000001>
  %129 = fadd <2 x double> %128, <double 0x409F440000000001, double 0x409F440000000001>
  %130 = extractelement <2 x double> %129, i32 0
  %131 = extractelement <2 x double> %129, i32 1
  %132 = fdiv double 0x408F400000000001, %130
  store double %132, double* %122, align 8
  %133 = load double, double* %123, align 8
  %134 = fmul double %133, 0xC09F400000000001
  %135 = load double, double* %124, align 8
  %136 = fmul double %135, 0xC0AF3E0000000001
  %137 = fsub double %136, %134
  %138 = load double, double* %125, align 8
  %139 = fmul double %138, 0xC09F400000000001
  %140 = fsub double %137, %139
  %141 = fmul double %store_forwarded46, 0xC08F400000000001
  %142 = fsub double %140, %141
  %143 = fdiv double %142, %131
  %144 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv5
  store double %143, double* %144, align 8
  %exitcond7 = icmp eq i64 %indvars.iv5, 998
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  br i1 %exitcond7, label %.loopexit47, label %121

.loopexit:                                        ; preds = %.ph40.lver.orig
  br label %145

.loopexit47:                                      ; preds = %121
  br label %145

; <label>:145:                                    ; preds = %.loopexit47, %.loopexit
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 999
  store double 1.000000e+00, double* %146, align 8
  br label %147

; <label>:147:                                    ; preds = %147, %145
  %indvars.iv8 = phi i64 [ 998, %145 ], [ %indvars.iv.next9.1, %147 ]
  %148 = phi double [ 1.000000e+00, %145 ], [ %161, %147 ]
  %149 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv8
  %150 = load double, double* %149, align 8
  %151 = fmul double %150, %148
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv8
  %153 = load double, double* %152, align 8
  %154 = fadd double %151, %153
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv8
  store double %154, double* %155, align 8
  %indvars.iv.next9 = add nsw i64 %indvars.iv8, -1
  %156 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv.next9
  %157 = load double, double* %156, align 8
  %158 = fmul double %157, %154
  %159 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv.next9
  %160 = load double, double* %159, align 8
  %161 = fadd double %158, %160
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv.next9
  store double %161, double* %162, align 8
  %163 = icmp sgt i64 %indvars.iv.next9, 1
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv8, -2
  br i1 %163, label %147, label %164

; <label>:164:                                    ; preds = %147
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 999
  br i1 %exitcond13, label %165, label %.lver.check39

; <label>:165:                                    ; preds = %164
  %166 = add nuw nsw i32 %.0311, 1
  %exitcond50 = icmp eq i32 %166, 501
  br i1 %exitcond50, label %167, label %.preheader4

; <label>:167:                                    ; preds = %165
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %17, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge4, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %17, label %._crit_edge4

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
