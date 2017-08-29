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
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
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

.preheader4:                                      ; preds = %._crit_edge16, %4
  %.0317 = phi i32 [ 1, %4 ], [ %165, %._crit_edge16 ]
  br label %.lver.check

.lver.check:                                      ; preds = %41, %.preheader4
  %indvar = phi i64 [ %5, %41 ], [ 0, %.preheader4 ]
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %41 ], [ 1, %.preheader4 ]
  %5 = add i64 %indvar, 1
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
  %18 = insertelement <2 x double> undef, double %15, i32 0
  %19 = insertelement <2 x double> %18, double 2.000000e+00, i32 1
  %20 = fmul <2 x double> %19, <double 0xC09F400000000001, double 0xC08F400000000001>
  %21 = fadd <2 x double> %20, <double 0x40AF420000000001, double 1.000000e+00>
  %22 = extractelement <2 x double> %21, i32 0
  %23 = fdiv double 0x409F400000000001, %22
  store double %23, double* %16, align 8
  %24 = bitcast double* %17 to <2 x double>*
  %25 = load <2 x double>, <2 x double>* %24, align 8
  %26 = insertelement <2 x double> %21, double 0xC08F400000000001, i32 0
  %27 = fmul <2 x double> %25, %26
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %30 = fsub double %29, %28
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next4
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, 0xC08F400000000001
  %34 = fsub double %30, %33
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %13
  %36 = load double, double* %35, align 8
  %37 = fmul double %36, 0xC09F400000000001
  %38 = fsub double %34, %37
  %39 = fdiv double %38, %22
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv.lver.orig
  store double %39, double* %40, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial23 = load double, double* %scevgep17, align 8
  br label %59

; <label>:41:                                     ; preds = %42
  %exitcond12 = icmp eq i64 %indvars.iv.next4, 999
  br i1 %exitcond12, label %.lver.check39.preheader, label %.lver.check

.lver.check39.preheader:                          ; preds = %41
  br label %.lver.check39

; <label>:42:                                     ; preds = %42, %._crit_edge.us
  %indvars.iv1 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next2.1, %42 ]
  %43 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %56, %42 ]
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv1
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %43
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv1
  %48 = load double, double* %47, align 8
  %49 = fadd double %46, %48
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv3
  store double %49, double* %50, align 8
  %indvars.iv.next2 = add nsw i64 %indvars.iv1, -1
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv.next2
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %49
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv.next2
  %55 = load double, double* %54, align 8
  %56 = fadd double %53, %55
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next2, i64 %indvars.iv3
  store double %56, double* %57, align 8
  %58 = icmp sgt i64 %indvars.iv.next2, 1
  %indvars.iv.next2.1 = add nsw i64 %indvars.iv1, -2
  br i1 %58, label %42, label %41

; <label>:59:                                     ; preds = %59, %.ph
  %store_forwarded24 = phi double [ %load_initial23, %.ph ], [ %81, %59 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %67, %59 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %59 ]
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %12
  %62 = insertelement <2 x double> undef, double %store_forwarded, i32 0
  %63 = insertelement <2 x double> %62, double 2.000000e+00, i32 1
  %64 = fmul <2 x double> %63, <double 0xC09F400000000001, double 0xC08F400000000001>
  %65 = fadd <2 x double> %64, <double 0x40AF420000000001, double 1.000000e+00>
  %66 = extractelement <2 x double> %65, i32 0
  %67 = fdiv double 0x409F400000000001, %66
  store double %67, double* %60, align 8
  %68 = bitcast double* %61 to <2 x double>*
  %69 = load <2 x double>, <2 x double>* %68, align 8
  %70 = insertelement <2 x double> %65, double 0xC08F400000000001, i32 0
  %71 = fmul <2 x double> %69, %70
  %72 = extractelement <2 x double> %71, i32 0
  %73 = extractelement <2 x double> %71, i32 1
  %74 = fsub double %73, %72
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next4
  %76 = load double, double* %75, align 8
  %77 = fmul double %76, 0xC08F400000000001
  %78 = fsub double %74, %77
  %79 = fmul double %store_forwarded24, 0xC09F400000000001
  %80 = fsub double %78, %79
  %81 = fdiv double %80, %66
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv
  store double %81, double* %82, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %._crit_edge.us.loopexit48, label %59

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit48:                        ; preds = %59
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit48, %._crit_edge.us.loopexit
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv3
  store double 1.000000e+00, double* %83, align 8
  br label %42

.lver.check39:                                    ; preds = %.lver.check39.preheader, %121
  %indvar25 = phi i64 [ %84, %121 ], [ 0, %.lver.check39.preheader ]
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %121 ], [ 1, %.lver.check39.preheader ]
  %84 = add i64 %indvar25, 1
  %scevgep27 = getelementptr [1000 x double], [1000 x double]* %2, i64 %84, i64 0
  %scevgep29 = getelementptr [1000 x double], [1000 x double]* %2, i64 %84, i64 999
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %3, i64 %84, i64 0
  %scevgep33 = getelementptr [1000 x double], [1000 x double]* %3, i64 %84, i64 999
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %85, i64 0, i64 0
  store double 1.000000e+00, double* %86, align 8
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 0
  store double 0.000000e+00, double* %87, align 8
  %88 = bitcast [1000 x double]* %85 to i64*
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
  %98 = insertelement <2 x double> undef, double %95, i32 0
  %99 = insertelement <2 x double> %98, double 2.000000e+00, i32 1
  %100 = fmul <2 x double> %99, <double 0xC08F400000000001, double 0xC09F400000000001>
  %101 = fadd <2 x double> %100, <double 0x409F440000000001, double 1.000000e+00>
  %102 = extractelement <2 x double> %101, i32 0
  %103 = extractelement <2 x double> %101, i32 1
  %104 = fdiv double 0x408F400000000001, %102
  store double %104, double* %96, align 8
  %105 = load double, double* %97, align 8
  %106 = fmul double %105, 0xC09F400000000001
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv5.lver.orig
  %108 = load double, double* %107, align 8
  %109 = fmul double %108, %103
  %110 = fsub double %109, %106
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next11, i64 %indvars.iv5.lver.orig
  %112 = load double, double* %111, align 8
  %113 = fmul double %112, 0xC09F400000000001
  %114 = fsub double %110, %113
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %93
  %116 = load double, double* %115, align 8
  %117 = fmul double %116, 0xC08F400000000001
  %118 = fsub double %114, %117
  %119 = fdiv double %118, %102
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv5.lver.orig
  store double %119, double* %120, align 8
  %exitcond7.lver.orig = icmp eq i64 %indvars.iv5.lver.orig, 998
  %indvars.iv.next6.lver.orig = add nuw nsw i64 %indvars.iv5.lver.orig, 1
  br i1 %exitcond7.lver.orig, label %._crit_edge12.us.loopexit, label %.ph40.lver.orig

.ph40:                                            ; preds = %.lver.check39
  %load_initial42 = load double, double* %scevgep27, align 8
  %load_initial45 = load double, double* %scevgep31, align 8
  br label %139

; <label>:121:                                    ; preds = %122
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 999
  br i1 %exitcond13, label %._crit_edge16, label %.lver.check39

; <label>:122:                                    ; preds = %122, %._crit_edge12.us
  %indvars.iv8 = phi i64 [ 998, %._crit_edge12.us ], [ %indvars.iv.next9.1, %122 ]
  %123 = phi double [ 1.000000e+00, %._crit_edge12.us ], [ %136, %122 ]
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv8
  %125 = load double, double* %124, align 8
  %126 = fmul double %125, %123
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv8
  %128 = load double, double* %127, align 8
  %129 = fadd double %126, %128
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv8
  store double %129, double* %130, align 8
  %indvars.iv.next9 = add nsw i64 %indvars.iv8, -1
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv.next9
  %132 = load double, double* %131, align 8
  %133 = fmul double %132, %129
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv.next9
  %135 = load double, double* %134, align 8
  %136 = fadd double %133, %135
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv.next9
  store double %136, double* %137, align 8
  %138 = icmp sgt i64 %indvars.iv.next9, 1
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv8, -2
  br i1 %138, label %122, label %121

; <label>:139:                                    ; preds = %139, %.ph40
  %store_forwarded46 = phi double [ %load_initial45, %.ph40 ], [ %161, %139 ]
  %store_forwarded43 = phi double [ %load_initial42, %.ph40 ], [ %148, %139 ]
  %indvars.iv5 = phi i64 [ 1, %.ph40 ], [ %indvars.iv.next6, %139 ]
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv5
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %92, i64 %indvars.iv5
  %142 = insertelement <2 x double> undef, double %store_forwarded43, i32 0
  %143 = insertelement <2 x double> %142, double 2.000000e+00, i32 1
  %144 = fmul <2 x double> %143, <double 0xC08F400000000001, double 0xC09F400000000001>
  %145 = fadd <2 x double> %144, <double 0x409F440000000001, double 1.000000e+00>
  %146 = extractelement <2 x double> %145, i32 0
  %147 = extractelement <2 x double> %145, i32 1
  %148 = fdiv double 0x408F400000000001, %146
  store double %148, double* %140, align 8
  %149 = load double, double* %141, align 8
  %150 = fmul double %149, 0xC09F400000000001
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv5
  %152 = load double, double* %151, align 8
  %153 = fmul double %152, %147
  %154 = fsub double %153, %150
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next11, i64 %indvars.iv5
  %156 = load double, double* %155, align 8
  %157 = fmul double %156, 0xC09F400000000001
  %158 = fsub double %154, %157
  %159 = fmul double %store_forwarded46, 0xC08F400000000001
  %160 = fsub double %158, %159
  %161 = fdiv double %160, %146
  %162 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv5
  store double %161, double* %162, align 8
  %exitcond7 = icmp eq i64 %indvars.iv5, 998
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  br i1 %exitcond7, label %._crit_edge12.us.loopexit47, label %139

._crit_edge12.us.loopexit:                        ; preds = %.ph40.lver.orig
  br label %._crit_edge12.us

._crit_edge12.us.loopexit47:                      ; preds = %139
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit47, %._crit_edge12.us.loopexit
  %163 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv10, i64 999
  store double 1.000000e+00, double* %163, align 8
  br label %122

._crit_edge16:                                    ; preds = %121
  %164 = icmp sgt i32 %.0317, 499
  %165 = add nuw nsw i32 %.0317, 1
  br i1 %164, label %166, label %.preheader4

; <label>:166:                                    ; preds = %._crit_edge16
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
